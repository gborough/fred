(** Container for map shape file data *)
type maps_shape_file =
  {typ: string [@key "type"]; name: string; crs: crs; features: feature list}
[@@deriving of_yojson, show]

and crs = {crs_typ: string [@key "type"]; properties: crs_properties}
[@@deriving of_yojson, show]

and crs_properties = {crs_properties_name: string [@key "name"]} [@@deriving of_yojson, show]

and feature =
  { feature_typ: string [@key "type"]
  ; feature_properties: feature_properties [@key "properties"]
  ; geometry: geometry }
[@@deriving of_yojson, show]

and feature_properties = {bea_region: int; bea_regi_1: string}
[@@deriving of_yojson, show]

and geometry =
  {geometry_typ: string [@key "type"]; coordinates: int list list list list}
[@@deriving of_yojson, show]

(** Maps share file's shape options *)
type shape =
  | Bea
  | Msa
  | Frb
  | Necta
  | State
  | Country
  | County
  | CensusRegion
  | CensusDivision

val shape_to_string : shape -> string
