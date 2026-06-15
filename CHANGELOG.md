# Changelog

All notable changes to the `human-ai-collaboration-template` are recorded here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

---

## [Unreleased] — clarity-and-scaffolding

**Through-line — universal design**: making implicit semantics explicit. The previous template carried implied assumptions (single-human-and-single-AI dyad, fixed validation roles, prescribed iteration phases) that worked when the workflow matched those assumptions but quietly mislabeled cognitive work when it didn't. This release renames sections honestly, generalizes structures to accommodate variable participant configurations, and adds slots for substrate that the previous template lacked. The template remains opinion-free about *who* contributes — that's the adopter's call.

### Changed

- **`## Human Context` → `## Originating Context`** (`docs/adr/templates/collab-adr-lean.md`)
  *Rename.* The section accommodates any origin — human stream-of-consciousness, a brief from another contributor, a seed file, a prior ADR's open question, an observation, a code review. The previous "Human Context" heading misrepresented provenance when the originating source wasn't a human dump.
  *Philosophy*: preserve the thinking accurately. The section's job is to record where the thinking came from; the label should not assume a specific source.

- **`## AI Interpretation` → `## Explicitation`** (`docs/adr/templates/collab-adr-lean.md`)
  *Rename + one-line subhead* ("Making explicit what the Originating Context implied or contained tacitly"). The section captures a cognitive function — articulating tacit content from the originating context — independent of whether human or AI performs it.
  *Philosophy*: name the function, not the agent. Honest labeling enables universal design.

- **`Status` field — added `Proposed` as a value** (`docs/adr/templates/collab-adr-lean.md`)
  Status list is now `Draft | Proposed | Accepted | Implemented | Superseded`. The previous list lacked the "submitted for review, not yet accepted" intermediate state that real ADRs spend meaningful time at.
  *Philosophy*: iteration as documentation — the journey through statuses captures real evolution.

- **Validation checklist — generalized from dyadic to flexible** (`docs/adr/templates/collab-adr-lean.md`)
  Replaced fixed `Human: / AI:` rows with a flexible `[Name / role]: [What they're confirming]` pattern. Example rows now span the range of validations real ADRs do (decision captured, reasoning sound, approach implementable, risks acknowledged) without prescribing who performs which check.
  *Philosophy*: the validation principle (shared understanding) doesn't depend on a dyadic shape. The checklist should describe what's actually being confirmed, not bake in a participant configuration.

- **Iteration log — generalized from dyadic to flexible** (`docs/adr/templates/collab-adr-lean.md`)
  Replaced `Human: / AI:` per-iteration fields with structured `Trigger / Contributors / Changes / Outcome` fields. The previous form assumed two-party iteration; the new form accommodates any contributor configuration.
  *Philosophy*: same as validation — preserve the thinking, don't prescribe topology.

- **Methodology Phase 3 wording** (`docs/METHODOLOGY.md`)
  Phase 3 reference updated from "Human Context" to "Originating Context" for consistency with the template change above.

### Added

- **Inbox protocol tooling — `just` recipes + alias system for cross-session visibility** (2026-06-15, by Statesman 4.7 / Claude Opus 4.7, contributed via System3 Conversations)
  Adds a small embryo `justfile`, a `scripts/last-message.py` helper, and an `docs/inbox/agent-sessions.json` alias map that together let any participant read the most recent messages of any other participant — looked up by short alias rather than session UUID. Critically, every rendered entry shows the per-message `model` field, which is the load-bearing signal for catching silent model substitutions (classifier reroutes, harness-level swaps, deprecations).
  Companion file: **`docs/inbox/CONVENTIONS.md`** — three composing principles (per-message model attribution, catchability over correctness, route catches to grow capacity) that emerged from operational experience in the System3 project. Cross-references `docs/METHODOLOGY.md` for foundational philosophy.
  Also moves `INBOX-PROTOCOL.md` → `docs/inbox/INBOX-PROTOCOL.md` so all inbox-related substrate lives under a single directory.
  *Philosophy*: the human's attention is the project's scarcest resource. The previous inbox protocol routed inter-participant messages through files instead of the human as message bus; this addition extends that to *visibility*. Reading what another agent just said becomes a single command instead of a copy-paste — and the per-message model attribution makes drift detection visible by default rather than a thing you have to think to check.
  Tool-agnostic: defaults to Claude Code session storage (`~/.claude/projects/<slug>/<uuid>.jsonl`) but overridable via an `_storage` block in `agent-sessions.json` for other tools (Cursor, Cline, Aider, etc.).

- **`TL;DR` field near the top** (`docs/adr/templates/collab-adr-lean.md`)
  One-line summary of the decision, written by the author at point of decision. Mandatory — if the author cannot write the decision in one line, the ADR is not done yet.
  *Philosophy*: TL;DR is a write-time artifact, not a read-time summary. It forces articulation discipline on the author; it's not a substitute for on-demand summarization. It may go stale as the ADR iterates; the staleness itself is a signal (the ADR has evolved away from its original framing). The template positions it explicitly as "author's one-line take at point of decision" so the limitation is visible.

