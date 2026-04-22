# [ADR Title - Decision/Topic]

- **Date**: [YYYY-MM-DD]
- **Iteration**: [N]
- **Status**: [Draft | Accepted | Implemented | Superseded]
- **Deciders**: [Human name], [AI model]

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

## Human Context

**Your stream-of-consciousness here** - no structure needed, just dump everything.

[Your thoughts, questions, frustrations, ideas, code snippets, whatever's on your mind about this decision]

**Agency Grant**: [Optional: What freedom does AI have? "Implement as you see fit" / "Explore options" / "Just structure my thoughts"]

---

## AI Interpretation

**What I understand you're asking**:

1. [Thread/topic 1] - [why it matters]
2. [Thread/topic 2] - [why it matters]

**Assumptions I'm making**:
- [Assumption 1]
- [Assumption 2]

**Confirm**: Does this match what you meant?

---

## Questions

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

## Action Items

- [ ] [Task 1] - Owner: [who]
- [ ] [Task 2] - Owner: [who]

---

## Validation

When we both agree:
- [ ] Human: Decision captured correctly
- [ ] AI: Understood the requirements

**Notes**: [Any caveats or follow-up needed]

---

## Iterations

### Iteration 1 ([date])
- Human: [What you provided]
- AI: [What I did]  
- Outcome: [What changed]

### Iteration 2 ([date])
- [Updated information]
- [How approach evolved]

---

## Links

- Related ADRs: [links]
- Related code: [links]
- Supersedes: [if applicable]
