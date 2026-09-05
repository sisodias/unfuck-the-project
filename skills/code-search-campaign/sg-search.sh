#!/usr/bin/env bash
# sg-search.sh — Sourcegraph code/repo/symbol search for SISO background agents
# Usage:
#   sg-search.sh code "<query>" [--lang ts] [--limit 20]
#   sg-search.sh repo "<query>" [--limit 20]
#   sg-search.sh symbol "<name>" [--lang go] [--limit 20]
#
# Auth: set SOURCEGRAPH_TOKEN env var for higher limits. Works unauthenticated.
# Deps: bash, curl, jq

set -euo pipefail

SG_ENDPOINT="https://sourcegraph.com/.api/graphql"
DEFAULT_LIMIT=20

# ─── helpers ───────────────────────────────────────────────────────────────────

die() { echo "ERROR: $*" >&2; exit 1; }

require_cmd() { command -v "$1" >/dev/null 2>&1 || die "$1 is required but not found"; }

build_auth_header() {
  if [[ -n "${SOURCEGRAPH_TOKEN:-}" ]]; then
    echo "Authorization: token ${SOURCEGRAPH_TOKEN}"
  else
    echo "X-Sourcegraph-Client: sg-search-cli/1.0"
  fi
}

sg_graphql() {
  local query="$1"
  local variables="$2"
  local auth_header
  auth_header="$(build_auth_header)"

  curl -sf -X POST "$SG_ENDPOINT" \
    -H "Content-Type: application/json" \
    -H "$auth_header" \
    -d "$(jq -cn --arg q "$query" --argjson v "$variables" '{query: $q, variables: $v}')" \
    --max-time 30
}

# ─── code search ───────────────────────────────────────────────────────────────

cmd_code() {
  local query="" lang="" limit="$DEFAULT_LIMIT"

  while [[ $# -gt 0 ]]; do
    case "$1" in
      --lang)   lang="$2"; shift 2 ;;
      --limit)  limit="$2"; shift 2 ;;
      *)        query="$1"; shift ;;
    esac
  done

  [[ -z "$query" ]] && die "code search requires a query string"

  local sg_query="$query count:${limit}"
  [[ -n "$lang" ]] && sg_query="${sg_query} lang:${lang}"

  local gql='
query($query: String!) {
  search(query: $query) {
    results {
      matchCount
      approximateResultCount
      results {
        __typename
        ... on FileMatch {
          repository { name }
          file { path }
          lineMatches {
            lineNumber
            preview
          }
        }
      }
    }
  }
}'

  local response
  response="$(sg_graphql "$gql" "{\"query\": \"$sg_query\"}")"

  local match_count
  match_count="$(echo "$response" | jq -r '.data.search.results.approximateResultCount')"
  echo "Sourcegraph code search: \"$query\"${lang:+ [lang:$lang]}"
  echo "Results: $match_count matches (showing up to $limit)"
  echo "─────────────────────────────────────────────────────────"

  echo "$response" | jq -r '
    .data.search.results.results[] |
    select(.__typename == "FileMatch") |
    . as $m |
    "Repo:  \($m.repository.name)",
    "File:  \($m.file.path)",
    ($m.lineMatches[] | "  L\(.lineNumber): \(.preview | gsub("^\\s+|\\s+$"; ""))"),
    "─────────────────────────────────────────────────────────"
  '
}

# ─── repo search ───────────────────────────────────────────────────────────────

