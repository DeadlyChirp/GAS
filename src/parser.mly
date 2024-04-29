%{
open Ast
%}

%token <int> NUMBER
%token <string> STRING
%token <string> IDENTIFIER
%token ELSE
%token IMPRIME
%token ALORS
%token VAVERS
%token IF
%token INPUT
%token END
%token REM
%token NL
%token EQUALS
%token GT
%token LT
%token PLUS
%token MINUS

%start <Ast.stmt list> program
%type <Ast.expr> expr
%type <Ast.stmt> stmt
%type <Ast.stmt list> stmt_list
%type <Ast.relop> relop
%type <Ast.expr list> expr_list
%type <Ast.stmt option> opt_else
%type <Ast.string list> var_list

%%
program:
  | EOF                  { [] }
  | stmt_list EOF        { List.rev $1 }

stmt_list:
  | stmt                 { [$1] }
  | stmt stmt_list       { $1 :: $2 }

stmt:
  | IMPRIME expr_list    { Print($2) }
  | REM STRING           { Remark($2) }
  | IF expr relop expr ALORS stmt opt_else { If ($2, $3, $4, $5, $6) }
  | IDENTIFIER EQUALS expr { Assign($1, $3) }
  | NL                   { Nl }
  | VAVERS expr          { Goto($2) }
  | INPUT var_list       { Input($2) }
  | END                  { End }

opt_else:
  | /* empty */          { None }
  | ELSE stmt            { Some $2 }

expr_list:
  | expr                 { [$1] }
  | expr COMMA expr_list { $1 :: $3 }

expr:
  | NUMBER               { Num($1) }
  | IDENTIFIER           { Var($1) }
  | expr PLUS expr       { Add($1, $3) }
  | expr MINUS expr      { Sub($1, $3) }

relop:
  | GT                   { Greater }
  | LT                   { Less }

var_list:
  | IDENTIFIER           { [$1] }
  | IDENTIFIER COMMA var_list { $1 :: $3 }
