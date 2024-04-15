open Fred
open Fred.Categories_query

let api_key = Conf.api_key_of_string "a3747eb09812f551b745ebb916604020"
(* Don't worry, it's just a harmless test key *)

let%expect_test "categories_query" =
  let q = make_categories_query ~category_id:125 in
  let run = run_categories_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]

let%expect_test "children_query" =
  let q = make_children_query ~category_id:13 () in
  let run = run_children_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]

let%expect_test "children_query" =
  let q =
    make_children_query ~realtime_start:"2024-04-11"
      ~realtime_end:"2024-04-11" ~category_id:13 ()
  in
  let run = run_children_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]

let%expect_test "related_query" =
  let q =
    make_related_query ~realtime_start:"2024-04-11"
      ~realtime_end:"2024-04-11" ~category_id:32073 ()
  in
  let run = run_related_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]

let%expect_test "series_query" =
  let q =
    make_series_query ~realtime_start:"2024-04-11" ~realtime_end:"2024-04-11"
      ~limit:1 ~offset:1 ~order_by:Models.Series.Title
      ~sort_order:Models.Sort_order.Ascending
      ~filter_variable:Models.Series.Frequency ~filter_value:"Quarterly"
      ~tag_names:"income;bea" ~exclude_tag_names:"discontinued;annual"
      ~category_id:125 ()
  in
  let run = run_series_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]

let%expect_test "tags_query" =
  let q =
    make_tags_query ~realtime_start:"2024-04-11" ~realtime_end:"2024-04-11"
      ~tag_names:"trade;goods" ~tag_group_id:Models.Tags.Default
      ~search_text:"" ~limit:1 ~offset:1 ~order_by:Models.Tags.SeriesCount
      ~sort_order:Models.Sort_order.Ascending ~category_id:125 ()
  in
  let run = run_tags_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]

let%expect_test "related_tags_query" =
  let q =
    make_related_tags_query ~realtime_start:"2024-04-11"
      ~realtime_end:"2024-04-11" ~tag_names:"trade"
      ~exclude_tag_names:"goods;sa" ~tag_group_id:Models.Tags.Default
      ~search_text:"" ~limit:1 ~offset:1 ~order_by:Models.Tags.SeriesCount
      ~sort_order:Models.Sort_order.Ascending ~category_id:125 ()
  in
  let run = run_related_tags_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]
