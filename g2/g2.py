import sys
import re

def pertenece(cadena):
    #'a' seguidas de varias 'b'
    patron = r"^a+b+$"
    if not re.match(patron, cadena):
        return False
    
    #contar
    n_a = len(re.findall(r"a", cadena))
    n_b = len(re.findall(r"b", cadena))
    
    return n_b == n_a + 1

def main():
    if len(sys.argv) < 2:
        sys.exit(1)

    archivo = sys.argv[1]
    with open(archivo, "r") as f:
        for linea in f:
            if linea.strip() == "":
                continue
            if pertenece(linea):
                print(f"{linea.strip()} -> ACEPTA")
            else:
                print(f"{linea.strip()} -> NO ACEPTA")

if __name__ == "__main__":
    main()
