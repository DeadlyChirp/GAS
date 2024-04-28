all: build

build:
	ocamllex lexer.mll       # Generates lexer.ml
	menhir parser.mly        # Generates parser.ml and parser.mli
	ocamlc -c Ast.ml         # Compiles ast.ml to ast.cmo and ast.cmi
	ocamlc -c parser.mli     # Compiles parser.mli to parser.cmi
	ocamlc -c parser.ml      # Compiles parser.ml to parser.cmo
	ocamlc -c lexer.ml       # Compiles lexer.ml to lexer.cmo
	ocamlc -c interpreter.ml # Compiles interpreter.ml to interpreter.cmo
	ocamlc -c main.ml        # Compiles main.ml to main.cmo
	ocamlc -o latsi ast.cmo parser.cmo lexer.cmo interpreter.cmo main.cmo

clean:
	rm -f *.cmi *.cmo lexer.ml parser.ml parser.mli latsi
