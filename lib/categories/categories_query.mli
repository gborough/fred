val make_categories_query : category_id:int -> [`CatCategories of string]
(** Make categories query string in the `category?` path *)

val run_categories_query :
     query:[`CatCategories of string]
  -> api_key:string
  -> (Categories.categories, Api_error.api_error) result Lwt.t
(** Run categories query in the `category?` path *)

val make_children_query :
     ?realtime_start:string
  -> ?realtime_end:string
  -> category_id:int
  -> unit
  -> [`CatChildren of string]
(** Make categories query string in the `children?` path *)

val run_children_query :
     query:[`CatChildren of string]
  -> api_key:string
  -> (Categories.categories, Api_error.api_error) result Lwt.t
(** Run categories string in the `children?` path *)

val make_related_query :
     ?realtime_start:string
  -> ?realtime_end:string
  -> category_id:int
  -> unit
  -> [`CatRelated of string]
(** Make categories query string in the `related?` path *)

val run_related_query :
     query:[`CatRelated of string]
  -> api_key:string
  -> (Categories.categories, Api_error.api_error) result Lwt.t
(** Run categories query in the `related?` path *)

val make_series_query :
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
  -> category_id:int
  -> unit
  -> [`CatSeries of string]
(** Make categories query string in the `series?` path *)

val run_series_query :
     query:[`CatSeries of string]
  -> api_key:string
  -> (Series.seriess, Api_error.api_error) result Lwt.t
(** Run categories query in the `series?` path *)

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
  -> category_id:int
  -> unit
  -> [`CatTags of string]
(** Make categories query string in the `tags?` path *)

val run_tags_query :
     query:[`CatTags of string]
  -> api_key:string
  -> (Tags.tags, Api_error.api_error) result Lwt.t
(** Run categories query in the `tags?` path *)

val make_related_tags_query :
     ?realtime_start:string
  -> ?realtime_end:string
  -> ?exclude_tag_names:string
  -> ?tag_group_id:Models.Tags.tag_group_id
  -> ?search_text:string
  -> ?limit:int
  -> ?offset:int
  -> ?order_by:Models.Tags.order_by
  -> ?sort_order:Models.Sort_order.sort_order
  -> tag_names:string
  -> category_id:int
  -> unit
  -> [`CatRelatedTags of string]
(** Make categories query string in the `related_tags?` path *)

val run_related_tags_query :
     query:[`CatRelatedTags of string]
  -> api_key:string
  -> (Tags.tags, Api_error.api_error) result Lwt.t
(** Run categories query in the `related_tags?` path *)
