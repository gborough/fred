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

type order_by = SeriesCount | Popularity | Created | Name | GroupId

let order_by_to_string = function
  | SeriesCount -> "&order_by=series_count"
  | Popularity -> "&order_by=popularity"
  | Created -> "&order_by=created"
  | Name -> "&order_by=name"
  | GroupId -> "&order_by=group_id"

type tag_group_id =
  | Default
  | Frequency
  | GeneralOrConcept
  | Geography
  | GeographyType
  | Release
  | SeasonalAdjustment
  | Source

let tag_group_id_to_string = function
  | Default -> ""
  | Frequency -> "&tag_group_id=freq"
  | GeneralOrConcept -> "&tag_group_id=gen"
  | Geography -> "&tag_group_id=geo"
  | GeographyType -> "&tag_group_id=geot"
  | Release -> "&tag_group_id=rls"
  | SeasonalAdjustment -> "&tag_group_id=seas"
  | Source -> "&tag_group_id=src"
