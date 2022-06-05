%{
#include<stdio.h>
void yyerror(const char*) {printf("sytax error!\n");}
int yylex();
%}

%token T_Num
%left '+' '-'
%left '*' '/'

%%
  S : S E '\n'    { printf("EndLine\n"); }
    | S '\n'      //忽略空行
    |
    ;

  E : E '+' E   { printf("add\n"); }
    | E '*' E   { printf("mul\n"); }
    | E '/' E   { printf("div\n"); }
    | E '-' E   { printf("sub\n"); }
    | T_Num     { printf("push %d\n", $1); }
    | '(' E ')' {/* nothing */}
    ;
%%

int main() {
  return yyparse();
}
