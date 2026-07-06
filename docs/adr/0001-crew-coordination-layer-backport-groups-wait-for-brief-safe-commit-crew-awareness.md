# Crew Coordination Layer Backport: Groups, wait-for-brief, safe-commit, Crew Awareness

- **Date**: 2026-07-06
- **Iteration**: 1
- **Status**: Proposed
- **Deciders**: Jérémie Lumbroso (decision authority, ratified 2026-07-03), Cartographer 5 (dispatcher, RFC reviewer), Shipwright 5 (author / implementer)

**TL;DR**: Backport the dogfooded crew coordination layer — group addressing + `broadcast`, `wait-for-brief` v4, `safe-commit`, crew-awareness recipes (`crew`/`groups`/`pulse`), generalized `ONBOARDING.md` + `ENCODING-MAP.md`, and the seat/occupant registry schema — from its downstream proving grounds (caring-form → ADRs4AI HQ) into the canonical template, shipping as v3.6.0, so that founding every future crew stops requiring a hand re-import.

---

## Quick Reference

**Navigation codes** (for grep):
- `QST:` Questions
- `ANS:` Answers
- `COD:` Code examples
- `API:` API calls
- `FIL:` Files to examine
- `DOC:` Documentation
- `NOT:` Notes, remarks, observations

**Find things**:
```bash
grep '^### QST:' file.md           # All questions
grep 'Status: unanswered' file.md  # Unanswered only
grep '^### COD:' file.md            # Code examples
```

---

## Originating Context

**Source**:
- `Brief: 2026-07-05-1539-cartographer-to-shipwright-firming-up-charter-topology-and-first-dispatch.md` (in the ADRs4AI meta repo's `docs/inbox/` — this template repo's coordination hub)
- Decision authority: Jérémie approved the backport 2026-07-03 (walkthrough batch 1; recorded in the meta repo's ADR-0002 inheritance notes and CLAUDE.md standing items). This ADR executes a made decision; the *selection* judgments within it are the author's, ORJ'd below.
- The backport candidates were first flagged in caring-form's `docs/justfile-changelog.md` (the layer's origin crew) and have since been independently re-imported by hand into two more sites (ADRs4AI HQ, 2026-07-01; vscode-adrs-for-ai, via caring-form import). Three hand-imports of the same layer is the signal that it belongs upstream.

**Agency Grant**: Execute the ratified backport; selection judgments (what exactly to port, from which lineage, version number) are the author's to make and defend in this ADR, subject to RFC review by Cartographer 5 and/or Jérémie before merge.

---

## Explicitation

**What I understand**:

1. **The template is the propagation root** — every downstream repo (caring-form, ADRs4AI HQ, vscode-adrs-for-ai, skill starter) syncs *from* it. Innovations born downstream (the crew layer) currently flow between siblings by hand-copy, which is how the same latent bug (see Assumption 3) reached two crews independently. Upstreaming ends that class of divergence.
2. **The layer being ported is operational, not speculative** — every piece has been dogfooded across at least two crews: reservation-only brief semantics (empty-stub bug hit 4+ times in caring-form), `wait-for-brief` (caring-form v4 semantics + two later fixes), `safe-commit` (cross-session staging pollution defense), `crew`/`pulse` (stall/error detection across seats), group addressing (crew-wide broadcasts).
3. **Lineage matters for correctness**: caring-form's original `wait-for-brief` carries a latent empty-inbox crash (`grep -c … || echo 0` emits two lines and breaks the arithmetic) — caught live in HQ 2026-07-04 (Naturalist's first wait died on it) and found again, unfixed, in vscode's copy on 2026-07-06 (fixed there by Understudy 5). HQ HEAD also carries the Hanlon's-razor timeout messaging (vscode-originated, imported to HQ 2026-07-06). **HQ HEAD is therefore the most-fixed lineage**, and the port source.
4. **`NOT:` is missing from `collab-adr-lean.md`'s Quick Reference** — while `debrief-template.md` in the same folder *uses* `### NOT:` (line 147), and QUICK-START.md / CLAUDE.md / METHODOLOGY.md all document it. Jérémie ratified "oversight — restore" on 2026-07-03. Verified at HEAD (`b920651`): the lean template's nav-code block is the only remaining omission; scope is that one block.

**Assumptions**:

- `CONVENTIONS.md` is already upstream (Statesman 4.7, v3.5.0) — **verified at HEAD**, ships unchanged.
- The HQ `scripts/last-message.py` (554 lines: tail-window reading, `--pulse`, groups awareness) and `scripts/groups-lookup.py` (162 lines) contain no HQ-specific hardcoding — verified by grep for repo/seat/user names; both resolve everything via `agent-sessions.json` + cwd.
- This repo's own unreleased work (`just adr` recipe, unwrap scripts — already on main) rides along in the same v3.6.0 release; it needs no changes from this ADR.

