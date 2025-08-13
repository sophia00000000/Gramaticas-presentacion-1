%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int yylex(void);
int yyerror(const char *s);
extern FILE *yyin;

char buffer[1000];
int pos = 0;

int es_capicua(char *str, int len) {
    for (int i = 0; i < len/2; i++) {
        if (str[i] != str[len-1-i]) {
            return 0;
        }
    }
    return 1;
}
%}

%token CERO UNO EOL

%%
programa:
    /* vacío */
    | programa linea
    ;

linea:
    { pos = 0; } secuencia EOL { 
        if (es_capicua(buffer, pos)) {
            printf("ACEPTA\n");
        } else {
            printf("NO ACEPTA\n");
        }
    }
    | EOL { /* línea vacía */ }
    | error EOL { printf("NO ACEPTA: Error de sintaxis\n"); yyerrok; }
    ;

secuencia:
    secuencia CERO { buffer[pos++] = '0'; }
    | secuencia UNO { buffer[pos++] = '1'; }
    | CERO { buffer[pos++] = '0'; }
    | UNO { buffer[pos++] = '1'; }
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
    } else {
        yyin = stdin;
        printf("Ingrese cadenas (Ctrl+D para terminar):\n");
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