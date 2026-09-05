# Bakery ordering app — dispatch brief

Apply `UNFUCK.md` in full. You are the accountable owner of this project.

## Root and sources

- Project root: `~/work/crumb-orders`
- Other repos / services that make this project possible: `~/work/crumb-worker` (nightly sync job), Supabase project `crumb-prod`
- Original intent lives in: `docs/voice/2026-06-kickoff.md`, `docs/client/whatsapp-export-2026-07.txt`, Loom links in `docs/client/looms.md`
- Client / user feedback lives in: `docs/client/`, GitHub issues labelled `client`
- Existing entry point (may be stale): `README.md` (last touched by an agent in July; unverified)

## What we were actually trying to achieve

The bakery owner wants to stop taking orders over WhatsApp. Customers pick a pickup slot, pay, and she sees one screen in the morning with what to bake. That's it. Everything else was our idea, not hers.

## Where it hurts (be honest)

- Three worktrees (`main`, `feature/slots-v2`, `agent/refactor-2026-07`) and nobody knows which one the deployed site is built from.
- A previous agent added a "phase plan" and an admin approval flow the client never asked for.
- The nightly sync job in `crumb-worker` fails silently about twice a week.
- README describes a Docker setup we don't use any more.

## Current owners and boundaries

- Other agents / people active on adjacent work: none
- Do not touch: `crumb-prod` Supabase data; anything under `infra/legacy-stripe/` (client's accountant depends on it)
- Coordinate before changing: none

## Real constraints

- Privacy / publication: customer names and phone numbers never leave the repo; no public demo with real data
- Money / external actions: no new paid services; no emails to the client — draft them for me
- Production / irreversible: no production deploy or DB migration without my explicit yes
- Run / test commands as they exist today: unknown — discover and record them in the README

## Success

The deployed site is built from one known branch, the morning screen shows the right orders, the sync job either works or fails loudly, and a fresh agent can read the README and be useful in ten minutes without asking me anything.

## Communication

Keep routine progress in `CURRENT_STATE.md`. Surface only a genuinely new blocking decision, an authority conflict or an urgent risk to me directly.
