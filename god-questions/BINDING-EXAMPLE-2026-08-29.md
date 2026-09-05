> Worked example. This is how one client project (an app-builder called Actionist) audited itself against the God Questions on 2026-08-29: re-deriving every count from source, finding the inversion (the project *is* the engine that answers GQ-004), and listing the standing obligations that fell out. Paths are that project's; read it for the method.

# The God Questions — what governs this project

Date: 2026-08-29 · Owner: the project's God-Questions lane · Status: proposal for owner review
Binding method: **by reference only.** Every link below is a pointer to a record that stays
where it lives. Nothing in `Great_Library_of_SISO/` is edited, copied, or vendored by this
document. That is GQ-006 success criterion 3, applied to ourselves.

---

## Read this first: the count is wrong everywhere

`ECOSYSTEM.md:25` says the Great Library holds "9 God Questions". The dispatch that
commissioned this document says nine. GQ-009's own `watch_trigger_status` field says
"All 7 registry questions".

Re-derived from source on 2026-08-29:

```
ls Great_Library_of_SISO/registry/works/frontier-question-gq-*.json | wc -l
→ 8
```

The eight are **GQ-001, 002, 004, 005, 006, 008, 009, 010**. There is no GQ-003 record and no
GQ-007 record in the registry. Three different published counts exist for one set of files and
none of them is the observed number.

This is not a footnote. GQ-006's second success criterion is *"Every number the organ publishes
can be re-derived mechanically from a named source by a second program that did not produce
it."* The first time this document ran that check against our own front door, it failed. The
correction belongs at the top rather than in an appendix, because the failure mode it
demonstrates — a number that everyone repeats and nobody re-derives — is the exact one the
binding below is meant to catch.

---

## The inversion, stated precisely

Actionist has been treating the Great Library as an index to be listed in. The relationship
runs the other way.

**GQ-004 · Best Software Primitive** has carried `"state": "scoped"` since 2026-08-04 and this
evidence gap, verbatim from
`registry/works/frontier-question-gq-004.json:106`:

> "No primitive has been evaluated yet. This contract defines what an answer would have to
> satisfy; it does not report findings."

Its question (`:71`) is *"For a named software primitive, which implementation is best for the
stated context, and is it safe and valuable to reuse, vendor, or learn from?"*

That is the capability shelf's question. It is the RVM's question. It is the foundry's
question. Actionist is not a consumer of GQ-004 — **Actionist is the engine that answers it**,
and GQ-004 is the standing specification Actionist has been building toward without citing.

But the inversion cuts both ways, and this is the part worth being honest about up front. Read
GQ-004's answer_shape (`:85`) next to what the shelf currently holds:

| GQ-004 requires | Shelf has (measured 2026-08-29) |
|---|---|
| A **context-specific** ranked shortlist | No shortlist. 3,010 rows, ranked by `priority_score` with no named context |
| Interface fit vs. the context's **actual call sites** | No call-site evidence on any row |
| Evidence grade | `evidence_classes` present, but 2,819/3,010 are `stage_0_intake` |
| Rights gate applied **before** reuse | Rights recorded; gate never exercised end to end |
| Adoption cost **including removal cost** | `adaptation_burden` defined in RVM; never measured. No removal-cost field exists |
| **Explicit reason NOT to choose each candidate** | **No such field exists anywhere in the shelf schema** |

And the qualification counts, re-derived from `knowledge/capability-shelf/source-registry.jsonl`
immediately before writing this line:

```
total rows                    3,010
qualification_status QUALIFIED    0     (all 3,010 NOT_QUALIFIED)
admission_status ADMITTED         0     (all 3,010 NOT_ADMITTED)
foundry_stage stage_0_intake  2,819
rows with any client precedent    7
```

