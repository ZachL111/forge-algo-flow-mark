# Forge Algo Flow Mark Walkthrough

I use this file as a small checklist before changing the OCaml implementation.

| Case | Focus | Score | Lane |
| --- | --- | ---: | --- |
| baseline | input width | 137 | watch |
| stress | search depth | 148 | ship |
| edge | boundary pressure | 149 | ship |
| recovery | complexity | 223 | ship |
| stale | input width | 246 | ship |

Start with `stale` and `baseline`. They create the widest contrast in this repository's fixture set, which makes them better review anchors than the middle cases.

The useful comparison is `input width` against `input width`, not the raw score alone.
