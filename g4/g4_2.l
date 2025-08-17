%{
#include "g4.tab.h"
%}

%%
"a"     { return A_CHAR; }
"b"     { return B_CHAR; }
\n      { return EOL; }
<<EOF>> { return EOL; }
[ \t]   ;  /* ignorar espacios */
.       { return DESCONOCIDO; }
%%
int yywrap() {
    return 1;
}