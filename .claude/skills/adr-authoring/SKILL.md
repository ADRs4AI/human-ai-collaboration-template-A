---
name: adr-authoring
description: Use BEFORE writing or editing any ADR, seed, or QST/ANS block in docs/adr/ — the template's minimal shape, the QST grammar and handles, the catch-the-author Recommendation form, and the four real-world malformations that break parsing. This skill IS the read-the-template step; skipping it re-creates the failure it exists to fix.
---

<!-- skill version: "adr-authoring 3.9.0" — co-versioned with human-ai-collaboration-template-A; assembled from Rubricator 5's corpus-adherence syllabus -->

# Writing parseable ADRs, seeds, and questions

## 1. Why the form matters (one paragraph, not a treatise)

Across ~1,100 real specimens, 76% of documents that clearly *attempt* this methodology's template still skip its one mandatory field (`TL;DR`), and 88% of documents that don't follow the template at all were written in repos where the template file was sitting right there, often edited the same session. The template being *referenced* does not make it *read*. This skill exists to be the thing that actually gets read — it loads into context automatically, not because someone remembered to open a file. If you are about to write an ADR, a seed, or a QST block: this skill *is* the read-the-template step.

## 2. The minimal shape — what every ADR needs, no exceptions

```
- **Date**: YYYY-MM-DD  |  **Iteration**: N  |  **Status**: Draft|Proposed|Accepted|Implemented|Superseded  |  **Deciders**: names

**TL;DR**: one line. Mandatory — if you can't write it in one line, the ADR isn't done.

## Questions
### QST: <question, or QST-<id>: for a citable handle>
- Status: unanswered
- Why asking: ...
- Need: yes/no | explanation | code example

**Recommendation**: (by <model-name>)
**<Letter> — <short pick>.** Because <evidence named specifically enough to check — a file, an ADR, a measurement>. If wrong: <what breaks, by name>.

**ANS:** (by <name>)
[Fill this in]   <!-- literal placeholder — parser-significant, do not paraphrase -->
```

That trailing comment on `[Fill this in]` is real, current template text (v3.9.0) — tooling checks for the literal placeholder to detect unanswered blocks; "helpfully" rewording it as filler prose breaks that check silently. Leave it exactly as-is until there's a real answer to put there.

That block — frontmatter, one QST, one catch-the-author Recommendation — is the load-bearing 80%. Everything else (Explicitation, Supporting Materials, Validation, Iterations, Glossary) matters and lives in the depth reference; this is what must never be skipped. Mint new ADRs with `just adr "<title>"` — never hand-number.

## 3. The four things the wild actually gets wrong (never this / always this)

Every pair below is a real, uncorrected specimen from this ecosystem's own corpus — not a hypothetical.

**Never** — a bolded pseudo-heading (parses as prose to every tool):
> `**QST-1 (Recommendation protocol — "YES TO ALL THREE").**`
**Always**:
> `### QST-1: Recommendation protocol — accept all three?`
*(33 real instances — the single largest malformation class.)*

**Never** — a number where the grammar wants a hyphen:
> `### QST 1: Delivery ledger — where does it live?`
**Always**:
> `### QST-1: Delivery ledger — where does it live?`
*(24 instances — the second-largest class; written the way you'd say it aloud, not the way the grammar parses.)*

**Never** — a `Status: unanswered` line with no QST heading above it (the answer surface lies in *both* directions: looks open when nothing's asking, or the real question is invisible):
> a bare `- Status: unanswered` floating under prose
**Always**: every `- Status:` line sits directly under a `### QST:` heading, no exceptions.
*(14 instances.)*

**Never** — wrong heading depth (`##` or `####`; parsers scan `###` only):
> `## QST-1 (ANSWERED 2026-07-03): official mechanism exists`
**Always**: `### QST-1: ...` — exactly three hashes, always.
*(4 instances.)*

## 4. The handle grammar, in one line (plus the fragility worth knowing)

`### QST:` is always valid. `### QST-<id>:` adds a citable handle when anything will refer back to the question — `id` is 1–24 letters/digits with interior hyphens (`QST-STATUS-AUTHORITY` is valid; `QST_2` and `QST-` are not). Once a handle is cited anywhere, it never changes — reword the question freely, the id is the anchor. A plain `### QST:` heading still gets an *auto-derived* handle slugified from its text — fragile: retitling silently changes it and breaks existing references; prefer an explicit id (or an `<!-- @adr-anchor: qst-... -->` comment placed *after* the heading) for anything tour- or citation-bound.

## 5. Load the depth reference when

Read `references/depth.md` (same skill directory) when: writing a **seed** instead of an ADR; questions don't fit one QST block cleanly (**batched / embedded shapes**); choosing between **`adr.md` / `adr-madr.md` / `seed.md`**; or touching **Validation, Iterations, Action Items**. For QuestionTours (referencing questions from tour files), the tours field guide is the authority — not this skill.

---

*Curriculum: Rubricator 5 (Claude Sonnet 5), from corpus-adherence findings over ~1,100 specimens + the qst-lint census (75 findings, 21 files). Assembly: Shipwright 5 (Claude Fable 5), v3.9.0 pre-launch sprint. Placeholder convention: Sextant 5's catch. Bounds ("crisp; field guide, not treatise"): Jérémie Lumbroso.*
