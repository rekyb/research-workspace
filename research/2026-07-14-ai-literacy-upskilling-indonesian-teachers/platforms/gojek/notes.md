# Gojek — targeted voice & copywriting pass

> **Scope note (read first).** This is **not** a full platform benchmark and it is **post-synthesis**.
> It is a targeted pass on one question only: *how does the most successful Indonesian consumer
> product handle copy register?* It was run to pressure-test the language decisions in
> `DESIGN-FOUNDATIONS.md` §5 and the prototype's copy. It adds **no feature** to `SYNTHESIS.md`.
>
> **Evidence type:** verbatim public UI/marketing strings + a first-party Gojek engineering-blog
> post. **No screenshots or `flow.gif`** — for a copy pass the strings *are* the artifact, and the
> captured page text is quoted verbatim below with its URL and access date. Declared honestly rather
> than padded with stills. The Gojek app itself is behind an app store and a login, so only public
> web surfaces were observed (no account, no install, per workspace guardrails).
>
> **PII:** the Mitra Driver page carries testimonials from named real drivers. Those names are
> **excluded** from these notes and were not captured (third-party PII rule).

## Why Gojek

Our teachers are Indonesian, on Android, in Bahasa. Gojek is the most-used Indonesian-designed
interface in that population, so it is the strongest available reference for what "sounds normal"
in an Indonesian app. Its writing team has also published its principles, which is rare and lets us
cite intent, not just infer it.

## What we found

### 1. Register is chosen by *audience*, not by brand — Gojek runs three tones

This is the headline, and it comes from Gojek's own writing team. Their post states that Gojek has
three super apps (consumer, driver partner, merchant partner) and that each has a different tone of
voice: the consumer app is witty, cheerful and casual, aiming to be the user's helpful best friend,
while the driver and merchant partner apps are deliberately more formal and business-like, because
the relationship is different.
Source: [Language No Bar: How We Localise UX Copies At Gojek](https://www.gojek.io/blog/language-no-bar-how-we-localise-ux-copies-at-gojek) (gojek.io, 2021-06-04, accessed 2026-07-15).

The live surfaces corroborate it exactly.

**Consumer surface** ([gojek.com/id-id](https://www.gojek.com/id-id/), accessed 2026-07-15) — informal
`kamu`/`-mu`, particles, even an emoticon:
- "Yuk, unduh sekarang juga."
- "Gabung jadi GoTroops, yuk!"
- "membantumu menjalani keseharian dengan lebih mudah"
- "Subsidi asuransi kesehatan buat kedua orang tuamu."
- "Mau beli buku, daftar gym membership, isi pulsa? Gojek bisa kasih subsidi ;)."

**Partner surface** ([gojek.com/id-id/driver](https://www.gojek.com/id-id/driver/), accessed 2026-07-15) —
switches to `Anda`, but stays colloquial:
- "sekarang giliran Anda!"
- "Pilih armada Anda"
- "Jutaan Mitra Driver udah gabung bersama Gojek dan ningkatin penghasilannya"
- "Yuk, dengar cerita dari Mitra"
- "Kenapa gabung jadi Mitra?"

**The pattern worth stealing:** the partner voice is a **hybrid** — the *formal pronoun* (`Anda`)
carrying *informal rhythm* (`udah`, `ningkatin`, `yuk`, questions as headings, exclamation marks).
Gojek does not treat "respectful" and "warm" as a trade-off. It picks `Anda` to signal a
professional relationship, then buys the warmth back with verb forms and particles.

### 2. Their stated principles subordinate wit to clarity

Gojek's post names their UX-writing principles as **Clear, Concise, Helpful**, and is explicit that
however funny or conversational they want to be, the copy must stay clear and helpful, and any joke
must be easily understood. Wit is a garnish, never the payload.

### 3. Error copy is localised with a *local metaphor*, and the metaphor is tuned per market

Their worked example is a "server busy" error. In Bahasa they used **"Server padat merayap"** — the
phrase Indonesians use for crawling traffic — turning a system error into a shared local joke. In
English they went conversational ("OMG… Server busy"); in Thai they deliberately went *plain and
apologetic* instead, because Thai users expect the company to take responsibility for its own fault.

The lesson is not "be funny in errors." It is that **the right tone in a failure state depends on
who is at fault and how much is at stake** — Gojek changed the register per market for the same bug.

### 4. They use the *user's* word, not the correct technical word

"Live tracking" has no natural Bahasa equivalent. Rather than coin one, they asked the research team
how users actually described the feature — users called it the driver's position — and shipped
**"Posisi driver akurat, kah?"** as the Bahasa copy. The technical term lost to the user's term,
and the decision was research-backed.

## What this means for us (analysis)

| Our locked decision | Gojek evidence | Verdict |
|---|---|---|
| `Anda` register (DESIGN-FOUNDATIONS §5) | Partner apps go formal *by design*; teachers are a professional audience, closer to Mitra than to consumer | **Validated — keep `Anda`** |
| "Calm & credible" (Direction B) | Gojek's own partner tone is business-like, not jokey | **Validated** |
| Warmth of our current copy | Gojek's `Anda` still carries `yuk` / `udah` / questions; ours is uniformly full-formal | **Too stiff — this is the real gap** |
| Teach real terms, scaffolded | Gojek *replaced* the technical term with the user's term | **Tension — see below** |

**The gap:** we picked the right pronoun and then wrote around it like a government circular. Gojek
proves `Anda` + warm rhythm is a real, native register — it is how Indonesian institutions talk to
adults they respect but want to befriend. Our prototype copy currently has no particles, no
contractions, and no questions-as-headings. It reads correct and slightly cold.

**The tension (worth a decision, not a silent choice):** Gojek dropped the technical term because
their user's goal is *to get a ride* — the vocabulary is not the product. Our user's goal is *to
become AI-literate* — the vocabulary **is** part of the learning outcome (F2 fluency ladder). So the
resolution is a split, not a copy of Gojek:
- **UI chrome** (buttons, labels, nav, errors) → the teacher's word.
- **Learning content** (units, definitions) → the real term, scaffolded, as already decided.
That keeps Gojek's lesson (never make the *interface* a vocabulary test) without abandoning the
course's job.

**Tone ladder by stakes** (synthesised from finding 3, our proposal — *not* a Gojek artifact):
| Stakes | State | Register |
|---|---|---|
| Low | offline, empty, loading, progress, wins | Warm hybrid — `Anda` + particle, reassurance first |
| Medium | validation, quality-gate fail, retry | Plain, helpful, no joke, say the fix |
| High | PII / student-data warnings (FR-13) | Formal and unambiguous. **No warmth, no metaphor.** |

Gojek's own Thai decision is the precedent for the high-stakes row: when the user stands to be
harmed, wit reads as evasion.

## Limits

- Public web surfaces only; the in-app copy (the real artifact) is behind an app store + login and
  was **not** observed first-hand. Marketing-site voice is a *proxy* for app voice.
- The GoBiz merchant surface (`gobiz.co.id`) was not readable in our browser tooling, so the
  merchant register is cited from Gojek's blog only, not verified first-hand.
- The blog post is from 2021; the live pages (2026-07-15) still corroborate the split, but the
  team's current guidelines are not public.
- No stills; strings are quoted verbatim with URLs + dates so every claim above is re-checkable.
- Gojek is a *transactional* consumer product, not a learning product. Its register transfers;
  its goal structure does not. Do not import its mechanics on the strength of this pass.
