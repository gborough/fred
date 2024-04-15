type t = {base_url: string; file_type: string}

val fred_base_url : unit -> t

val geofred_base_url : unit -> t

val api_key_of_string : string -> string
(** Make api key via string *)

val api_key_of_env : unit -> string
(** Make api key via env variable *)
