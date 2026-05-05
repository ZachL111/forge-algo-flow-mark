#use "src/core.ml";;

let expect condition = if not condition then failwith "fixture mismatch";;
let signal_case_1 = { demand = 71; capacity = 86; latency = 19; risk = 15; weight = 11 };;
expect (score signal_case_1 = 122);;
expect (classify signal_case_1 = "review");;
let signal_case_2 = { demand = 84; capacity = 82; latency = 15; risk = 23; weight = 10 };;
expect (score signal_case_2 = 102);;
expect (classify signal_case_2 = "review");;
let signal_case_3 = { demand = 79; capacity = 72; latency = 27; risk = 6; weight = 5 };;
expect (score signal_case_3 = 150);;
expect (classify signal_case_3 = "review");;
