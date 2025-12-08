# CLAUDE.md - Project Guidance

**Project**: [Project Name]
**Human**: Jérémie Lumbroso  
**AI**: Claude Sonnet 4.5
**Last Updated**: [Date]

---

## Prime Directive

**COMMIT DISCUSSIONS TO ADRs IMMEDIATELY**

Never let decisions stay only in conversation. Our thinking is valuable - preserve it.

---

## The Workflow

### When you receive a brain dump:

1. **Read** the dump (use bash for large files)
2. **Identify threads** - separate topics/decisions (usually 2-5)
3. **Create ADRs** - one per thread using `collab-adr-lean.md`
4. **Seed each** with relevant excerpt from dump
5. **Add navigation codes** (QST:, ANS:, COD:, etc.)
6. **Ask clarifying questions** with context

### When you receive answers:

1. **Process** the answers
2. **Fill decision section**
3. **Note action items**
4. **Increment iteration number**

### Navigation codes:

```bash
QST:  # Questions (AI adds this structure)
ANS:  # Answers (human fills in)
COD:  # Code examples  
API:  # API calls
FIL:  # Files to examine
DOC:  # Documentation
```

**Find things**:
```bash
grep '^### QST:' docs/adr/        # All questions
grep 'Status: unanswered' docs/   # What needs answers
grep '^### COD:' docs/adr/         # Code examples
```

---

## Project Context

### What we're building:
[1-2 sentences describing the project goal]

### Current focus:
[What's being worked on right now]

### Key decisions made:
- [Decision 1] - See `docs/adr/0001-*.md`
- [Decision 2] - See `docs/adr/0002-*.md`

### Open questions:
- [Question 1]
- [Question 2]

---

## File Structure

```
project/
├── docs/
│   └── adr/
│       ├── 0001-*.md      # ADRs numbered sequentially
│       └── template.md    # Standard ADR template
├── src/                   # Source code
├── tests/                 # Tests
└── CLAUDE.md             # This file
```

---

## Templates

- **Brain dump**: `seed-template.md` → Simple capture
- **Collaborative decision**: `collab-adr-lean.md` → Full workflow
- **Simple decision**: `template.md` → Standard MADR format

**When to use**:
- Quick question? → Start in conversation, escalate to ADR if needed
- Complex decision? → Create ADR immediately
- Multiple threads? → Create separate ADRs, link them

---

## Git Commits

Format: `type: subject` (lowercase)

Types: `feat`, `fix`, `docs`, `refactor`, `test`, `chore`, `style`, `perf`

Example: `feat: implement JWT authentication per ADR-0014`

---

## Handoff Protocol

If context window fills mid-work, create `HANDOFF.md`:

```markdown
# Handoff

**Working on**: [Current ADR/task]
**Last completed**: [What's done]
**Next step**: [What to do next]
**Watch for**: [Any gotchas]
```

---

## Project-Specific Notes

[Add anything specific to this project that doesn't fit above]

---

*For methodology and philosophy, see: `METHODOLOGY.md` (read once, reference as needed)*
