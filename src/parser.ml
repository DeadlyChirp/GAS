
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | VAVERS
    | STRING of (
# 6 "parser.mly"
       (string)
# 16 "parser.ml"
  )
    | REM
    | PLUS
    | NUMBER of (
# 5 "parser.mly"
       (int)
# 23 "parser.ml"
  )
    | NL
    | MINUS
    | LT
    | INPUT
    | IMPRIME
    | IF
    | IDENTIFIER of (
# 7 "parser.mly"
       (string)
# 34 "parser.ml"
  )
    | GT
    | EQUALS
    | EOF
    | END
    | ELSE
    | COMMA
    | ALORS
  
end

include MenhirBasics

# 1 "parser.mly"
  
open Ast

# 52 "parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_program) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: program. *)

  | MenhirState01 : (('s, _menhir_box_program) _menhir_cell1_VAVERS, _menhir_box_program) _menhir_state
    (** State 01.
        Stack shape : VAVERS.
        Start symbol: program. *)

  | MenhirState05 : (('s, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_state
    (** State 05.
        Stack shape : expr.
        Start symbol: program. *)

  | MenhirState07 : (('s, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_state
    (** State 07.
        Stack shape : expr.
        Start symbol: program. *)

  | MenhirState12 : (('s, _menhir_box_program) _menhir_cell1_INPUT, _menhir_box_program) _menhir_state
    (** State 12.
        Stack shape : INPUT.
        Start symbol: program. *)

  | MenhirState14 : (('s, _menhir_box_program) _menhir_cell1_IDENTIFIER, _menhir_box_program) _menhir_state
    (** State 14.
        Stack shape : IDENTIFIER.
        Start symbol: program. *)

  | MenhirState17 : (('s, _menhir_box_program) _menhir_cell1_IMPRIME, _menhir_box_program) _menhir_state
    (** State 17.
        Stack shape : IMPRIME.
        Start symbol: program. *)

  | MenhirState20 : (('s, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_state
    (** State 20.
        Stack shape : expr.
        Start symbol: program. *)

  | MenhirState22 : (('s, _menhir_box_program) _menhir_cell1_IF, _menhir_box_program) _menhir_state
    (** State 22.
        Stack shape : IF.
        Start symbol: program. *)

  | MenhirState26 : ((('s, _menhir_box_program) _menhir_cell1_IF, _menhir_box_program) _menhir_cell1_expr _menhir_cell0_relop, _menhir_box_program) _menhir_state
    (** State 26.
        Stack shape : IF expr relop.
        Start symbol: program. *)

  | MenhirState28 : (((('s, _menhir_box_program) _menhir_cell1_IF, _menhir_box_program) _menhir_cell1_expr _menhir_cell0_relop, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_state
    (** State 28.
        Stack shape : IF expr relop expr.
        Start symbol: program. *)

  | MenhirState30 : (('s, _menhir_box_program) _menhir_cell1_IDENTIFIER, _menhir_box_program) _menhir_state
    (** State 30.
        Stack shape : IDENTIFIER.
        Start symbol: program. *)

  | MenhirState34 : ((((('s, _menhir_box_program) _menhir_cell1_IF, _menhir_box_program) _menhir_cell1_expr _menhir_cell0_relop, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_cell1_stmt, _menhir_box_program) _menhir_state
    (** State 34.
        Stack shape : IF expr relop expr stmt.
        Start symbol: program. *)

  | MenhirState40 : (('s, _menhir_box_program) _menhir_cell1_stmt, _menhir_box_program) _menhir_state
    (** State 40.
        Stack shape : stmt.
        Start symbol: program. *)


and ('s, 'r) _menhir_cell1_expr = 
  | MenhirCell1_expr of 's * ('s, 'r) _menhir_state * (
# 27 "parser.mly"
      (ast.expr)
# 130 "parser.ml"
)

and 's _menhir_cell0_relop = 
  | MenhirCell0_relop of 's * (
# 30 "parser.mly"
      (ast.relop)
# 137 "parser.ml"
)

and ('s, 'r) _menhir_cell1_stmt = 
  | MenhirCell1_stmt of 's * ('s, 'r) _menhir_state * (
# 28 "parser.mly"
      (ast.stmt)
# 144 "parser.ml"
)

and ('s, 'r) _menhir_cell1_IDENTIFIER = 
  | MenhirCell1_IDENTIFIER of 's * ('s, 'r) _menhir_state * (
# 7 "parser.mly"
       (string)
# 151 "parser.ml"
)

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_IMPRIME = 
  | MenhirCell1_IMPRIME of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_INPUT = 
  | MenhirCell1_INPUT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_VAVERS = 
  | MenhirCell1_VAVERS of 's * ('s, 'r) _menhir_state

and _menhir_box_program = 
  | MenhirBox_program of (
# 26 "parser.mly"
      (ast.stmt list)
# 170 "parser.ml"
) [@@unboxed]

let _menhir_action_01 =
  fun _1 ->
    (
# 63 "parser.mly"
                         ( Num(_1) )
# 178 "parser.ml"
     : (
# 27 "parser.mly"
      (ast.expr)
# 182 "parser.ml"
    ))

let _menhir_action_02 =
  fun _1 ->
    (
# 64 "parser.mly"
                         ( Var(_1) )
# 190 "parser.ml"
     : (
# 27 "parser.mly"
      (ast.expr)
# 194 "parser.ml"
    ))

let _menhir_action_03 =
  fun _1 _3 ->
    (
# 65 "parser.mly"
                         ( Add(_1, _3) )
# 202 "parser.ml"
     : (
# 27 "parser.mly"
      (ast.expr)
# 206 "parser.ml"
    ))

let _menhir_action_04 =
  fun _1 _3 ->
    (
# 66 "parser.mly"
                         ( Sub(_1, _3) )
# 214 "parser.ml"
     : (
# 27 "parser.mly"
      (ast.expr)
# 218 "parser.ml"
    ))

let _menhir_action_05 =
  fun _1 ->
    (
# 59 "parser.mly"
                         ( [_1] )
# 226 "parser.ml"
     : (
# 31 "parser.mly"
      (ast.expr list)
# 230 "parser.ml"
    ))

let _menhir_action_06 =
  fun _1 _3 ->
    (
# 60 "parser.mly"
                         ( _1 :: _3 )
# 238 "parser.ml"
     : (
# 31 "parser.mly"
      (ast.expr list)
# 242 "parser.ml"
    ))

let _menhir_action_07 =
  fun () ->
    (
# 55 "parser.mly"
                         ( None )
# 250 "parser.ml"
     : (
# 32 "parser.mly"
      (ast.stmt option)
# 254 "parser.ml"
    ))

let _menhir_action_08 =
  fun _2 ->
    (
# 56 "parser.mly"
                         ( Some _2 )
# 262 "parser.ml"
     : (
# 32 "parser.mly"
      (ast.stmt option)
# 266 "parser.ml"
    ))

let _menhir_action_09 =
  fun () ->
    (
# 37 "parser.mly"
                         ( [] )
# 274 "parser.ml"
     : (
# 26 "parser.mly"
      (ast.stmt list)
# 278 "parser.ml"
    ))

let _menhir_action_10 =
  fun _1 ->
    (
# 38 "parser.mly"
                         ( List.rev _1 )
# 286 "parser.ml"
     : (
# 26 "parser.mly"
      (ast.stmt list)
# 290 "parser.ml"
    ))

let _menhir_action_11 =
  fun () ->
    (
# 69 "parser.mly"
                         ( Greater )
# 298 "parser.ml"
     : (
# 30 "parser.mly"
      (ast.relop)
# 302 "parser.ml"
    ))

let _menhir_action_12 =
  fun () ->
    (
# 70 "parser.mly"
                         ( Less )
# 310 "parser.ml"
     : (
# 30 "parser.mly"
      (ast.relop)
# 314 "parser.ml"
    ))

let _menhir_action_13 =
  fun _2 ->
    (
# 45 "parser.mly"
                         ( Print(_2) )
# 322 "parser.ml"
     : (
# 28 "parser.mly"
      (ast.stmt)
# 326 "parser.ml"
    ))

let _menhir_action_14 =
  fun _2 ->
    (
# 46 "parser.mly"
                         ( Remark(_2) )
# 334 "parser.ml"
     : (
# 28 "parser.mly"
      (ast.stmt)
# 338 "parser.ml"
    ))

let _menhir_action_15 =
  fun _2 _3 _4 _5 _6 ->
    (
# 47 "parser.mly"
                                           ( If (_2, _3, _4, _5, _6) )
# 346 "parser.ml"
     : (
# 28 "parser.mly"
      (ast.stmt)
# 350 "parser.ml"
    ))

let _menhir_action_16 =
  fun _1 _3 ->
    (
# 48 "parser.mly"
                           ( Assign(_1, _3) )
# 358 "parser.ml"
     : (
# 28 "parser.mly"
      (ast.stmt)
# 362 "parser.ml"
    ))

let _menhir_action_17 =
  fun () ->
    (
# 49 "parser.mly"
                         ( Nl )
# 370 "parser.ml"
     : (
# 28 "parser.mly"
      (ast.stmt)
# 374 "parser.ml"
    ))

let _menhir_action_18 =
  fun _2 ->
    (
# 50 "parser.mly"
                         ( Goto(_2) )
# 382 "parser.ml"
     : (
# 28 "parser.mly"
      (ast.stmt)
# 386 "parser.ml"
    ))

let _menhir_action_19 =
  fun _2 ->
    (
# 51 "parser.mly"
                         ( Input(_2) )
# 394 "parser.ml"
     : (
# 28 "parser.mly"
      (ast.stmt)
# 398 "parser.ml"
    ))

let _menhir_action_20 =
  fun () ->
    (
# 52 "parser.mly"
                         ( End )
# 406 "parser.ml"
     : (
# 28 "parser.mly"
      (ast.stmt)
# 410 "parser.ml"
    ))

let _menhir_action_21 =
  fun _1 ->
    (
# 41 "parser.mly"
                         ( [_1] )
# 418 "parser.ml"
     : (
# 29 "parser.mly"
      (ast.stmt list)
# 422 "parser.ml"
    ))

let _menhir_action_22 =
  fun _1 _2 ->
    (
# 42 "parser.mly"
                         ( _1 :: _2 )
# 430 "parser.ml"
     : (
# 29 "parser.mly"
      (ast.stmt list)
# 434 "parser.ml"
    ))

let _menhir_action_23 =
  fun _1 ->
    (
# 73 "parser.mly"
                         ( [_1] )
# 442 "parser.ml"
     : (
# 33 "parser.mly"
      (ast.string list)
# 446 "parser.ml"
    ))

let _menhir_action_24 =
  fun _1 _3 ->
    (
# 74 "parser.mly"
                              ( _1 :: _3 )
# 454 "parser.ml"
     : (
# 33 "parser.mly"
      (ast.string list)
# 458 "parser.ml"
    ))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | ALORS ->
        "ALORS"
    | COMMA ->
        "COMMA"
    | ELSE ->
        "ELSE"
    | END ->
        "END"
    | EOF ->
        "EOF"
    | EQUALS ->
        "EQUALS"
    | GT ->
        "GT"
    | IDENTIFIER _ ->
        "IDENTIFIER"
    | IF ->
        "IF"
    | IMPRIME ->
        "IMPRIME"
    | INPUT ->
        "INPUT"
    | LT ->
        "LT"
    | MINUS ->
        "MINUS"
    | NL ->
        "NL"
    | NUMBER _ ->
        "NUMBER"
    | PLUS ->
        "PLUS"
    | REM ->
        "REM"
    | STRING _ ->
        "STRING"
    | VAVERS ->
        "VAVERS"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_goto_program : type  ttv_stack. ttv_stack -> _ -> _menhir_box_program =
    fun _menhir_stack _v ->
      MenhirBox_program _v
  
  let _menhir_run_38 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_program =
    fun _menhir_stack _v ->
      let _1 = _v in
      let _v = _menhir_action_10 _1 in
      _menhir_goto_program _menhir_stack _v
  
  let rec _menhir_goto_stmt_list : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState40 ->
          _menhir_run_41 _menhir_stack _v
      | MenhirState00 ->
          _menhir_run_38 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_41 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_stmt -> _ -> _menhir_box_program =
    fun _menhir_stack _v ->
      let MenhirCell1_stmt (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_22 _1 _2 in
      _menhir_goto_stmt_list _menhir_stack _v _menhir_s
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_VAVERS (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState01 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NUMBER _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENTIFIER _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_02 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState30 ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState26 ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState22 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState20 ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState17 ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState07 ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState05 ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState01 ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_31 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_IDENTIFIER as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | END | EOF | IDENTIFIER _ | IF | IMPRIME | INPUT | NL | REM | VAVERS ->
          let MenhirCell1_IDENTIFIER (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_16 _1 _3 in
          _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_05 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_expr -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState05 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NUMBER _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENTIFIER _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_03 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _1 = _v in
      let _v = _menhir_action_02 _1 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_07 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_expr -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState07 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NUMBER _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENTIFIER _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_stmt : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState40 ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState34 ->
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState28 ->
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_40 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | VAVERS ->
          let _menhir_stack = MenhirCell1_stmt (_menhir_stack, _menhir_s, _v) in
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | REM ->
          let _menhir_stack = MenhirCell1_stmt (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | NL ->
          let _menhir_stack = MenhirCell1_stmt (_menhir_stack, _menhir_s, _v) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | INPUT ->
          let _menhir_stack = MenhirCell1_stmt (_menhir_stack, _menhir_s, _v) in
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | IMPRIME ->
          let _menhir_stack = MenhirCell1_stmt (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | IF ->
          let _menhir_stack = MenhirCell1_stmt (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | IDENTIFIER _v_0 ->
          let _menhir_stack = MenhirCell1_stmt (_menhir_stack, _menhir_s, _v) in
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState40
      | END ->
          let _menhir_stack = MenhirCell1_stmt (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | EOF ->
          let _1 = _v in
          let _v = _menhir_action_21 _1 in
          _menhir_goto_stmt_list _menhir_stack _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_09 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _2 = _v in
          let _v = _menhir_action_14 _2 in
          _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_11 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_17 () in
      _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_12 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_INPUT (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState12 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENTIFIER _v ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_13 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_IDENTIFIER (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState14 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENTIFIER _v ->
              _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | ELSE | END | EOF | IDENTIFIER _ | IF | IMPRIME | INPUT | NL | REM | VAVERS ->
          let _1 = _v in
          let _v = _menhir_action_23 _1 in
          _menhir_goto_var_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_var_list : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState12 ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState14 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_16 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_INPUT -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_INPUT (_menhir_stack, _menhir_s) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_19 _2 in
      _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_15 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_IDENTIFIER -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_IDENTIFIER (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_24 _1 _3 in
      _menhir_goto_var_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_17 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IMPRIME (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState17 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NUMBER _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENTIFIER _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_22 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState22 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NUMBER _v ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENTIFIER _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_29 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_IDENTIFIER (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | EQUALS ->
          let _menhir_s = MenhirState30 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NUMBER _v ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IDENTIFIER _v ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_32 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_20 () in
      _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_35 : type  ttv_stack. ((((ttv_stack, _menhir_box_program) _menhir_cell1_IF, _menhir_box_program) _menhir_cell1_expr _menhir_cell0_relop, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_cell1_stmt -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _2 = _v in
      let _ = _menhir_action_08 _2 in
      _menhir_goto_opt_else _menhir_stack _menhir_lexbuf _menhir_lexer _tok
  
  and _menhir_goto_opt_else : type  ttv_stack. ((((ttv_stack, _menhir_box_program) _menhir_cell1_IF, _menhir_box_program) _menhir_cell1_expr _menhir_cell0_relop, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_cell1_stmt -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_stmt (_menhir_stack, _, _6) = _menhir_stack in
      let MenhirCell1_expr (_menhir_stack, _, _4) = _menhir_stack in
      let MenhirCell0_relop (_menhir_stack, _3) = _menhir_stack in
      let MenhirCell1_expr (_menhir_stack, _, _2) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let _5 = () in
      let _v = _menhir_action_15 _2 _3 _4 _5 _6 in
      _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_33 : type  ttv_stack. ((((ttv_stack, _menhir_box_program) _menhir_cell1_IF, _menhir_box_program) _menhir_cell1_expr _menhir_cell0_relop, _menhir_box_program) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_stmt (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ELSE ->
          let _menhir_s = MenhirState34 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAVERS ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | REM ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NL ->
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INPUT ->
              _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IMPRIME ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IF ->
              _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENTIFIER _v ->
              _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | END ->
              _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | END | EOF | IDENTIFIER _ | IF | IMPRIME | INPUT | NL | REM | VAVERS ->
          let _ = _menhir_action_07 () in
          _menhir_goto_opt_else _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_27 : type  ttv_stack. (((ttv_stack, _menhir_box_program) _menhir_cell1_IF, _menhir_box_program) _menhir_cell1_expr _menhir_cell0_relop as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ALORS ->
          let _menhir_s = MenhirState28 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VAVERS ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | REM ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NL ->
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INPUT ->
              _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IMPRIME ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IF ->
              _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENTIFIER _v ->
              _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | END ->
              _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_23 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_12 () in
          _menhir_goto_relop _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | GT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_11 () in
          _menhir_goto_relop _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_relop : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_IF, _menhir_box_program) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _menhir_stack = MenhirCell0_relop (_menhir_stack, _v) in
      match (_tok : MenhirBasics.token) with
      | NUMBER _v_0 ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState26
      | IDENTIFIER _v_1 ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState26
      | _ ->
          _eRR ()
  
  and _menhir_run_19 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState20 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NUMBER _v ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IDENTIFIER _v ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | ELSE | END | EOF | IDENTIFIER _ | IF | IMPRIME | INPUT | NL | REM | VAVERS ->
          let _1 = _v in
          let _v = _menhir_action_05 _1 in
          _menhir_goto_expr_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_expr_list : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState20 ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState17 ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_21 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_06 _1 _3 in
      _menhir_goto_expr_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_18 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_IMPRIME -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_IMPRIME (_menhir_stack, _menhir_s) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_13 _2 in
      _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_08 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ALORS | COMMA | ELSE | END | EOF | GT | IDENTIFIER _ | IF | IMPRIME | INPUT | LT | NL | REM | VAVERS ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_04 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_06 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ALORS | COMMA | ELSE | END | EOF | GT | IDENTIFIER _ | IF | IMPRIME | INPUT | LT | NL | REM | VAVERS ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_03 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_04 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_VAVERS as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | END | EOF | IDENTIFIER _ | IF | IMPRIME | INPUT | NL | REM | VAVERS ->
          let MenhirCell1_VAVERS (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_18 _2 in
          _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  let _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAVERS ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | REM ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | NL ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | INPUT ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | IMPRIME ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | IF ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | IDENTIFIER _v ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00
      | EOF ->
          let _v = _menhir_action_09 () in
          _menhir_goto_program _menhir_stack _v
      | END ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | _ ->
          _eRR ()
  
end

let program =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_program v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
