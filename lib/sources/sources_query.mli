val make_sources_query :
     ?realtime_start:string
  -> ?realtime_end:string
  -> ?limit:int
  -> ?offset:int
  -> ?order_by:Models.Sources.order_by
  -> ?sort_order:Models.Sort_order.sort_order
  -> unit
  -> [`ScSources of string]
(** Make sources query string in the `sources?` path *)

val run_sources_query :
     query:[`ScSources of string]
  -> api_key:string
  -> (Sources.sources, Api_error.api_error) result Lwt.t
(** Run sources query in the `sources?` path *)

val make_source_query :
     ?realtime_start:string
  -> ?realtime_end:string
  -> source_id:int
  -> unit
  -> [`ScSource of string]
(** Make sources query string in the `source?` path *)

val run_source_query :
     query:[`ScSource of string]
  -> api_key:string
  -> (Sources.sources, Api_error.api_error) result Lwt.t
(** Run sources query in the `source?` path *)

val make_source_releases_query :
     ?realtime_start:string
  -> ?realtime_end:string
  -> ?limit:int
  -> ?offset:int
  -> ?order_by:Models.Releases.order_by
  -> ?sort_order:Models.Sort_order.sort_order
  -> source_id:int
  -> unit
  -> [`ScSourceReleases of string]
(** Make sources query string in the `releases?` path *)

val run_source_releases_query :
     query:[`ScSourceReleases of string]
  -> api_key:string
  -> (Releases.releases, Api_error.api_error) result Lwt.t
(** Run sources query in the `releases?` path *)
