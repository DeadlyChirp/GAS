let () =
  if Array.length Sys.argv < 2 then (
    Printf.eprintf "Usage: %s <filename>\n" Sys.argv.(0);
    exit 1
  );
  let filename = Sys.argv.(1) in
  let in_channel = open_in filename in
  try
    let lexbuf = Lexing.from_channel in_channel in
    let program = Parser.program Lexer.token lexbuf in
    Interpreter.execute program;  (* Execute the program *)
    close_in in_channel
  with
  | Lexer.Error msg -> Printf.eprintf "Lexer error: %s\n" msg; close_in in_channel; exit 1
  | Parser.Error -> Printf.eprintf "Parser error at offset %d.\n" (Lexing.lexeme_start lexbuf); close_in in_channel; exit 1
  | e -> close_in in_channel; raise e
