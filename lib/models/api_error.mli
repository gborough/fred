(** Type of returned API error *)
type api_error = {error_code: int; error_message: string}
[@@deriving of_yojson, show]
