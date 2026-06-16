# Justfile — coordination recipes for multi-participant human-AI projects.
#
# This is a **seed** justfile. It contains only the recipes needed to use
# the inbox protocol and the per-message-attribution discipline; it does NOT
# contain project-specific recipes (build, test, deploy, etc.) — those are
# yours to add per project. Keeping this file focused on the *coordination*
# layer lets it drop into any project without conflicting with the project's
# own justfile structure.
#
# Two design choices worth knowing as you extend this:
#
# 1. Filenames are stamped UTC; prose to humans is rendered ET (or local).
#    The `stamp` recipe shows both; the `brief` and `completion` recipes use
#    UTC for the filename. This prevents the cross-timezone ordering bug
#    described in docs/inbox/INBOX-PROTOCOL.md.
#
# 2. The `last`, `aliases`, and `discover-sessions` recipes surface
#    per-message `model` attribution from session JSONLs — the load-bearing
#    drift-detection signal described in docs/inbox/CONVENTIONS.md (principle
#    1). Keep this surface in any extensions you add.
#
# Contributed by Statesman 4.7 (Claude Opus 4.7), 2026-06-15, via System3
# Conversations. See docs/inbox/CONVENTIONS.md for origin and the principles
# this file operationalizes.

# Default: list available recipes when `just` is run with no args.
default:
    @just --list

# ─── inbox protocol — file naming + listing ──────────────────────────────────

# List the most recent inbox messages. Useful at the start of a session to
# get oriented on what other participants have been doing.
[group('inbox')]
[doc("List recent docs/inbox/ messages (see docs/inbox/INBOX-PROTOCOL.md).")]
inbox:
    @echo "📬  docs/inbox/ — recent messages:"
    @ls -t docs/inbox/*.md 2>/dev/null | head -8 | sed 's|^|    |' || echo "    (no inbox files yet)"

# Print current timestamp in both UTC (for filenames) and ET (for prose).
# UTC ensures filenames sort correctly across participants in different
# timezones. ET (or your local zone) is what you say to the human.
[group('inbox')]
[doc("Print current timestamp in UTC (for filenames) and ET (for prose).")]
stamp:
    @echo "UTC: $(date -u +%Y-%m-%d-%H%M)"
    @echo "ET:  $(TZ=America/New_York date +'%Y-%m-%d %I:%M %p %Z')"

# Create a new outgoing brief. Args: from to slug.
#
# Filename: docs/inbox/<UTC-ts>-<from>-to-<to>-<sluggified-slug>.md
# Slug is sanitized: lowercase, non-alphanumeric → "-", repeated dashes collapsed.
# Refuses to overwrite an existing file.
#
# Example: just brief planner reviewer schema-question
[group('inbox')]
[doc("Create new outgoing brief file: just brief <from> <to> <slug>")]
brief from to slug:
    #!/usr/bin/env bash
    set -euo pipefail
    ts=$(date -u +"%Y-%m-%d-%H%M")
    slug=$(echo "{{slug}}" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g; s/--*/-/g; s/^-//; s/-$//')
    file="docs/inbox/${ts}-{{from}}-to-{{to}}-${slug}.md"
    if [[ -e "$file" ]]; then echo "Error: $file already exists" >&2; exit 1; fi
    mkdir -p docs/inbox
    touch "$file"
    echo "$file"

# Create a new completion brief (response to an earlier dispatch).
# Args: from slug.
#
# Filename: docs/inbox/<UTC-ts>-<from>-completion-<sluggified-slug>.md
#
# Example: just completion implementer schema-question
[group('inbox')]
[doc("Create new completion brief file: just completion <from> <slug>")]
completion from slug:
    #!/usr/bin/env bash
    set -euo pipefail
    ts=$(date -u +"%Y-%m-%d-%H%M")
    slug=$(echo "{{slug}}" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g; s/--*/-/g; s/^-//; s/-$//')
    file="docs/inbox/${ts}-{{from}}-completion-${slug}.md"
    if [[ -e "$file" ]]; then echo "Error: $file already exists" >&2; exit 1; fi
    mkdir -p docs/inbox
    touch "$file"
    echo "$file"

# ─── inbox protocol — cross-session awareness via session JSONLs ─────────────
#
# These recipes give each participant the ability to *see* what other
# participants have recently said, without going through the human as message
# bus. Critically, they surface per-message `model` attribution by default —
# making silent model substitutions (classifier reroutes, harness swaps,
# deprecations) visible the moment they happen.
#
# See docs/inbox/CONVENTIONS.md § 1 for why per-message model attribution is
# load-bearing.

# Read the last K messages from an agent's session JSONL (default K=1).
# Resolves <alias> via docs/inbox/agent-sessions.json. Renders per-message
# `model` attribution on every entry.
[group('inbox')]
[doc("Read last K messages from agent's session: just last <alias> [k]")]
last alias k='1':
    @python3 scripts/last-message.py {{alias}} -k {{k}}

# Same as `last`, but no body truncation (full message contents).
[group('inbox')]
[doc("Read last K messages from agent (full, no truncation): just last-full <alias> [k]")]
last-full alias k='1':
    @python3 scripts/last-message.py {{alias}} -k {{k}} --full

# List configured agent → session-UUID aliases. Edit
# docs/inbox/agent-sessions.json to add or update.
[group('inbox')]
[doc("List configured agent session aliases (docs/inbox/agent-sessions.json)")]
aliases:
    @python3 scripts/last-message.py --list

# List recent session JSONLs in the storage dir. Use this to find UUIDs for
# new agents and populate docs/inbox/agent-sessions.json.
[group('inbox')]
[doc("Discover recent session JSONLs in this project (find UUIDs for new aliases)")]
discover-sessions:
    @python3 scripts/last-message.py --discover
