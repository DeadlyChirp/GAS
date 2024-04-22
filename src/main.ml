let () =
  let filename = Sys.argv.(1) in
  let in_channel = open_in filename in
  try
    let lexbuf = Lexing.from_channel in_channel in
    let program = Parser.program Lexer.token lexbuf in
    Interpreter.execute program;  (* Implement this function to execute your program *)
    close_in in_channel
  with
  | Lexer.Error msg -> Printf.eprintf "%s%!" msg; close_in in_channel
  | Parser.Error -> Printf.eprintf "At offset %d: syntax error.\n%!" (Lexing.lexeme_start lexbuf); close_in in_channel
  | e -> close_in in_channel; raise e