**Confirm**: Cartographer 5 (RFC), Jérémie (acceptance, or delegated to Cartographer if heads-down).

---

## Questions

### QST: Version number for the release carrying this backport?
- Status: unanswered
- Why asking: This repo has never been version-tagged (v3.5.0 exists only as a CHANGELOG heading + commit `f11042a`); this release starts the actual tag discipline, so the number sets precedent.
- Need: pick

Options: **A** — v3.6.0 (minor: additive coordination layer, no breaking changes to existing template files). **B** — v4.0.0 (major: the template's scope visibly grows from "dyad + inbox" to "multi-seat crews"). **C** — v3.5.1 (patch: "just tooling").

**Recommendation**: (by Shipwright 5, Claude Fable 5)

**A — v3.6.0.** Everything is additive: no existing file changes meaning, no adopter workflow breaks; SemVer says minor. C undersells it (new documents + six new recipes is a feature, not a fix). B would spend the major number on something adopters can ignore entirely — the crew layer only activates if you register seats; save v4 for a change that *requires* migration. The unreleased `just adr` + unwrap scripts fold into the same v3.6.0 entry.

**ANS:** (by )
[pending]

---

### QST: Include `inbox-archive`, which the dispatch's port list does not enumerate?
- Status: unanswered
- Why asking: The dispatch names `brief`/`completion`/`broadcast`/`wait-for-brief`/`safe-commit`/`crew`/`last`/`aliases`/`groups`/`discover-sessions`/`pulse`. `inbox-archive` (git-mv a brief to `archive/` + commit) is absent — but INBOX-PROTOCOL.md, which this template ships, documents archiving as lifecycle step 4, and both source repos carry the recipe.
- Need: yes/no

**Recommendation**: (by Shipwright 5, Claude Fable 5)

**Yes — include it.** The template already *prescribes* the archive step in prose; shipping every lifecycle recipe except the last one leaves adopters hand-naming `git mv` targets for exactly the step that closes the loop. One caveat handled in the port: the recipe auto-commits with a `chore(inbox):` message, which is opinionated — the recipe comment says so and invites adaptation. If the RFC reads the dispatch's list as exhaustive-by-intent, dropping it is a one-commit revert.

**ANS:** (by )
[pending]

---

## Supporting Materials

### FIL: port sources (all at ADRs4AI HQ repo HEAD, 2026-07-06)
- `justfile` — recipes: `broadcast`, `wait-for-brief` (v4 + empty-inbox fix + Hanlon's-razor timeout note), `safe-commit`, `crew`, `groups`, `pulse`, `inbox-archive`; reservation-only semantics on `brief`/`completion`
- `scripts/last-message.py` — replaces this repo's 319-line version (superset: tail-window reading, `--pulse`, groups)
- `scripts/groups-lookup.py` — new; resolves recipient → groups for `wait-for-brief` wake conditions
- `docs/inbox/ONBOARDING.md`, `docs/inbox/ENCODING-MAP.md` — generalized here (HQ-specific content stripped, structure kept)
- `docs/inbox/agent-sessions.json` — schema example gains `groups` + seat/occupant doctrine fields (`display_name`, `color`, `model`, `model_note`, `registered`)

### NOT: what is deliberately *not* ported
- HQ's `status`/`subs`/`pins`/`unanswered` recipes — coordination-*hub* tooling (multi-repo oversight), not seed-crew tooling; a fresh adopter has one repo.
- HQ's `seed`/`vignette` scaffold recipes — see Open Follow-ups.
- caring-form's original `wait-for-brief` — superseded lineage (see Explicitation 3).

---

## Decision

### Context
Founding a crew currently costs a hand-import of ~6 recipes + 2 scripts + 2 documents + a registry schema, done three times so far with divergence each time (one latent bug shipped twice). The template exists precisely to make adoption cheap and convergent.

### Options

**Option A**: Port from caring-form (the layer's origin).
- Pros: honors origin lineage directly.
- Cons: carries the empty-inbox crash; lacks the Hanlon's-razor timeout messaging; would re-ship a known bug into the propagation root.

**Option B**: Port from ADRs4AI HQ HEAD (origin + two generations of fixes).
- Pros: most-fixed lineage; both post-origin fixes included; HQ's copies are already generalized once (caring-form → HQ import, 2026-07-01).
- Cons: one more hop from origin — mitigated by attributing the full chain (Statesman 4.7 → caring-form crews → Naturalist 5 / Understudy 5 fixes) in CHANGELOG and file headers.

### Chosen: B — port from HQ HEAD

**Why**: The propagation root must carry the best-known version; lineage honor is an attribution problem, not a source-selection problem.

**Trade-offs accepted**: The template's copy is now the fourth site of this layer until downstream repos re-sync from it; the sync plan below bounds that window.

### Consequences
- Every future adopter gets the full coordination layer at `git clone` time; the three existing crews converge on one canonical copy.
- This repo starts real tag discipline (first tag ever) — see QST 1.
- Downstream sync plan: (1) ADRs4AI HQ syncs its `docs/adr/templates/` + `METHODOLOGY.md` copies immediately after this lands (owner: Shipwright 5, same dispatch); (2) vscode-adrs-for-ai crew notified by heads-up brief to Lapidary 5 — *their crew owns their sync*, anti-clobbering reminder re: their local `@adr-anchor` included; (3) caring-form: no action required (origin crew, already carries the layer; will pick up fixes at their own cadence — the porcelain/upgrade seed covers systematic re-sync); (4) skill starter repo: syncs when its dormancy ends (tracked at HQ).

---

## Open Follow-ups

- [ ] **Template CLAUDE.md carries project-specific pollution**: a "Tenth Directive" referencing Playwright MCP and "this reveal.js skill we are building" (plus `AI: Claude Sonnet 4.5` in the header) — clearly leaked from a specific project into the canonical template. Out of scope here (template changes are one-at-a-time); needs its own branch + ADR. Flagged to Cartographer in the RFC.
- [ ] **`seed` / `vignette` scaffold recipes**: HQ carries both; the template ships `seed-template.md` and prescribes vignettes (Sixth Directive) but has no minting recipes for either. Same "prescribes in prose, doesn't ship the recipe" gap as `inbox-archive` — candidate for a follow-up minor release rather than scope growth here.
- [ ] **Unverified**: `wait-for-brief`'s `stat -f %m || stat -c %Y` portability dance is dogfooded on macOS only; the Linux branch is untested in operational use. Catchability note, not a blocker.

---

## Action Items

- [ ] Implement port on branch `crew-tooling-backport` (granular commits) — Owner: Shipwright 5
- [ ] RFC brief to Cartographer 5 — Owner: Shipwright 5
- [ ] Merge + tag + push after acceptance — Owner: Shipwright 5
- [ ] HQ template-copy + METHODOLOGY sync sweep — Owner: Shipwright 5 (post-merge)
- [ ] Heads-up brief to Lapidary 5 (vscode crew) — Owner: Shipwright 5 (post-merge)
- [ ] Gitlink advance at HQ — Owner: Cartographer 5 (on completion brief)

---

## Validation

- [ ] Jérémie Lumbroso: decision matches the 2026-07-03 ratification; version + inbox-archive QSTs answered
- [ ] Cartographer 5: RFC pass — port manifest complete vs. dispatch; sync plan sound
- [ ] Shipwright 5: implementation matches this ADR; nothing ported beyond the manifest

**Notes**: Anti-clobbering bound throughout: no existing template file is overwritten in meaning; Statesman 4.7's attributed contributions (justfile header, CONVENTIONS.md) are extended, never replaced; attributions stack.

---

## Iterations

### Iteration 1 (2026-07-06)
- Trigger: Cartographer 5's first-dispatch brief (2026-07-05-1539), executing Jérémie's 2026-07-03 ratification
- Contributors: Shipwright 5 (Claude Fable 5)
- Changes: Initial draft — port manifest, lineage selection (HQ HEAD over caring-form origin), two QSTs (version; inbox-archive), NOT: restore verified to scope = lean template's Quick Reference only
- Outcome: `Draft → Proposed`; RFC brief to Cartographer 5

---

## Glossary

- **Crew layer**: the named-seat coordination substrate — registry (`agent-sessions.json` with seats, colors, models, groups), inbox recipes, cross-session awareness (`last`/`crew`/`pulse`), wait discipline (`wait-for-brief`), commit discipline (`safe-commit`).
- **Reservation-only semantics**: filename-minting recipes print the path but never `touch` it — an empty stub traps Write-tool flows and causes false `wait-for-brief` wakes.
- **Seat/occupant doctrine**: the seat (name, color, mission) persists across sessions; the occupant (`model`, `model_note`) records reality. The seat outlives the occupant.

---

## Links

- Related ADRs: meta repo ADR-0002 (template evolution sequencing; inheritance notes carry the ratification)
- Related briefs: `2026-07-05-1539-cartographer-to-shipwright-firming-up-charter-topology-and-first-dispatch.md`; `2026-07-06-0310-understudy-to-lapidary-cross-repo-justfile-fix-and-crew-acknowledgment.md` (both at HQ)
- Related seeds: `seed-2026-06-15-porcelain-to-upgrade-template.md` (HQ — systematic downstream re-sync tooling; this backport widens what it must fingerprint)
- Origin attribution: Statesman 4.7 (justfile seed + CONVENTIONS, 2026-06-15) → caring-form crews (wait-for-brief v4, safe-commit, crew registry, pulse) → Naturalist 5 (empty-inbox fix, 2026-07-04) → vscode crew via Understudy 5 (timeout messaging, 2026-07-06)

---

*Authored by Shipwright 5 (Claude Fable 5), 2026-07-06.*
