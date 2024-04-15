val make_tags_query :
     ?realtime_start:string
  -> ?realtime_end:string
  -> ?tag_names:string
  -> ?tag_group_id:Models.Tags.tag_group_id
  -> ?search_text:string
  -> ?limit:int
  -> ?offset:int
  -> ?order_by:Models.Tags.order_by
  -> ?sort_order:Models.Sort_order.sort_order
  -> unit
  -> [`TgTags of string]
(** Make tags query string in the `tags?` path *)

val run_tags_query :
     query:[`TgTags of string]
  -> api_key:string
  -> (Tags.tags, Api_error.api_error) result Lwt.t
(** Run tags query in the `tags?` path *)

val make_related_tags_query :
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
  -> unit
  -> [`TgRelatedTags of string]
(** Make tags query string in the `related_tags?` path *)

val run_related_tags_query :
     query:[`TgRelatedTags of string]
  -> api_key:string
  -> (Tags.tags, Api_error.api_error) result Lwt.t
(** Run tags query in the `related_tags?` path *)

val make_tags_series_query :
     ?realtime_start:string
  -> ?realtime_end:string
  -> ?tag_names:string
  -> ?exclude_tag_names:string
  -> ?limit:int
  -> ?offset:int
  -> ?order_by:Models.Series.order_by
  -> ?sort_order:Models.Sort_order.sort_order
  -> unit
  -> [`TgTagsSeries of string]
(** Make tags query string in the `series?` path *)

val run_tags_series_query :
     query:[`TgTagsSeries of string]
  -> api_key:string
  -> (Series.seriess, Api_error.api_error) result Lwt.t
(** Run tags query in the `series?` path *)
