%token <int> NUMBER
%token <string> STRING
%token PRINT IF THEN GOTO INPUT LET END REM NL EQUALS GT LT COMMA PLUS MINUS TIMES DIVIDE LPAREN RPAREN IDENTIFIER EOF

%start <Ast.program> program
%type <Ast.expr> expr
%type <Ast.stmt> stmt

%%
program:
  | EOF                  { [] }
  | stmt_list EOF        { List.rev $1 }

stmt_list:
  | stmt                 { [$1] }
  | stmt stmt_list       { $1 :: $2 }

stmt:
  | PRINT expr_list      { Print($2) }
  | REM STRING           { Remark($2) }
  | IF expr relop expr THEN stmt opt_else { If($2, $3, $4, $6, $7) }
  | IDENTIFIER EQUALS expr { Assignment($1, $3) }
  | NL                   { NewLine }
  | GOTO expr            { Goto($2) }
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
  | LPAREN expr RPAREN   { $2 }

relop:
  | GT                   { Greater }
  | LT                   { Less }

var_list:
  | IDENTIFIER           { [$1] }
  | IDENTIFIER COMMA var_list { $1 :: $3 }
