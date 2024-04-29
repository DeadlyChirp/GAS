{
  open Parser  (* This allows tokens to be directly passed to the parser *)
}

let digit = ['0'-'9']
let letter = ['a'-'z' 'A'-'Z']
let identifier = letter+ 
let number = digit+ 
let string = '"' ( [^ '"' '\n']* as s) '"'

rule token = parse
  | [' ' '\t' '\r' '\n']+ { token lexbuf }  
  | "IMPRIME"             { IMPRIME }
  | "ALORS"               { ALORS }
  | "VAVERS"              { VAVERS }
  | "IF"                  { IF }
  | "INPUT"               { INPUT }
  | "END"                 { END }
  | "REM"                 { REM }
  | "NL"                  { NL }
  | "="                   { EQUALS }
  | ">"                   { GT }
  | "<"                   { LT }
  | ","                   { COMMA }
  | "+"                   { PLUS }
  | "-"                   { MINUS }
  | "("                   { LPAREN }
  | ")"                   { RPAREN }
  | number                { NUMBER(int_of_string (Lexing.lexeme lexbuf)) }
  | string                { STRING(s) }
  | identifier            { IDENTIFIER(Lexing.lexeme lexbuf) }
  | eof                   { EOF }  