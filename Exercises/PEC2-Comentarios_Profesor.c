//@isalas En esta PEC se ha de trabajar las expresiones. No se pueden usar los condicionales
#include <stdio.h>

// Definición de constantes para las condiciones
#define EDAD_MINIMA 16
#define EDAD_MINIMA_ACOMPANADO 12
#define EDAD_MAXIMA_ACOMPANADO 15
#define ALTURA_MINIMA 1.40
#define ALTURA_MAXIMA 1.95

int main() {
    //Se realiza la delaración de variables
    int edad, acompanado, estadoSalud;
    float altura;

    //INPUT SOLICITADO
    printf("INPUT\n");
    printf("AGE?\n");
    scanf("%d", &edad);

    printf("ACCOMPANIED BY AN ADULT (0-FALSE, 1-TRUE)?\n");
    scanf("%d", &acompanado);

    printf("HEIGHT?\n");
    scanf("%f", &altura);

    printf("HEALTH STATUS (0-OK, 1-FEAR OF HEIGHTS, 2-FEAR OF HIGH SPEEDS)?\n");
    scanf("%d", &estadoSalud);

    //Se evalúa las condiciones
    int puedeSubir = 0;  //Inicialmente asumo que no puede subir
    if ((edad >= EDAD_MINIMA) || 
        (edad >= EDAD_MINIMA_ACOMPANADO && edad <= EDAD_MAXIMA_ACOMPANADO && acompanado == 1)) {
        if (altura >= ALTURA_MINIMA && altura <= ALTURA_MAXIMA && estadoSalud == 0) {
            puedeSubir = 1;  //Si cumple las condiciones cambiamos a 1 (Puede subir)
        }
    }

    // OUTPUT SOLICITADO
    printf("OUTPUT\n");
    printf("CAN RIDE (0-FALSE, 1-TRUE): %d\n", puedeSubir);
    
    getchar();  //Se limpia el buffer del último '\n'
    getchar();  //Se Espera una entrada del teclado antes de terminar

    return 0;
}
