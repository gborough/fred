(** Container for release dates data *)
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

(** Release date's order by options *)
type order_by = ReleaseDate | ReleaseId | ReleaseName

val order_by_to_string : order_by -> string
