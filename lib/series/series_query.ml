open Utils

let config = Conf.fred_base_url ()

let series_path () = config.base_url ^ "series?" ^ config.file_type

let series_categories_path () =
  config.base_url ^ "series/categories?" ^ config.file_type

let series_observations_path () =
  config.base_url ^ "series/observations?" ^ config.file_type

let series_release_path () =
  config.base_url ^ "series/release?" ^ config.file_type

let series_search_path () =
  config.base_url ^ "series/search?" ^ config.file_type

let series_search_tags_path () =
  config.base_url ^ "series/search/tags?" ^ config.file_type

let series_search_related_tags_path () =
  config.base_url ^ "series/search/related_tags?" ^ config.file_type

let series_tags_path () = config.base_url ^ "series/tags?" ^ config.file_type

let series_updates_path () =
  config.base_url ^ "series/updates?" ^ config.file_type

let series_vintagedates_path () =
  config.base_url ^ "series/vintagedates?" ^ config.file_type

let make_series_query ?(realtime_start = "") ?(realtime_end = "") ~series_id
    () =
  let q =
    series_path ()
    ^ qstr "realtime_start" realtime_start
    ^ qstr "realtime_end" realtime_end
    ^ qstr "series_id" series_id
  in
  `SerSeries q

let run_series_query ~query ~api_key =
  let q =
    match query with
    | `SerSeries q -> q ^ api_key
    | _ -> failwith "Wrong series query type"
  in
  ezcurl_get ~query:q ~f:Series.seriess_of_yojson

let make_series_categories_query ?(realtime_start = "") ?(realtime_end = "")
    ~series_id () =
  let q =
    series_categories_path ()
    ^ qstr "realtime_start" realtime_start
    ^ qstr "realtime_end" realtime_end
    ^ qstr "series_id" series_id
  in
  `SerSeriesCategories q

let run_series_categories_query ~query ~api_key =
  let q =
    match query with
    | `SerSeriesCategories q -> q ^ api_key
    | _ -> failwith "Wrong series categories query type"
  in
  ezcurl_get ~query:q ~f:Categories.categories_of_yojson

let make_series_observations_query ?(realtime_start = "")
    ?(realtime_end = "") ?(limit = 100000) ?(offset = 0)
    ?(sort_order = Models.Sort_order.Ascending)
    ?(observation_start = "1776-07-04") ?(observation_end = "9999-12-31")
    ?(units = Models.Observations.Levels)
    ?(frequency = Models.Observations.Default)
    ?(aggregation_method = Models.Observations.Average)
    ?(output_type = Models.Observations.ObservationsByRealTimePeriod)
    ?(vintage_dates = "") ~series_id () =
  let q =
    series_observations_path ()
    ^ qstr "realtime_start" realtime_start
    ^ qstr "realtime_end" realtime_end
    ^ qstr "limit" @@ limit_series_obs limit ^ qstr "offset"
    @@ offset_q offset
    ^ Sort_order.sort_order_to_string sort_order
    ^ qstr "observation_start" observation_start
    ^ qstr "observation_end" observation_end
    ^ Observations.units_to_string units
    ^ Observations.frequency_to_string frequency
    ^ Observations.aggregation_method_to_string aggregation_method
    ^ Observations.output_type_to_string output_type
    ^ qstr "vintage_dates" vintage_dates
    ^ qstr "series_id" series_id
  in
  `SerSeriesObservations q

let run_series_observations_query ~query ~api_key =
  let q =
    match query with
    | `SerSeriesObservations q -> q ^ api_key
    | _ -> failwith "Wrong series observations query type"
  in
  ezcurl_get ~query:q ~f:Observations.observations_of_yojson

let make_series_release_query ?(realtime_start = "") ?(realtime_end = "")
    ~series_id () =
  let q =
    series_release_path ()
    ^ qstr "realtime_start" realtime_start
    ^ qstr "realtime_end" realtime_end
    ^ qstr "series_id" series_id
  in
  `SerSeriesRelease q

let run_series_release_query ~query ~api_key =
  let q =
    match query with
    | `SerSeriesRelease q -> q ^ api_key
    | _ -> failwith "Wrong series release query type"
  in
  ezcurl_get ~query:q ~f:Releases.releases_of_yojson

let make_series_search_query ?(search_type = Models.Search.FullText)
    ?(realtime_start = "") ?(realtime_end = "") ?(limit = 1000) ?(offset = 0)
    ?order_by ?sort_order ?(filter_variable = Models.Series.Default)
    ?(filter_value = "") ?(tag_names = "") ?(exclude_tag_names = "")
    ~search_text () =
  let q =
    let search_type = Search.search_type_to_string search_type in
    let ob =
      Option.fold ~none:""
        ~some:(fun order_by ->
          match search_type with
          | "full_text" -> Search.order_by_to_string Search.SearchRank
          | "series_id" -> Search.order_by_to_string Search.SeriesId
          | _ -> Search.order_by_to_string order_by )
        order_by
    in
    let so =
      Option.fold ~none:""
        ~some:(fun _ ->
          match ob with
          | "search_rank" | "popularity" ->
              Sort_order.sort_order_to_string Sort_order.Descending
          | _ -> Sort_order.sort_order_to_string Sort_order.Ascending )
        sort_order
    in
    series_search_path () ^ search_type
    ^ qstr "realtime_start" realtime_start
    ^ qstr "realtime_end" realtime_end
    ^ qstr "limit" @@ limit_q limit ^ qstr "offset" @@ offset_q offset ^ ob
    ^ so
    ^ Series.filter_variable_to_string filter_variable
    ^ qstr "filter_value" filter_value
    ^ qstr "tag_names" tag_names
    ^ qstr "exclude_tag_names" exclude_tag_names
    ^ qstr "search_text" search_text
  in
  `SerSeriesSearch q

let run_series_search_query ~query ~api_key =
  let q =
    match query with
    | `SerSeriesSearch q -> q ^ api_key
    | _ -> failwith "Wrong series search query type"
  in
  ezcurl_get ~query:q ~f:Series.seriess_of_yojson

