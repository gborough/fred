type maps_series_group = {series_group: series_group}
[@@deriving of_yojson, show]

and series_group =
  { title: string
  ; region_type: string
  ; series_group_: string [@key "series_group"]
  ; season: string
  ; units: string
  ; frequency: string
  ; min_date: string
  ; max_date: string }
[@@deriving of_yojson, show]
