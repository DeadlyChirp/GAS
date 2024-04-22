all: build

build:
    ocamllex lexer.mll       # Generates lexer.ml
    menhir parser.mly        # Generates parser.ml and parser.mli
    ocamlc -o latsi lexer.ml parser.ml interpreter.ml main.ml

clean:
    rm -f *.cmi *.cmo *.ml
