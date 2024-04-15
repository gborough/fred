(** This module is the top level of the Fred library, it contains various
   query paths as well as data structures and configurations *)

module Categories_query = Categories_query
module Releases_query = Releases_query
module Series_query = Series_query
module Sources_query = Sources_query
module Tags_query = Tags_query
module Maps_query = Maps_query
module Models = Models
module Conf = Conf

(** Helper function to retrieve the Lwt result after running a query *)
let get_result res = Lwt_main.run res
