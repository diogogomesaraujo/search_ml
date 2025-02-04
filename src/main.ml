open Interpreter

let () =
  let list_to_search = Parse.parse_from_file "test/test1" in
  let str_to_search = "val a : int -> int" in
  let expr_to_search = Parse.parse str_to_search in
  let result = Search.contains list_to_search expr_to_search in
  Printf.printf "\n%s    =    %b\n" str_to_search result
