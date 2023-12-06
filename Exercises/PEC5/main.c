#include "lightbulb.h"

int main() {
    Bulb firstBulb, secondBulb, bestBulb;

    //Solicito al usuario los datos de entrada para cada bombilla
    printf("INPUT\n");
    printf("LIGHT BULB 1\n");
    getInputBulb(&firstBulb);
    printf("LIGHT BULB 2\n");
    getInputBulb(&secondBulb);

    //Comparo las dos opciones
    pickBestBulb(&firstBulb, &secondBulb, &bestBulb);

    //Luego de la comparación muestro por pantalla la mejor opción
    printf("OUTPUT\n");
    printf("BEST LIGHT BULB\n");
    showBulb(&bestBulb);

    getchar();  //Se limpia el buffer del último '\n'
    getchar();  //Se Espera una entrada del teclado antes de cerrar la terminal

    return 0;
}