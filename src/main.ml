open Interpreter

let () =
  let list_to_search = Parse.parse_from_file "test/test1" in
  let str_to_search = "val b : int -> int" in
  let expr_to_search = Parse.parse str_to_search in
  let result = match Search.specific_search list_to_search expr_to_search with
  | Some _ -> true
  | None -> false
  in
  Printf.printf "\n%s    =    %b\n" str_to_search result
