open Utils

let config = Conf.fred_base_url ()

let sources_path () = config.base_url ^ "sources?" ^ config.file_type

let source_path () = config.base_url ^ "source?" ^ config.file_type

let source_releases_path () =
  config.base_url ^ "source/releases?" ^ config.file_type

let make_sources_query ?(realtime_start = "") ?(realtime_end = "")
    ?(limit = 1000) ?(offset = 0) ?(order_by = Models.Sources.SourceID)
    ?(sort_order = Models.Sort_order.Ascending) () =
  let q =
    sources_path ()
    ^ qstr "realtime_start" realtime_start
    ^ qstr "realtime_end" realtime_end
    ^ qstr "limit" @@ limit_q limit ^ qstr "offset" @@ offset_q offset
    ^ Sources.order_by_to_string order_by
    ^ Sort_order.sort_order_to_string sort_order
  in
  `ScSources q

let run_sources_query ~query ~api_key =
  let q =
    match query with
    | `ScSources q -> q ^ api_key
    | _ -> failwith "Wrong sources query type"
  in
  ezcurl_get ~query:q ~f:Sources.sources_of_yojson

let make_source_query ?(realtime_start = "") ?(realtime_end = "") ~source_id
    () =
  let q =
    source_path ()
    ^ qstr "realtime_start" realtime_start
    ^ qstr "realtime_end" realtime_end
    ^ qstr "source_id" @@ string_of_int source_id
  in
  `ScSource q

let run_source_query ~query ~api_key =
  let q =
    match query with
    | `ScSource q -> q ^ api_key
    | _ -> failwith "Wrong source query type"
  in
  ezcurl_get ~query:q ~f:Sources.sources_of_yojson

let make_source_releases_query ?(realtime_start = "") ?(realtime_end = "")
    ?(limit = 1000) ?(offset = 0) ?(order_by = Models.Releases.ReleaseId)
    ?(sort_order = Models.Sort_order.Ascending) ~source_id () =
  let q =
    source_releases_path ()
    ^ qstr "realtime_start" realtime_start
    ^ qstr "realtime_end" realtime_end
    ^ qstr "limit" @@ limit_q limit ^ qstr "offset" @@ offset_q offset
    ^ Releases.order_by_to_string order_by
    ^ Sort_order.sort_order_to_string sort_order
    ^ qstr "source_id" @@ string_of_int source_id
  in
  `ScSourceReleases q

let run_source_releases_query ~query ~api_key =
  let q =
    match query with
    | `ScSourceReleases q -> q ^ api_key
    | _ -> failwith "Wrong source releases query type"
  in
  ezcurl_get ~query:q ~f:Releases.releases_of_yojson
