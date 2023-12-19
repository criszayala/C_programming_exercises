//@isalas
//#ifndef LIGHTBULB_H y #define LIGHTBULB_H  void transferBulb(const Bulb *source, Bulb *target)  son conceptos que no hemos visto. 
//Las prácticas son un trabajo individual. Si en próximas entregas utilizas sintaxis no explicada en los materiales podria tener otras consecuencias más drásticas.
//No deben haber más de un return en una función
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