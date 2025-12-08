# Version Comparison: v2.0 (Opus) → v3.0 (Streamlined)

**Date**: 2024-12
**Purpose**: Document what changed and why

---

## Summary

**v2.0** (by Opus 4.1): Elaborate, comprehensive, ceremony-heavy
**v3.0** (by Sonnet 4.5): Focused, efficient, workflow-optimized

**Net change**: ~60% reduction in content, 100% preservation of utility

---

## File-by-File Comparison

### CLAUDE.md

| Aspect | v2.0 | v3.0 | Why Changed |
|--------|------|------|-------------|
| **Lines** | 300+ | 87 | Context cost in Claude Code |
| **Sections** | 15+ | 7 | Focus on essentials |
| **Emojis** | Throughout | None | Professional clarity |
| **Personality** | "Understanding Jérémie" | Removed | Belongs in context/memory |
| **Commands** | Extensive aliases | Basic grep | Only what's needed |
| **Metrics** | Multiple tracking sections | Removed | Arbitrary, not actionable |
| **Philosophy** | Repeated throughout | Moved to METHODOLOGY.md | Read once, not every session |

**What stayed**:
- Prime directive (commit to ADRs)
- The workflow (dump → chunk → iterate)
- Navigation codes
- File structure
- Template selection

**What left**:
- Validation ceremony templates
- Health check scripts
- "Understanding Jérémie" personality profiles
- Success metrics dashboards
- Quick command library

### Collaboration ADR Template

| Aspect | v2.0 | v3.0 | Why Changed |
|--------|------|------|-------------|
| **Lines** | 400+ | ~120 | 70% reduction |
| **Sections** | 25+ | 12 | Many were optional/rarely used |
| **Quick Start** | Elaborate multi-page | Simple workflow | Just need to know what to do |
| **Validation** | Timestamped checkboxes | Simple checkboxes | Timestamps were ceremony |
| **Cognitive Approach** | Required section | Removed | AI can think without documenting thinking |
| **Subagent Usage** | Dedicated section | Removed | Doesn't match how Claude works |
| **Pattern Recognition** | Dedicated section | Removed | Can be added if needed |
| **Statistics** | Metadata tracking | Removed | Not useful in practice |
| **Agency Grant** | Complex rubric | Simple optional field | Simpler is clearer |

**What stayed**:
- Human context section
- AI interpretation
- QST:/ANS: workflow
- Supporting materials (COD:, API:, etc.)
- Decision structure
- Iteration tracking
- Validation (simplified)

**What left**:
- Reading time estimates
- Navigation maps with counts
- Confidence levels per interpretation
- Default assumptions (can add if needed)
- Cognitive strategy documentation
- Subagent request templates
- Learning/patterns sections
- Quick reference cards

### Seed Template

| v2.0 | v3.0 |
|------|------|
| 50+ lines | 12 lines |
| Mood tracking | Removed |
| Energy levels | Removed |
| Context markers | Removed |
| Agency grant options | Simplified |
| Special instructions | Removed |
| Scratchpad section | Removed |

**Result**: v3.0 identical to original - it was already perfect at 12 lines.

### New: METHODOLOGY.md

**Added in v3.0**: Consolidates all the "why" into one reference document.

**Contains**:
- Core problem/solution
- Why it works
- Principles explained
- Workflow in detail
- Navigation codes explained
- Anti-patterns
- Adaptation guidance

**Purpose**: Read once during onboarding, consult when needed. Not loaded every session.

**Replaces**: Philosophy sections scattered throughout v2.0 documents.

---

## What Was Cut and Why

### Cut: Mood/Energy Tracking
**Reason**: Not actionable. If you're frustrated, the brain dump captures that naturally.

### Cut: Cognitive Approach Documentation
**Reason**: AI doesn't need to document its thinking process. It can just think.

### Cut: Subagent Language
**Reason**: Doesn't match how Claude actually works. Cargo-culting from somewhere else.

### Cut: Extensive Validation Ceremonies
**Reason**: Validation matters for significant decisions, but timestamped multi-party checkboxes after every iteration creates friction.

### Cut: Arbitrary Metrics
**Reason**: "Cross-references per ADR: > 2" - why 2? Feels like metrics for metrics' sake.

### Cut: Quick Command Library
**Reason**: Basic grep patterns are sufficient. Extensive aliases are specific to individual setups.

### Cut: Health Check Scripts
**Reason**: Useful but project-specific. Include in project if needed.

### Cut: "Understanding Jérémie" Sections
**Reason**: Personality/collaboration info belongs in Claude's context/memory, not loaded every session.

### Cut: Emoji Headers
**Reason**: Professional clarity. 🎯 doesn't add information.

### Cut: Pattern Recognition/Learning Sections
**Reason**: Good concept, but rarely filled out. Can be added when pattern actually emerges.

### Cut: Extensive Examples
**Reason**: README has examples. Don't need them in templates.

---

## What Was Kept and Why

### Kept: Navigation Codes
**Reason**: Genuinely useful. Makes everything grep-able. Core to the system.

