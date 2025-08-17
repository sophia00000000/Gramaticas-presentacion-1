%{
#include "capicuas.tab.h"
int yyerror(const char *s);
%}

%%
0         { return CERO; }
1         { return UNO; }
\n          { return EOL; }
<<EOF>> { return EOL; }
"//".*      { /* ignorar comentarios */ }
[ \t\r\f]+  { /* ignorar espacios en blanco */ }
.           { return DESCONOCIDO;}
%%

int yywrap() {
    return 1;
}