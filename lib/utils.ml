let qstr tag str = if str = "" then "" else "&" ^ tag ^ "=" ^ str

let limit_q lmt =
  if lmt < 1 || lmt > 1000 then failwith "Limit out of range"
  else string_of_int lmt

let limit_release_dates lmt =
  if lmt < 1 || lmt > 10000 then failwith "Limit out of range"
  else string_of_int lmt

let limit_series_obs lmt =
  if lmt < 1 || lmt > 100000 then failwith "Limit out of range"
  else string_of_int lmt

let offset_q off =
  if off < 0 then failwith "Limit must be non-negative"
  else string_of_int off

let ezcurl_get ~query ~f =
  let open Lwt.Infix in
  let open Api_error in
  Ezcurl_lwt.get ~url:query ()
  >>= fun res ->
  match res with
  | Ok r -> (
      if r.code == 200 then
        let payload = f @@ Yojson.Safe.from_string r.body in
        match payload with
        | Ok r -> Lwt.return @@ Result.ok r
        | Error e ->
            Lwt.return @@ Result.error {error_code= 500; error_message= e}
      else
        let payload =
          Api_error.api_error_of_yojson @@ Yojson.Safe.from_string r.body
        in
        match payload with
        | Ok r -> Lwt.return @@ Result.error r
        | Error e ->
            Lwt.return @@ Result.error {error_code= 500; error_message= e} )
  | Error (_, e) ->
      Lwt.return @@ Result.error {error_code= 500; error_message= e}
