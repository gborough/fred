(** Container for tags data *)
type tags =
  { realtime_start: string
  ; realtime_end: string
  ; order_by: string
  ; sort_order: string
  ; count: int
  ; offset: int
  ; limit: int
  ; tags: tag list }
[@@deriving of_yojson, show]

and tag =
  { name: string
  ; group_id: string
  ; notes: string option [@default None]
  ; created: string
  ; popularity: int
  ; series_count: int }
[@@deriving of_yojson, show]

(** Tags' order by options *)
type order_by = SeriesCount | Popularity | Created | Name | GroupId

(** Tags' order tag group id options *)
type tag_group_id =
  | Default
  | Frequency
  | GeneralOrConcept
  | Geography
  | GeographyType
  | Release
  | SeasonalAdjustment
  | Source

val order_by_to_string : order_by -> string

val tag_group_id_to_string : tag_group_id -> string
