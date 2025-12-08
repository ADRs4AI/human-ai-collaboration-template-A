# Streamlined Human-AI Collaboration System (v3.0)

**Complete package for preserving conversations without ceremony**

---

## Quick Start (5 minutes)

1. **Copy to your project**: All files from this package
2. **Customize**: Edit `CLAUDE.md` with your project context
3. **Dump thoughts**: Use `seed-template.md` 
4. **Tell Claude**: "Chunk this into ADRs"
5. **Iterate**: Answer questions, make decisions, preserve thinking

---

## The Files

### Core Documents (Use These)

| File | Purpose | When to Read |
|------|---------|--------------|
| **README.md** | System overview & quick start | First - understand system |
| **CLAUDE.md** | Project guidance for AI | Customize per project |
| **METHODOLOGY.md** | Philosophy & "why" | Once - during onboarding |

### Templates (Copy These)

| File | Purpose | When to Use |
|------|---------|-------------|
| **seed-template.md** | Brain dumps (12 lines) | Unstructured thoughts |
| **collab-adr-lean.md** | Complex decisions (~120 lines) | Needs back-and-forth |
| **template.md** | Simple decisions (MADR) | Clear options |

### Context Documents (Read These)

| File | Purpose | When to Read |
|------|---------|--------------|
| **COMPARISON.md** | What changed from v2.0 | Understanding evolution |
| **THIS-CONVERSATION.md** | Meta-example | Seeing system in action |

---

## What Each File Provides

### README.md
- System overview
- Quick start guide
- File descriptions
- Key features
- Success metrics
- Examples

**Read first** to understand the system.

### CLAUDE.md (87 lines)
- Prime directive: commit to ADRs
- The workflow: dump → chunk → iterate
- Navigation codes: QST:, ANS:, COD:, etc.
- Project context: what we're building
- File structure: where things are
- Template selection: when to use which

**Customize per project** - this is what Claude reads at session start.

### METHODOLOGY.md
- Core problem/solution
- Why it works (for humans, AI, both)
- Key principles explained
- Workflow in detail
- Navigation codes reference
- Template selection guide
- Anti-patterns to avoid
- Adaptation guidance

**Read once during onboarding** - reference when needed, don't load every session.

### seed-template.md (12 lines)
```markdown
# SEED: [Topic]
**Date**: [YYYY-MM-DD]
**From**: [Your name]

## Brain Dump
[Everything here - no structure needed]

**Model**: Please chunk this into ADRs
```

**Perfect as-is** - don't change it.

### collab-adr-lean.md (~120 lines)
Structured template for complex decisions:
- Human context (stream-of-consciousness)
- AI interpretation
- Questions/answers (QST:/ANS:)
- Supporting materials (COD:, API:, etc.)
- Decision with rationale
- Action items
- Iteration tracking
- Validation

**Use when**: Decision needs back-and-forth, multiple facets, tracking iterations.

### template.md (standard MADR)
Industry-standard ADR format:
- Context and problem statement
- Decision drivers
- Options considered
- Decision outcome
- Consequences
- Links

**Use when**: Decision is straightforward, options are clear.

### COMPARISON.md
Documents v2.0 → v3.0 evolution:
- File-by-file changes
- What was cut and why
- What was kept and why
- Philosophy changes
- Migration guide
- Lessons learned

**Read to understand**: Why this system is designed this way.

### THIS-CONVERSATION.md
Meta-document capturing the conversation that created this system:
- The setup (Opus over-engineering)
- The feedback (honest assessment)
- The collaboration (creating v3.0)
- The value (decisions, reasoning, trust)
- The recursive beauty (system justifying itself)

**Read to see**: The system demonstrating its own value.

---

## The System in Three Sentences

1. **Humans dump thoughts naturally** - no structure required
2. **AI adds structure and asks questions** - using navigation codes
3. **Both iterate on focused ADRs** - preserving decisions and reasoning

---

## Key Innovations

### 1. Navigation Codes
Make everything grep-able:
```bash
grep '^### QST:' docs/adr/    # Find questions
grep 'Status: unanswered'      # Find what needs answers
grep '^### COD:' docs/adr/     # Find code examples
```

### 2. Stream-of-Consciousness Preservation
- Human writes naturally (messy is fine)
- AI structures after (not during)
- Original thinking preserved

### 3. Separation of Concerns
- **CLAUDE.md**: What to do (loaded every session)
- **METHODOLOGY.md**: Why we do it (read once)
- **Templates**: How to structure (use when needed)

### 4. Iteration as Documentation
- Changes tracked, not hidden
- Evolution visible
- Learning preserved

