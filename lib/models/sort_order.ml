type sort_order = Ascending | Descending

let sort_order_to_string = function
  | Ascending -> "&sort_order=asc"
  | Descending -> "&sort_order=desc"
