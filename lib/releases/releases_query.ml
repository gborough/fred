open Utils

let config = Conf.fred_base_url ()

let releases_path () = config.base_url ^ "releases?" ^ config.file_type

let releases_date_path () =
  config.base_url ^ "releases/dates?" ^ config.file_type

let release_path () = config.base_url ^ "release?" ^ config.file_type

let release_dates_path () =
  config.base_url ^ "release/dates?" ^ config.file_type

let release_series_path () =
  config.base_url ^ "release/series?" ^ config.file_type

let release_sources_path () =
  config.base_url ^ "release/sources?" ^ config.file_type

let release_tags_path () =
  config.base_url ^ "release/tags?" ^ config.file_type

let release_related_tags_path () =
  config.base_url ^ "release/related_tags?" ^ config.file_type

let release_tables_path () =
  config.base_url ^ "release/tables?" ^ config.file_type

let make_releases_query ?(realtime_start = "") ?(realtime_end = "")
    ?(limit = 1000) ?(offset = 0) ?(order_by = Models.Releases.ReleaseId)
    ?(sort_order = Models.Sort_order.Ascending) () =
  let q =
    releases_path ()
    ^ qstr "realtime_start" realtime_start
    ^ qstr "realtime_end" realtime_end
    ^ qstr "limit" @@ limit_q limit ^ qstr "offset" @@ offset_q offset
    ^ Releases.order_by_to_string order_by
    ^ Sort_order.sort_order_to_string sort_order
  in
  `RelReleases q

let run_releases_query ~query ~api_key =
  let q =
    match query with
    | `RelReleases q -> q ^ api_key
    | _ -> failwith "Wrong releases query type"
  in
  ezcurl_get ~query:q ~f:Releases.releases_of_yojson

let make_releases_dates_query ?(realtime_start = "")
    ?(realtime_end = "9999-12-31") ?(limit = 1000) ?(offset = 0)
    ?(order_by = Models.Release_dates.ReleaseDate)
    ?(sort_order = Models.Sort_order.Ascending)
    ?(include_release_dates_with_no_data = "false") () =
  let q =
    releases_date_path ()
    ^ qstr "realtime_start" realtime_start
    ^ qstr "realtime_end" realtime_end
    ^ qstr "limit" @@ limit_q limit ^ qstr "offset" @@ offset_q offset
    ^ Release_dates.order_by_to_string order_by
    ^ Sort_order.sort_order_to_string sort_order
    ^ qstr "include_release_dates_with_no_data"
        include_release_dates_with_no_data
  in
  `RelReleasesDates q

let run_releases_dates_query ~query ~api_key =
  let q =
    match query with
    | `RelReleasesDates q -> q ^ api_key
    | _ -> failwith "Wrong releases dates query type"
  in
  ezcurl_get ~query:q ~f:Release_dates.release_dates_of_yojson

let make_release_query ?(realtime_start = "") ?(realtime_end = "")
    ~release_id () =
  let q =
    release_path ()
    ^ qstr "realtime_start" realtime_start
    ^ qstr "realtime_end" realtime_end
    ^ qstr "release_id" @@ string_of_int release_id
  in
  `RelRelease q

let run_release_query ~query ~api_key =
  let q =
    match query with
    | `RelRelease q -> q ^ api_key
    | _ -> failwith "Wrong release query type"
  in
  ezcurl_get ~query:q ~f:Releases.releases_of_yojson

let make_release_dates_query ?(realtime_start = "1776-07-04")
    ?(realtime_end = "9999-12-31") ?(limit = 10000) ?(offset = 0)
    ?(sort_order = Models.Sort_order.Ascending)
    ?(include_release_dates_with_no_data = "false") ~release_id () =
  let q =
    release_dates_path ()
    ^ qstr "realtime_start" realtime_start
    ^ qstr "realtime_end" realtime_end
    ^ qstr "limit" @@ limit_release_dates limit ^ qstr "offset"
    @@ offset_q offset
    ^ Sort_order.sort_order_to_string sort_order
    ^ qstr "include_release_dates_with_no_data"
        include_release_dates_with_no_data
    ^ qstr "release_id" @@ string_of_int release_id
  in
  `RelReleaseDates q

let run_release_dates_query ~query ~api_key =
  let q =
    match query with
    | `RelReleaseDates q -> q ^ api_key
    | _ -> failwith "Wrong release dates query type"
  in
  ezcurl_get ~query:q ~f:Release_dates.release_dates_of_yojson

