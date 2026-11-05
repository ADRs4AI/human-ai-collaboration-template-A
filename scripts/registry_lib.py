#!/usr/bin/env python3
"""registry_lib.py — the registry-reading subset shared by refresh-terminals.py
and blame.py.

NOT the fork returning: the ADR-0044 molt removed last-message.py (68KB,
harness-unaware), but two surviving scripts path-loaded eight of its small
registry/tmux/color helpers — and crashed at HEAD for every consumer
(FileNotFoundError; Lapidary-of-CAM's reviewers reproduced it, brief
2026-11-05-0938, the guidebook cut its crew-launch step over it). This file
is those helpers, extracted VERBATIM from the removed module's last revision
(provenance: `git show <pre-molt>:scripts/last-message.py`), nothing added.
Destination unchanged: pneumatic absorbs this at the refresh-terminals port
(Understudy's scope-call, per the molt's own CHANGELOG row).
"""
from __future__ import annotations

import json
import os
import re
import subprocess  # noqa: F401  (kept: _tmux_argv callers pass argv to subprocess)
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent

ALIAS_FILE = Path(__file__).resolve().parent.parent / "docs" / "inbox" / "agent-sessions.json"

def load_config() -> dict:
    """Read the alias file. Returns dict with optional `_schema`, `_storage`, `aliases`."""
    if not ALIAS_FILE.exists():
        sys.exit(
            f"Alias file not found: {ALIAS_FILE}\n"
            "Create one (see docs/inbox/agent-sessions.json template) or run\n"
            "`just discover-sessions` to find session UUIDs for new agents."
        )
    try:
        with ALIAS_FILE.open() as f:
            return json.load(f)
    except json.JSONDecodeError as e:
        sys.exit(f"Alias file is not valid JSON: {e}")

def _real_aliases(cfg: dict) -> dict:
    """Skip underscore-prefixed keys (treated as comments/metadata in JSON)."""
    return {k: v for k, v in cfg.get("aliases", {}).items() if not k.startswith("_")}

DEFAULT_TMUX_SOCKET = "HSICTA"

def _tmux_argv(*args: str, socket: str | None = None) -> list[str]:
    """Build a tmux argv, threading `-L <socket>` (tmux's own socket-name
    flag — a distinct, isolated server, not just a distinct session) when
    set. Centralizing this in one place means every one of this file's ~25
    tmux call sites gets socket isolation automatically; hand-inserting `-L`
    at each site individually is exactly the kind of repetition that lets one
    site quietly get missed."""
    base = ["tmux"]
    if socket:
        base += ["-L", socket]
    return base + list(args)

def _project_tag() -> str:
    """Short, stable identifier for this repo, used to namespace tmux session
    names. tmux runs one server per user on the machine, not one per repo —
    two projects that happen to pick the same alias would otherwise collide
    on the same seat session. Per Seamster 5's feedback (companion-thinking-
    stream-etude import)."""
    return Path(__file__).resolve().parent.parent.name

def _seat_session_name(alias: str) -> str:
    """Namespaced tmux session name. Format: <project>-<alias>-seat (not
    seat-<project>-<alias>) — tmux's status bar truncates from the right, so
    front-loading the variable/unique parts survives truncation better than a
    generic "seat-" prefix."""
    return f"{_project_tag()}-{alias}-seat"

NAMED_COLORS = {
    "red": "#E06C75",
    "green": "#98C379",
    "yellow": "#E5C07B",
    "blue": "#61AFEF",
    "purple": "#C678DD",
    "orange": "#D19A66",
    "pink": "#E06C96",
    "cyan": "#56B6C2",
    "amber": "#FFB300",  # not a Claude-Code /color name, but several crews (incl.
                         # this one's own Cartographer) use "amber" descriptively;
                         # added per flightaware/flight-aware's independent copy.
    "default": "#666666",
}

def _get_seat_color(entry: dict) -> str:
    """Resolve a seat's status-bar color with a fallback chain:
    1. settings.color_hex (explicit hex, highest priority)
    2. top-level `color` — passed through if already hex, else translated
       via NAMED_COLORS (the Claude-Code-/color value most seats have)
    3. default gray
    """
    if not isinstance(entry, dict):
        return NAMED_COLORS["default"]
    settings = entry.get("settings") or {}
    if isinstance(settings, dict) and settings.get("color_hex"):
        return settings["color_hex"]
    color = entry.get("color", "default")
    if isinstance(color, str) and color.startswith("#"):
        return color
    return NAMED_COLORS.get(color, NAMED_COLORS["default"])

def _get_seat_setting(entry: dict, global_cfg: dict, key: str, default=None):
    """Fallback chain: seat-specific `settings.<key>` -> global default ->
    `default` (omitted from the launch command entirely if still None).
    Nested under `settings` for consistency with this registry's existing
    convention (color_hex, substrate_backstop) — caring-feedback's own example
    put these at the seat's top level instead; adapted here rather than
    introducing a second, inconsistent config surface."""
    seat_settings = (entry.get("settings") or {}) if isinstance(entry, dict) else {}
    if key in seat_settings:
        return seat_settings[key]
    if key in global_cfg:
        return global_cfg[key]
    return default

