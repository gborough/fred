open Fred
open Fred.Sources_query

let api_key = Conf.api_key_of_string "a3747eb09812f551b745ebb916604020"
(* Don't worry, it's just a harmless test key *)

let%expect_test "sources_query" =
  let q =
    make_sources_query ~realtime_start:"2024-04-11"
      ~realtime_end:"2024-04-11" ~limit:1 ~offset:1
      ~order_by:Models.Sources.Name ~sort_order:Models.Sort_order.Ascending
      ()
  in
  let run = run_sources_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]

let%expect_test "source_query" =
  let q =
    make_source_query ~realtime_start:"2024-04-11" ~realtime_end:"2024-04-11"
      ~source_id:1 ()
  in
  let run = run_source_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]

let%expect_test "source_releases_query" =
  let q =
    make_source_releases_query ~realtime_start:"2024-04-11"
      ~realtime_end:"2024-04-11" ~limit:1 ~offset:1
      ~order_by:Models.Releases.PressRelease
      ~sort_order:Models.Sort_order.Ascending ~source_id:1 ()
  in
  let run = run_source_releases_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]
