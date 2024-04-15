type maps_series_data = {meta: meta} [@@deriving of_yojson, show]

and meta =
  { title: string
  ; region: string
  ; seasonality: string
  ; units: string
  ; frequency: string
  ; date: string option [@default None]
  ; data: Yojson.Safe.t }
[@@deriving of_yojson, show]
