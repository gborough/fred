open Utils

let config = Conf.fred_base_url ()

let tags_path () = config.base_url ^ "tags?" ^ config.file_type

let related_tags_path () =
  config.base_url ^ "related_tags?" ^ config.file_type

let tags_series_path () = config.base_url ^ "tags/series?" ^ config.file_type

let make_tags_query ?(realtime_start = "") ?(realtime_end = "")
    ?(tag_names = "") ?(tag_group_id = Models.Tags.Default)
    ?(search_text = "") ?(limit = 1000) ?(offset = 0)
    ?(order_by = Models.Tags.SeriesCount)
    ?(sort_order = Models.Sort_order.Ascending) () =
  let q =
    tags_path ()
    ^ qstr "realtime_start" realtime_start
    ^ qstr "realtime_end" realtime_end
    ^ qstr "tag_names" tag_names
    ^ Tags.tag_group_id_to_string tag_group_id
    ^ qstr "search_text" search_text
    ^ qstr "limit" @@ limit_q limit ^ qstr "offset" @@ offset_q offset
    ^ Tags.order_by_to_string order_by
    ^ Sort_order.sort_order_to_string sort_order
  in
  `TgTags q

let run_tags_query ~query ~api_key =
  let q =
    match query with
    | `TgTags q -> q ^ api_key
    | _ -> failwith "Wrong tags query type"
  in
  ezcurl_get ~query:q ~f:Tags.tags_of_yojson

let make_related_tags_query ?(realtime_start = "") ?(realtime_end = "")
    ?(tag_names = "") ?(exclude_tag_names = "")
    ?(tag_group_id = Models.Tags.Default) ?(search_text = "") ?(limit = 1000)
    ?(offset = 0) ?(order_by = Models.Tags.SeriesCount)
    ?(sort_order = Models.Sort_order.Ascending) () =
  let q =
    related_tags_path ()
    ^ qstr "realtime_start" realtime_start
    ^ qstr "realtime_end" realtime_end
    ^ qstr "tag_names" tag_names
    ^ qstr "exclude_tag_names" exclude_tag_names
    ^ Tags.tag_group_id_to_string tag_group_id
    ^ qstr "search_text" search_text
    ^ qstr "limit" @@ limit_q limit ^ qstr "offset" @@ offset_q offset
    ^ Tags.order_by_to_string order_by
    ^ Sort_order.sort_order_to_string sort_order
  in
  `TgRelatedTags q

let run_related_tags_query ~query ~api_key =
  let q =
    match query with
    | `TgRelatedTags q -> q ^ api_key
    | _ -> failwith "Wrong related tags query type"
  in
  ezcurl_get ~query:q ~f:Tags.tags_of_yojson

let make_tags_series_query ?(realtime_start = "") ?(realtime_end = "")
    ?(tag_names = "") ?(exclude_tag_names = "") ?(limit = 1000) ?(offset = 0)
    ?(order_by = Models.Series.SeriesId)
    ?(sort_order = Models.Sort_order.Ascending) () =
  let q =
    tags_series_path ()
    ^ qstr "realtime_start" realtime_start
    ^ qstr "realtime_end" realtime_end
    ^ qstr "tag_names" tag_names
    ^ qstr "exclude_tag_names" exclude_tag_names
    ^ qstr "limit" @@ limit_q limit ^ qstr "offset" @@ offset_q offset
    ^ Series.order_by_to_string order_by
    ^ Sort_order.sort_order_to_string sort_order
  in
  `TgTagsSeries q

let run_tags_series_query ~query ~api_key =
  let q =
    match query with
    | `TgTagsSeries q -> q ^ api_key
    | _ -> failwith "Wrong tags series query type"
  in
  ezcurl_get ~query:q ~f:Series.seriess_of_yojson
