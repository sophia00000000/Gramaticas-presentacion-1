%{
#include "g3.tab.h"
#include <stdio.h>
int yyerror(const char *s);
%}

%%
"a"         { return A_CHAR; }
"b"         { return B_CHAR; }
\n          { return EOL; }
<<EOF>> { return EOL; }
"//".*      { /* ignorar comentarios */ }
[ \t\r\f]+  { /* ignorar espacios en blanco */ }
.           { return DESCONOCIDO; }
%%

int yywrap() {
    return 1;
}