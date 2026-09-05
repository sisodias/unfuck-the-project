# God Questions — origins (July 2026 registry)

The first written registry, exported from the original research page. Kept as history; the current ranked list is in `GOD-QUESTIONS.md`.


# GOD-QUESTIONS — the L4 research registry

What this is: the standing list of god questions — the high-leverage domain questions the owner wants answered once Foundry has ~80% coverage of the world's repos + people. Each question is a research target the L4 harness re-answers as new God-source data lands. This file is the SEED of Layer 4; it grows over time. Companion to FOUNDRY-PLAN.html (the build runbook) and FOUNDRY.html (the system map).

What "god" means here (the owner, 2026-06-26): "God is all-knowing, all-thinking, all-reasoning — considering everything and reasoning everything." A god question is one you'd hand to a superintelligence that already has all the relevant data in front of it. Foundry's whole point is to BE that data substrate: once the global corpus of repos + people is mapped and curated, you can fan ~100 agents over the God-source subset for a question and get the best answer that the available evidence can support — not an opinion, a survey of everything that exists.

## Why the questions come AFTER coverage

The chain (his thesis, see project-foundry-north-star memory): L1 cover → L2 people → L3 watch → L4 ask. You can't answer "what's the best code architecture?" by reading 10 repos; you answer it by reading every God-source repo + person that bears on it. So the registry below is deliberately ahead of the engine — we capture the questions now (they're the cheapest thing to lose and the hardest to reconstruct: they're the owner's actual curiosity), and the harness answers them as coverage fills in. Each question also tells the collectors what God-source to prioritise — a question is a demand signal back into L1/L2.

HOW these get answered → L4-ANSWERING-PROTOCOL.html (the TRIDENT evidence-ladder protocol: candidate answers frozen before looking → repos placed on ungameable evidence rungs (stars enter nowhere) → a README-reading adversary hunts counter-examples → graded A/B/C/SPECULATIVE with a falsifiable hold-out → O(changed) re-answer keyed on content hash). That doc is the method; this doc is the question list.

## How a god question gets answered (the L4 harness contract)

StepWhat happens

1. ScopeTranslate the question into a corpus slice: which categories / God-source tier / people / repos bear on it. (e.g. agent-harness question → categories 116–122, 239, 274, 275, 287; ~5,600 repos / ~1,500 saucy.)

2. Fanfoundry research "<q>" from the laptop SSHes a headless MiniMax fan-out onto the mini (where data + compute live). ~N agents each read a chunk of the slice, extract structured evidence, return compact.

3. SynthesizeOpus (cockpit) reads the compact returns, adversarially verifies, writes the answer back into the git tree as a dated HTML report under research/answers/<question-id>/.

4. Re-answer on driftThe question is standing. When L3 watch detects new God-source repos/people in the slice, the answer is flagged stale and re-run — continuous learning.

Status: the harness (foundry research) is NOT built yet — it's runbook step beyond 7. This registry is what it will consume. Until then, any question can be run ad-hoc as a one-off MiniMax fan-out over identity.sqlite.

## The registry

