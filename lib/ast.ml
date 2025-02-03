type op =
  | Arrow
  | Star

type expr =
  | Type of string
  | Title of string * expr
  | Op of op * expr * expr
