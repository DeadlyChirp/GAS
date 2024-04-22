{
  open Parser
}

let digit = ['0'-'9']
let letter = ['a'-'z' 'A'-'Z']
let identifier = letter+
let number = digit+
let string = '"' ( [^ '"']* as s) '"' { s }

rule token = parse
  | [' ' '\t' '\r' '\n']+ { token lexbuf }
  | "PRINT"               { PRINT }
  | "IF"                  { IF }
  | "THEN"                { THEN }
  | "GOTO"                { GOTO }
  | "INPUT"               { INPUT }
  | "LET"                 { LET }
  | "END"                 { END }
  | "REM"                 { REM }
  | "NL"                  { NL }
  | "="                   { EQUALS }
  | ">"                   { GT }
  | "<"                   { LT }
  | ","                   { COMMA }
  | "+"                   { PLUS }
  | "-"                   { MINUS }
  | "*"                   { TIMES }
  | "/"                   { DIVIDE }
  | "("                   { LPAREN }
  | ")"                   { RPAREN }
  | number                { NUMBER(int_of_string (Lexing.lexeme lexbuf)) }
  | string                { STRING(Lexing.lexeme lexbuf) }
  | identifier            { IDENTIFIER(Lexing.lexeme lexbuf) }
  | eof                   { EOF }
