
SCANNER = scanner.l
PARSER = parser.y

all:lex.yy.c y.tab.c
	gcc -o tcc y.tab.c lex.yy.c

lex.yy.c:$(SCANNER)
	flex $< 

y.tab.c:$(PARSER)
	bison -vdty $<

clean:
	rm y.* lex.yy.c 

test:
	python pysim.y

# $@: target name
# $<: first dependency
# $^: all dependency
