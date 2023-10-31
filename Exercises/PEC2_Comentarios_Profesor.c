//@isalas No se pueden usar iteraciones. tal y como se indica en el enunciado sólo se pueden usar  conocimientos que se ha dado.
// sólo se  puede acabar el programa (return 0) al final del código 
//Se incluye la biblioteca estándar de entrada/salida para poder usar las funciones printf y scanf
#include <stdio.h>

#define SIZE 3

int main() {
    int matrix[SIZE][SIZE];
    int i, j, value;

    //Ingreso de datos de la matríz 
    printf("INPUT\n");
    for(int k = 0; k < SIZE*SIZE; k++) {
        printf("I-COORD?\n");
        scanf("%d", &i);
        printf("J-COORD?\n");
        scanf("%d", &j);
        printf("VALUE?\n");
        scanf("%d", &value);
        matrix[i-1][j-1] = value; //Usamos el -1 porque los índices en C comienzan desde 0
    }

    //Verificación para saber si la matríz es simétrica
    for(i = 0; i < SIZE; i++) {
        for(j = i+1; j < SIZE; j++) { //j comienza desde i+1 para solo considerar la parte superior de la matriz
            if(matrix[i][j] != matrix[j][i]) {
                printf("OUTPUT\n");
                printf("IS SYMMETRIC (0-FALSE, 1-TRUE): 0\n");
                return 0;
            }
        }
    }

    printf("OUTPUT\n");
    printf("IS SYMMETRIC (0-FALSE, 1-TRUE): 1\n");

    getchar();  //Se limpia el buffer del último '\n'
    getchar();  //Se Espera una entrada del teclado antes de cerrar la terminal

    return 0;
}