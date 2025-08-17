# Gram-ticas-presentaci-n-1

Programa en Python y en C que procese las gramáticas: L(G1), L(G2), L(G3), L(G4), L(G5).

Para cada una de las gramáticas hay un archivo de prueba .txt. 

<img width="1597" height="886" alt="image" src="https://github.com/user-attachments/assets/41b528f5-025d-4fca-aa5d-b7a804e35824" />

Flex y Bison:

<img width="828" height="325" alt="image" src="https://github.com/user-attachments/assets/7591a603-92d4-4bae-bf98-bbe844d9c5f6" />

Python:

<img width="504" height="336" alt="image" src="https://github.com/user-attachments/assets/b8579660-f291-489b-a76c-d5679fd6adcd" />


---
<img width="1599" height="807" alt="image" src="https://github.com/user-attachments/assets/b34da2e2-4ce0-4ef2-b2af-8f001706fd93" />

Flex y Bison:

<img width="793" height="303" alt="image" src="https://github.com/user-attachments/assets/d3de812a-6e07-451e-a60f-b06b51969d86" />

Python:

<img width="438" height="327" alt="image" src="https://github.com/user-attachments/assets/45cced38-30a7-4e4c-941a-96494e39e799" />


--- 

<img width="1592" height="932" alt="image" src="https://github.com/user-attachments/assets/8410e37f-f581-4ea2-8446-6e243863baf6" />

Flex y Bison:

<img width="762" height="357" alt="image" src="https://github.com/user-attachments/assets/8f682414-c459-4d55-b8dc-3816aaaaf234" />

Python:

<img width="588" height="286" alt="image" src="https://github.com/user-attachments/assets/05b852f5-04c5-4500-a3c7-22fbe9d35c4d" />


---
<img width="1593" height="812" alt="image" src="https://github.com/user-attachments/assets/b69fc0f8-658f-40a8-9082-d6164b614aea" />

Flex y Bison:

<img width="611" height="315" alt="image" src="https://github.com/user-attachments/assets/62d331be-72ff-417b-8f3d-5fe7040efa08" />


Python:

<img width="793" height="303" alt="image" src="https://github.com/user-attachments/assets/75cf5fe9-ec77-45fe-a59f-4578fba5136f" />


---

<img width="1597" height="809" alt="image" src="https://github.com/user-attachments/assets/aba0fb68-0647-4e46-86f6-cb82c219490f" />

Flex y Bison:

<img width="734" height="267" alt="image" src="https://github.com/user-attachments/assets/8d4f803e-4df7-4d29-9458-6787fd722af9" />

Python:

<img width="573" height="301" alt="image" src="https://github.com/user-attachments/assets/b72456a4-b70f-4ef2-9eb1-d864a044fc61" />


---
### Ejecución
Flex


        flex g2.l



        
compilar - se produce del anterior - banderas


        cc lex.yy.c -lfl


ejecutable



        ./a.out < archivo.txt

Flex y Bison 


        bison -d g2.y      # genera g2.tab.c y g2.tab.h
        flex g2.l          # genera lex.yy.c
                cc g2.tab.c lex.yy.c -lfl -o g2
        ./g2 artivo.txt

### Referencias 
- https://github.com/westes/flex 

