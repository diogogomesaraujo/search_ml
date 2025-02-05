type op =
  | Arrow
  | Star

type expr =
  | Type of string * string option
  | Val of string * expr
  | Op of op * expr * expr

let expr_to_types expr =
  match expr with
  | Val (_, types) -> Some types
  | Op _ -> None
  | Type _ -> None
