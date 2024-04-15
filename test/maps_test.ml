open Fred
open Fred.Maps_query

let api_key = Conf.api_key_of_string "a3747eb09812f551b745ebb916604020"
(* Don't worry, it's just a harmless test key *)

(* let%expect_test "shape_query" = let q = make_shape_query ~shape:"bea" in
   let run = run_shape_query ~query:q ~api_key:api_key in let res =
   get_result run in let sh = Result.get_ok res in print_endline sh.name ;
   [%expect {| goods |}] *)
(* The shape_query endpoint is possibly defunct *)

let%expect_test "series_group_query" =
  let q = make_series_group_query ~series_id:"SMU56000000500000001a" in
  let run = run_series_group_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]

let%expect_test "series_data_query" =
  let q =
    make_series_data_query ~date:"2012-01-01" ~start_date:"2011-12-30"
      ~series_id:"WIPCPI" ()
  in
  let run = run_series_data_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]

let%expect_test "regional_data_query" =
  let q =
    make_regional_data_query ~transformation:Models.Maps_regional_data.Levels
      ~aggregation_method:Models.Maps_regional_data.Average
      ~frequency:Models.Maps_regional_data.Annual ~date:"2013-01-01"
      ~start_date:"" ~region_type:"state" ~season:"NSA" ~units:"Dollars"
      ~series_group:"882" ()
  in
  let run = run_regional_data_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]
