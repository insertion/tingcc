%{
#define YYSTYPE char *
#include "y.tab.h"
%}

%%
[0-9]+                  { yylval = strdup(yytext); return T_Num; } 
[-+*/()=;]              { return *yytext; }
[_a-zA-Z][a-zA-Z0-9]*   { yylval = strdup(yytext); return T_Identifier; }
[ \t]*                  { /* ignore whitespace */ }
.                       { printf("unknown token\n"); return 0; }
%%

int yywrap(void) {
  return 1;
}