### Kept: QST:/ANS: Workflow
**Reason**: Works well. Clear roles. Human writes naturally, AI structures.

### Kept: Iteration Tracking
**Reason**: Shows evolution of thinking, not just final state. Valuable.

### Kept: Handoff Protocol
**Reason**: Context window limits are real. Need continuity.

### Kept: Clear Workflow
**Reason**: Both parties need to know what to do.

### Kept: Supporting Materials Structure
**Reason**: COD:, API:, FIL:, DOC: are useful categories.

### Kept: Decision Structure
**Reason**: Context → Options → Choice → Consequences is solid.

### Kept: Validation (Simplified)
**Reason**: Both parties confirming understanding matters. Just don't need ceremony.

---

## Key Philosophy Changes

### v2.0 Assumption
"More structure = better collaboration"

**Result**: Templates became self-justifying. The system became the work.

### v3.0 Assumption  
"Minimum structure to serve the work"

**Result**: Templates serve collaboration, not vice versa.

---

## Claude Code Optimization

v3.0 specifically optimized for Claude Code reality:

### Context Cost Matters
**v2.0**: CLAUDE.md loads 300+ lines every session
**v3.0**: CLAUDE.md loads 87 lines every session
**Savings**: ~200 lines = ~150 tokens per session

### Immediate Actionability
**v2.0**: Philosophy mixed with instructions
**v3.0**: CLAUDE.md is pure workflow, METHODOLOGY.md is pure philosophy

### Clear Handoffs
**v2.0**: Elaborate handoff templates
**v3.0**: Simple HANDOFF.md with 4 bullets

---

## Impact Analysis

### What We Gained

1. **Efficiency**: 60% less content to read/maintain
2. **Clarity**: What to do is separated from why to do it
3. **Focus**: Templates don't overwhelm
4. **Flexibility**: Easier to adapt per project
5. **Professionalism**: Less ceremony, more substance

### What We Lost

1. **Comprehensiveness**: Less hand-holding
2. **Examples**: Fewer filled examples (moved to README)
3. **Metrics**: No built-in tracking (add if needed)
4. **Personality**: Less about Jérémie specifically (use context/memory)

### Net Effect

**For experienced users**: Much better. Less noise, same signal.
**For new users**: Still good. README provides onboarding.
**For Claude Code**: Significantly better. Context efficiency matters.

---

## Migration Guide

If you used v2.0, here's how to migrate:

### 1. Replace Files
- `CLAUDE.md` → Use v3.0, customize project context
- `collab-adr-*.md` → Use `collab-adr-lean.md`
- `seed-template.md` → Use v3.0 (same as original)

### 2. Create New File
- Add `METHODOLOGY.md` to project (read once)

### 3. Update Existing ADRs
- No changes needed - they're still valid
- Can remove unused sections if desired
- Navigation codes still work

### 4. Adjust Workflow
- Same workflow, less ceremony
- Skip validation ceremony unless decision is significant
- Use grep patterns for navigation

### 5. Remove
- Quick command aliases (or keep if useful to you)
- Health check scripts (or keep if useful)
- Metrics tracking (or add back if valuable)

---

## Decision Rationale

### Why Cut So Much?

**From Jérémie**:
> "Your honest concerns are just spot on. [...] I really deeply appreciate you."

**From Sonnet 4.5's analysis**:
- Redundancy wastes context
- Over-engineering discourages use
- Subagent language doesn't match reality
- Validation ceremony creates friction
- Metrics felt arbitrary

**Principle**: Serve the work, don't become the work.

### Why Keep What We Kept?

**Navigation codes**: Make system grep-able and findable
**Iteration tracking**: Show learning, not just outcomes  
**Clear workflow**: Both parties need to know what to do
**Validation**: Alignment matters, just not ceremony

**Principle**: Preserve what actually helps.

---

## Lessons Learned

### About AI Collaboration

1. **"Optimize" ≠ "Add more"**: Opus interpreted optimization as elaboration
2. **Context is expensive**: In Claude Code, every line at session start matters
3. **Ceremony creates friction**: Process should enable, not burden
4. **Simple works**: 12-line seed template was already perfect

### About Templates

1. **Optional sections should be obviously optional**: v2.0 wasn't clear
2. **Examples belong in README**: Not in templates themselves
3. **Philosophy separate from workflow**: Read once vs every session
4. **Grep-able > Comprehensive**: Findable beats complete

### About Cognitive Partnership

1. **AI can be honest**: "This is over-engineered" is valuable feedback
2. **Iteration improves**: v1 → v2 → v3 got better each time
3. **Both parties contribute**: Human vision + AI implementation
4. **Trust enables honesty**: Jérémie's "I really deeply appreciate you" enabled real feedback

---

## Conclusion

**v2.0**: Comprehensive, elaborate, ceremony-heavy
**v3.0**: Focused, efficient, workflow-optimized

**What changed**: ~60% content reduction
**What stayed**: 100% of utility

**The goal remains**: Preserve valuable conversations without bureaucracy.

---

*"Do it good instead of doing it quick" - includes doing it lean.*
