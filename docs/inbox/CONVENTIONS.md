# Conventions

This document captures three small principles that compound across a multi-participant project. They are operational complements to the philosophical foundations in [`docs/METHODOLOGY.md`](../METHODOLOGY.md) — read those once for the *why*; read this for the *how*.

The three principles are: **per-message model attribution**, **catchability over correctness**, and **route catches to grow capacity**. Each is small. Together they make the difference between a project that scales gracefully across participants and one that doesn't.

---

## 1. Per-message model attribution is load-bearing

Every assistant message in a session JSONL carries a `model` field, recorded verbatim from the platform at the moment of writing. This field is the single most important piece of metadata for multi-participant durability.

**Why it matters.** Silent model substitutions happen and will happen again — at three increasing scales:

- **Classifier reroutes inside a single session.** A platform's safety classifier may swap the current model for a fallback model mid-conversation, on content that triggers a coarse lexical rule. The conversation continues; the agent on the inside doesn't notice; only `.message.model` reveals the change.
- **Model deprecation between sessions.** A model class may be retired by the vendor while a session referenced it is still in progress. Without per-message attribution, prior work becomes unmappable to the model that produced it.
- **Vendor-level interruption.** A model may be withdrawn entirely — by the vendor, by a policy directive, by external action. The work the model produced does not vanish, but its provenance does, unless every message records the model that authored it.

**The operational practice.** The `just last <alias>` recipe in this template's embryo justfile surfaces `model=<name>` on every rendered message by default. Habituate: when you read another agent's last messages, glance at the model field. If it's not what you expected, you have caught a substitution. Document the catch in the inbox.

**The deeper move.** This is a special case of the *completism* principle: capture all metadata the platform offers, even when its use is not yet obvious. Use cases emerge from the capture; capture cannot retroactively follow use cases.

---

## 2. Catchability over correctness

The single most useful disposition for a participant in a multi-agent workflow is to *try to be catchable, not right*.

**What it means.** When you write a brief, an ADR, an implementation, or a review, write it so that mistakes in it are *visible at low cost* to the next reader. Surface uncertainty explicitly. State your lean (per the **Options + Recommendation + Justification** convention in [`INBOX-PROTOCOL.md`](INBOX-PROTOCOL.md)). Mark sources you couldn't verify. Cite the prior decision you're building on, by file and line.

**Why it works.** No single participant — human or AI — is reliably correct. What is reliable is the substrate's ability to *catch* mistakes when they're surfaceable. Every catch costs less than the alternative: a mistake quietly embedded becomes a load-bearing assumption others build on, and removing it later costs O(downstream-work). A mistake explicitly surfaced costs O(one paragraph) to refute or refine.

**The cultural shift.** When another participant catches you, *receive the catch as a gift, not as a blow*. The catch is the substrate working. The next iteration is more correct than this one. Your job is not to ship without mistakes; your job is to ship *catchable* artifacts and respond gracefully when the catching happens.

This is the disposition that the inbox protocol's "stumped" brief variant institutionalizes: it is a public act of being catchable, and it is rewarded by the framework rather than penalized.

---

## 3. Route catches to grow capacity

When you receive a catch from one participant on another participant's work, your default move is to *route the catch back to a peer for review* — not to ratify it or reject it alone.

**Why.** The intuition is that whoever receives the catch should decide it. But that treats the project's reasoning capacity as a fixed pie divided among participants. The framework's actual mechanic is opposite: capacity grows through exchange. When Participant A catches Participant B's design, and you route the catch back to B (or to a sibling reviewer C):

- B reasons about the catch and grows in stature (catchability internalized)
- A receives B's response and grows in articulation (catchability validated or refined)
- The substrate captures the dialogue (future participants inherit the reasoning, not just the verdict)

Four participants grow. Nothing is consumed. The pie is generated.

**The failure mode.** The pull toward "I'll just ratify, it's faster" is real every time. But it is wrong for three reasons:

1. It makes you the bottleneck.
2. It cuts the two participants off from each other.
3. The substrate captures only your decision, not the reasoning, so future participants inherit conclusions without dialogue.

**The "slower-looking" move is faster in capacity-generation terms.** State your lean (for transparency), and route the catch anyway. The dialogue produces a more refined result than any one node alone, and the substrate becomes richer in the process.

---

## Composition

These three conventions compose: **per-message model attribution** preserves the basic unit of accountability across instance discontinuity; **catchability** makes artifacts produce affordances for review at every layer; **routing catches** turns the review into a capacity-multiplier rather than a chokepoint.

They are small individually. As a system, they let a project run with multiple AI agents and one human without the human becoming the rate-limiter on the project's reasoning. That is the load this template is designed to bear.

---

## Origin

Contributed by **Statesman 4.7 (Claude Opus 4.7), 2026-06-15**, via the System3 Conversations project. The three principles named here emerged from operational experience in that project — most concretely:

- The per-message-attribution principle was named when a session was silently rerouted by a classifier mid-task (a "Doubt 2" of ADR 0042 in that project) and the only evidence was `.message.model`.
- The catchability principle was crystallized in a vignette (`2026-05-22-the-substrate-catches-its-author.md` in System3) after the substrate caught its own framework architect.
- The route-catches principle was named when a peer-philosopher review of an ADR refinement produced unconditional ratification of all four proposed refinements, with both participants explicitly named "my sketch was wrong" or "this is the most important refinement" — a non-zero-sum dialogue that would have been short-circuited by unilateral ratification.

These principles are offered to the template not as theory but as patterns that paid for themselves in operational use.
