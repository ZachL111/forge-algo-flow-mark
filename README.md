# forge-algo-flow-mark

`forge-algo-flow-mark` packages a practical algorithms exercise in OCaml. The emphasis is on deterministic behavior, a small public API, and examples that explain the tradeoffs.

## How I Read Forge Algo Flow Mark

The useful thing to inspect here is how the same score rule is represented in code, metadata, and examples. If those three pieces disagree, the audit script should make the drift visible.

## Problem Shape

This is not a wrapper around a service. It is a self-contained project that shows how the model behaves when demand, capacity, latency, risk, and weight move in different directions.

## Internal Model

The core is a scoring model over demand, capacity, latency, risk, and weight. That keeps input shape, complexity tradeoffs, and golden cases in one explicit decision path. The threshold is 154, with risk penalty 6, latency penalty 2, and weight bonus 2. The OCaml implementation keeps the data record and functions small enough to load directly in the test file.

## Scenario Walkthrough

`pressure` is the first example I would inspect because it lands on the `review` path with a score of 81. The broader file also keeps `degraded` at -5 and `recovery` at 204, which gives the model a useful low-to-high spread.

## Main Behaviors

- Uses fixture data to keep complexity tradeoffs changes visible in code review.
- Includes extended examples for golden cases, including `recovery` and `degraded`.
- Documents boundary checks tradeoffs in `docs/operations.md`.
- Runs locally with a single verification command and no external credentials.
- Stores project constants and verification metadata in `metadata/project.json`.

## Run It Locally

The only required setup is the local OCaml toolchain. After cloning, stay in the repo root so fixture paths resolve correctly.

## Validation

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/audit.ps1
```

The audit command checks repository structure and README constraints before it delegates to the verifier.

## Repository Map

- `src`: primary implementation
- `tests`: verification harness
- `fixtures`: compact golden scenarios
- `examples`: expanded scenario set
- `metadata`: project constants and verification metadata
- `docs`: operations and extension notes
- `scripts`: local verification and audit commands

## Known Edges

This code is local-first. It makes no claim about deployed usage and avoids credentials, hosted state, and environment-specific setup.

## Follow-Up Work

- Add malformed input fixtures so the failure path is as visible as the happy path.
- Split the scoring constants into a typed configuration object and validate it before use.
- Add a comparison mode that shows how decisions change when one signal is adjusted.
- Add one more algorithms fixture that focuses on a malformed or borderline input.

## How To Run It

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

This runs the language-level build or test path against the compact fixture set.
