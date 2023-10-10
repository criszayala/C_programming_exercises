//Se incluye la biblioteca estándar de entrada/salida para poder usar las funciones printf y scanf
#include <stdio.h> 

//Se define las constantes
#define COSTO_POR_ENTREGA 0.35
#define COSTO_POR_DEVOLUCION 0.15

//Función principal del programa
int main() {
    //Se declaran las variables que vamos a utilizar:
    //paquetesEntregados y paquetesDevueltos para almacenar la cantidad de paquetes,
    //y totalAPagar para el cálculo final
    int paquetesEntregados, paquetesDevueltos;
    float totalAPagar;

    //Se imprime "Input" para indicar la sección de entrada de datos
    printf("INPUT\n");

    //Se pide al usuario el número de paquetes entregados
    //printf("Introduce el total de paquetes entregados: ");
    printf("PACKAGES DELIVERED?\n");
    //Se lee el número ingresado por el usuario y lo almacenamos en la variable paquetesEntregados.
    scanf("%d", &paquetesEntregados);

    //Se repite el proceso para los paquetes devueltos.
    //printf("Introduce el total de paquetes devueltos: ");
    printf("PACKAGES RETURNED?\n");
    scanf("%d", &paquetesDevueltos);

    //Calculamos el total a pagar. Multiplicamos la cantidad de paquetes entregados y devueltos
    //por sus respectivos costos y sumamos los resultados
    totalAPagar = (paquetesEntregados * COSTO_POR_ENTREGA) + (paquetesDevueltos * COSTO_POR_DEVOLUCION);

    //Se imprime "Ouput" para indicar la sección de salida de datos
    printf("OUTPUT\n");

    //Mostramos el resultado al usuario. Usamos %.2f para mostrar el número con dos decimales.
    //printf("El importe que el marketplace debe pagar al punto de recogida es: %.2f euros\n", totalAPagar);
    printf("TOTAL AMOUNT: %.2f\n", totalAPagar);

    // Retornamos 0 para indicar que el programa se ejecutó con éxito.
    return 0;
}