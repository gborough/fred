open Fred
open Fred.Series_query

let api_key = Conf.api_key_of_string "a3747eb09812f551b745ebb916604020"
(* Don't worry, it's just a harmless test key *)

let%expect_test "series_query" =
  let q =
    make_series_query ~realtime_start:"2024-04-11" ~realtime_end:"2024-04-11"
      ~series_id:"GNPCA" ()
  in
  let run = run_series_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]

let%expect_test "series_categories_query" =
  let q =
    make_series_categories_query ~realtime_start:"2024-04-11"
      ~realtime_end:"2024-04-11" ~series_id:"EXJPUS" ()
  in
  let run = run_series_categories_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]

let%expect_test "series_observations_query" =
  let q =
    make_series_observations_query ~realtime_start:"2013-08-14"
      ~realtime_end:"2013-08-14" ~observation_start:"1776-07-05"
      ~observation_end:"9999-12-11" ~units:Models.Observations.Change
      ~frequency:Models.Observations.Annual
      ~aggregation_method:Models.Observations.Sum
      ~output_type:Models.Observations.ObservationsByRealTimePeriod ~limit:1
      ~offset:1 ~vintage_dates:"" ~series_id:"GNPCA" ()
  in
  let run = run_series_observations_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]

let%expect_test "series_release_query" =
  let q =
    make_series_release_query ~realtime_start:"2024-04-11"
      ~realtime_end:"2024-04-11" ~series_id:"IRA" ()
  in
  let run = run_series_release_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]

let%expect_test "series_search_query" =
  let q =
    make_series_search_query ~search_type:Models.Search.FullText
      ~realtime_start:"2017-08-01" ~realtime_end:"2017-08-01" ~limit:1
      ~offset:1 ~filter_variable:Models.Series.Frequency
      ~filter_value:"Monthly" ~tag_names:"usa;m2"
      ~exclude_tag_names:"discontinued;m1"
      ~search_text:"monetary+service+index" ()
  in
  let run = run_series_search_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]

let%expect_test "series_search_tags_query" =
  let q =
    make_series_search_tags_query ~realtime_start:"2013-08-14"
      ~realtime_end:"2013-08-14" ~limit:1 ~offset:1
      ~tag_group_id:Models.Tags.Default ~order_by:Models.Tags.SeriesCount
      ~tag_search_text:"" ~sort_order:Models.Sort_order.Ascending
      ~tag_names:"m1;m2" ~series_search_text:"monetary+service+index" ()
  in
  let run = run_series_search_tags_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]

let%expect_test "series_search_related_tags_query" =
  let q =
    make_series_search_related_tags_query ~realtime_start:"2013-08-14"
      ~realtime_end:"2013-08-14" ~limit:1 ~offset:1
      ~tag_group_id:Models.Tags.Default ~order_by:Models.Tags.Popularity
      ~tag_search_text:"" ~sort_order:Models.Sort_order.Ascending
      ~tag_names:"30-year;frb" ~exclude_tag_names:""
      ~series_search_text:"mortgage+rate" ()
  in
  let run = run_series_search_related_tags_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]

let%expect_test "series_tags_query" =
  let q =
    make_series_tags_query ~realtime_start:"2013-08-14"
      ~realtime_end:"2013-08-14" ~order_by:Models.Tags.Popularity
      ~sort_order:Models.Sort_order.Ascending ~series_id:"STLFSI" ()
  in
  let run = run_series_tags_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]

let%expect_test "series_updates_query" =
  let q =
    make_series_updates_query ~realtime_start:"2024-04-11"
      ~realtime_end:"2024-04-11" ~limit:1 ~offset:1
      ~filter_value:Models.Filter.All ~start_time:"202404020420"
      ~end_time:"202404021420" ()
  in
  let run = run_series_updates_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]

let%expect_test "series_vintagedates_query" =
  let q =
    make_series_vintagedates_query ~realtime_start:"1776-07-05"
      ~realtime_end:"2024-04-11" ~limit:1 ~offset:1
      ~sort_order:Models.Sort_order.Ascending ~series_id:"GNPCA" ()
  in
  let run = run_series_vintagedates_query ~query:q ~api_key in
  let res = get_result run in
  let o = if Result.is_ok res then "t" else "f" in
  print_endline o ; [%expect {| t |}]