let make_release_series_query ?(realtime_start = "") ?(realtime_end = "")
    ?(limit = 1000) ?(offset = 0) ?(order_by = Models.Series.SeriesId)
    ?(sort_order = Models.Sort_order.Ascending)
    ?(filter_variable = Models.Series.Default) ?(filter_value = "")
    ?(tag_names = "") ?(exclude_tag_names = "") ~release_id () =
  let q =
    release_series_path ()
    ^ qstr "realtime_start" realtime_start
    ^ qstr "realtime_end" realtime_end
    ^ qstr "limit" @@ limit_q limit ^ qstr "offset" @@ offset_q offset
    ^ Series.order_by_to_string order_by
    ^ Sort_order.sort_order_to_string sort_order
    ^ Series.filter_variable_to_string filter_variable
    ^ qstr "filter_value" filter_value
    ^ qstr "tag_names" tag_names
    ^ qstr "exclude_tag_names" exclude_tag_names
    ^ qstr "release_id" @@ string_of_int release_id
  in
  `RelReleaseSeries q

let run_release_series_query ~query ~api_key =
  let q =
    match query with
    | `RelReleaseSeries q -> q ^ api_key
    | _ -> failwith "Wrong release series query type"
  in
  ezcurl_get ~query:q ~f:Series.seriess_of_yojson

let make_release_sources_query ?(realtime_start = "") ?(realtime_end = "")
    ~release_id () =
  let q =
    release_sources_path ()
    ^ qstr "realtime_start" realtime_start
    ^ qstr "realtime_end" realtime_end
    ^ qstr "release_id" @@ string_of_int release_id
  in
  `RelReleaseSource q

let run_release_sources_query ~query ~api_key =
  let q =
    match query with
    | `RelReleaseSource q -> q ^ api_key
    | _ -> failwith "Wrong release source query type"
  in
  ezcurl_get ~query:q ~f:Sources.sources_of_yojson

let make_release_tags_query ?(realtime_start = "") ?(realtime_end = "")
    ?(tag_names = "") ?(tag_group_id = Models.Tags.Default)
    ?(search_text = "") ?(limit = 1000) ?(offset = 0)
    ?(order_by = Models.Tags.SeriesCount)
    ?(sort_order = Models.Sort_order.Ascending) ~release_id () =
  let q =
    release_tags_path ()
    ^ qstr "realtime_start" realtime_start
    ^ qstr "realtime_end" realtime_end
    ^ qstr "tag_names" tag_names
    ^ Tags.tag_group_id_to_string tag_group_id
    ^ qstr "search_text" search_text
    ^ qstr "limit" @@ limit_q limit ^ qstr "offset" @@ offset_q offset
    ^ Tags.order_by_to_string order_by
    ^ Sort_order.sort_order_to_string sort_order
    ^ qstr "release_id" @@ string_of_int release_id
  in
  `RelReleaseTags q

let run_release_tags_query ~query ~api_key =
  let q =
    match query with
    | `RelReleaseTags q -> q ^ api_key
    | _ -> failwith "Wrong release tags query type"
  in
  ezcurl_get ~query:q ~f:Tags.tags_of_yojson

let make_release_related_tags_query ?(realtime_start = "")
    ?(realtime_end = "") ?(tag_names = "") ?(exclude_tag_names = "")
    ?(tag_group_id = Models.Tags.Default) ?(search_text = "") ?(limit = 1000)
    ?(offset = 0) ?(order_by = Models.Tags.SeriesCount)
    ?(sort_order = Models.Sort_order.Ascending) ~release_id () =
  let q =
    release_related_tags_path ()
    ^ qstr "realtime_start" realtime_start
    ^ qstr "realtime_end" realtime_end
    ^ qstr "tag_names" tag_names
    ^ qstr "exclude_tag_names" exclude_tag_names
    ^ Tags.tag_group_id_to_string tag_group_id
    ^ qstr "search_text" search_text
    ^ qstr "limit" @@ limit_q limit ^ qstr "offset" @@ offset_q offset
    ^ Tags.order_by_to_string order_by
    ^ Sort_order.sort_order_to_string sort_order
    ^ qstr "release_id" @@ string_of_int release_id
  in
  `RelReleaseRelatedTags q

let run_release_related_tags_query ~query ~api_key =
  let q =
    match query with
    | `RelReleaseRelatedTags q -> q ^ api_key
    | _ -> failwith "Wrong release related tags query type"
  in
  ezcurl_get ~query:q ~f:Tags.tags_of_yojson

let make_release_tables_query ?(element_id = 0)
    ?(include_observation_values = "false")
    ?(observation_date = "9999-12-31") ~release_id () =
  let q =
    release_tables_path () ^ qstr "element_id" @@ string_of_int element_id
    ^ qstr "include_observation_values" include_observation_values
    ^ qstr "observation_date" observation_date
    ^ qstr "release_id" @@ string_of_int release_id
  in
  `RelReleaseTables q

let run_release_tables_query ~query ~api_key =
  let q =
    match query with
    | `RelReleaseTables q -> q ^ api_key
    | _ -> failwith "Wrong release tables query type"
  in
  ezcurl_get ~query:q ~f:Tables.tables_of_yojson