let make_series_search_tags_query ?(realtime_start = "") ?(realtime_end = "")
    ?(tag_names = "") ?(tag_group_id = Models.Tags.Default)
    ?(tag_search_text = "") ?(limit = 1000) ?(offset = 0)
    ?(order_by = Models.Tags.SeriesCount)
    ?(sort_order = Models.Sort_order.Ascending) ~series_search_text () =
  let q =
    series_search_tags_path ()
    ^ qstr "realtime_start" realtime_start
    ^ qstr "realtime_end" realtime_end
    ^ qstr "tag_names" tag_names
    ^ Tags.tag_group_id_to_string tag_group_id
    ^ qstr "tag_search_text" tag_search_text
    ^ qstr "limit" @@ limit_q limit ^ qstr "offset" @@ offset_q offset
    ^ Tags.order_by_to_string order_by
    ^ Sort_order.sort_order_to_string sort_order
    ^ qstr "series_search_text" series_search_text
  in
  `SerSeriesSearchTags q

let run_series_search_tags_query ~query ~api_key =
  let q =
    match query with
    | `SerSeriesSearchTags q -> q ^ api_key
    | _ -> failwith "Wrong series search tags query type"
  in
  ezcurl_get ~query:q ~f:Tags.tags_of_yojson

let make_series_search_related_tags_query ?(realtime_start = "")
    ?(realtime_end = "") ?(tag_names = "") ?(exclude_tag_names = "")
    ?(tag_group_id = Models.Tags.Default) ?(tag_search_text = "")
    ?(limit = 1000) ?(offset = 0) ?(order_by = Models.Tags.SeriesCount)
    ?(sort_order = Models.Sort_order.Ascending) ~series_search_text () =
  let q =
    series_search_related_tags_path ()
    ^ qstr "realtime_start" realtime_start
    ^ qstr "realtime_end" realtime_end
    ^ qstr "tag_names" tag_names
    ^ qstr "exclude_tag_names" exclude_tag_names
    ^ Tags.tag_group_id_to_string tag_group_id
    ^ qstr "tag_search_text" tag_search_text
    ^ qstr "limit" @@ limit_q limit ^ qstr "offset" @@ offset_q offset
    ^ Tags.order_by_to_string order_by
    ^ Sort_order.sort_order_to_string sort_order
    ^ qstr "series_search_text" series_search_text
  in
  `SerSeriesSearchRelatedTags q

let run_series_search_related_tags_query ~query ~api_key =
  let q =
    match query with
    | `SerSeriesSearchRelatedTags q -> q ^ api_key
    | _ -> failwith "Wrong series search related tags query type"
  in
  ezcurl_get ~query:q ~f:Tags.tags_of_yojson

let make_series_tags_query ?(realtime_start = "") ?(realtime_end = "")
    ?(order_by = Models.Tags.SeriesCount)
    ?(sort_order = Models.Sort_order.Ascending) ~series_id () =
  let q =
    series_tags_path ()
    ^ qstr "realtime_start" realtime_start
    ^ qstr "realtime_end" realtime_end
    ^ Tags.order_by_to_string order_by
    ^ Sort_order.sort_order_to_string sort_order
    ^ qstr "series_id" series_id
  in
  `SerSeriesTags q

let run_series_tags_query ~query ~api_key =
  let q =
    match query with
    | `SerSeriesTags q -> q ^ api_key
    | _ -> failwith "Wrong series tags query type"
  in
  ezcurl_get ~query:q ~f:Tags.tags_of_yojson

let make_series_updates_query ?(realtime_start = "") ?(realtime_end = "")
    ?(limit = 1000) ?(offset = 0) ?(filter_value = Models.Filter.All)
    ?(start_time = "") ?(end_time = "") () =
  let q =
    series_updates_path ()
    ^ qstr "realtime_start" realtime_start
    ^ qstr "realtime_end" realtime_end
    ^ qstr "limit" @@ limit_q limit ^ qstr "offset" @@ offset_q offset
    ^ Filter.filter_value_to_string filter_value
    ^ qstr "start_time" start_time
    ^ qstr "end_time" end_time
  in
  `SerSeriesUpdates q

let run_series_updates_query ~query ~api_key =
  let q =
    match query with
    | `SerSeriesUpdates q -> q ^ api_key
    | _ -> failwith "Wrong series updates query type"
  in
  ezcurl_get ~query:q ~f:Series.seriess_of_yojson

let make_series_vintagedates_query ?(realtime_start = "1776-07-04")
    ?(realtime_end = "9999-12-31") ?(limit = 10000) ?(offset = 0)
    ?(sort_order = Models.Sort_order.Ascending) ~series_id () =
  let q =
    series_vintagedates_path ()
    ^ qstr "realtime_start" realtime_start
    ^ qstr "realtime_end" realtime_end
    ^ qstr "limit" @@ limit_release_dates limit ^ qstr "offset"
    @@ offset_q offset
    ^ Sort_order.sort_order_to_string sort_order
    ^ qstr "series_id" series_id
  in
  `SerSeriesVintageDates q

let run_series_vintagedates_query ~query ~api_key =
  let q =
    match query with
    | `SerSeriesVintageDates q -> q ^ api_key
    | _ -> failwith "Wrong series vintage dates query type"
  in
  ezcurl_get ~query:q ~f:Vintage_dates.vintage_dates_of_yojson
