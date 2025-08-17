%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex(void);
int yyerror(const char *s);
extern FILE *yyin;

char buffer[1000];  /* Para almacenar la cadena leída */
int pos = 0;        /* Índice en el buffer */

/* Función que evalúa si una cadena es capicúa */
int es_capicua(char *str) {
    int len = strlen(str);
    for (int i = 0; i < len/2; i++) {
        if (str[i] != str[len - 1 - i]) {
            return 0; /* No es capicúa */
        }
    }
    return 1; /* Sí es capicúa */
}
%}

%token CERO UNO EOL DESCONOCIDO

%%
programa:
        /* vacío */
    |   programa linea
    ;

linea:
      numero EOL {
          buffer[pos] = '\0';   /* Terminar cadena */
          if (es_capicua(buffer))
              printf("%s -> ACEPTA\n", buffer);
          else
              printf("%s -> NO ACEPTA\n", buffer);
          pos = 0;  /* Reiniciar buffer */
      }
    | EOL { pos = 0; } /* línea vacía */
    | error EOL {
          printf("NO ACEPTA\n");
          pos = 0;
          yyerrok;
      }
    ;

numero:
      digito
    | numero digito
    ;

digito:
      CERO { buffer[pos++] = '0'; }
    | UNO  { buffer[pos++] = '1'; }
    ;
%%

int yyerror(const char *s) {
    return 0;
}

int main(int argc, char *argv[]) {
    if (argc > 1) {
        yyin = fopen(argv[1], "r");
        if (!yyin) {
            perror("No se pudo abrir el archivo");
            return 1;
        }
    }
    yyparse();
    return 0;
}
