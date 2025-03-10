{
open Parser
}

let white = [' ' '\t']+

rule read =
    parse
    | white { read lexbuf }
    | "val" { VAL }
    | ":" { DIV }
    | "(" { LPAR }
    | ")" { RPAR }
    | "->" { ARROW }
    | "*" { STAR }
    | ['a'-'z' 'A'-'Z' '_']+ { STRING (Lexing.lexeme lexbuf) }
    | eof { EOF }
