val make_shape_query : shape:string -> [`MapShapeFile of string]
(** Make maps query string in the `shapes/file?` path *)

val run_shape_query :
     query:[`MapShapeFile of string]
  -> api_key:string
  -> (Maps_shape_file.maps_shape_file, Api_error.api_error) result Lwt.t
(** Run maps query in the `shapes/file?` path *)

val make_series_group_query : series_id:string -> [`MapSeriesGroup of string]
(** Make maps query string in the `series/group?` path *)

val run_series_group_query :
     query:[`MapSeriesGroup of string]
  -> api_key:string
  -> (Maps_series_group.maps_series_group, Api_error.api_error) result Lwt.t
(** Run maps query in the `series/group?` path *)

val make_series_data_query :
     ?date:string
  -> ?start_date:string
  -> series_id:string
  -> unit
  -> [`MapSeriesData of string]
(** Make maps query string in the `series/data?` path *)

val run_series_data_query :
     query:[`MapSeriesData of string]
  -> api_key:string
  -> (Maps_series_data.maps_series_data, Api_error.api_error) result Lwt.t
(** Run maps query in the `series/data?` path *)

val make_regional_data_query :
     ?start_date:string
  -> ?transformation:Models.Maps_regional_data.transformation
  -> ?aggregation_method:Models.Maps_regional_data.aggregation_method
  -> date:string
  -> frequency:Models.Maps_regional_data.frequency
  -> region_type:string
  -> season:string
  -> units:string
  -> series_group:string
  -> unit
  -> [`MapRegionalData of string]
(** Make maps query string in the `regional/data?` path *)

val run_regional_data_query :
     query:[`MapRegionalData of string]
  -> api_key:string
  -> (Maps_regional_data.maps_regional_data, Api_error.api_error) result
     Lwt.t
(** Run maps query in the `regional/data?` path *)
