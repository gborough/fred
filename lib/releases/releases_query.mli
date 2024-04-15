val make_releases_query :
     ?realtime_start:string
  -> ?realtime_end:string
  -> ?limit:int
  -> ?offset:int
  -> ?order_by:Models.Releases.order_by
  -> ?sort_order:Models.Sort_order.sort_order
  -> unit
  -> [`RelReleases of string]
(** Make releases query string in the `releases?` path *)

val run_releases_query :
     query:[`RelReleases of string]
  -> api_key:string
  -> (Releases.releases, Api_error.api_error) result Lwt.t
(** Run releases query in the `releases?` path *)

val make_releases_dates_query :
     ?realtime_start:string
  -> ?realtime_end:string
  -> ?limit:int
  -> ?offset:int
  -> ?order_by:Models.Release_dates.order_by
  -> ?sort_order:Models.Sort_order.sort_order
  -> ?include_release_dates_with_no_data:string
  -> unit
  -> [`RelReleasesDates of string]
(** Make releases query string in the `releases/dates?` path *)

val run_releases_dates_query :
     query:[`RelReleasesDates of string]
  -> api_key:string
  -> (Release_dates.release_dates, Api_error.api_error) result Lwt.t
(** Run releases query in the `releases/dates?` path *)

val make_release_query :
     ?realtime_start:string
  -> ?realtime_end:string
  -> release_id:int
  -> unit
  -> [`RelRelease of string]
(** Make releases query string in the `release?` path *)

val run_release_query :
     query:[`RelRelease of string]
  -> api_key:string
  -> (Releases.releases, Api_error.api_error) result Lwt.t
(** Run releases query in the `release?` path *)

val make_release_dates_query :
     ?realtime_start:string
  -> ?realtime_end:string
  -> ?limit:int
  -> ?offset:int
  -> ?sort_order:Models.Sort_order.sort_order
  -> ?include_release_dates_with_no_data:string
  -> release_id:int
  -> unit
  -> [`RelReleaseDates of string]
(** Make releases query string in the `release/dates?` path *)

val run_release_dates_query :
     query:[`RelReleaseDates of string]
  -> api_key:string
  -> (Release_dates.release_dates, Api_error.api_error) result Lwt.t
(** Run releases query in the `release/dates?` path *)

val make_release_series_query :
     ?realtime_start:string
  -> ?realtime_end:string
  -> ?limit:int
  -> ?offset:int
  -> ?order_by:Models.Series.order_by
  -> ?sort_order:Models.Sort_order.sort_order
  -> ?filter_variable:Series.filter_variable
  -> ?filter_value:string
  -> ?tag_names:string
  -> ?exclude_tag_names:string
  -> release_id:int
  -> unit
  -> [`RelReleaseSeries of string]
(** Make releases query string in the `release/series?` path *)

val run_release_series_query :
     query:[`RelReleaseSeries of string]
  -> api_key:string
  -> (Series.seriess, Api_error.api_error) result Lwt.t
(** Run releases query in the `release/series?` path *)

val make_release_sources_query :
     ?realtime_start:string
  -> ?realtime_end:string
  -> release_id:int
  -> unit
  -> [`RelReleaseSource of string]
(** Make releases query string in the `sources?` path *)

val run_release_sources_query :
     query:[`RelReleaseSource of string]
  -> api_key:string
  -> (Sources.sources, Api_error.api_error) result Lwt.t
(** Run releases query in the `sources?` path *)

val make_release_tags_query :
     ?realtime_start:string
  -> ?realtime_end:string
  -> ?tag_names:string
  -> ?tag_group_id:Models.Tags.tag_group_id
  -> ?search_text:string
  -> ?limit:int
  -> ?offset:int
  -> ?order_by:Models.Tags.order_by
  -> ?sort_order:Models.Sort_order.sort_order
  -> release_id:int
  -> unit
  -> [`RelReleaseTags of string]
(** Make releases query string in the `release/tags?` path *)

val run_release_tags_query :
     query:[`RelReleaseTags of string]
  -> api_key:string
  -> (Tags.tags, Api_error.api_error) result Lwt.t
(** Run releases query in the `release/tags?` path *)

val make_release_related_tags_query :
     ?realtime_start:string
  -> ?realtime_end:string
  -> ?tag_names:string
  -> ?exclude_tag_names:string
  -> ?tag_group_id:Models.Tags.tag_group_id
  -> ?search_text:string
  -> ?limit:int
  -> ?offset:int
  -> ?order_by:Models.Tags.order_by
  -> ?sort_order:Models.Sort_order.sort_order
  -> release_id:int
  -> unit
  -> [`RelReleaseRelatedTags of string]
(** Make releases query string in the `release/related_tags?` path *)

val run_release_related_tags_query :
     query:[`RelReleaseRelatedTags of string]
  -> api_key:string
  -> (Tags.tags, Api_error.api_error) result Lwt.t
(** Run releases query in the `release/related_tags?` path *)

val make_release_tables_query :
     ?element_id:int
  -> ?include_observation_values:string
  -> ?observation_date:string
  -> release_id:int
  -> unit
  -> [`RelReleaseTables of string]
(** Make releases query string in the `release/tables?` path *)

val run_release_tables_query :
     query:[`RelReleaseTables of string]
  -> api_key:string
  -> (Tables.tables, Api_error.api_error) result Lwt.t
(** Run releases query in the `release/tables?` path *)
