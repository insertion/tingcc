all:yy ll
	gcc -o calc y.tab.c lex.yy.c

yy:
	bison -vdty phase.y	

ll:
	flex lex.l

