(lang dune 3.7)
(using menhir 2.1)

(name search_ml)

(generate_opam_files true)

(source
 (github diogogomesaraujo/search_ml))

(authors "Diogo Araújo")

(maintainers "Diogo Araújo")

(license LICENSE)

(package
 (name search_ml)
 (synopsis "Search engine for OCaml modules")
 (description "")
 (depends ocaml dune)
 (tags
  ("search" "engine")))
