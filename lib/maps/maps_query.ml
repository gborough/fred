open Utils

let config = Conf.geofred_base_url ()

let shape_file_path () = config.base_url ^ "shapes/file?" ^ config.file_type

let series_group_path () =
  config.base_url ^ "series/group?" ^ config.file_type

let series_data_path () = config.base_url ^ "series/data?" ^ config.file_type

let regional_data_path () =
  config.base_url ^ "regional/data?" ^ config.file_type

let make_shape_query ~shape =
  let q = shape_file_path () ^ qstr "shape" shape in
  `MapShapeFile q

let run_shape_query ~query ~api_key =
  let q =
    match query with
    | `MapShapeFile q -> q ^ api_key
    | _ -> failwith "Wrong share file query type"
  in
  ezcurl_get ~query:q ~f:Maps_shape_file.maps_shape_file_of_yojson

let make_series_group_query ~series_id =
  let q = series_group_path () ^ qstr "series_id" series_id in
  `MapSeriesGroup q

let run_series_group_query ~query ~api_key =
  let q =
    match query with
    | `MapSeriesGroup q -> q ^ api_key
    | _ -> failwith "Wrong series group query type"
  in
  ezcurl_get ~query:q ~f:Maps_series_group.maps_series_group_of_yojson

let make_series_data_query ?(date = "") ?(start_date = "") ~series_id () =
  let q =
    series_data_path () ^ qstr "date" date
    ^ qstr "start_date" start_date
    ^ qstr "series_id" series_id
  in
  `MapSeriesData q

let run_series_data_query ~query ~api_key =
  let q =
    match query with
    | `MapSeriesData q -> q ^ api_key
    | _ -> failwith "Wrong series data query type"
  in
  ezcurl_get ~query:q ~f:Maps_series_data.maps_series_data_of_yojson

let make_regional_data_query ?(start_date = "")
    ?(transformation = Models.Maps_regional_data.Levels)
    ?(aggregation_method = Models.Maps_regional_data.Average) ~date
    ~frequency ~region_type ~season ~units ~series_group () =
  let q =
    regional_data_path ()
    ^ qstr "start_date" start_date
    ^ Maps_regional_data.transformation_to_string transformation
    ^ Maps_regional_data.frequency_to_string frequency
    ^ Maps_regional_data.aggregation_method_to_string aggregation_method
    ^ qstr "date" date
    ^ qstr "region_type" region_type
    ^ qstr "season" season ^ qstr "units" units
    ^ qstr "series_group" series_group
  in
  `MapRegionalData q

let run_regional_data_query ~query ~api_key =
  let q =
    match query with
    | `MapRegionalData q -> q ^ api_key
    | _ -> failwith "Wrong series data query type"
  in
  ezcurl_get ~query:q ~f:Maps_regional_data.maps_regional_data_of_yojson
