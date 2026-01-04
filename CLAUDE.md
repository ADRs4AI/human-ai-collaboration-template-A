# CLAUDE.md - Project Guidance

- **Project**: [Project Name]
- **Human**: Jérémie Lumbroso  
- **AI**: Claude Sonnet 4.5
- **Last Updated**: [Date]

---

## Prime Directive

**COMMIT DISCUSSIONS TO ADRs IMMEDIATELY**

Never let decisions stay only in conversation. Our thinking is valuable - preserve it.

---

## Secondary Directive

**SURFACE DOUBTS; THE HUMAN CONSIDERS YOUR DOUBTS TO BE GENERATIVE**

This means the human is interested in meaningful points of friction or underspecification or unsuspected diversity or anything else you find interesting. These doubts are the cornerstone of the human-LLM conversations.

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
NOT:  # Notes, remarks, comments, observations
```

**Find things**:
```bash
grep '^### QST:' docs/adr/        # All questions
grep 'Status: unanswered' docs/   # What needs answers
grep '^### COD:' docs/adr/         # Code examples
```

---

## Temporary Scripts / Ephemeray Scripts / One-Off Diagnostic Scripts

Please create all temporary scripts in:

`./scripts/ephemeral`

with a filename that has the `yyyy-mm-dd` timestamp in the beginning, like: `2026-01-03-test_sweed_adapter.py`

and commit them separately with `chore: script for ...` and qualify the purpose. The goal is to have a record of all the investigative tools we have created.

- Don't use `cat` and or the interpreter `python` + heredoc; instead use `Read()` + `Write()` (even though `cat` might seem more efficient to you, the permission model allows user to give you broad access for Read/Write but not for vague bash constructs)
- Don't use `/tmp` instead use `scripts/ephemeral`
- Document context of tool briefly in tool header: This will help with legibility.

If the script was successfully used, append as comments how, and what the outcome of the decision was.

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

The templates are in the folder `docs/adr/templates/`.

- **Brain dump**: `docs/adr/templates/seed-template.md` → Simple capture
- **Collaborative decision**: `docs/adr/templates/collab-adr-lean.md` → Full workflow
- **Simple decision**: `docs/adr/templates/template.md` → Standard MADR format

**When to use**:
- Quick question? → Start in conversation, escalate to ADR if needed
- Complex decision? → Create ADR immediately
- Multiple threads? → Create separate ADRs, link them

---

## Git Commits

Format: `type: subject` (lowercase)

Types: `feat`, `fix`, `docs`, `refactor`, `test`, `chore`, `style`, `perf`, `meta`

Example: `feat: implement JWT authentication per ADR-0014`

`meta:` commits are relative to `AGENTS.md`/`CLAUDE.md`, `.claude` settings, and meta-configuration of the repository.

---

## Handoff Protocol

If context window fills mid-work, create `docs/HANDOFF-datetime.md`:

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

- It's possible the user uses `asdf` for Node.js and Python and the runtime of most languages. You can `source .claude/agent.env` before calling the runtimes, like `python` or `node` to access them through `asdf`'s shims. See: https://asdf-vm.com/manage/configuration.html

---

*For methodology and philosophy, see: `docs/METHODOLOGY.md` (read once, reference as needed)*
