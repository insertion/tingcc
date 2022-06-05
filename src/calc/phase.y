/*
 * 语法分析器: 将token流转化成AST
 * c = a + b 这样的语法如何转化成AST?
 * 未匹配到有效的规则会咋样? 产生异常
 */
%{
#include <stdio.h>
void yyerror(const char* msg) {}
int yylex();
%}

%token T_INTEGER /* 指示T_INTEGER 是一个token */
%left '+' '-'
%left '*' '/'

%%
prog: prog expr '\n'  {printf("ans = %d\n", $2);}
    | {/* do nothing */}
    ;

/* 一个树的结点可以有如下几种子结构 */
expr: expr '+' expr {$$ = $1 + $3;} //分解成基本操作单元
    | expr '-' expr {$$ = $1 - $3;}
    | expr '*' expr {$$ = $1 * $3;}
    | expr '/' expr {$$ = $1 / $3;}
    | T_INTEGER {$$ = $1;}
    | '(' expr ')' {$$ = $2;}
    ;
%%

int main() {
  return yyparse();
}

