(lang dune 2.7)

(name fred)

(generate_opam_files true)

(source
 (github gborough/fred))

(authors "Geoffrey Borough")

(maintainers "geoffrey.borough@outlook.com")

(license MIT)

(documentation "https://gborough.github.io/fred/fred")

(package
 (name fred)
 (synopsis "API binding for Federal Reserve Economic Data")
 (description "API binding for Federal Reserve Economic Data")
 (depends
  (ocaml
   (>= 4.14.0))
  dune
  ezcurl-lwt
  (ppx_expect :with-test)
  ppx_deriving
  ppx_deriving_yojson
  yojson)
 (tags
  ("api binding" "federal reserve" "ecomonic data")))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
