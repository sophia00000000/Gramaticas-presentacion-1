import sys
import re

# Definimos la gramática como una expresión regular.
pattern = re.compile(r'^(ab|abb)$')

def analizar_linea(linea):

    linea = linea.strip() 
    return bool(pattern.match(linea)) 

def main():
    if len(sys.argv) < 2:
        print("Uso: python3 programa.py archivo.txt")
        sys.exit(1)  # Terminamor si no hay archivo

    archivo = sys.argv[1]
    print("Analizando archivo:", archivo)

    with open(archivo, "r") as f:
        for linea in f:
            if analizar_linea(linea):
                print("ACEPTA")
            else:
                print("NO ACEPTA")

if __name__ == "__main__":
    main()
