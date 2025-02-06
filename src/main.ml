open Interpreter

let () =
  let list_to_search = Parse.parse_from_file "test/test" in
  let str_to_search = "seilza" in
  match Search.match_name list_to_search str_to_search with
  | Some _ -> Printf.printf "\n%s    has %d matches.\n" str_to_search 1
  | None -> Printf.printf "\n%s    has %d matches.\n" str_to_search 0
