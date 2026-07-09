# Performance — low-tier Android / 3G budget

> Load for perf-sensitive work. Primary target: **low-tier Mobile users on 3G**. Performance is a constraint (NN-05),
> not an afterthought — when a treatment can't hit budget, simplify it.

## PERF · Motion budget
- **PERF-01** Animations ≥ 30fps on low-tier Android/3G; if the budget is tight, **drop to instant state**.
- **PERF-02** Respect `prefers-reduced-motion`. Animate `transform`/`opacity` only (never layout props).
- **PERF-03** Glassmorphism / heavy blur / multi-layer shadow stacks / 3D-spatial: use **sparingly**, verify on a real low-end device before shipping.

## PERF · Loading character
- **PERF-04** Skeleton-with-personality over a generic spinner; show feedback within ~100ms; contextual progress for >1s ops.
- **PERF-05** Optimistic commit where safe (assume success, reconcile on response) instead of blocking spinners.

## PERF · Assets & delivery
- **PERF-06** Images WebP/AVIF, responsive `srcset/sizes`, `loading="lazy"` below the fold; declare `width/height` (avoid CLS).
- **PERF-07** `font-display: swap`; preload only critical fonts.
- **PERF-08** Route-level code splitting / dynamic import for non-hero components; keep the initial bundle lean.
- **PERF-09** Virtualize lists > 50 items; debounce/throttle scroll/resize/input.

## PERF · Network (PWA)
- **PERF-10** Offline state messaging + basic fallback; surface "offline saves your progress" where true.
- **PERF-11** Degrade gracefully on slow networks (lower-res images, fewer animations).
