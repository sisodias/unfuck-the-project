# God Questions — the ranked list

Source of the ranked list: the owner's private Agent Zero folder, 5 September 2026. Older origins: `ORIGINS-2026-07.md`. Per-question research contracts: `library-contracts/`.

Definition (the owner): the ranked list of things worth throwing the highest intelligence at, by ROI.

| ID | Question | Status |
|---|---|---|
| GQ-001 | The Agent Workspace: the complete stack, not just code architecture | existing |
| GQ-002 | 10x the SISO agent layer | existing |
| GQ-003 | (phantom per 29 Aug file; do not cite) | none |
| GQ-004 | What's the best [X] primitive? (reusable-component meta-question) | existing |
| GQ-005 | Where is the field actually moving? | existing |
| GQ-006 | The information organ: Foundry running, baked into the harness | existing |
| GQ-007 | (phantom per 29 Aug file; do not cite) | none |
| GQ-008 | The model-routing evidence base: who is actually good at what | existing |
| GQ-009 | The God Questions Observatory | existing, 29 Aug |
| GQ-010 | The People Graph | existing, 29 Aug |
| GQ-011 | **Compute allocation.** Which tasks go to god-tier intelligence, which to cheap intelligence, and what framework lets the two cohere so cheap compute at 100x volume produces god-tier outcomes | new, memo 2 |
| GQ-012 | **Context.** How agents know everything without being stuffed: file-system-first search, entry files, windows, no RAG until measured failure. The owner: "if we solve that one problem ... fully autonomous OS" | new, memo 2 |
| GQ-013 | **Distillation.** From all components, all SaaS apps, all flows and pages: 2 to 3 good variations per component type across every dimension of an app, plus repos as modules and app-building principles reverse-engineered from the best-built SaaSes | new, memo 1 |
| GQ-014 | **Bets.** Index everyone on the planet doing what SISO needs across ~20 domains, pick the 10 to 20 horses that will keep improving, wrap them with as few lines as possible | new, memo 2 |
| GQ-015 | **The push surface.** How agents show the human things: one button from the terminal, a shared page shell, display sub-skills (mind map, timeline, table), decisions with options. "This terminal shit ain't it" | new, memo 3 |
| GQ-016 | **The Agent Zero front-end.** One agent or several, voice or terminal, how it acts, how it evolves | new, memo 4, first answer lives in the private protocol folder |
| GQ-017 | **Node topology.** Laptop vs home server vs client VPSs: what runs where, who controls allocation, how they talk privately without a third-party mesh VPN | new, memo 2 |
| GQ-018 | **Pricing.** Compute partner: compute-plus-margin now, percent of the business later. Market search 5 Sep found no one packaging it | new, memo 1 |
| GQ-019 | **Client intake.** Is the client's group chat the ticket queue? Every client WhatsApp group feeds a per-project inbox file; the project Agent Zero executes on the client VPS or the laptop, node-agnostic; replies gated until trusted | new, memo 6, second reading |

Rule: a GQ gets frontier-tier compute only when it has a written falsifier (what answer would make us stop). Add falsifiers before dispatching.

## Falsifiers (second reading, 5 Sep 2026, Agent Zero Two)

Written so GQ-011 to GQ-019 can receive god-tier compute under the rule above. Each line: what answer makes us stop, and the cheapest worker-tier probe that produces that answer. Full reasoning is in the private second reading.

| ID | Falsifier (stop if…) | First probe (worker tier) |
|---|---|---|
| GQ-011 | after 20 bounded briefs, worker-tier output passes the god-tier judge less than half the time | log tier + verdict per dispatch for one week (the RETURN block already carries both) |
| GQ-012 | a cold worker-tier model dropped on a project whose entry file is true still needs more than 3 reads before a correct first action | cold-start test on two live client projects; count reads-to-first-correct-action |
| GQ-013 | The owner, blind, does not prefer the judge's top 3 variations over the raw top 20 for one component type | one component type (login) through the component-bank judge once fixed; blind pick on the console |
| GQ-014 | a horse ships a breaking change we cannot absorb in a day (an upstream workspace-tool wipe on 28 Jun is the precedent) | pin versions; weekly upstream diff read per horse; count days lost to horses |
| GQ-015 | more than 3 console decisions are older than 24h at any session start  or the owner does not open the console twice in two days | decision read-back at the start of every owner session, answers taken by voice |
| GQ-016 | a week after the frontier model lands on the plan, the voice head still cannot dispatch one typed T1 action into an agent workspace | one T1 action (status read) end to end by voice |
| GQ-017 | the home node cannot stay reachable 7 days straight after sleep/network settings are fixed | cron ping log from the laptop; if it fails, the forever node is a VPS |
| GQ-018 | the next two clients will not sign an operator fee, or the standing cost exceeds the fee | put an operator line on the next two client proposals/invoices |
| GQ-019 | one week live in one client group chat: the number is banned, or no client message became a work item without the owner touching it | read-only listener on a dedicated number, one client group only, inbox files only, zero outbound |
