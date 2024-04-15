type release_dates =
  { realtime_start: string
  ; realtime_end: string
  ; order_by: string
  ; sort_order: string
  ; count: int
  ; offset: int
  ; limit: int
  ; release_dates: release_date list }
[@@deriving of_yojson, show]

and release_date =
  { release_id: int
  ; release_name: string option [@default None]
  ; release_last_updated: string option [@default None]
  ; date: string }
[@@deriving of_yojson, show]

type order_by = ReleaseDate | ReleaseId | ReleaseName

let order_by_to_string = function
  | ReleaseDate -> "&order_by=release_date"
  | ReleaseId -> "&order_by=release_id"
  | ReleaseName -> "&order_by=release_name"
