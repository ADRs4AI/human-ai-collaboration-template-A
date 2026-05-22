# Topology layer: Tripartite framework (draft, held)

- **Status**: Draft (not merged; placeholder)
- **Author**: Jérémie Lumbroso (with Claude collaborators)
- **Relationship to the template**: This document sits ON TOP of `collab-adr-lean.md`. The template provides primitive slots (participants, validation rows, iteration entries, etc.); this document provides one **opinionated topology** for distributing and sequencing work among those slots. Adopters who want this topology read this doc; adopters who want a different topology (or none) use the primitives unmodified.

---

## Why this document is held

The Tripartite framework is part of Jérémie's research portfolio (Plato's *Sophist* synthesized with Byzantine fault tolerance, Jevons paradox, Freire's banking-model critique, Solomon's Judgment, Simon's near-decomposability). The framework is in active development; specific role names, their functions, sequencing recommendations, and ratio constraints have not been formalized for public dissemination. This document is drafted in advance of that formalization so the scaffolding is ready when the research lands — but it is **not merged** until Jérémie is ready to publish the topology layer.

The template itself (in `collab-adr-lean.md` on `main`) remains topology-agnostic. This is by design.

---

## What this document will contain (when filled in by Jérémie)

The structure below is placeholder — Jérémie will replace each section with the formalized content.

### Roles

The Tripartite framework distinguishes three cognitive roles (working titles; Jérémie may rename):

- **Philosopher** — *doubt-maximizer; reconfigures knowledge; surfaces complexity; produces semantic depth*
  - Equivalent slot in the template: contributor performing peer review, structural critique, blind-spot surfacing
  - When the role is filled by an AI agent: typically a model invoked specifically for philosopher-class review (e.g., a higher-capability model brought in for ADR RFC passes)

- **Sophist** — *doubt-suppressor; applies pre-packaged patterns reliably; ships fast; doesn't relitigate scope*
  - Equivalent slot in the template: contributor performing execution, implementation, briefed work
  - When the role is filled by an AI agent: typically a model invoked for implementation against a clear brief

- **Statesman** — *doubt-manager; junction; balances truth-seeking with action-forcing; integrates philosopher findings into sophist-executable plans*
  - Equivalent slot in the template: contributor performing integration, orchestration, strategic decisions
  - When the role is filled by an AI agent: typically a model holding context across the workflow; often shared with the human partner

### Sequencing

The recommended sequence within an ADR's lifecycle:

1. **Originator** (human or AI) drafts the ADR (filled-in `Originating Context` + `Explicitation`)
2. **Philosopher** reviews (peer-review pass; surfaces critique + refinements + blind spots)
3. **Statesman** integrates (absorbs refinements; flips `Status` from Proposed → Accepted)
4. **Sophist** implements (executes the Action Items)
5. **All** validate (per the template's Validation section)

*(Sequencing detail to be expanded by Jérémie.)*

### Constraints (Byzantine fault tolerance applied to crew composition)

The framework draws on Byzantine fault tolerance to constrain how cognitive roles are distributed:

- *(To be detailed by Jérémie.)*

### Mapping to template slots

When adopters want to use this topology with `collab-adr-lean.md`, the recommended slot-fill is:

- `Deciders` field: list participants with their Tripartite role labels (e.g., "Jérémie (Statesman), Opus 4.7 (Statesman), Opus 4.6 (Philosopher), Sonnet 4.5 (Sophist)")
- `Validation` checklist: rows include each Tripartite role's confirmation
- `Iterations` log: `Contributors` field tags each contributor with their Tripartite role for that iteration
- `Origin` field: may reference Philosopher's RFC brief if the iteration was triggered by peer review

*(Detailed mapping examples to be added by Jérémie.)*

---

## What this document deliberately does NOT do

- **Does not modify `collab-adr-lean.md`**. The template stays topology-agnostic; this document layers on top
- **Does not require adopters to use Tripartite naming**. Adopters who prefer Author / Reviewer / Implementer (or any other taxonomy) use those words in their template slots
- **Does not formalize the framework's research basis**. That lives in Jérémie's broader work (see project memories `[[project_tripartite_framework]]`, `[[project_system3_distributed_locus_of_control]]`, and the Plato / Freire / Byzantine / Jevons / Solomon syntheses)

---

## Branch status

- **Branch**: `tripartite-name-mapping` in `human-ai-collaboration-template-A`
- **Created**: 2026-05-22 ET, drafted by Opus 4.7 (Acquisitions) at Jérémie's request
- **Merge plan**: held. To be merged when Jérémie has formalized the topology content and decided to publish

— Placeholder by Opus 4.7 (Acquisitions); content to be authored by Jérémie Lumbroso
