# Sourcegraph + NPM raw-search reference

Absorbed from the retired `sourcegraph` skill on 2026-07-03. For the campaign *methodology*
(intent → 3-lane sweep → loop → judge), see the parent `SKILL.md`. This file is the raw
mechanics — when a single Sourcegraph / NPM call is what you actually need.

## The wrapper (live path, verified 2026-07-03)

```
<your-own sg-search.sh wrapper; see the curl recipe below>
```

Usage:
```bash
sg-search.sh code   "<query>" --lang typescript --limit 20
sg-search.sh repo   "<query>" --limit 10
sg-search.sh symbol "<query>" --lang go
```

Auth: set `SOURCEGRAPH_TOKEN` for higher limits. Unauthenticated is fine for most research.
Get a token: sourcegraph.com → Settings → Access Tokens → Generate.

## Sourcegraph query syntax (pass in query strings)

```
lang:TypeScript      Filter by language
count:50             Up to N results
type:repo            Repo results
type:symbol          Symbol results
r:owner/repo         Scope to repo
patternType:regexp   Enable regex
fork:yes             Include forks
archived:yes         Include archived
file:*.config.ts     Filter by filename
```

## Known limits & gotchas

1. **Dot-in-URL queries:** `chaturbate.com/events` returns 0 — dots are regex wildcards in
   Sourcegraph's default mode. Use `patternType:regexp` or simplify the query.
2. **No star metadata:** Sourcegraph results don't include stars. Use `gh search repos` for
   popularity signal.
3. **Fork/archive exclusion:** Forked and archived repos excluded by default. Add
   `fork:yes` or `archived:yes` to include them.
4. **Repo search syntax:** Internally uses `r:<query> type:repo`. Bare name queries work;
   no special quoting needed.
5. **Rate limits:** No `x-ratelimit-*` headers observed. Unauthenticated ceiling unknown —
   comfortable for 10-50 queries/session. Get a token if you see 429s.
6. **`count:` matters:** Sourcegraph caps results. Add `count:all` for exhaustive search
   (slower).
7. **Sourcegraph is evidence, not ranking:** No stars, downloads, or publish dates. Pair
   with NPM or GitHub metadata.
8. **NPM is noisy:** Package keyword search finds forks, personal packages, and unrelated
   packages. Categorize and score before dispatching research agents.

## Direct Sourcegraph GraphQL fallback

Use when the wrapper is missing or stale.

```bash
QUERY='"@mariozechner/pi-coding-agent" "registerTool" lang:TypeScript count:50'
curl -sS https://sourcegraph.com/.api/graphql \
  -H 'accept: application/json' \
  -H 'content-type: application/json' \
  --data-binary "$(jq -n --arg q "$QUERY" '{
    query: "query($q:String!){ search(query:$q, version:V3){ results { limitHit matchCount elapsedMilliseconds results { __typename ... on FileMatch { repository { name url } file { path url } lineMatches { lineNumber preview } } ... on Repository { name url } } } } }",
    variables: { q: $q }
  }')" \
  | jq -r '.data.search.results.results[]? |
      select(.__typename=="FileMatch") |
      [.repository.name, .file.path, .file.url] | @tsv'
```

## NPM package discovery (registry search)

For Pi / extension / ecosystem inventory, the registry search is the fast lane:

```bash
python3 - <<'PY' > research/sources/discovery/npm-pi-package-candidates.json
import json, urllib.parse, urllib.request

queries = [
    "keywords:pi-package",
    "pi extension coding agent",
    "pi subagent coding agent",
    "pi context coding agent",
    "pi permission coding agent",
    "pi task coding agent",
    "pi prompt coding agent",
]

seen = {}
for q in queries:
    url = "https://registry.npmjs.org/-/v1/search?" + urllib.parse.urlencode({
        "text": q,
        "size": 100,
        "quality": 0.2,
        "popularity": 0.4,
        "maintenance": 0.4,
    })
    data = json.load(urllib.request.urlopen(url, timeout=20))
    for item in data.get("objects", []):
        pkg = item["package"]
        name = pkg["name"]
        if name in seen:
            continue
        seen[name] = {
            "name": name,
            "version": pkg.get("version"),
            "description": pkg.get("description"),
            "published_at": pkg.get("date"),
            "links": pkg.get("links", {}),
            "keywords": pkg.get("keywords", []),
            "score": item.get("score", {}).get("final"),
        }

print(json.dumps(list(seen.values()), indent=2))
PY
```

Summarize:

```bash
jq -r '.[] |
  [.name, .version, .published_at, ((.links.repository // .links.npm // "")|tostring), (.description // "")]
  | @tsv' research/sources/discovery/npm-pi-package-candidates.json
```

## Sourcegraph / NPM queries to start a Pi ecosystem sweep

NPM:
```text
keywords:pi-package
pi extension coding agent
pi subagent coding agent
pi context coding agent
pi permission coding agent
pi workflow coding agent
pi memory coding agent
pi mcp coding agent
```

Sourcegraph:
```text
file:package.json "pi" "extensions" count:50
"@mariozechner/pi-coding-agent" count:50
registerTool lang:TypeScript count:50
registerCommand lang:TypeScript count:50
"pi.on(\"tool_call\"" lang:TypeScript count:50
"pi.on(\"context\"" lang:TypeScript count:50
"pi.setActiveTools" lang:TypeScript count:50
"sendUserMessage" "followUp" lang:TypeScript count:50
```

## Broad inventory output shape

When building a registry, normalize to:

```json
{
  "name": "pi-subagents",
  "version": "0.24.0",
  "published_at": "2026-05-03T05:36:42.779Z",
  "repo": "https://github.com/nicobailon/pi-subagents.git",
  "description": "Pi extension for delegating tasks to subagents...",
  "keywords": ["pi-package"],
  "category": "workers/subagents",
  "inspection_priority": "medium",
  "harness_fit": "high",
  "status": "candidate",
  "last_checked": "2026-05-05"
}
```

Useful categories: `workers/subagents`, `task/queue/workflow`, `safety/permission/audit`,
`context/pruning/memory`, `codebase-map/wiki`, `ui/status/metrics`, `web/browser/search`,
`testing/devtools`, `provider/mcp/integration`.

## Interpreting a Sourcegraph result

Each result is a **file match**, not a repo summary:
```
Repo:  github.com/twirapp/twir
File:  frontend/overlays/src/composables/obs/use-obs.ts
  L1: import OBSWebSocket from 'obs-websocket-js'
```

- `Repo` = full GitHub path (clone with `git clone https://github.com/<repo>`)
- `File` = path within the repo
- `L<n>` = line number + matched snippet

Use results to: identify candidate repos, then clone/read the specific file.

## When to use which (recap from absorbed skill)

| Need | Use |
|------|-----|
| Code-pattern research (library usage, API calls, impl patterns) | `sg-search.sh code` |
| Broad package ecosystem inventory | NPM registry search (`-/v1/search`) |
| Star counts / trending repos | `gh search repos` |
| Symbol definitions across langs | `sg-search.sh symbol` |
| Archived / dead repos | `sg-search.sh repo` with `archived:yes` |
| PR/commit/issue history | `gh` — Sourcegraph is code-only |