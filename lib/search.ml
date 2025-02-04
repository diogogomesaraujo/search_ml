open Ast

let rec contains (list_to_search : expr list) (expr_to_search : expr) : bool =
  match (list_to_search , expr_to_search) with
  | ([], _) -> false
  | (l, e) ->
    match compare (List.hd l) e with
    | 0 -> true
    | _ -> contains (List.tl l) e

let match_types (list_to_search : expr list) (expr_to_search : expr) : expr list =
  let expr_to_search = Ast.expr_types expr_to_search in
  List.filter (
    fun e ->
    match (expr_to_search, Ast.expr_types e) with
    | (Some a, Some b) ->
      begin
        match compare a b with
        | 0 -> true
        | _ -> false
      end
    | (_, _) -> false
  ) list_to_search