Tags: OWNER = the owner named it explicitly · SEED = first-principles candidate I added (delete freely) · SCOPED = corpus slice already identified · LIVE-ANCHORED = tied to a running laptop/mini project the answering agent MUST study first (these aren't pure corpus questions — the evidence includes OUR OWN systems: conversation JSONLs, .agents/ trees, built code) · MERGED = absorbed into another question.

Restructure 2026-07-10 (the owner, voice session, verbatim in .agents/jarvis/memory/conversations/2026-07-10.md): superintelligence access is imminent (Fable 5, GPT next-gen). The registry now splits into corpus questions (mine the world's repos) and LIVE-anchored questions (mine our own running systems + the world). GQ-001 expanded, GQ-002 reworded, GQ-003 merged into GQ-006, GQ-006/007 added.

### GQ-001 · The Agent Workspace — the complete stack, not just code architecture [owner-scoped, live-anchored]

Question (expanded 2026-07-10, the owner): Every codebase is now an agent workspace, not just code. When an agent starts a new project or works an existing one, what is the best way to build the COMPLETE stack — code layout, agent architecture, memory, UI? "The god question is: how do we best build this agent workspace."

Sub-theses for superintelligence to confirm or deny:
(a) Language choice post-AI — people avoided Rust because it's harder, but AI doesn't care about hard; so should ALL backend be Rust (+ Tauri, React GUI)? Confirm/deny with evidence, and generalize: which "too hard for humans" choices become optimal when agents write the code?
(b) Agent architecture inside the codebase — the .agents/ folder pattern (oracle-streaming is the exemplar: everything agents write lives there), the spine, the anti-amnesia architecture. All of that is part of THIS question now.
(c) Standardized agent UI framework — when agents spin up HTMLs/dashboards to show the user things, there should be one standardized simple-React-grade framework they all use (the UI-hub we tried building). What should it be?

Evidence base (this is what makes it LIVE-anchored): the prior corpus slice still stands, but the answering agent must ALSO (1) study how we built oracle-streaming — enormous compute went into it and it embodies the current best practice (SISO_Agency/apps/oracle-streaming/.agents/); (2) fan out MiniMax stations over the rest of the laptop and the Mac mini to survey everything else we've built. Our own systems are corpus now.

STATUS: prior scope ANSWERED at B+ (2026-07-02 Fable pass; first B 2026-06-26; 28 principles, workspace answers/GQ-001-agent-legible-architecture/; KEEP-half refuted — structures don't self-propagate without enforcement). 2026-07-10: SCOPE EXPANDED per the owner → answer is now PARTIAL. The B+ work is noted and good, but it covered code layout; the complete-stack question (Rust thesis, .agents/spine/anti-amnesia, UI framework) is unanswered. Re-answer at superintelligence tier.

### GQ-002 · 10x the SISO agent layer (reworded from "every harness" 2026-07-10) [owner-authored, live-anchored]

Question (the owner's rewording): Our real harness is not any one CLI — the SISO agent layer sits ON TOP of all of them. We're CLI-agnostic (Claude Code, Codex CLI, opencode, our own CLIs — doesn't matter), herdr lets all agents talk to all agents, and the harness proper is skills + packets + document handoffs + parallel task sprints, with a smartest-talks-to-dumber hierarchy: the owner → Opus (the verbose listener he talks to) → Fable / Codex-manager (orchestration + fleets) → Claude CLIs running MiniMax as the unlimited grind tier (Codex where needed). Managers run fleets; agents talk to each other AND to the harness. The god question: a smart agent reads our conversation JSONLs, the systems we've built, and what the Fables have said — sees how we've actually been architecting, finds where the 10x is, and makes this system 10x more efficient.

Evidence base: LIVE, ours — conversation JSONLs (~/.claude/projects/, .claude-mini-home logs), the built systems (herdr, Bifrost router, claude-mini, agent-router, ORCH2 design, fleet briefs), Fable session outputs, burn scars (2026-07-09 MiniMax drain postmortem in .agents/jarvis/memory/journal.md). Known partial findings to hand the answerer: MiniMax-in-herdr beats headless (visible + inter-agent comms); fleet-efficiency memory says the bottleneck is deliberating Opus leads + idle Fable, not Codex; target ~80% Codex utilization.

Subsumed: the original "every agent harness on the internet" landscape survey (corpus slice stays mapped: cat 116 core, ≈5,600 repos / ≈1,500 saucy across 116/117/118/119/121/122/239/103/274/275/287; openclaw/claude-code/codex/opencode/hermes/aider/goose all present) — now a supporting input ("what do others do well that our layer should steal") rather than the question itself.

### GQ-003 · Who are the God-source people? MERGED → GQ-006

Merged 2026-07-10 (the owner): the people graph is not a standalone question — it's secondary information that falls out of working the information organ. "Certain people will just be god-source information... it's kind of all wrapped into the same thing." Once GQ-006's pipelines run (e.g. daily transcripts from named YouTube creators), the god-source people emerge from the data. Original early-signature question preserved inside GQ-006's output shape.

### GQ-004 · What's the best [X] primitive? (the reusable-component meta-question) SEED

Question: For a given primitive — auth, rate-limiter, vector store, job queue, SSE layer, retry/backoff, config loader — what's the best implementation across the corpus, and is it worth vendoring into SourceBank? (This is the project_foundry SourceBank thesis as a repeatable god question: "best-in-class X, with evidence.")

Corpus slice: capability-filtered, EXCLUDING harnesses (his negative filter when component-mining). Output: a ranked shortlist per primitive → feeds the Builder agent. Note: this is parametric — one question template, many fills.

### GQ-005 · Where is the field actually moving? (momentum / emergence) SEED

Question: Using L3 momentum deltas, which categories / techniques / repos are gaining fastest right now, and what does the acceleration predict about where the field goes next?

Corpus slice: the momentum snapshots table (L3, step 7 — start ASAP, can't backfill). Why: coverage tells you what exists; momentum tells you what matters next. The one question that decays if we don't start collecting now.

### GQ-006 · The information organ — Foundry running, and baked into the harness [owner-authored, live-anchored]

Question/Task (the owner 2026-07-10 — part god question, part god TASK): We have a Mac mini running 24/7 with ~1.2M repos mapped — but the agents don't know how to check it. Access to the corpus must be baked into the agent harness: any agent, any scenario, can pull whatever repos it wants as a primitive. Same for the rest of the information organ: daily transcript pulls for named YouTube creators (exists but flaky — "it doesn't always work"), news, Twitter, GitHub — all valuable data continuously gathered for our AIs to mine, learn from, and improve on: the best primitives for using Claude Code, skills, and self-learning — when something goes wrong or feedback lands, there's an easy loop that turns it into improvement.

Absorbs GQ-003: the people graph is secondary information that emerges from working this organ — certain creators/people ARE god-source; watching them is the people graph. Early-signature question ("spot the next Karpathy before fame") lives here as an output.

STATUS 2026-07-10 (OPUS-FOUNDRY, GQ-006 run): largely DELIVERED — (2) harness primitive SHIPPED (global foundry skill: repos/transcripts/insights/people/status/signal + foundry research = L4 fan-out that READS READMEs, ~34 parallel MiniMax workers/question); (1) organ running: transcripts fixed+draining, heartbeat live (caught scrape-discovery stall ~7 Jul — open), momentum snapshots started, categorizer guarded+reloaded; (3) read-half wired (insights domain + daily-signal push), write-half open. THREE god-question answers produced (fleet-orchestration · self-improvement · corpus-access) → SISO_Agent_Base/Foundry/research/answers/gq006-volley/. MiniMax plan exhausted 2026-07-09 night (the owner spend-decision pending). Full record: .agents/jarvis/work/god-questions/out/gq-006/ + FOUNDRY-PLAN #update-20260710.

Evidence base / current state: Foundry wraps it all but the owner hasn't had time on it — needs a fresh look. Map = SISO_Agent_Base/Foundry/FOUNDRY.html, runbook = FOUNDRY-PLAN.html; 2026-07-02 audit found zombie-green ops (Tor-IP killed YouTube pulls, categorizer off since the 429 burn). Mini = engine, laptop = cockpit, single-writer law. Output shape: (1) the organ actually RUNNING green (collectors healthy, transcripts daily); (2) a harness primitive (skill) any agent can call to query the 1.2M-repo corpus; (3) the self-learning feedback loop wired.

### GQ-008 · The model-routing evidence base — who's actually good at what [owner-authored, live-anchored]

Question (the owner 2026-07-10, voice): Deep-dive scrape of artificialanalysis.ai + every serious benchmark site (LMArena, LiveBench, SWE-bench boards, vendor cards…) for every model we can run — MiniMax M3, all Claude models (Fable 5, Opus, Haiku), all GPT/Codex models (gpt-5.6-sol, 5.5, Spark…) — and turn it into an evidence-based map of which scenarios each model should own. "It takes all the models' benchmarks into consideration… who's good at what — look at their benchmarks and figure out who should be used for what." Feeds the routing agent directly.

Real-world constraints that pure benchmarks miss (must be first-class inputs): quota economics (Fable ≈ 2-3x less allowance than Codex; MiniMax ≈ unlimited ~1B tok/day plan; Sol ~24k-token boot floor per one-shot), the owner's priors to confirm/deny with data: MiniMax strong at long-horizon coding + low hallucination → good verifier/searcher.

Output shape: (1) scenario × model routing matrix with benchmark evidence per cell, graded; (2) a MACHINE-READABLE routing table (JSON) the Bifrost router / allocator / agents consume; (3) re-scrape trigger so it stays current as models drop. LIVE anchor: today's routing ladder (MiniMax=bulk+builds, Opus/Fable=judgment, Sol=hard-code scalpel — brain.md 2026-07-10) is the hypothesis this question tests. Example seed URL: https://artificialanalysis.ai/models/claude-fable-5. Workspace: work/god-questions/out/gq-008/.

## Adding a question

Append a new entry with the next GQ-NNN. Minimum fields: the question in one sentence, the corpus slice it needs (which categories/people/momentum), the output shape, and the tag. If the owner says it out loud, tag it OWNER and put it at the top of their concern. Capture FIRST, scope SECOND — a half-formed question is worth keeping. Cross-reference the search-intents log (foundry-search-intents memory) — every value-mining search he runs is a latent god question.

Provenance: seeded 2026-06-26 from the owner's full Foundry vision dump (session 34a3da38). GQ-001/002 are his words; GQ-004/005 are first-principles candidates derived from the 4-layer thesis + SourceBank memory — the owner to keep, kill, or reword. Restructured 2026-07-10 from the owner's voice session (verbatim: .agents/jarvis/memory/conversations/2026-07-10.md): GQ-001 expanded to the agent-workspace complete-stack question, GQ-002 reworded to 10x-the-SISO-layer, GQ-003 merged into new GQ-006 (information organ). (GQ-007 was a personal question and is not published.) GQ-004/005 untouched by the owner — still seeds, kill freely.
