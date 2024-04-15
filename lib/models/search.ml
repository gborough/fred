type search_type = FullText | SeriesId

let search_type_to_string = function
  | FullText -> "&search_type=full_text"
  | SeriesId -> "&search_type=series_id"

type order_by =
  | SearchRank
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
  | SearchRank -> "&order_by=search_rank"
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
