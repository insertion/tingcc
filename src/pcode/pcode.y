%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void yyerror(const char*) {printf("sytax error!\n");}
int yylex();
#define YYSTYPE  char*
%}

%token T_Num T_Identifier
%left '+' '-'
%left '*' '/'

%%
/* S是起始符号,所有的语句必须最终收敛为S */
S   : S stmt
    | stmt
    ;

stmt: T_Identifier '=' E ';' {printf("pop %s\n", $1); }
    ;

E   : E '+' E   { printf("add\n"); }
    | E '*' E   { printf("mul\n"); }
    | E '/' E   { printf("div\n"); }
    | E '-' E   { printf("sub\n"); }
    | T_Num     { printf("push %s\n", $1); }
    | T_Identifier {printf("push %s\n", $1); }
    | '(' E ')' {/* nothing */}
    ;
%%

int main() {
  return yyparse();
}
