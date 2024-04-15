type categories = {categories: category list} [@@deriving of_yojson, show]

and category = {id: int; name: string; parent_id: int}
[@@deriving of_yojson, show]
