(** Container for sources data *)
type sources =
  { realtime_start: string
  ; realtime_end: string
  ; order_by: string option [@default None]
  ; sort_order: string option [@default None]
  ; count: int option [@default None]
  ; offset: int option [@default None]
  ; limit: int option [@default None]
  ; sources: source list }
[@@deriving of_yojson, show]

and source =
  { id: int
  ; realtime_start_: string [@key "realtime_start"]
  ; realtime_end_: string [@key "realtime_end"]
  ; name: string
  ; link: string option [@default None] }
[@@deriving of_yojson, show]

(** Sources' order by options *)
type order_by = SourceID | Name | RealtimeStart | RealtimeEnd

val order_by_to_string : order_by -> string
