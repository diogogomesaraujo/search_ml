%{
    open Ast
%}

%token <string> STRING

%token VAL
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
  | VAL; t = STRING; DIV; e = expr { Val(t, e) }
  | t1 = STRING;{ Type (t1, None) }
  | t1 = STRING; t2 = STRING { Type (t1, Some t2) }
  | LPAR; e = expr; RPAR { e }
  ;
