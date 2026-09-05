# UNFUCK — whole-project ownership prompt for a frontier agent

A reusable prompt you hand to the smartest model you have access to, together with a short brief about one project, that turns it from a task-runner into the **accountable owner** of that project. It recovers what you were actually trying to build, reads the real evidence (your prompts, transcripts, client feedback, code, tests, runtime), works out where the reasoning or implementation went wrong, and then makes the project materially better — and keeps going.

It is not a framework, a runtime, or a task system. It is two files:

| File | What it is |
|---|---|
| [`UNFUCK.md`](UNFUCK.md) | The prompt. Give it to the agent verbatim. |
| [`templates/BRIEF.md`](templates/BRIEF.md) | A fill-in dispatch brief for one project: root, sources, owners, constraints. |

Pair them and dispatch. That's the whole mechanism.

## Quick start

1. Copy `UNFUCK.md` and `templates/BRIEF.md` into the project (or anywhere the agent can read).
2. Fill in the brief — see [`examples/BRIEF-example.md`](examples/BRIEF-example.md). Five minutes. Be honest about what's broken.
3. Dispatch:

   ```text
   Read UNFUCK.md in full, then BRIEF.md. You are the owner of this project under that prompt. Begin.
   ```

4. Walk away. Come back to a resumable state, a working entry point, and a project that is better than you left it. It will only ping you for a genuinely new blocking decision, an authority conflict, or an urgent risk.

Works with any agent that can read files and run commands (Claude Code, Codex, Cursor agents, OpenHands, a Herdr/tmux pane — anything). The better the model, the better the result; the prompt is written for frontier-class reasoning and gets weaker on small models.

## What the prompt actually does

The prompt is organised around one idea: **the agent owns the outcome, not the task.**

- **Recover the real intent and evidence.** Read the original human prompts, voice transcripts, client feedback, decisions, code, tests and runtime — not another agent's summary. Distinguish what the human said from what a previous assistant proposed. Resolve corrections at the scope they were given; don't let the newest document silently win.
- **Be sceptical of inherited structure.** Tidy names, repeated conventions, phase plans and assistant-created approval processes are unproven until read. Neither age, nor which model wrote it, nor repetition proves something good or disposable. Read the thing and its consumers before changing or removing it.
- **Reason, decide, execute.** What are the actual outcomes? What's already valuable? Where did we build the wrong thing, duplicate, lose context, make iteration hard? Pick the shortest high-quality path and carry it through. Resolve decisions yourself when the evidence is sufficient; don't send the human a questionnaire the project files already answer.
- **Use compute intelligently.** Keep consequential reasoning and integration with the owner. Use scoped sub-agents for genuinely independent reading, implementation or verification — with exact ownership, a concrete outcome and a stop condition. No agent-per-noun, no recursive fan-out.
- **Verify against reality.** A green build, a screenshot, a catalogue count or a synthetic probe is not proof of integration. Test the changed behaviour and its existing consumers.
- **Leave a real front door.** Every project must end with a verified agent entry point (README / AGENTS / current-state) that a fresh reader can navigate from. Another unverified index is not a finished front door.
- **Distil learning, not instruction noise.** Promote only lessons that change a real decision. Keep private transcripts and client details out of reusable modules.
- **Stay the owner.** A finished milestone is a checkpoint, not the end. Keep working until the outcome is achieved or no useful authorised work remains.

Hard limits are explicit: no exposing secrets, no fabricated evidence, no unapproved spend, no binding a client to new terms, no overwriting another owner's work, no irreversible production/cutover changes without approval. The agent stops *that* action, explains once, and continues everything else.

## Why this exists

We run many projects in parallel with agents owning each one. Two failure modes kept recurring:

1. **Task-runner drift.** An agent completes the audit, the checklist or the first passing test and stops — leaving the project no more coherent than before.
2. **Slop accumulation.** Successive agents inherit tidy-looking but unverified structure (phase plans, approval rituals, duplicate docs, dead worktrees) and build on it because it *looks* deliberate.

UNFUCK answers both: give the whole project to one accountable owner, make it sceptical of everything it inherits, and make it prove improvement against the real intent and real runtime evidence. It has been through three revisions from actually dispatching it across client work, an internal ops app, a streaming product, a knowledge corpus and a machine-organisation job.

## Using it at scale

If you're dispatching many owners at once (one per project):

- One brief per project. Never a shared brief.
- Name the real root, source locations and any *other* active owners so they don't collide. Folder boundary ≠ product boundary.
- Let a lightweight routing agent hold cross-project priorities; it is **not** an approval desk. The prompt tells owners not to send it routine status.
- A template revision does not silently expand an already-dispatched project's scope. Re-dispatch explicitly if you want the new version applied.

## Versioning

`UNFUCK.md` carries its own version line at the top. v3 (5 September 2026) makes source authorship and decision-scoped supersession explicit — the agent must know *who* said a thing and *what scope* a correction applies to, because a transcript's `user` role can carry pasted proposals and generated summaries.

Fork it, change it, keep the version line honest.

## Licence

MIT. See [`LICENSE`](LICENSE).
