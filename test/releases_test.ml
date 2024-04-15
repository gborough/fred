open Fred
open Fred.Releases_query

let api_key = Conf.api_key_of_string "a3747eb09812f551b745ebb916604020"
(* Don't worry, it's just a harmless test key *)

let%expect_test "releases_query" =
  let q =
    make_releases_query ~realtime_start:"2024-04-11"
      ~realtime_end:"2024-04-11" ~limit:1 ~offset:1
      ~order_by:Models.Releases.Name ~sort_order:Models.Sort_order.Ascending
      ()
  in
  let run = run_releases_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]

let%expect_test "releases_dates_query" =
  let q =
    make_releases_dates_query ~realtime_start:"2024-04-11"
      ~realtime_end:"2024-04-11" ~limit:1 ~offset:1
      ~order_by:Models.Release_dates.ReleaseId
      ~sort_order:Models.Sort_order.Ascending
      ~include_release_dates_with_no_data:"true" ()
  in
  let run = run_releases_dates_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]

let%expect_test "release_query" =
  let q =
    make_release_query ~realtime_start:"2024-04-11"
      ~realtime_end:"2024-04-11" ~release_id:53 ()
  in
  let run = run_release_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]

let%expect_test "release_dates_query" =
  let q =
    make_release_dates_query ~realtime_start:"1776-07-04"
      ~realtime_end:"9999-12-31" ~limit:10000 ~offset:0
      ~sort_order:Models.Sort_order.Ascending
      ~include_release_dates_with_no_data:"true" ~release_id:82 ()
  in
  let run = run_release_dates_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]

let%expect_test "release_series_query" =
  let q =
    make_release_series_query ~realtime_start:"2000-04-11"
      ~realtime_end:"2024-04-11" ~limit:2 ~offset:1
      ~order_by:Models.Series.Frequency
      ~sort_order:Models.Sort_order.Ascending
      ~filter_variable:Models.Series.Frequency ~filter_value:"Monthly"
      ~tag_names:"australia" ~exclude_tag_names:"services" ~release_id:51 ()
  in
  let run = run_release_series_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]

let%expect_test "release_source_query" =
  let q =
    make_release_sources_query ~realtime_start:"2000-04-11"
      ~realtime_end:"2024-04-11" ~release_id:51 ()
  in
  let run = run_release_sources_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]

let%expect_test "release_tags_query" =
  let q =
    make_release_tags_query ~realtime_start:"2000-04-11"
      ~realtime_end:"2024-04-11" ~tag_names:"" ~limit:2 ~offset:1
      ~tag_group_id:Models.Tags.GeographyType ~search_text:""
      ~sort_order:Models.Sort_order.Ascending
      ~order_by:Models.Tags.Popularity ~release_id:51 ()
  in
  let run = run_release_tags_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]

let%expect_test "release_tags_query" =
  let q =
    make_release_related_tags_query ~realtime_start:"2000-04-11"
      ~realtime_end:"2024-04-11" ~tag_names:"sa;foreign"
      ~exclude_tag_names:"monthly;financial" ~limit:2 ~offset:1
      ~tag_group_id:Models.Tags.Default ~search_text:""
      ~sort_order:Models.Sort_order.Ascending
      ~order_by:Models.Tags.Popularity ~release_id:86 ()
  in
  let run = run_release_related_tags_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]

let%expect_test "release_tables_query" =
  let q =
    make_release_tables_query ~element_id:12886
      ~include_observation_values:"true" ~observation_date:"9999-12-30"
      ~release_id:53 ()
  in
  let run = run_release_tables_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]
