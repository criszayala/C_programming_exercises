//Se incluye la biblioteca estándar de entrada/salida para poder usar las funciones printf y scanf
#include <stdio.h>

#define SIZE 3

int main() {
    int matriz[SIZE][SIZE];
    int is_symmetric = 1; //Se asume que la matríz es simétrica hasta que se demuestre lo contrario.

    printf("INPUT\n");

    //Ingreso de datos
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            printf("I-COORD?\n");
            scanf("%d", &i);
            printf("J-COORD?\n");
            scanf("%d", &j);
            printf("VALUE?\n");
            scanf("%d", &matriz[i][j]);
        }
    }

    //Verificamos si la matríz es simétrica
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            if (matriz[i][j] != matriz[j][i]) {
                is_symmetric = 0;
                break;
            }
        }
        if (!is_symmetric) {
            break;
        }
    }

    //Salida de datos
    printf("OUTPUT\n");
    printf("IS SYMMETRIC (0-FALSE, 1-TRUE): %d\n", is_symmetric);

    getchar();  //Se limpia el buffer del último '\n'
    getchar();  //Se Espera una entrada del teclado antes de cerrar la terminal

    return 0;
}