%{
#include <stdio.h>
#include <string.h>

int valid_input = 0;
%}

%%
"abb"           { printf("acepta\n"); valid_input = 1; }
"ab"            { printf("acepta\n"); valid_input = 1; }
[a-zA-Z0-9]+    { printf("no acepta\n"); }
.               { /* Ignorar caracteres que no matcheen */ }
\n              { /* Ignorar saltos de línea */ }
%%

int yywrap() {
    return 1;
}

int main(int argc, char *argv[]) {
    yylex();
    return 0;
}