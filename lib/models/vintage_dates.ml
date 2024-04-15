type vintage_dates =
  { realtime_start: string
  ; realtime_end: string
  ; order_by: string
  ; sort_order: string
  ; count: int
  ; offset: int
  ; limit: int
  ; vintage_dates: string list }
[@@deriving of_yojson, show]
