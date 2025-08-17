import sys
import re

# Regex que representa L(G5) = {a (ab)^n b | n >= 0}
#^ y $ aseguran que sea toda la cadena.
#* → repite cero o más veces 
pattern = re.compile(r'^a(ab)*b$')

def pertenece_gramatica(cadena):
    cadena = cadena.strip()
    return bool(pattern.match(cadena))

def main():
    if len(sys.argv) < 2:
        sys.exit(1)
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