cmd_repo() {
  local query="" limit="$DEFAULT_LIMIT"

  while [[ $# -gt 0 ]]; do
    case "$1" in
      --limit) limit="$2"; shift 2 ;;
      *)       query="$1"; shift ;;
    esac
  done

  [[ -z "$query" ]] && die "repo search requires a query string"

  local sg_query="r:${query} type:repo count:${limit}"

  local gql='
query($query: String!) {
  search(query: $query) {
    results {
      matchCount
      approximateResultCount
      results {
        __typename
        ... on Repository {
          name
          description
          externalURLs { url }
        }
      }
    }
  }
}'

  local response
  response="$(sg_graphql "$gql" "{\"query\": \"$sg_query\"}")"

  local match_count
  match_count="$(echo "$response" | jq -r '.data.search.results.approximateResultCount')"
  echo "Sourcegraph repo search: \"$query\""
  echo "Results: $match_count repos (showing up to $limit)"
  echo "─────────────────────────────────────────────────────────"

  echo "$response" | jq -r '
    .data.search.results.results[] |
    select(.__typename == "Repository") |
    "Repo:  \(.name)",
    "URL:   \((.externalURLs[0].url) // "n/a")",
    "Desc:  \(.description // "(no description)")",
    "─────────────────────────────────────────────────────────"
  '
}

# ─── symbol search ─────────────────────────────────────────────────────────────

cmd_symbol() {
  local name="" lang="" limit="$DEFAULT_LIMIT"

  while [[ $# -gt 0 ]]; do
    case "$1" in
      --lang)  lang="$2"; shift 2 ;;
      --limit) limit="$2"; shift 2 ;;
      *)       name="$1"; shift ;;
    esac
  done

  [[ -z "$name" ]] && die "symbol search requires a symbol name"

  local sg_query="type:symbol ${name} count:${limit}"
  [[ -n "$lang" ]] && sg_query="${sg_query} lang:${lang}"

  local gql='
query($query: String!) {
  search(query: $query) {
    results {
      matchCount
      approximateResultCount
      results {
        __typename
        ... on FileMatch {
          repository { name }
          file { path }
          symbols {
            name
            kind
            location {
              range { start { line } }
            }
          }
        }
      }
    }
  }
}'

  local response
  response="$(sg_graphql "$gql" "{\"query\": \"$sg_query\"}")"

  local match_count
  match_count="$(echo "$response" | jq -r '.data.search.results.approximateResultCount')"
  echo "Sourcegraph symbol search: \"$name\"${lang:+ [lang:$lang]}"
  echo "Results: $match_count matches (showing up to $limit)"
  echo "─────────────────────────────────────────────────────────"

  echo "$response" | jq -r '
    .data.search.results.results[] |
    select(.__typename == "FileMatch") |
    . as $m |
    "Repo:  \($m.repository.name)",
    "File:  \($m.file.path)",
    ($m.symbols[] | "  \(.kind) \(.name)  (L\(.location.range.start.line))"),
    "─────────────────────────────────────────────────────────"
  '
}

# ─── dispatch ──────────────────────────────────────────────────────────────────

require_cmd curl
require_cmd jq

case "${1:-}" in
  code)   shift; cmd_code "$@" ;;
  repo)   shift; cmd_repo "$@" ;;
  symbol) shift; cmd_symbol "$@" ;;
  ""|--help|-h)
    cat <<EOF
sg-search.sh — Sourcegraph search for SISO agents
Endpoint: $SG_ENDPOINT (unauthenticated by default)
Auth: export SOURCEGRAPH_TOKEN=<token> for higher limits

Commands:
  code "<query>" [--lang LANG] [--limit N]   Search code patterns
  repo "<query>" [--limit N]                 Search repositories (uses r: prefix)
  symbol "<name>" [--lang LANG] [--limit N]  Find symbol definitions

Query tips (Sourcegraph syntax):
  lang:TypeScript     Filter by language
  count:50            Return up to N results (default: 20)
  type:repo           Limit to repo results
  type:symbol         Limit to symbol results
  patternType:regexp  Use regex patterns
  r:owner/repo        Search within a specific repo
  archived:yes        Include archived repos

Examples:
  sg-search.sh code "obs-websocket-js" --lang ts --limit 10
  sg-search.sh repo "obs-websocket" --limit 5
  sg-search.sh symbol "createClient" --lang typescript
  sg-search.sh code "chaturbate.com/events" --limit 10
EOF
    ;;
  *) die "Unknown command: $1. Use code, repo, or symbol." ;;
esac
