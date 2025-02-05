open Interpreter

let () =
  let list_to_search = Parse.parse_from_file "test/test1" in
  let str_to_search = "val b : int -> int option" in
  let expr_to_search = Parse.parse str_to_search in
  let result = Search.match_types list_to_search expr_to_search |> List.length in
  Printf.printf "\n%s    has %d matches.\n" str_to_search result
