%{
#include "y.tab.h"
%}

%%
[0-9]+  {yylval = atoi(yytext); return T_INTEGER;} 
[-+*/()\n]  {return *yytext;}
.           {return 0;}
%%

int yywrap(void) {
  return 1;
}
