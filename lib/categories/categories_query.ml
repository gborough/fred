open Utils

let config = Conf.fred_base_url ()

let categories_path () = config.base_url ^ "category?" ^ config.file_type

let children_path () =
  config.base_url ^ "category/children?" ^ config.file_type

let related_path () =
  config.base_url ^ "category/related?" ^ config.file_type

let series_path () = config.base_url ^ "category/series?" ^ config.file_type

let tags_path () = config.base_url ^ "category/tags?" ^ config.file_type

let related_tags_path () =
  config.base_url ^ "category/related_tags?" ^ config.file_type

let make_categories_query ~category_id =
  let q =
    categories_path () ^ qstr "category_id" @@ string_of_int category_id
  in
  `CatCategories q

let run_categories_query ~query ~api_key =
  let q =
    match query with
    | `CatCategories q -> q ^ api_key
    | _ -> failwith "Wrong categories query type"
  in
  ezcurl_get ~query:q ~f:Categories.categories_of_yojson

let make_children_query ?(realtime_start = "") ?(realtime_end = "")
    ~category_id () =
  let query =
    children_path ()
    ^ qstr "realtime_start" realtime_start
    ^ qstr "realtime_end" realtime_end
    ^ qstr "category_id" @@ string_of_int category_id
  in
  `CatChildren query

let run_children_query ~query ~api_key =
  let q =
    match query with
    | `CatChildren q -> q ^ api_key
    | _ -> failwith "Wrong children query type"
  in
  ezcurl_get ~query:q ~f:Categories.categories_of_yojson

let make_related_query ?(realtime_start = "") ?(realtime_end = "")
    ~category_id () =
  let query =
    related_path ()
    ^ qstr "realtime_start" realtime_start
    ^ qstr "realtime_end" realtime_end
    ^ qstr "category_id" @@ string_of_int category_id
  in
  `CatRelated query

let run_related_query ~query ~api_key =
  let q =
    match query with
    | `CatRelated q -> q ^ api_key
    | _ -> failwith "Wrong related query type"
  in
  ezcurl_get ~query:q ~f:Categories.categories_of_yojson

let make_series_query ?(realtime_start = "") ?(realtime_end = "")
    ?(limit = 1000) ?(offset = 0) ?(order_by = Models.Series.SeriesId)
    ?(sort_order = Models.Sort_order.Ascending)
    ?(filter_variable = Models.Series.Default) ?(filter_value = "")
    ?(tag_names = "") ?(exclude_tag_names = "") ~category_id () =
  let query =
    series_path ()
    ^ qstr "realtime_start" realtime_start
    ^ qstr "realtime_end" realtime_end
    ^ qstr "limit" @@ limit_q limit ^ qstr "offset" @@ offset_q offset
    ^ Series.order_by_to_string order_by
    ^ Sort_order.sort_order_to_string sort_order
    ^ Series.filter_variable_to_string filter_variable
    ^ qstr "filter_value" filter_value
    ^ qstr "tag_names" tag_names
    ^ qstr "exclude_tag_names" exclude_tag_names
    ^ qstr "category_id" @@ string_of_int category_id
  in
  `CatSeries query

let run_series_query ~query ~api_key =
  let q =
    match query with
    | `CatSeries q -> q ^ api_key
    | _ -> failwith "Wrong series query type"
  in
  ezcurl_get ~query:q ~f:Series.seriess_of_yojson

let make_tags_query ?(realtime_start = "") ?(realtime_end = "")
    ?(tag_names = "") ?(tag_group_id = Models.Tags.Default)
    ?(search_text = "") ?(limit = 1000) ?(offset = 0)
    ?(order_by = Models.Tags.SeriesCount)
    ?(sort_order = Models.Sort_order.Ascending) ~category_id () =
  let query =
    tags_path ()
    ^ qstr "realtime_start" realtime_start
    ^ qstr "realtime_end" realtime_end
    ^ qstr "tag_names" tag_names
    ^ Tags.tag_group_id_to_string tag_group_id
    ^ qstr "search_text" search_text
    ^ qstr "limit" @@ limit_q limit ^ qstr "offset" @@ offset_q offset
    ^ Tags.order_by_to_string order_by
    ^ Sort_order.sort_order_to_string sort_order
    ^ qstr "category_id" @@ string_of_int category_id
  in
  `CatTags query

let run_tags_query ~query ~api_key =
  let q =
    match query with
    | `CatTags q -> q ^ api_key
    | _ -> failwith "Wrong tags query type"
  in
  ezcurl_get ~query:q ~f:Tags.tags_of_yojson

let make_related_tags_query ?(realtime_start = "") ?(realtime_end = "")
    ?(exclude_tag_names = "") ?(tag_group_id = Models.Tags.Default)
    ?(search_text = "") ?(limit = 1000) ?(offset = 0)
    ?(order_by = Models.Tags.SeriesCount)
    ?(sort_order = Models.Sort_order.Ascending) ~tag_names ~category_id () =
  let query =
    related_tags_path ()
    ^ qstr "realtime_start" realtime_start
    ^ qstr "realtime_end" realtime_end
    ^ qstr "exclude_tag_names" exclude_tag_names
    ^ Tags.tag_group_id_to_string tag_group_id
    ^ qstr "search_text" search_text
    ^ qstr "limit" @@ limit_q limit ^ qstr "offset" @@ offset_q offset
    ^ Tags.order_by_to_string order_by
    ^ Sort_order.sort_order_to_string sort_order
    ^ qstr "tag_names" tag_names
    ^ qstr "category_id" @@ string_of_int category_id
  in
  `CatRelatedTags query

let run_related_tags_query ~query ~api_key =
  let q =
    match query with
    | `CatRelatedTags q -> q ^ api_key
    | _ -> failwith "Wrong related tags query type"
  in
  ezcurl_get ~query:q ~f:Tags.tags_of_yojson
