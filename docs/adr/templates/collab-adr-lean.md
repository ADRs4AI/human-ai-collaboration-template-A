# [ADR Title - Decision/Topic]

- **Date**: [YYYY-MM-DD]
- **Iteration**: [N]
- **Status**: [Draft | Proposed | Accepted | Implemented | Superseded]
- **Deciders**: [Names / roles of contributors]

**TL;DR**: [One-line summary of the decision, written by the author at point of decision. May go stale as the ADR iterates; treat as the author's intent at write-time, not the canonical current rendering. Mandatory field — if you cannot write this in one line, the ADR is not done yet.]

---

## Quick Reference

**Navigation codes** (for grep):
- `QST:` Questions  
- `ANS:` Answers
- `COD:` Code examples
- `API:` API calls
- `FIL:` Files to examine
- `DOC:` Documentation

**Find things**:
```bash
grep '^### QST:' file.md           # All questions
grep 'Status: unanswered' file.md  # Unanswered only
grep '^### COD:' file.md            # Code examples
```

---

## Originating Context

**Source**: [Type and link to where this ADR originated, e.g.:
- `Human dump (below)` — stream-of-consciousness from a contributor
- `Brief: <path/to/brief.md>` — a brief from another contributor (see also: [INBOX-PROTOCOL.md](../../../INBOX-PROTOCOL.md) if your project uses the inbox-based coordination protocol)
- `Seed: <path/to/seed.md>` — a seed that was chunked into multiple ADRs
- `Prior ADR open question: <ADR-xxxx#QST-N>` — a follow-up
- `Code review / observation / external discussion / etc.`

Multiple sources may be listed.]

[If the source is a human dump, drop the stream-of-consciousness here — no structure needed, just everything that's on your mind about this decision]

[If the source is a brief, seed, or other reference, you may summarize the originating constraints here in a paragraph, OR rely on the link above.]

**Agency Grant**: [Optional: What freedom does the author have? "Implement as you see fit" / "Explore options" / "Just structure my thoughts"]

---

## Explicitation

*Making explicit what the Originating Context implied or contained tacitly. The author reflects back what they understand the problem to be, so misalignment surfaces here, not later.*

**What I understand**:

1. [Thread/topic 1] — [why it matters]
2. [Thread/topic 2] — [why it matters]

**Assumptions**:

- [Assumption 1]
- [Assumption 2]

**Confirm**: [Who is the author asking to confirm? Could be the originator (if a brief or dump), another contributor, or a self-check before moving on.]

---

## Questions

**Use the `QST:` / `ANS:` codes for open questions.** They're required for grep-ability and for any tooling (e.g., the ADRs4AI extension) that parses ADRs as structured documents. Open questions outside this format are invisible to those tools.

**Protocol** (added 2026-04-22 by Opus 4.7): every QST block must include a `**Recommendation**: (by [model-name])` section between the options and the `**ANS:**` block. The human should not have to extract the AI's lean from prose — put it under its own heading with a clear pick and a short justification grounded in evidence (data, prior ADRs, constraints). Lead the recommendation with a bold pick (`**B — short name.**`) so a skim reveals the AI's position without reading. If walking back an earlier lean during iteration, say so explicitly.

### QST: [Question text]
- Status: unanswered
- Why asking: [How this shapes my approach]
- Need: [yes/no | explanation | code example | etc]

[List the options A / B / C ... with a short description of each]

**Recommendation**: (by [model-name, e.g. Opus 4.7])

[One clear sentence naming the pick — e.g. "**B — persistent annotation.**" — followed by 2–4 sentences of justification. Reference evidence rather than taste. If walking back an earlier lean, say so explicitly.]

**ANS:** (by [name])
[Fill this in]

---

### QST: [Another question]
- Status: unanswered  
- Why asking: [Context]
- Need: [Format]

**Recommendation**: (by [model-name])

[Clear pick + justification.]

**ANS:** (by [name])
[Fill this in]

---

## Supporting Materials

Use these only when needed - delete unused sections.

### COD: [example-name]
```python
# Your code here
```

### API: [call-name]
**Request:**
```http
POST /endpoint
{"param": "value"}
```

**Response:**
```json
{"result": "data"}
```

### FIL: [files-to-read]
- `/path/file.py` - [What to look for]
- `/path/file.md` - [Why it matters]

### DOC: [reference-name]
[Documentation excerpt or link]

---

## Decision

### Context
[What problem are we solving? Why does it matter?]

### Options

**Option A**: [Name]
- Pros: [Benefits]
- Cons: [Drawbacks]

**Option B**: [Name]  
- Pros: [Benefits]
- Cons: [Drawbacks]

### Chosen: [Option name]

**Why**: [Rationale from our discussion]

**Trade-offs accepted**: [What we're giving up]

### Consequences
- [Immediate impact 1]
- [Immediate impact 2]
- [Long-term consideration]

---

## Open Follow-ups

*Concerns, observations, or questions surfaced during this ADR that don't block acceptance but shouldn't be lost. Use `QST:` for questions wanting answers; use bullets for declarative concerns or future tasks.*

### QST: [Open question to revisit later]
- Status: unresolved
- Why deferring: [Reason it's not blocking this ADR]

**ANS:** [Fill when resolved; or link to the ADR / discussion that resolved it]

---

- [ ] [Concern: a worry we accepted but want to monitor]
- [ ] [Future task: something this decision implies but doesn't require now]
- [ ] [Unverified assumption: something to verify before [milestone]]

---

## Action Items

- [ ] [Task 1] - Owner: [name / role]
- [ ] [Task 2] - Owner: [name / role]

---

## Validation

*Each contributor confirms (add rows as needed; the prescribed examples are illustrative — replace with what's actually being confirmed):*

- [ ] [Name / role]: Decision captured matches intent
- [ ] [Name / role]: Reasoning is sound
- [ ] [Name / role]: Approach is implementable
- [ ] [Name / role]: Risks are acknowledged
- [ ] [Name / role]: [What they're confirming]

**Notes**: [Any caveats or follow-up needed]

---

## Iterations

*Each iteration captures how the ADR evolved. `Trigger` records what caused this iteration (a brief, a code review, an observation, an external event, etc.); `Outcome` records what changed and any status transition.*

### Iteration 1 ([date])
- Trigger: [What caused this iteration — e.g., initial draft from human dump / brief at <path> / etc.]
- Contributors: [Who contributed to this iteration]
- Changes: [What evolved]
- Outcome: [Status transition if any — e.g., `Draft → Proposed`]

### Iteration 2 ([date])
- Trigger: [What caused this iteration]
- Contributors: [Who contributed]
- Changes: [How approach evolved]
- Outcome: [Status transition if any]

---

## Glossary (optional)

*Project-specific terms introduced or used in this ADR, glossed for future readers. Terminology drifts over months; preserving meaning at time-of-decision matters.*

- **[Term]**: [Definition at time-of-decision]
- **[Term]**: [Definition]

---

## Links

- Related ADRs: [links]
- Related code: [links]
- Supersedes: [if applicable]
