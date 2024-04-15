type t = {base_url: string; file_type: string}

let fred_base_url () =
  let base_url = "https://api.stlouisfed.org/fred/" in
  let file_type = "&file_type=json" in
  {base_url; file_type}

let geofred_base_url () =
  let base_url = "https://api.stlouisfed.org/geofred/" in
  let file_type = "&file_type=json" in
  {base_url; file_type}

let api_key k =
  if String.length k <> 32 then
    failwith "API key length must be 32 characters"
  else "&api_key=" ^ k

let api_key_of_string k = api_key k

let api_key_of_env () =
  match Sys.getenv_opt "FRED_API_KEY" with
  | Some k -> api_key k
  | None -> failwith "No API key provided"
