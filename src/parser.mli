
(* The type of tokens. *)

type token = 
  | VAVERS
  | STRING of (string)
  | REM
  | PLUS
  | NUMBER of (int)
  | NL
  | MINUS
  | LT
  | INPUT
  | IMPRIME
  | IF
  | IDENTIFIER of (string)
  | GT
  | EQUALS
  | EOF
  | END
  | ELSE
  | COMMA
  | ALORS

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val program: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (ast.stmt list)
