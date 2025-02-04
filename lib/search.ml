open Ast

let rec contains (list_to_search : expr list) (expr_to_search : expr) : bool  =
  match (list_to_search , expr_to_search) with
  | ([], _) -> false
  | (l, e) ->
    match compare (List.hd l) e with
    | 0 -> true
    | _ -> contains (List.tl l) e
