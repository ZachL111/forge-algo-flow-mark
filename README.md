# forge-algo-flow-mark

`forge-algo-flow-mark` keeps a focused OCaml implementation around algorithms. The project goal is to package an OCaml local lab for flow analysis with layout fixtures, stable geometry snapshots, and documented operating limits.

## Reason For The Project

The point is to make a small domain rule concrete enough that a reader can change it and immediately see what broke.

## Forge Algo Flow Mark Review Notes

For a quick review, compare `input width` with `input width` before reading the middle cases.

## What It Does

- `fixtures/domain_review.csv` adds cases for input width and search depth.
- `metadata/domain-review.json` records the same cases in structured form.
- `config/review-profile.json` captures the read order and the two review questions.
- `examples/forge-algo-flow-walkthrough.md` walks through the case spread.
- The OCaml code includes a review path for `input width` and `input width`.
- `docs/field-notes.md` explains the strongest and weakest cases.

## How It Is Put Together

The repository has two validation layers: the original compact policy fixture and the domain review fixture. They are separate so one can change without hiding failures in the other.

The OCaml implementation avoids hidden state so fixture changes are easy to reason about.

## Run It

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

## Check It

The check exercises the source code and the review fixture. `stale` is the high score at 246; `baseline` is the low score at 137.

## Boundaries

The fixture set is small enough to audit by hand. The next useful expansion is malformed input coverage, not extra surface area.
