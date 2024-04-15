val make_series_query :
     ?realtime_start:string
  -> ?realtime_end:string
  -> series_id:string
  -> unit
  -> [`SerSeries of string]
(** Make series query string in the `series?` path *)

val run_series_query :
     query:[`SerSeries of string]
  -> api_key:string
  -> (Series.seriess, Api_error.api_error) result Lwt.t
(** Run series query in the `series?` path *)

val make_series_categories_query :
     ?realtime_start:string
  -> ?realtime_end:string
  -> series_id:string
  -> unit
  -> [`SerSeriesCategories of string]
(** Make series query string in the `categories?` path *)

val run_series_categories_query :
     query:[`SerSeriesCategories of string]
  -> api_key:string
  -> (Categories.categories, Api_error.api_error) result Lwt.t
(** Run series query in the `categories?` path *)

val make_series_observations_query :
     ?realtime_start:string
  -> ?realtime_end:string
  -> ?limit:int
  -> ?offset:int
  -> ?sort_order:Models.Sort_order.sort_order
  -> ?observation_start:string
  -> ?observation_end:string
  -> ?units:Models.Observations.units
  -> ?frequency:Models.Observations.frequency
  -> ?aggregation_method:Models.Observations.aggregation_method
  -> ?output_type:Models.Observations.output_type
  -> ?vintage_dates:string
  -> series_id:string
  -> unit
  -> [`SerSeriesObservations of string]
(** Make series query string in the `observations?` path *)

val run_series_observations_query :
     query:[`SerSeriesObservations of string]
  -> api_key:string
  -> (Observations.observations, Api_error.api_error) result Lwt.t
(** Run series query in the `observations?` path *)

val make_series_release_query :
     ?realtime_start:string
  -> ?realtime_end:string
  -> series_id:string
  -> unit
  -> [`SerSeriesRelease of string]
(** Make series query string in the `release?` path *)

val run_series_release_query :
     query:[`SerSeriesRelease of string]
  -> api_key:string
  -> (Releases.releases, Api_error.api_error) result Lwt.t
(** Run series query in the `release?` path *)

val make_series_search_query :
     ?search_type:Search.search_type
  -> ?realtime_start:string
  -> ?realtime_end:string
  -> ?limit:int
  -> ?offset:int
  -> ?order_by:Models.Search.order_by
  -> ?sort_order:Models.Sort_order.sort_order
  -> ?filter_variable:Models.Series.filter_variable
  -> ?filter_value:string
  -> ?tag_names:string
  -> ?exclude_tag_names:string
  -> search_text:string
  -> unit
  -> [`SerSeriesSearch of string]
(** Make series query string in the `search?` path *)

val run_series_search_query :
     query:[`SerSeriesSearch of string]
  -> api_key:string
  -> (Series.seriess, Api_error.api_error) result Lwt.t
(** Run series query in the `search?` path *)

val make_series_search_tags_query :
     ?realtime_start:string
  -> ?realtime_end:string
  -> ?tag_names:string
  -> ?tag_group_id:Models.Tags.tag_group_id
  -> ?tag_search_text:string
  -> ?limit:int
  -> ?offset:int
  -> ?order_by:Models.Tags.order_by
  -> ?sort_order:Models.Sort_order.sort_order
  -> series_search_text:string
  -> unit
  -> [`SerSeriesSearchTags of string]
(** Make series query string in the `search/tags?` path *)

val run_series_search_tags_query :
     query:[`SerSeriesSearchTags of string]
  -> api_key:string
  -> (Tags.tags, Api_error.api_error) result Lwt.t
(** Run series query in the `search/tags?` path *)

val make_series_search_related_tags_query :
     ?realtime_start:string
  -> ?realtime_end:string
  -> ?tag_names:string
  -> ?exclude_tag_names:string
  -> ?tag_group_id:Models.Tags.tag_group_id
  -> ?tag_search_text:string
  -> ?limit:int
  -> ?offset:int
  -> ?order_by:Models.Tags.order_by
  -> ?sort_order:Models.Sort_order.sort_order
  -> series_search_text:string
  -> unit
  -> [`SerSeriesSearchRelatedTags of string]
(** Make series query string in the `related_tags?` path *)

val run_series_search_related_tags_query :
     query:[`SerSeriesSearchRelatedTags of string]
  -> api_key:string
  -> (Tags.tags, Api_error.api_error) result Lwt.t
(** Run series query in the `related_tags?` path *)

val make_series_tags_query :
     ?realtime_start:string
  -> ?realtime_end:string
  -> ?order_by:Models.Tags.order_by
  -> ?sort_order:Models.Sort_order.sort_order
  -> series_id:string
  -> unit
  -> [`SerSeriesTags of string]
(** Make series query string in the `tags?` path *)

val run_series_tags_query :
     query:[`SerSeriesTags of string]
  -> api_key:string
  -> (Tags.tags, Api_error.api_error) result Lwt.t
(** Run series query in the `tags?` path *)

val make_series_updates_query :
     ?realtime_start:string
  -> ?realtime_end:string
  -> ?limit:int
  -> ?offset:int
  -> ?filter_value:Models.Filter.filter_value
  -> ?start_time:string
  -> ?end_time:string
  -> unit
  -> [`SerSeriesUpdates of string]
(** Make series query string in the `updates?` path *)

val run_series_updates_query :
     query:[`SerSeriesUpdates of string]
  -> api_key:string
  -> (Series.seriess, Api_error.api_error) result Lwt.t
(** Run series query in the `updates?` path *)

val make_series_vintagedates_query :
     ?realtime_start:string
  -> ?realtime_end:string
  -> ?limit:int
  -> ?offset:int
  -> ?sort_order:Models.Sort_order.sort_order
  -> series_id:string
  -> unit
  -> [`SerSeriesVintageDates of string]
(** Make series query string in the `vintagedates?` path *)

val run_series_vintagedates_query :
     query:[`SerSeriesVintageDates of string]
  -> api_key:string
  -> (Vintage_dates.vintage_dates, Api_error.api_error) result Lwt.t
(** Run series query in the `vintagedates?` path *)
