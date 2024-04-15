open Fred
open Fred.Tags_query

let api_key = Conf.api_key_of_string "a3747eb09812f551b745ebb916604020"
(* Don't worry, it's just a harmless test key *)

let%expect_test "tags_query" =
  let q =
    make_tags_query ~realtime_start:"2024-04-11" ~realtime_end:"2024-04-11"
      ~tag_names:"" ~tag_group_id:Models.Tags.Frequency ~search_text:""
      ~limit:1 ~offset:1 ~order_by:Models.Tags.Popularity
      ~sort_order:Models.Sort_order.Ascending ()
  in
  let run = run_tags_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]

let%expect_test "related_tags_query" =
  let q =
    make_related_tags_query ~realtime_start:"2024-04-11"
      ~realtime_end:"2024-04-11" ~tag_names:"monetary+aggregates"
      ~exclude_tag_names:"discontinued;currency"
      ~tag_group_id:Models.Tags.Frequency ~search_text:"" ~limit:1 ~offset:1
      ~order_by:Models.Tags.Popularity
      ~sort_order:Models.Sort_order.Ascending ()
  in
  let run = run_related_tags_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]

let%expect_test "tags_series_query" =
  let q =
    make_tags_series_query ~realtime_start:"2024-04-11"
      ~realtime_end:"2024-04-11" ~tag_names:"slovenia;food;oecd"
      ~exclude_tag_names:"" ~limit:1 ~offset:1
      ~order_by:Models.Series.Frequency
      ~sort_order:Models.Sort_order.Ascending ()
  in
  let run = run_tags_series_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]
