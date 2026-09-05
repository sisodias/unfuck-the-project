---
name: ui-bank
description: Query the SISO Component Bank (8,538 21st.dev components, 6,212 with source, plus a hand-curated layer) before building any UI component or screen. Use for "which component should I use for X", "is there a comp for a login/chart/notifications/leaderboard", or when a human pastes 21st.dev URLs with reactions.
---

# ui-bank — the component bank

Clone: `git clone https://github.com/sisodias/siso-component-bank` (README there is the contract).
Layers: `index.jsonl` (8,538 rows), `previews/`, `source/` (CDN TSX), `legacy/` (shadcn-registry TSX + classification), `curated/` (hand-picked, with presets).

## When an agent needs a comp for a job

```bash
node find.mjs "<thing>" --limit 8                       # corpus: free text / tag → ranked rows with preview paths
node curated/query.mjs "<thing>" --preset operator      # hand-picked layer only; presets in curated/presets.json
jq -c 'select(.id=="<author>__<slug>")' index.jsonl     # the full row: preview, source, legacy, classification
```

Then: look at the preview, read `source/<id>/code.tsx` (or `legacy/<dir>/*.tsx`), adapt to the project's design DNA. Never paste verbatim; check the author's licence via the row's `url`.

Curated rows carry `feedback` (verbatim human reaction), `signal` (love/good/maybe/meh), `type` (`family/kind`), `form` (mobile/desktop/either), `vote`, `winner_of_type`. A keep-vote or winner outranks any score.

## When a human pastes URLs with commentary

1. Split the stream into (url, verbatim reaction). Keep their words; do not paraphrase.
2. Infer `--target` from the comment and `--signal` (love = "banging / exactly what we needed", good = default, maybe = "don't know where", meh = "bit shit").
3. `node curated/add.mjs <url> --fb "..." --target x,y --signal love` per URL (or `--stdin` for a batch). It harvests preview/bundle/source itself.
4. Assign `type` and `form` by looking at the preview and the code; edit `picks.jsonl` for those two fields.
5. Serve the board (`node curated/serve.mjs` → http://127.0.0.1:8812) and let the human vote there, not in the terminal.

## Scouting the corpus for bank candidates

`curated/scout/RUBRIC.md` rates bank-fit (craft, mechanism, product-fit, robbability, taste-match; 0-25). `scout/build-lanes.py` splits the corpus into lanes with contact sheets; one agent per lane with `scout/BRIEF.md`; `scout/merge.mjs` → `candidates.jsonl`; the human votes; `scout/promote.mjs` moves kept ones into picks. Never promote without a human keep vote.

## Do not

- Don't grep `source/` or load `index.jsonl` whole into context. Query, take the top handful.
- Don't dedupe `source/` against `legacy/`: 562 components exist only in legacy, and legacy carries the classification axes.
- Don't hit 21st.dev's metered registry endpoint; source comes from the bank or from `cdn.21st.dev`.
