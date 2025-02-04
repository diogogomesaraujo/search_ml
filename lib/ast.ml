type op =
  | Arrow
  | Star

type expr =
  | Type of string
  | Val of string * expr
  | Op of op * expr * expr

let expr_types (expr: expr) : expr option =
  match expr with
  | Val (_, types) -> Some types
  | Op _ -> None
  | Type _ -> None
