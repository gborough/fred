(** Container for filter data *)
type filter_value = Macro | Regional | All

val filter_value_to_string : filter_value -> string
