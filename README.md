[![CI](https://github.com/gborough/fred/actions/workflows/ci.yml/badge.svg)](https://github.com/gborough/fred/actions/workflows/ci.yml)

API Documentation: https://gborough.github.io/fred/fred/fred/index.html

# Fred

API binding for FRED, the Federal Reserve Economic Data set(https://fred.stlouisfed.org/)

Up-to-date as of April 2024

## User Manual

### Step 1: Obtain API key

Visit https://fredaccount.stlouisfed.org/login/secure/ and register for an account to obtain
API key

### Step 2: Example API calls

This library is organised in modules that reflect available FRED API endpoints:

- Categories_query
- Releases_query
- Series_query
- Sources_query
- Tags_query
- Maps_query

The general steps are:

1. Setup API key credential via either "FRED_API_KEY" env variable or API key string
2. Make query string
3. Run query string with credential
4. Obtain query result. The result is generally of type **('data_model, 'api_error) result Lwt.t**
5. Handle result(or together in step 4)

Example of a full Categories Series query:

```ocaml
open Fred

let api_key = Conf.api_key_of_string "abcdefghijklmnopqrstuvwxyz123456" in
(* or set API key in FRED_API_KEY env variable, using Conf.api_key_of_env *)
let query =
    Categories_query.make_series_query ~realtime_start:"2024-04-11" ~realtime_end:"2024-04-11"
      ~limit:1 ~offset:1 ~order_by:Models.Series.Title
      ~sort_order:Models.Sort_order.Ascending
      ~filter_variable:Models.Series.Frequency ~filter_value:"Quarterly"
      ~tag_names:"income;bea" ~exclude_tag_names:"discontinued;annual"
      ~category_id:125 ()
(* make query with various parameters *)
in
let run = Categories_query.run_series_query ~query:query ~api_key:api_key in
(* run query *)
let res = get_result run in
(* get result *)
match res with
| Ok r -> (* handle returned categories type *)
| Error e -> (* handle returned api_error type *)
```

## Notes

Supported Platforms: UNIX

Caveats:

- Due to lack of version information from FRED, official API additions and deprecations announcements
  tracked in CHANGES is on best-effor basis

- Maps Shape File query appears to be defunct

## License

This project is licensed under the [MIT license].

[MIT license]: https://github.com/gborough/fred/blob/main/LICENSE

## Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in fred by you, shall be licensed as MIT, without any additional
terms or conditions.
