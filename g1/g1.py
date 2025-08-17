import sys
import re

def es_capicua(cadena):
    #una sola letra
    if len(cadena) == 1:
        return True
    
    # Si inicia y termina con el mismo símbolo
    if cadena[0] == cadena[-1]:
        # solo 2 caracteres iguales
        if len(cadena) == 2:
            return True
        # Recursivamente verificar el interior
        return es_capicua(cadena[1:-1])  
    return False

def main():
    if len(sys.argv) < 2:
        sys.exit(1)
    
    archivo = sys.argv[1]
    
    with open(archivo, "r") as f:
        for linea in f:
            linea = linea.strip()
            if linea == "": 
                continue
            
            #solo 0 y 1
            if re.match(r'^[01]+$', linea):
                if es_capicua(linea):
                    print(f"{linea}: ACEPTA")
                else:
                    print(f"{linea}: NO ACEPTA")
            else:
                print(f"{linea}: NO ACEPTA")


if __name__ == "__main__":
    main()