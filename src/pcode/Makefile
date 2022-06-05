all:yy ll
	gcc -o cc y.tab.c lex.yy.c

yy:
	bison -vdty pcode.y	

ll:
	flex lex.l

clean:
	rm y.* lex.yy.c cc

