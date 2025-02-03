%{
    open Ast
%}

%token <string> STRING

%token VAR
%token DIV

%token LPAR
%token RPAR

%token STAR
%token ARROW

%token EOF

%left ARROW
%left STAR

%start <Ast.expr> prog
%%

prog:
  | e = expr; EOF { e }
  ;

expr:
  | e1 = expr; ARROW; e2 = expr { Op (Arrow, e1, e2) }
  | e1 = expr; STAR; e2 = expr { Op (Star, e1, e2) }
  | VAR; t = STRING; DIV; e = expr { Title(t, e) }
  | t = STRING { Type t }
  | LPAR; e = expr; RPAR { e }
  ;
