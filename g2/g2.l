%{
#include "g2.tab.h"
#include <stdio.h>
int yyerror(const char *s);
%}

%%
"a"         { return A_CHAR; }
"b"         { return B_CHAR; }
\n          { return EOL; }
"//".*      { /* ignorar comentarios */ }
[ \t\r\f]+  { /* ignorar espacios en blanco */ }
.           { yyerror("Caracter desconocido"); return 0; }
%%

int yywrap() {
    return 1;
}