So the honest statement of the inversion is narrower than the one in `ECOSYSTEM.md:65`
(*"Actionist is not a consumer of the Great Library. It is the engine that answers its hardest
open question"*). That sentence is written in the present tense and it is **a claim about the
future**. Stated as a present fact:

> **Actionist could answer GQ-004 and has produced no evidence that would qualify.** Zero
> qualified rows means zero GQ-004 findings. The engine is designed, partly built, and has never
> been run to completion on a single primitive.

Two things stop that from being merely a deflation.

**First, the bar is already written and we did not write it.** GQ-004's contract states exactly
what the first completed run must produce — down to a field we do not have. We are not guessing
at a standard, which is the usual reason a first attempt gets rejected.

**Second, and less obvious: a GQ-004 finding is a *shortlist*, so one qualified block would
still not be one.** `answer_shape` requires *"explicit reasons not to choose each candidate"* —
plural. That needs **two or more candidates for the same primitive in the same named context.**
The two built blocks are different primitives (a data grid and a workspace/editor), so even
qualifying both produces two decisions and zero findings. The gap between here and the first
finding is not "finish qualification"; it is **qualify a second donor of a capability we have
already started**, which is a queue decision nobody has had to make yet.

That is the practical content of the inversion, and it is worth more than the slogan.

---

## The binding map

Eight questions. Four bind directly and govern work in flight. Four are unexamined against this
project until now; two of those turn out to bind harder than expected.

### Summary table

| GQ | State | Binds to | Strength | What it already decided for us |
|---|---|---|---|---|
| [GQ-004](#gq-004--best-software-primitive) | `scoped` | Shelf, RVM, foundry | **Governing** | The bar for a selection answer; we owe it findings |
| [GQ-006](#gq-006--the-information-organ) | `partial` | State record, front door, gates | **Governing** | Bind by reference; re-derivable numbers; per-lane staleness |
| [GQ-002](#gq-002--10-the-agent-layer) / [GQ-008](#gq-008--model-routing-evidence) | `partial` | Every framework we write | **Governing** | The zero-falsifier failure mode, and the measurement-artifact trap |
| [GQ-001](#gq-001--the-agent-workspace) | `partial` | INTENT, ownership table, blocks | **Strong** | Universal vs. preference must be marked per claim |
| [GQ-009](#gq-009--the-god-questions-observatory) | `researching` | This document; the whole binding | **Strong, and reciprocal** | We are its missing standing agent |
| [GQ-005](#gq-005--where-the-field-is-moving) | `scoped` | Discovery estate | **Moderate** | Dated predictions with pre-fixed scoring |
| [GQ-010](#gq-010--the-people-graph) | `scoped` | Nothing directly — but see the analogy | **Analogical, and the sharpest one** | Row count is not value. It already ran our experiment |

---

### GQ-004 · Best Software Primitive
`registry/works/frontier-question-gq-004.json` · `gls:work:85964f1c-2efe-48b0-8f71-dc32bb668c0c`
State `scoped` · lifecycle `experimental` · updated 2026-08-04

**Binds to:** `knowledge/capability-shelf/source-registry.jsonl` (3,010 rows),
`knowledge/frameworks/repository-value-matrix-v1.md`,
`knowledge/capability-shelf/FOUNDRY-PROCESS.md` (11 stages),
`blocks/teable-data-grid/`, `blocks/affine-workspace/`.

**What it has already decided, so we do not get to re-litigate it:**

1. *"Every candidate carries an explicit reason NOT to choose it — a shortlist without stated
   downsides is advocacy, not evaluation."* (`success_criteria[0]`) — The RVM produces a
   Diamond Score and a `minimum_critical_dimension`. A low dimension is not a reason not to
   choose; it is a number. **This field does not exist in our schema and must be added.**
2. *"Interface fit is assessed against the named context's actual call sites, not against the
   candidate's own documentation."* (`success_criteria[2]`) — RVM's `integration_seams`
   dimension is measured from the donor's typed APIs and extension points. That is the
   candidate's side of the seam. GQ-004 requires the **host's** side.
3. *"Adoption cost includes the cost of removing the candidate later, not only of adding it."*
   (`success_criteria[3]`) — `adaptation_burden` counts surgeries to get in. Nothing counts
   the cost of getting out. R4's iframe-debt argument is exactly a removal-cost argument that
   the scoring framework cannot express.
4. *"The rights gate is applied and recorded per candidate before any code is vendored or
   reused, not after."* (`success_criteria[1]`) — Consistent with R1 (licence is not a
   selection input) because a gate at **admission** is not a weight at **selection**. GQ-004
   and R1 agree; they are describing different stages.

**Its falsifier that will fire on us first** (`falsifiers[2]`): *"The 'best' choice changes
when the context is restated slightly, indicating the ranking tracked the phrasing rather than
the requirement."* The RVM scores per `(source, shape, recipe, block, workflow)`. Restating a
recipe slightly is cheap. Nobody has checked whether the ranking is stable under it.

**What it explicitly leaves open:** which primitives to evaluate, in what order, and what
counts as a "named context". GQ-004 defines the bar, not the queue. That is ours to choose.

**Where our evidence flows back:** a qualified block becomes a GQ-004 finding. See
[G3 flow-back](#the-flow-back-path) below. Requires ≥1 row at `QUALIFIED`. Currently 0.

---

### GQ-006 · The Information Organ
`registry/works/frontier-question-gq-006.json` · `gls:work:2144e900-4886-461e-92f1-49571f2e9f74`
State `partial` · lifecycle `active` · updated 2026-08-04

**Binds to:** `site/system-map/data/state.json`, INTENT.md as front door, every gate and
verifier we run, and this document.

**What it has already decided:**

1. *"Evidence attaches to a question by reference — byte ranges into sources — rather than by
   copying corpora into the registry."* (`success_criteria[2]`) — This is the constraint that
   makes the whole flow-back design tractable. The 6.7MB `source-registry.jsonl` never moves.
   Already adopted in ECOSYSTEM.md's standing constraints.
2. *"Freshness is derived from observable state, never asserted by whoever last touched the
   record."* (`success_criteria[0]`) — Our `observed_at: "2026-08-28"` fields are assertions by
   the last writer. They are exactly what this criterion prohibits.
3. *"A delivery path that stops working becomes visible without anyone remembering to check
   it."* (`success_criteria[3]`)

**Its falsifiers, three of which have already fired in the Library** (`state_note`: *"three of
the four falsifiers have already fired at least once"*) — these are recorded failure modes, not
hypotheticals:

- **Falsifier 1 fired:** *"a hyphen/underscore path typo reported 0 source inventories when 6
  existed, because the builder and the checker shared the wrong path."* This is why R5's
  strengthened form demands a *second program that did not produce the number*. A verifier
  sharing code with its generator verifies nothing.
- **Falsifier 2 fired:** *"hardening a verifier marked all 10 claims stale at once"* — a gate
  that cries wolf is worse than no gate. Adopted in INTENT.md as the per-lane staleness rule.
- **Falsifier 4 fired:** *"the organ reports a pipeline as healthy while that pipeline has never
  actually run end to end... outbox/sent/ was empty — zero escalations ever delivered."*

**That last one is us, right now, in a different costume.** The foundry is an 11-stage pipeline.
Stages 0-6 have run. Stages 8-10 (qualification, admission, production learning) have never run
to completion on any source: 0 QUALIFIED, 0 ADMITTED. The framework register reports 24
frameworks at `machine_readable` and `specified` maturity — which is honest — but
`registry-summary.json` describes a 3,010-row shelf in the language of an operating system.
GQ-006 falsifier 4 is the check that catches this, and it fires.

**What it leaves open:** the query primitives and push mechanism. Its own evidence gap says
*"Push freshness into agent workflows is named in the question but unbuilt: the organ currently
publishes and waits to be read rather than pushing into a loop."* Our state record has the same
shape and the same gap.

---

### GQ-002 · 10× the Agent Layer
`registry/works/frontier-question-gq-002.json` · State `partial` · lifecycle `active`

### GQ-008 · Model Routing Evidence
`registry/works/frontier-question-gq-008.json` · State `partial` · lifecycle `active`

These two bind as a pair, because they were downgraded on the same day for the same reason and
they teach the same two lessons.

**Lesson one — the zero-falsifier downgrade.** Both carry a `state_note` recording a
downgrade from `answered` to `partial` on 2026-08-04. GQ-008's reads: *"Downgraded from
'answered' on 2026-08-04, for the same reason as GQ-002: marked answered while carrying zero
falsifiers."* GQ-002's adds the sharper line: ***"Writing the falsifiers is what exposed the
gap."***

This is R6's precedent and it is already in INTENT.md. What is *not* yet acted on: **0 of our
24 frameworks carry `success_criteria`.** All 24 carry falsifiers (2-3 each — verified by
reading `frameworks[].falsifiers` across `framework-register.json`). We adopted half the
contract shape. G2 proposes the other half.

**Lesson two — the measurement-artifact trap, which is the dangerous one.** GQ-008's third
falsifier:

> *"A measured cost gap between providers disappears once gateway configuration is corrected,
> meaning the matrix ranked a misconfiguration rather than a model. This has already partially
> fired: MiniMax reads 0 cached tokens through Bifrost and 2,944 of 3,033 through the local
> proxy."*

And its fourth success criterion: *"The matrix distinguishes provider capability from gateway
configuration, so a defect in the path is not recorded as a property of the model."*

The RVM has no equivalent criterion, and it needs one more urgently than GQ-008 did. Full
analysis in [G4](#g4--where-our-frameworks-can-fail-the-same-way).

---

### GQ-001 · The Agent Workspace
`registry/works/frontier-question-gq-001.json` · State `partial` · lifecycle `active`
**Unexamined until now. It binds strongly.**

**Binds to:** INTENT.md's ownership table (§3), the domain/contract seam model, the block
record structure, `AGENTS.md`, `CLAUDE.md`.

**What it decides for us:**

1. *"Each principle is graded by the evidence behind it and states whether it is a universal
   finding or a SISO preference."* (`success_criteria[0]`) — INTENT.md's six standing rules are
   stated as universals. R4 ("default reuse shape is fork and integrate natively") is a
   preference derived from one observation about AFFiNE's iframe. It may well be right; it is
   not graded, and GQ-001 requires that distinction **per principle**.
2. *"Rejected patterns are recorded with the observation that rejected them, so a later reader
   can tell a tried-and-failed pattern from an untried one."* (`success_criteria[1]`) — INTENT
   does this well. Every rule carries its counter-example with a date. This is the one criterion
   we already pass cleanly.
3. *"A principle that has never been violated in practice is marked as untested rather than as
   confirmed."* (`success_criteria[3]`)

**Its first assumption, `QA-GQ001-BOUNDARIES`** (from the `program` block): *"A complete agent
workspace can integrate its organs through typed interfaces without collapsing their independent
ownership boundaries."* Falsifier: *"Representative workspace tasks require one organ to own
another organ's durable state, evidence adjudication, and runtime authority to remain
coherent."*

INTENT.md §3 is a bet on exactly that assumption — "No domain owns another domain's truth.
Agents own domains; contracts own the seams." **Actionist is a second workspace testing
GQ-001's central assumption**, and GQ-001's headline evidence gap is that it has only one:
*"Evidence comes almost entirely from a single workspace operated by a single agent, so
'universal' cannot yet be distinguished from 'true here'."*

That is a genuine, cheap, unclaimed contribution. We are the second data point GQ-001 says it
needs, and we cost nothing extra to observe.

---

### GQ-009 · The God Questions Observatory
`registry/works/frontier-question-gq-009.json` · State `researching` · lifecycle `active`
**Unexamined until now. It binds reciprocally — this document is an instance of it.**

**What it decides:** *"A question can justify a bounded action candidate and later receive a
verified learning return without the Library authorizing or executing the action."*
(`success_criteria[2]`). This is the governance shape of the entire flow-back design: the
Library never authorizes Actionist work; it receives evidence returns. G3 is built to that
constraint.

**Its evidence gap names us exactly:**

> *"No standing agent operates the loop. Every piece of infrastructure built to date is supply;
> nothing continuously reads a question, finds bearing evidence, and updates an answer. This is
> the gap between a warehouse and an organ."*

**Actionist is a candidate standing agent for GQ-004.** Not a metaphor — that is the literal
missing component, and GQ-004 is the question we are already built to read.

**And its fifth watch trigger is the one nobody can fire alone:**

> *"A standing agent proposes a change to the Library or Foundry and it survives independent
> review — the first evidence that self-improvement is real rather than asserted."*

Its own recorded status: *"CANNOT FIRE BY CONSTRUCTION — the standing agent is the proposer and
the trigger requires INDEPENDENT review. This is the only one genuinely blocked on a second
party."*

**Actionist is a second party.** A proposal originating in this project, reviewed by the
Library's maintainer, is structurally capable of firing GQ-009's watch trigger 5 — the trigger
its own record says cannot fire by construction. That is the single highest-leverage move
available in this whole engagement, and it costs one well-formed proposal.

**Its hardest constraint on us** (`falsifiers[3]`): *"Maintaining the question contract costs
more attention than the repeated research and decision errors it prevents."* G2 must not
produce ceremony. Every field proposed there has to earn its keep.

---

### GQ-005 · Where the Field Is Moving
`registry/works/frontier-question-gq-005.json` · State `scoped` · lifecycle `experimental`
**Unexamined until now. Binds moderately — and warns us off a trap.**

**Binds to:** the discovery estate (Mac Mini `identity.sqlite`, 1,358,200 `repo_card` rows),
the industry discovery scrapes in `registry-summary.json`, any future "what's trending" input
to shelf ranking.

**What it decides:** *"Every predicted movement carries a date and a scoring rule fixed in
advance, so it can later be marked right or wrong without renegotiation."* If shelf ranking
ever consumes a momentum signal, it inherits this bar.

**The warning it carries for us**, from its own evidence gaps, measured 2026-08-04: the top
category by star gain (`agent-extension-pack`, 2.06/repo against a 0.045 baseline) *"draws 92.1%
of its gain from ONE repository, and only 29 repos in the whole corpus moved at all across the
three days."*

A momentum signal that is 92% one repository is a signal about one repository. Our
`priority_score` field ranks 3,010 rows and no one has checked its concentration. Same failure
shape, unexamined.

**Second warning, from `falsifiers[2]`:** *"The observed deltas are dominated by measurement
artifacts — a source changing its reporting rather than the field changing."* R2's counter-
example (an agent re-scraped 21st.dev for 3,507 components already on disk, 37% redundant fetch
rate) is a discovery-estate failure of the same family: measuring our own collection activity
and mistaking it for signal about the world.

---

### GQ-010 · The People Graph
`registry/works/frontier-question-gq-010.json` · State `scoped` · lifecycle `active`
updated 2026-08-06 — the most recently revised of the eight.
**No direct binding. And it is the most useful question on this list for us.**

The People Graph is not our domain and nothing in Actionist touches it. But GQ-010's question
is, structurally, our question with the nouns swapped:

> *"How do we increase the People Graph's research and decision value by 100× **without treating
> row count as value** or weakening identity quality, provenance, rights, privacy,
> reproducibility, and reversibility?"*

Substitute "capability shelf" for "People Graph" and that is R3 — *breadth is not progress* —
stated as a research contract with measurable criteria, four weeks before an Actionist lane ran
a breadth wave from 191 to 3,010 rows and rated zero of them.

**GQ-010 already ran our experiment and pre-registered the result.** Its first falsifier:

> *"Source expansion increases rows or edges by at least tenfold but produces no measured
> improvement in the five decision-use cases."*

Actionist: 191 → 3,010 rows is a **15.8× expansion**. Measured improvement in decisions: none
recorded. Qualified rows: 0. **That falsifier, applied to our shelf, fires.** It is the
cleanest external confirmation available that R3 was right, and it comes from a question that
was not written about us.

**What we should steal from it wholesale.** GQ-010 separates value into six named dimensions
where our shelf has one (`priority_score`): breadth, resolution quality, research depth,
**decision value**, rights/privacy, and reproducibility/cost. Its fourth criterion is the one
our framework register has no analogue for:

> *"Decision value: in at least five pre-registered operator or research decisions, the graph
> changes the selected action or reduces evidence-retrieval time by at least 80% against a
> measured baseline; **additional rows alone cannot satisfy this criterion**."*

Pre-registered decisions, a measured baseline, a numeric threshold, and an explicit statement
that volume cannot substitute. That is the shape of the success criterion the RVM is missing,
already written, already dated, by someone who was not thinking about us. G2 adopts it.

---

## What binds to nothing

Honest negative result, since a binding map that finds everything relevant is not a map.

- **GQ-005 → composition/host/data domains:** nothing. Momentum has no bearing on how a block
  binds to a host.
- **GQ-010 → any Actionist domain:** nothing directly. Its value is analogical, and the analogy
  is load-bearing enough to justify the section above, but no Actionist artifact should cite
  GQ-010 as governing evidence.
- **GQ-003, GQ-007:** do not exist. If a future document cites either, it is citing the phantom
  count corrected at the top of this file.

---

## The flow-back path

Designed here, not executed. Detail and open questions in
`research/workstreams/2026-08-29-god-questions/G3-FLOW-BACK.md`.

```
Actionist                                          Great Library
─────────                                          ─────────────
shelf row (3,010)          ─── no path ───▶        (nothing; discovery is not evidence)
       │
       │ foundry stages 1-7
       ▼
qualified block (0 today)  ─── pointer ──▶         Source Inventory campaign unit
       │                                            · promotion.stage
       │                                            · verification_evidence_refs  ← by reference
       │                                            · next_gate / blockers
       ▼
admitted block (0 today)   ─── pointer ──▶         GQ-004 finding
                                                    · named context
                                                    · reason-not-to-choose per candidate
                                                    · measured adoption + removal cost
```

Three properties this design must preserve, each traceable to a named constraint:

1. **Zero forks, zero vendoring** — the Library catalogues by URL + pinned revision. Our
   6.7MB `source-registry.jsonl` never enters it. (GQ-006 `success_criteria[2]`; CONTRIBUTING
   "Capability discovery and promotion".)
2. **Registration shape is a single Work + a dated Source Inventory campaign, not a Section.**
   A Section requires a `build.mjs` edit, closed-enum schema changes, a Snapshot, and an Event.
   The project owner established this; the schema confirms it — `source-inventory.schema.json` has a
   `campaign` object with exactly the ten-stage `lifecycle` enum INTENT.md §4 already adopted
   verbatim.
3. **Discovery must not create a Work automatically** (CONTRIBUTING, verbatim). The 3,010 rows
   are discovery. They have no path into the Library and should not acquire one. Only a
   reviewed, qualified candidate promotes.

**The gating fact:** every arrow below the first is currently empty. The path can be designed
now and cannot be exercised until one row reaches `QUALIFIED`.

---

## G4 — where our frameworks can fail the same way

GQ-008's falsifier 3 fired: a measured MiniMax cost disadvantage turned out to be a gateway
defect, not a model property. The matrix ranked a misconfiguration and reported it as a finding.

Full audit in `research/workstreams/2026-08-29-god-questions/G4-MEASUREMENT-ARTIFACTS.md`.
Headline: **VSCP-1 is the RVM's gateway-defect.** `ui_quality` carries weight 0.22 for surface/module
rows and 0.24 for pattern rows — the single heaviest dimension in both profiles — and it is
scored entirely from screenshots taken by our own harness under our pinned fonts, locale, device
scale factor and reduced-motion preference. A donor that renders badly under *our* capture
configuration is indistinguishable, in the resulting score, from a donor that renders badly.
The RVM has no criterion separating donor property from harness configuration. GQ-008 has
exactly that criterion (`success_criteria[3]`) and needed it.

---

## Standing obligations this binding creates

| # | Obligation | From | Status |
|---|---|---|---|
| 1 | Add a per-candidate "reason not to choose" field | GQ-004 `success_criteria[0]` | proposed in G2 |
| 2 | Assess interface fit against host call sites, not donor docs | GQ-004 `success_criteria[2]` | proposed in G2 |
| 3 | Add removal cost to adoption cost | GQ-004 `success_criteria[3]` | proposed in G2 |
| 4 | Add `success_criteria` to all 24 frameworks | GQ-002/008 downgrade precedent | proposed in G2 |
| 5 | Separate donor property from harness configuration in VSCP-1 | GQ-008 `success_criteria[3]` | proposed in G4 |
| 6 | Mark each INTENT rule universal vs. SISO preference | GQ-001 `success_criteria[0]` | open |
| 7 | Check `priority_score` concentration before using it to rank | GQ-005 evidence gap | open |
| 8 | Add a decision-value criterion that volume cannot satisfy | GQ-010 `success_criteria[3]` | proposed in G2 |
| 9 | Qualify one block end to end, producing the first GQ-004 finding | GQ-004 evidence gap | blocked: 0 qualified |
| 10 | Offer one reviewable proposal to the Library | GQ-009 watch trigger 5 | open — highest leverage |
| 11 | Add a `VOID` verdict for subject/measurement mismatch | G4 finding 0 (observed 2026-08-29) | proposed in G2 |
| 12 | Stop research-tree artifacts self-describing as `canonical` | G4 finding 0 | open — cheapest on this list |

---

## Refresh policy for this document

Re-read the eight contracts and re-derive the counts when any of these occur:

- a God Question changes `state` or `updated_at` (all eight are currently 2026-08-04 except
  GQ-010 at 2026-08-06);
- the first shelf row reaches `QUALIFIED`, which makes obligation 9 live;
- a ninth God Question is added, or GQ-003/GQ-007 appear;
- any count in this document is quoted somewhere else without re-derivation — that is the
  failure mode described at the top, and it is a trigger, not a nuisance.

Every number here was re-derived from source on 2026-08-29 immediately before writing. Nothing
is quoted from another document, including the ones that were wrong.
