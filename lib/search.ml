open Ast

let rec contains list_to_search expr_to_search =
  match (list_to_search , expr_to_search) with
  | ([], _) -> false
  | (l, e) ->
    match compare (List.hd l) e with
    | 0 -> true
    | _ -> contains (List.tl l) e

let match_types_and_operators list_to_search expr_to_search =
  let expr_to_search =
    expr_to_types expr_to_search
  in

  List.filter (
    fun e ->
    match (expr_to_search, expr_to_types e) with
    | (Some a, Some b) ->
      begin
        match compare a b with
        | 0 -> true
        | _ -> false
      end
    | (_, _) -> false
  ) list_to_search

let match_types list_to_search expr_to_search =
  let rec types_list l e =
    match e with
    | Type (s, None) -> l @ [s]
    | Type (s1, Some s2) -> l @ [s1] @ [s2]
    | Val (_, e) -> l @ (types_list l e)
    | Op (_, e1, e2) -> l @ (types_list l e1) @ (types_list l e2)
  in

  let tl = types_list [] expr_to_search in

  List.filter (
    fun e ->
      let l_tl = types_list [] e in
      match compare l_tl tl with
      | 0 -> true
      | _ -> false
  ) list_to_search

let rec match_name list_to_search name_to_search =
  match (list_to_search, name_to_search) with
  | ([], _) -> None
  | (h::tl, name) ->
    match expr_name h with
    | Some n when compare n name == 0 -> Some h
    | _ -> match_name tl name
