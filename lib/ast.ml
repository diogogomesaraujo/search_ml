type op =
  | Arrow
  | Star

type expr =
  | Type of string
  | Val of string * expr
  | Op of op * expr * expr
