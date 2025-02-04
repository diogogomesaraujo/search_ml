open Ast

let specific_search (list_to_search : expr list) (expr_to_search : expr) : expr option  =
  let l = List.filter (
    fun expr ->
    match compare expr expr_to_search with
    | 0 -> true
    | _ -> false
  ) list_to_search in
  try Some (List.hd l) with Failure _ -> None