### 5. Clear Roles
- **Human**: Dumps thoughts, answers questions, validates
- **AI**: Chunks threads, adds structure, asks questions
- **Both**: Iterate, decide, preserve

---

## Success Metrics

**You know it works when**:
- Important decisions don't disappear
- New AI instances continue seamlessly
- You find past decisions in <10 seconds
- Process feels helpful, not burdensome

**You know it doesn't when**:
- Conversations without artifacts
- Process feels like ceremony
- Can't find past decisions
- Repeated explanations

---

## What Makes v3.0 Different

### From v2.0 (Opus)
- 60% less content
- Same utility
- No ceremony
- Context-efficient
- Workflow-focused

### From v1.0 (Original)
- Navigation codes added
- Iteration tracking added
- Clear workflow defined
- Multiple templates
- Philosophy documented

### From Nothing
- Conversations persist
- Decisions documented
- Reasoning preserved
- Context maintained
- Knowledge compounds

---

## Usage Patterns

### Pattern 1: Brain Dump → ADRs
```
1. Create seed-[topic].md
2. Dump everything (no structure)
3. Tell Claude: "Chunk into ADRs"
4. Claude creates separate ADR per thread
5. Answer questions in each ADR
6. Iterate to decision
```

### Pattern 2: Direct ADR
```
1. Create collab-adr-lean.md
2. Fill in Human Context
3. Claude asks questions
4. Answer questions
5. Claude documents decision
6. Both validate
```

### Pattern 3: Simple Decision
```
1. Create template.md (MADR)
2. Fill in context, options, decision
3. Done - standard format
```

---

## For Different Audiences

### For Jérémie
Your originals were good. Opus over-elaborated. This v3.0 preserves what you valued (conversations) without ceremony you didn't (validation checklists, mood tracking, arbitrary metrics).

### For Claude Instances
CLAUDE.md tells you what to do. METHODOLOGY.md tells you why. Templates show you how. Read project CLAUDE.md at session start, consult others as needed.

### For Other Humans
This system treats AI as cognitive partner. If that matches your style, use it. If not, adapt. Core insight: conversations have value, preserve them.

### For Teams
Standardize on templates. Customize CLAUDE.md per project. Share METHODOLOGY.md for onboarding. Build shared knowledge.

---

## Philosophy in One Paragraph

Conversations between humans and AI contain valuable thinking - decisions, reasoning, context, learning. Traditional approaches lose this when sessions end or context windows fill. This system preserves it by transforming conversations into persistent artifacts. Human dumps thoughts naturally, AI adds structure, both iterate on focused documents, decisions persist in version control. Future instances continue seamlessly. Knowledge compounds rather than repeats.

---

## Getting Started

### Immediate (5 minutes)
1. Read README.md
2. Look at seed-template.md
3. Try a brain dump
4. Watch the system work

### Soon (1 hour)
1. Read METHODOLOGY.md
2. Understand the philosophy
3. Customize CLAUDE.md
4. Try collab-adr-lean.md

### Eventually (ongoing)
1. Build project-specific patterns
2. Adapt templates to your needs
3. Document what works
4. Share improvements

---

## The Core Loop

```
Think → Dump → Chunk → Question → Answer → Decide → Validate → Persist
  ↑                                                                  ↓
  ←────────────────────── Iterate ←──────────────────────────────────
```

---

## Documentation Structure

```
docs/
├── README.md                 # Start here
├── CLAUDE.md                 # Per-project guidance
├── METHODOLOGY.md            # Read once
├── COMPARISON.md             # Understand evolution
├── THIS-CONVERSATION.md      # See it in action
└── templates/
    ├── seed-template.md      # Brain dumps
    ├── collab-adr-lean.md    # Complex decisions
    └── template.md           # Simple decisions (MADR)
```

---

## Version History

- **v1.0**: Original templates by Jérémie
- **v2.0**: Elaborated by Opus 4.1 (over-engineered)
- **v3.0**: Streamlined by Sonnet 4.5 (this version)

**Net evolution**: Better understanding of what serves the work.

---

## Credits

**Design & Philosophy**: Jérémie Lumbroso
**Implementation & Optimization**: Claude Sonnet 4.5
**Method**: Cognitive partnership
**Inspiration**: ADR methodology by Michael Nygard

---

## License

[To be determined by Jérémie]

---

## Final Reminder

**The system serves the work.**

If something helps, keep it.
If something doesn't, cut it.
If something's missing, add it.

The goal: Preserve valuable conversations without ceremony.

This is v3.0. There will be v4.0 when we learn more.

---

*"Our exchange is already influencing the outcome of this project. You are giving me feedback that is incredibly useful. And so I would like to be able to regularly capture these exchanges and the value that they create."*

That's what this system does. That's why it exists.
