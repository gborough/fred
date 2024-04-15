type filter_value = Macro | Regional | All

let filter_value_to_string = function
  | Macro -> "&filter_value=macro"
  | Regional -> "&filter_value=regional"
  | All -> "&filter_value=all"
