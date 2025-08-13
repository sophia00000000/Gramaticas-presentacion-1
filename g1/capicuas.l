%{
#include "capicuas.tab.h"
#include <stdio.h>
int yyerror(const char *s);
%}

%%
"0"         { return CERO; }
"1"         { return UNO; }
\n          { return EOL; }
"//".*      { /* ignorar comentarios */ }
[ \t\r\f]+  { /* ignorar espacios en blanco */ }
.           { yyerror("Caracter desconocido"); return 0; }
%%

int yywrap() {
    return 1;
}