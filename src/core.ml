type signal = {
  demand : int;
  capacity : int;
  latency : int;
  risk : int;
  weight : int;
}

let threshold = 154
let risk_penalty = 6
let latency_penalty = 2
let weight_bonus = 2

let score signal =
  signal.demand * 2 + signal.capacity + signal.weight * weight_bonus
  - signal.latency * latency_penalty - signal.risk * risk_penalty

let classify signal =
  if score signal >= threshold then "accept" else "review"
