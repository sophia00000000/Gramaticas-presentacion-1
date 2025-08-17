import sys
import re

#a^n b^n b  (n >= 1)
# ^ → inicio de cadena
# $ → fin de cadena
# a+ → una o más as
# b{2,} → al menos dos bs
pattern = re.compile(r'^(a+b{2,})$')

def pertenece_gramatica(cadena):
    # Verifica si la cadena pertenece al lenguaje definido por la gramática:

    #quita espacios en blanco y saltos de línea
    cadena = cadena.strip()

    #emparejar la línea completa con el patrón.
    return bool(pattern.match(cadena))

def main():
    if len(sys.argv) < 2:
        print("Uso: python3 programa.py archivo.txt")
        sys.exit(1)

    #argv[0]es el nombre del script.py
    #el primer argumento es .txt
    archivo = sys.argv[1]

    with open(archivo, "r") as f:
        for linea in f:
            if linea.strip() == "":
                continue  
            if pertenece_gramatica(linea):
                print("ACEPTA")
            else:
                print("NO ACEPTA")

if __name__ == "__main__":
    main()
