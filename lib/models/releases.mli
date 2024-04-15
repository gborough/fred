(** Container for releases dates data *)
type releases =
  { realtime_start: string
  ; realtime_end: string
  ; order_by: string option [@default None]
  ; sort_order: string option [@default None]
  ; count: int option [@default None]
  ; offset: int option [@default None]
  ; limit: int option [@default None]
  ; releases: release list }
[@@deriving of_yojson, show]

and release =
  { id: int
  ; release_realtime_start: string [@key "realtime_start"]
  ; release_realtime_end: string [@key "realtime_end"]
  ; name: string
  ; press_release: bool
  ; link: string
  ; notes: string option [@default None] }
[@@deriving of_yojson, show]

(** Release's order by options *)
type order_by =
  | ReleaseId
  | Name
  | PressRelease
  | RealtimeStart
  | RealtimeEnd

val order_by_to_string : order_by -> string
