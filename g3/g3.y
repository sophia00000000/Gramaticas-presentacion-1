%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
int yyerror(const char *s);
extern FILE *yyin;
%}

%token A_CHAR B_CHAR EOL DESCONOCIDO

%%
programa:
    /* vacío */
    | programa linea
    ;

linea:
    expresion EOL     { printf("ACEPTA\n"); }
    | EOL             { /* línea vacía */ }
    | error EOL       { printf("NO ACEPTA\n"); yyerrok; }
    ;

expresion:
    S
    ;

S:
    A B_CHAR          { /* S -> Ab */ }
    ;

A:
    A_CHAR A B_CHAR   { /* A -> aAb */ }
    | A_CHAR B_CHAR   { /* A -> ab */ }
    ;

%%

int main(int argc, char **argv) {
    if (argc > 1) {
        yyin = fopen(argv[1], "r");
        if (!yyin) {
            perror("No se pudo abrir el archivo");
            return 1;
        }
        printf("Analizando archivo: %s\n", argv[1]);
    }
    
    yyparse();
    
    if (argc > 1 && yyin != stdin) {
        fclose(yyin);
    }
    
    return 0;
}

int yyerror(const char *s) {
    return 0;
}