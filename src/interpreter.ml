type expr =
  | Num of int
  | Var of string
  | Add of expr * expr
  | Sub of expr * expr
  | Mul of expr * expr
  | Div of expr * expr

type stmt =
  | Print of expr list
  | Assign of string * expr
  | If of expr * expr * stmt * stmt option  (* Added an optional else branch *)
  | Goto of int
  | Input of string list
  | Remark of string
  | Nl
  | End

let rec eval_expr env = function
  | Num n -> n
  | Var v -> Hashtbl.find env v
  | Add (e1, e2) -> eval_expr env e1 + eval_expr env e2
  | Sub (e1, e2) -> eval_expr env e1 - eval_expr env e2
  | Mul (e1, e2) -> eval_expr env e1 * eval_expr env e2
  | Div (e1, e2) ->
      let denom = eval_expr env e2 in
      if denom = 0 then failwith "Division by zero" else eval_expr env e1 / denom

let rec exec_stmt env = function
  | Print exprs -> List.iter (fun e -> print_int (eval_expr env e); print_newline ()) exprs
  | Assign (v, e) -> let value = eval_expr env e in Hashtbl.replace env v value
  | If (cond, then_stmt, else_stmt) ->
      if eval_expr env cond then exec_stmt env then_stmt else Option.iter (exec_stmt env) else_stmt
  | Goto line -> (* Logic to jump to a line number in the program *)
  | Input vars -> List.iter (fun v -> print_string (v ^ ": "); let value = read_int () in Hashtbl.replace env v value) vars
  | Remark _ -> ()
  | Nl -> print_newline ()
  | End -> exit 0
