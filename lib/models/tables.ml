type tables =
  {name: string; element_id: int; release_id: string; elements: Yojson.Safe.t}
[@@deriving of_yojson, show]

type element =
  { element_id: int
  ; release_id: int
  ; series_id: string
  ; parent_id: int
  ; line: string
  ; typ: string [@key "type"]
  ; name: string
  ; level: string
  ; observation_value: string
  ; observation_date: string
  ; children: element list }
[@@deriving of_yojson, show]
