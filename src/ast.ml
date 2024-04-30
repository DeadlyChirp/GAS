(* Define the types for expressions *)
type expr =
  | Num of int
  | Var of string
  | Add of expr * expr
  | Sub of expr * expr
  | Mul of expr * expr
  | Div of expr * expr

(* Define the type for relational operators *)
type relop =
  | Greater
  | Less

(* Define the types for statements *)
type stmt =
  | Print of expr list
  | Assign of string * expr
  | If of expr * relop * expr * stmt * stmt option
  | Goto of expr
  | Input of string list
  | Remark of string
  | Nl
  | End
