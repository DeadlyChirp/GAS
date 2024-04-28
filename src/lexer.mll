{
  open Parser  (* This allows tokens to be directly passed to the parser *)
}

let digit = ['0'-'9']
let letter = ['a'-'z' 'A'-'Z']
let identifier = letter+ { IDENTIFIER (Lexing.lexeme lexbuf) }
let number = digit+ { NUMBER (int_of_string (Lexing.lexeme lexbuf)) }
let string = '"' ( [^ '"' '\n']* as s) '"' { STRING s }

rule token = parse
  | [' ' '\t' '\r' '\n']+ { token lexbuf }  (* Skip whitespace and recurse *)
  | "IMPRIME"             { IMPRIME }
  | "ALORS"               { ALORS }
  | "VAVERS"              { VAVERS }
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
  | number
  | string
  | identifier
  | eof                   { EOF }
