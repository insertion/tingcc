%{
#include "y.tab.h"
%}

%%
[0-9]+  {yylval = atoi(yytext); return T_Num;} 
[-+*/()\n]  {return *yytext;}
.           {printf("unknown token\n"); return 0;}
%%

int yywrap(void) {
  return 1;
}
