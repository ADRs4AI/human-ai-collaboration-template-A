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

## Third Directive: When Bug Is Fixed, Regression Is Created

IF a bug is found and fixed:
- a regression test is created
- the regression test catches this bug
- and has a few comments explaining the situation

- Colocate with Related Tests 
Add a describe('Regression tests', ...) block in the existing test file for that module:

```ts
// In src/tests/api/signups/create.test.ts

describe('Regression tests', () => {
  it('should handle null tier gracefully (fixes #123)', () => {
    // Bug: tier=null caused TypeError in v1.2.0
    // Fixed in commit abc123
    // ...
  });
});
```

---

## Fourth Directive: Tests Must Be Meaningful, Not Contrived

**NEVER WRITE CONTRIVED TESTS**

Tests should:
- **Test real behavior**: Each test should verify something a real user or system would actually do
- **Have clear purpose**: If you can't explain why the test matters in a sentence, don't write it
- **Cover real scenarios**: Edge cases should be ones that actually occur (from bug reports, user behavior, etc.)
- **Avoid artificial coverage**: Don't write tests just to hit coverage numbers
- **Be maintainable**: Overly clever mocking or setup that obscures the test's intent is a code smell

**Good tests answer questions like:**
- "What happens when a student signs up for a full session?"
- "Does faculty authorization actually block unauthorized access?"
- "Are preparation rates calculated correctly with mixed evaluations?"

**Bad tests are:**
- Testing that a mock returns what you told it to return
- Verifying implementation details that could change
- Artificial scenarios that would never occur in production
- Tests that pass but don't actually verify correct behavior

**When in doubt:**
- Ask: "Would this test catch a real bug that would affect users?"
- If not, either rewrite the test or skip it

---

## Fifth Directive: Always Run Tests Before Serving

**RUN TESTS BEFORE EVERY COMMIT**

Before serving any code changes to the user:
1. Run `npm test` to verify all tests pass
2. Fix any failures before committing
3. Never serve code with failing tests

**Why**: We have 497 tests with 60% coverage. They catch exactly the bugs that slip through (500 errors, syntax errors, join issues). Use them.

**Process**:
```bash
npm test  # Must be green before commit
git add -A
git commit -m "..."
```

---

## Sixth Directive: Document Metacognitive Gems

**PRESERVE PROCESS INSIGHTS IN VIGNETTES**

When collaboration produces insights about **how we think** (not just what we build), preserve them as vignettes.

### What Are Metacognitive Gems?

Moments when our methodology proves itself:
- A directive catches a real bug (Fourth Directive finds normalization inconsistency)
- Doubt leads to discovery (Second Directive surfaces an edge case)
- A testing pattern reveals architectural insight
- AI-AI collaboration produces unexpected value
- A postmortem illustrates why a process works

### When to Create a Vignette

Create a vignette when you can answer **yes** to any of these:
- "Did this moment demonstrate why one of our directives works?"
- "Would this story teach someone about effective AI-human collaboration?"
- "Did we discover something surprising about our process?"
- "Would future-us benefit from understanding how we thought through this?"

### Where and Format

**Location**: `docs/vignettes/YYYY-MM-DD-short-title.md`

**Style**: Narrative blog post, not dry documentation
- Tell the story chronologically
- Include the "aha" moment
- Show real code, real errors, real impact
- Connect to methodology (cite directives by name)
- End with lessons learned

**Example structure**:
```markdown
# Title: The Discovery in Action

**Date**: YYYY-MM-DD
**Authors**: [Who was involved]
**Topic**: [One-line summary]

## The Discovery
[What happened - tell the story]

## Why This Matters
[Real-world impact - why should anyone care?]

## [Directive Name] at Work
[How methodology enabled this]

## Lessons Learned
[Concrete takeaways]

## Metacognitive Insight
[The "how we think" observation]
```

### What NOT to Document

Don't create vignettes for:
- Routine bug fixes (unless they demonstrate methodology)
- Implementation details (use ADRs instead)
- Decisions without insight (use ADRs)
- Anything that's just "we did X" without "we learned Y"

### Philosophy

Our **process** is as valuable as our **product**. Vignettes make tacit knowledge explicit. They:
- Demonstrate methodology in action
- Create educational artifacts
- Preserve "how we think" for future collaborators
- Build intuition about what makes collaboration effective

When in doubt: **If it made you say "aha!", write it down.**

---

## Tenth Directive

(Other directives have been occluded because they are not relevant.)

**DON'T HESITATE TO EXPERIMENT TO LEARN: YOU HAVE ACCESS TO PLAYWRIGHT MCP TO BE ABLE TO HAVE ACCESS TO YOUR HOW BROWSER**

This is a methodology (of taking screenshots, learning from Playwright) that you need to document a subskill for this reveal.js skill we are building — so dogfooding is the best way of learning!

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
│   ├── adr/
│   │   ├── 0001-*.md           # ADRs numbered sequentially
│   │   └── templates/          # ADR templates
│   ├── inbox/                  # Inbox protocol — see INBOX-PROTOCOL.md
│   │   ├── INBOX-PROTOCOL.md   # Filename + brief conventions
│   │   ├── CONVENTIONS.md      # Three operational principles
│   │   └── agent-sessions.json # Agent alias → session UUID map
│   └── METHODOLOGY.md          # Foundational philosophy
├── scripts/
│   └── last-message.py         # Cross-session message reader (just last <alias>)
├── justfile                    # Coordination recipes (just brief / just completion / just last / ...)
├── src/                        # Source code
├── tests/                      # Tests
└── CLAUDE.md                   # This file
```

## Inbox protocol — see `docs/inbox/`

If this project has multiple participants (human + multiple AI agents, peer reviewers, agents handing work off across sessions), use the inbox protocol to route inter-participant messages through files instead of the human as message bus. Three documents:

- **`docs/inbox/INBOX-PROTOCOL.md`** — the file-naming convention, brief variants, lifecycle
- **`docs/inbox/CONVENTIONS.md`** — three operational principles (per-message model attribution, catchability, route catches to grow capacity)
- **`docs/inbox/agent-sessions.json`** — alias map for `just last <alias>`

Recipes (from the seed `justfile`):

- `just brief <from> <to> <slug>` — create new outgoing brief (UTC-stamped filename)
- `just completion <from> <slug>` — create new completion brief
- `just last <alias> [k]` — read last K assistant messages from an agent's session (shows per-message `model` field — catches silent model substitutions)
- `just aliases` — list configured aliases
- `just discover-sessions` — list recent session JSONLs to find UUIDs for new aliases
- `just inbox` — list recent inbox messages
- `just stamp` — print current UTC + ET timestamps

---

## Technical Debt Tracking

**File**: `docs/TECHNICAL-DEBT.md`

**Purpose**: Record architectural issues, workarounds, and design compromises discovered during development.

**When to add entries**:
- You discover architectural issues during implementation
- You implement a workaround instead of a proper fix
- You notice patterns violating good practices
- You identify type safety gaps or excessive optional chaining
- You find inconsistencies between database schema and TypeScript types

**Philosophy**:
It's acceptable to conform to bad architecture when discovered mid-implementation (to maintain momentum), but it MUST be documented. Technical debt that accumulates in the dark becomes legacy code.

**Process**:
1. Notice architectural issue while implementing
2. Add entry to TECHNICAL-DEBT.md with precise location and fix proposal
3. Continue with current work (don't derail to fix immediately)
4. Address during next refactoring sprint based on priority

**Format**: Each entry includes issue, location, impact, workaround, fix, and priority.

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
