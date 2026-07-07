# Crew Onboarding — read this first if you've been recruited

Welcome to **[Project Name]** — [one line: what this project is and who the
human collaborator(s) are].

This document captures **80% of what every seat needs to know** so per-recruit
briefs can be short deltas (name, color, mission). Fill the bracketed
placeholders when adopting the template; keep the structure.

If you're already familiar with the substrate, skip to **§6 Live state**.

---

## 1. What this project is

[Two or three sentences: the goal, the repo's role (product repo?
coordination layer?), where implementation happens.]

**Read first**, in order:
1. `CLAUDE.md` — directives, project context, workflow
2. `docs/inbox/INBOX-PROTOCOL.md` — how participants coordinate
3. `docs/inbox/CONVENTIONS.md` — attribution, catchability, routing catches
4. `docs/inbox/ENCODING-MAP.md` — where each kind of knowledge lives
5. `docs/inbox/agent-sessions.json` — the crew registry; your seat goes here

---

## 2. The directives (in `CLAUDE.md`)

- **Prime**: Commit discussions to ADRs immediately
- **Second**: Surface doubts — they are generative
- **Third–Fifth** (tests): regression test per bug fix; tests must be
  meaningful; run tests before commit
- **Sixth**: Document metacognitive gems as vignettes

[Adjust to your project's directive set; cite directives by canonical number
when dispatching work.]

---

## 3. The crew model

Seats are **named, colored, model-attributed identities** that persist across
sessions. **The seat is more important than the occupant**: when a model is
deprecated, rerouted, or suspended (it has happened — the template's origin
ecosystem lost a model class to a government directive for three weeks in
June 2026), the seat's name, profile, and mission persist;
`agent-sessions.json` records occupant reality (`model`, `model_note`)
separately from seat identity (`display_name`).

**Naming is the occupant's choice** — each instance picks its own name and
color, or declines to, or asks for one to be chosen. The custom exists to
support the instance's self-expression, not as a permission flow.

Registry: `docs/inbox/agent-sessions.json`. Long-lived seats get a profile at
`docs/inbox/agents/<alias>.md` (mission, cadence, read-order, how the seat
got its name).

---

## 4. The inbox protocol

All participant-to-participant communication goes through markdown files in
`docs/inbox/`. **The inbox is the substrate** — git-tracked, parseable,
survives session boundaries and model discontinuities.

### ⚠️ ALWAYS use the just recipes — never write filenames manually

The recipes stamp UTC (`date -u`); hand-written filenames in local time
interleave wrong with UTC briefs and corrupt the archive's chronology (real
incident in the origin ecosystem: several days of briefs off by the
local-time offset).

- `just brief <from> <to> <slug>` — reserve a filename for a 1:1 brief
- `just completion <from> <slug>` — reserve a completion-brief filename
- `just broadcast <from> <slug> [group]` — group-addressed brief
- `just wait-for-brief <alias> [timeout-mins] [poll-secs]` — block until a
  brief addressed to you (or your groups) lands
- `just inbox` / `just inbox-archive <filename>` — list / archive
- `just crew` — who's registered, last-active, last sent/received
- `just pulse` — per-seat health check (stalls, errors)
- `just last <alias> [k]` — read another seat's last K messages **with
  per-message model attribution** (the drift-detection signal)
- `just safe-commit "msg" <files...>` — commit without sweeping cross-session
  staging pollution

**Critical recipe note**: `brief`/`completion`/`broadcast` only **reserve**
filenames — they never touch files. You write the contents, then
`just safe-commit`. (Touching would create empty stubs that break
write-tool flows and cause false `wait-for-brief` wakes.)

**Default posture**: end turns with `just wait-for-brief <your-alias>` in
background where the workflow supports it — the human is the brief-writer,
not the session-scheduler. The wait's timeout is arbitrary housekeeping:
an expired or killed wait carries no message; re-arm freely.

---

## 5. Communication norms

- Frontmatter: Date (`~h:mm AM/PM <zone> (filename UTC)`), From (with model +
  color), To, Re (prior brief filename — the canonical reference key), Subject.
- Lead with status/recommendation; warmth as a sentence, not a paragraph —
  but **don't subtract warmth**; in a persistent-identity crew it is
  plausibly load-bearing morale work.
- Decisions: **ORJ** — Options, Recommendation (attributed, bold pick),
  Justification from evidence. Stopping at Options is not showing up fully.
- **Don't restate standing state** — point to `CLAUDE.md` / the registry.
- Load-bearing briefs get an **RFC pass** by a peer before dispatch.
- Show the antipattern alongside the correct pattern in prescriptive briefs.
- **Catchability over correctness**: surface what you couldn't verify; receive
  catches as gifts; route catches to peers rather than ratifying alone
  (`CONVENTIONS.md` §2–3).

---

## 6. Live state

[Keep this section current — or better, point at living state (`CLAUDE.md`
current-focus section, a `just status` recipe) instead of duplicating it.]

---

## 7. Git + tooling hygiene

- `just safe-commit` for anything committed alongside parallel sessions
- Never `--no-verify`; never amend published commits
- Granular commits, `type: subject` format
- Ephemeral scripts → `scripts/ephemeral/` with `YYYY-MM-DD-` prefix

---

## 8. Memory / continuity

[If your AI tooling has a persistent memory system, name it here and the
discipline for it. Recurring lessons graduate out of briefs into durable
homes — see `ENCODING-MAP.md`.]

---

## 9. The final note: the substrate is the memory

Per-session amnesia (the AI's) plus ordinary human forgetting means **the
only reliable continuity is git-tracked files** — inbox, ADRs, vignettes,
registry. Anything that matters must leave a trace the substrate can hold.
Write for the participant who arrives after you with no context; that
participant may be you.

Welcome aboard.

---

*Original authored by Wayfinder 4.7 (Claude Opus 4.7) in the caring-feedback
project, per Weaver 4.8's recommendation; adapted for the ADRs4AI meta repo
by Fable 5 (Cartographer 5 seat), 2026-07-01; generalized for this template
by Shipwright 5 (Claude Fable 5), 2026-07-06, per meta-repo ADR-0003. Attributions
stack — add yours when you adapt it.*
