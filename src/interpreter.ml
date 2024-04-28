open Ast

(* Define the environment *)
let env = Hashtbl.create 26  (* Variable name to integer value *)

(* Initialize environment - Assume LATSI has 26 single-letter variables A-Z *)
let initialize_env () =
  for i = 0 to 25 do
    Hashtbl.add env (String.make 1 (char_of_int (65 + i))) 0
  done

(* Evaluate expressions *)
let rec eval_expr env = function
  | Num n -> n
  | Var v -> Hashtbl.find env v
  | Add (e1, e2) -> eval_expr env e1 + eval_expr env e2
  | Sub (e1, e2) -> eval_expr env e1 - eval_expr env e2
  | Mul (e1, e2) -> eval_expr env e1 * eval_expr env e2
  | Div (e1, e2) ->
      let denom = eval_expr env e2 in
      if denom = 0 then failwith "Division by zero" else eval_expr env e1 / denom

(* Execute statements *)
let rec exec_stmt env program current_line = function
  | Print exprs ->
      List.iter (fun e -> print_int (eval_expr env e); print_newline ()) exprs
  | Assign (v, e) ->
      let value = eval_expr env e in
      Hashtbl.replace env v value
  | If (cond, then_stmt, else_stmt) ->
      if eval_expr env cond = 0 then Option.iter (exec_stmt env program current_line) else_stmt
      else exec_stmt env program current_line then_stmt
  | Goto expr ->
      let line = eval_expr env expr in
      exec_program env program line
  | Input vars ->
      List.iter (fun v ->
        print_string (v ^ ": ");
        let value = read_int () in
        Hashtbl.replace env v value) vars
  | Remark _ -> ()
  | Nl ->
      print_newline ()
  | End ->
      exit 0

and exec_program env program line =
  match List.find_opt (fun (ln, _) -> ln = line) program with
  | Some (_, stmt) -> exec_stmt env program line stmt
  | None -> failwith "Line number not found in program"

(* Entry point of the interpreter *)
let execute program =
  initialize_env ();
  exec_program env program (List.hd program |> fst)  (* Start from the smallest line number *)
