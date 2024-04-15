(** Search type options *)
type search_type = FullText | SeriesId

(** Search type's order by options *)
type order_by =
  | SearchRank
  | SeriesId
  | Title
  | Units
  | Frequency
  | SeasonalAdjustment
  | RealtimeStart
  | RealtimeEnd
  | LastUpdated
  | ObservationStart
  | ObservationEnd
  | Popularity
  | GroupPopularity

val search_type_to_string : search_type -> string

val order_by_to_string : order_by -> string