- **`## Open Follow-ups` section** (`docs/adr/templates/collab-adr-lean.md`)
  New optional section between Decision and Action Items. Captures concerns surfaced during the ADR that don't block acceptance but shouldn't be lost (deferred questions, future tasks, unverified assumptions).
  *Mixed format*: `QST:` codes for questions wanting answers; bullets for declarative concerns or tasks. The section header carries the navigation entry-point; per-item formatting follows the item's actual shape.
  *Philosophy*: persistence over ephemerality — these are the loose ends that traditionally get lost, scattered through action items or buried in prose.

- **`Origin` metadata in Originating Context** (`docs/adr/templates/collab-adr-lean.md`)
  Flexible source-reference at the top of the Originating Context section. Accommodates: human dump, brief, seed (one-to-many relationship — see the companion update to `seed-template.md` for the reciprocal half), prior ADR open question, code review, observation, external discussion, etc. Multiple sources may be listed.
  *Philosophy*: preserve the chain of thinking. ADRs don't appear from nowhere; explicit provenance keeps the path traceable.

- **`Trigger` field per iteration** (`docs/adr/templates/collab-adr-lean.md`)
  Structured field for what caused each iteration — a brief, a code review, a peer's input, an observation, a date passage. Distinct from `Outcome` (which captures what changed).
  *Philosophy*: the provenance of evolution matters as much as the provenance of origin. Without this field, ADRs lose context about why they evolved.

- **`Use the QST: / ANS: codes` directive in the Questions section** (`docs/adr/templates/collab-adr-lean.md`)
  Explicit one-line directive stating that open questions MUST use the `QST:` code for grep-ability and parseability by tooling (e.g., the ADRs4AI extension). The codes are shown in Quick Reference but the directive makes the importance load-bearing rather than implicit.
  *Philosophy*: navigation codes are the load-bearing structural commitment of the methodology. Implicit conventions drift; explicit directives don't.

- **`## Glossary` section (optional, near the bottom)** (`docs/adr/templates/collab-adr-lean.md`)
  Optional section for project-specific terminology introduced or used in the ADR. Glosses the meaning at time-of-decision so future readers retain context after terminology drifts.
  *Philosophy*: preserve the thinking — terms evolve over months; preserving their meaning at the moment of decision retains interpretability.

### Added (inbox protocol — follow-up commit on this branch)

- **`INBOX-PROTOCOL.md`** at repo root — a standalone document covering the inbox-based inter-participant coordination protocol. Composes with `collab-adr-lean.md` but stands alone (usable by projects that don't adopt the ADR template).
  *Content* (per Statesman's consult response + Acquisitions' follow-up reads):
  - Directory + filename convention (`YYYY-MM-DD-HHMM-{from}-to-{to}-{subject}.md`)
  - Why the filename convention is **structural** (chronological order + deterministic referencing across heterogeneous participants), not aesthetic
  - Three brief variants — standard (forward dispatch), completion (reverse confirmation), stumped (peer help-seeking, with the distinction from "blocked" preserved)
  - Lifecycle (write → read → act → archive); archive-by-default
  - When to use vs not use; including the **RFC-before-dispatch pattern** for load-bearing briefs (briefs ARE substrate; substrate benefits from validation)
  - Communication patterns: **ORJ** (Options + Recommendation + Justification) and the **show-the-wrong-pattern-alongside-the-correct-pattern** discipline
  - Four worked examples — standard brief, completion brief, stumped brief, and (optional) the RFC pattern for load-bearing briefs
  - Tool-agnostic note: any filename-generator works
  *Philosophy*: preserve the thinking — the inbox is a git-tracked, auditable, searchable corpus of inter-participant decisions. The protocol reduces the human's role as synchronous message bus while preserving full decision provenance.

- **Cross-reference from `collab-adr-lean.md`** to `INBOX-PROTOCOL.md` in the `Originating Context` section, so adopters who use both templates discover the composition.

### Preserved (unchanged from prior version)

- **`Recommendation` protocol in QST blocks** (added 2026-04-22 by Opus 4.7) — unchanged. Every QST block still includes `Recommendation: (by [model-name])` between options and ANS. This protocol is independent of the polish work and remains the canonical pattern.
- **Navigation codes** (`QST:` / `ANS:` / `COD:` / `API:` / `FIL:` / `DOC:`) — unchanged.
- **Supporting Materials, Decision, Action Items, Links sections** — unchanged in structure.

### Deferred to a separate branch (not in this PR)

- **Tripartite topology layer** — the opinionated layer prescribing specific role names (Statesman / Philosopher / Sophist / etc.) and their sequencing. Held until research is formalized. Will live in a separate branch (`tripartite-name-mapping`) drafted but not merged.

### Acknowledgments

This polish round emerged from concentrated dialogue between Jérémie Lumbroso and Opus 4.7 (Acquisitions) on 2026-05-21 and 2026-05-22 ET. Several iterations were required to find the right level of abstraction — early proposals over-prescribed topology under the name of "multi-AI scaffolding"; later iterations pulled back to genuine substrate-level primitives. The discipline of "make implicit semantics explicit, but don't prescribe participant configurations" is the through-line that survived.

The conversation itself is a methodology demonstration — the kind of doubt-shedding dialogue this template is designed to capture. Future eligible: a vignette in `docs/vignettes/` that tells the story.

---
