type seriess =
  { realtime_start: string
  ; realtime_end: string
  ; filter_variable: string option [@default None]
  ; filter_value: string option [@default None]
  ; order_by: string option [@default None]
  ; sort_order: string option [@default None]
  ; count: int option [@default None]
  ; offset: int option [@default None]
  ; limit: int option [@default None]
  ; seriess: series list }
[@@deriving of_yojson, show]

and series =
  { id: string
  ; series_realtime_start: string [@key "realtime_start"]
  ; series_realtime_end: string [@key "realtime_end"]
  ; title: string
  ; observation_start: string
  ; observation_end: string
  ; frequency: string
  ; frequency_short: string
  ; units: string
  ; units_short: string
  ; seasonal_adjustment: string
  ; seasonal_adjustment_short: string
  ; last_updated: string
  ; popularity: int
  ; group_popularity: int option [@default None]
  ; notes: string }
[@@deriving of_yojson, show]

type order_by =
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

let order_by_to_string = function
  | SeriesId -> "&order_by=series_id"
  | Title -> "&order_by=title"
  | Units -> "&order_by=units"
  | Frequency -> "&order_by=frequency"
  | SeasonalAdjustment -> "&order_by=seasonal_adjustment"
  | RealtimeStart -> "&order_by=realtime_start"
  | RealtimeEnd -> "&order_by=realtime_end"
  | LastUpdated -> "&order_by=last_updated"
  | ObservationStart -> "&order_by=observation_start"
  | ObservationEnd -> "&order_by=observation_end"
  | Popularity -> "&order_by=popularity"
  | GroupPopularity -> "&order_by=group_popularity"

type filter_variable = Default | Frequency | Units | SeasonalAdjustment

let filter_variable_to_string = function
  | Default -> ""
  | Frequency -> "&filter_variable=frequency"
  | Units -> "&filter_variable=units"
  | SeasonalAdjustment -> "&filter_variable=seasonal_adjustment"
