# UNFUCK — whole-project ownership for a frontier agent, with the source layer

Give the smartest model you have the **whole project**, not a task, and give it the **sources** a good owner would use: a ranked list of the questions worth frontier compute, a bank of 8,538 UI components with source, a bank of 23,778 categorised GitHub repos, and the search skills to find what's missing. That's this repo plus its two sibling banks.

```
unfuck-the-project/            ← you are here: prompt, brief, God Questions, skills
siso-component-bank/           ← 8,538 21st.dev components, 6,212 with TSX source, one index   (191 MB previews + 86 MB source)
siso-repo-bank/                ← 23,778 rated repos, best-per-capability, adoption vs fame, 56k star farm
```

- https://github.com/sisodias/siso-component-bank
- https://github.com/sisodias/siso-repo-bank

Everything is MIT (the prompt, the indexes, the skills). Component and repo code belongs to its upstream authors; every row carries the upstream URL.

## Quick start (hand this to an agent)

```bash
git clone https://github.com/sisodias/unfuck-the-project
git clone https://github.com/sisodias/siso-component-bank
git clone https://github.com/sisodias/siso-repo-bank
cp unfuck-the-project/templates/BRIEF.md my-project/BRIEF.md   # fill it in, five minutes, be honest
```

Then, in the agent:

```text
Read unfuck-the-project/UNFUCK.md in full, then my-project/BRIEF.md.
The component bank is at ../siso-component-bank and the repo bank at ../siso-repo-bank; their READMEs say how to query them.
The skills in unfuck-the-project/skills/ are yours to load.
You are the owner of this project under that prompt. Begin.
```

Walk away. It pings you only for a genuinely new blocking decision, an authority conflict, or an urgent risk.

## What's in here

| Path | What it is |
|---|---|
| [`UNFUCK.md`](UNFUCK.md) | The prompt (v3). Whole-project ownership, scepticism of inherited structure, evidence recovery from real sources, verified entry point, distil learning. |
| [`templates/BRIEF.md`](templates/BRIEF.md) · [`examples/BRIEF-example.md`](examples/BRIEF-example.md) | The one-page dispatch brief per project: root, sources, where it hurts, owners, constraints, success. |
| [`god-questions/GOD-QUESTIONS.md`](god-questions/GOD-QUESTIONS.md) | The ranked list of questions worth frontier compute (GQ-001 to GQ-019), with a **falsifier** per question: what answer would make us stop, and the cheapest worker-tier probe that produces it. Rule: no frontier compute without a written falsifier. |
| [`god-questions/library-contracts/`](god-questions/library-contracts/) | Eight research contracts as JSON: question, answer shape, success criteria, evidence gaps, watch triggers. Machine-readable, for an agent that is going to *work* a question. |
| [`god-questions/ORIGINS-2026-07.md`](god-questions/ORIGINS-2026-07.md) | Where the questions came from and the harness contract for answering one. |
| [`god-questions/BINDING-EXAMPLE-2026-08-29.md`](god-questions/BINDING-EXAMPLE-2026-08-29.md) | A worked example: one project auditing itself against the questions, re-deriving every count from source, and finding it *is* the engine that answers GQ-004. Read it for the method. |
| [`skills/`](skills/) | Agent skills, Claude-Code `SKILL.md` format, usable as plain instructions anywhere. See below. |

### Skills

| Skill | Use it when |
|---|---|
| `code-search-campaign` | You want to find what already exists in open source before building. Three lanes (Sourcegraph, GitHub keyword, GitHub topics), loop until dry, judge last. Bundles `sg-search.sh`. |
| `gitsearch` · `unified-code-search` · `xsearch` · `multisearch` | Narrower search mechanics: GitHub code/repo search, cross-source, X/Twitter, multi-engine. |
| `ui-bank` | Before building any UI: query the component bank, read the preview and the source, adapt. Also the intake flow when a human pastes component URLs with reactions. |
| `classify-by-reading` | Before any archive / delete / dedupe / supersede call: read the file and its consumers. Names, flags and timestamps are claims, not verdicts. |
| `prove-before-claim` | Before any verifiable system claim: run the probe that could make you wrong. A table of claim → falsifying command. |
| `subagents` | Dispatching bounded workers: one outcome, exact paths, forbidden edits, compact `RETURN` block. Templates for parallel spawn and research. |
| `skills-catalog` | Discover and load skills by trigger. |
| `analyzing-video` | A human sends a screen recording or Loom: ffmpeg frames, analyse in parallel. |

The skills reference each other by name and assume nothing about your machine. Where one names a specific model tier, read it as "your cheapest capable worker" and "your strongest reviewer".

## Why this exists

We run many projects in parallel with agents owning each one. Two failure modes kept recurring: the agent completes the audit or the first passing test and stops, leaving the project no more coherent; and successive agents inherit tidy-looking but unverified structure and build on it because it looks deliberate. UNFUCK answers both: one accountable owner, sceptical of everything it inherits, proving improvement against real intent and real runtime evidence, with the sources a good owner would actually use.

The God Questions are the other half. Not every question deserves frontier compute; the ones that do are ranked, and each has a written falsifier so the compute can stop. The banks exist because "what's the best X" and "is there a component for Y" should be one command, not a scrape.

## Versioning

`UNFUCK.md` carries its own version line. v3 (5 September 2026) makes source authorship and decision-scoped supersession explicit: the agent must know *who* said a thing and *what scope* a correction applies to, because a transcript's `user` role can carry pasted proposals and generated summaries. The God Questions file is dated per revision. Fork it, change it, keep the dates honest.

## Licence

MIT. See [`LICENSE`](LICENSE).
