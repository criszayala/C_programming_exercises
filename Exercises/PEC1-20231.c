// Incluimos la biblioteca estándar de entrada/salida para poder usar las funciones printf y scanf
#include <stdio.h>

// Definimos constantes para los costos de entrega y devolución para evitar el uso de números mágicos en el código.
#define COSTO_POR_ENTREGA 0.35
#define COSTO_POR_DEVOLUCION 0.15

// Función principal del programa.
int main() {
    // Declaramos las variables que vamos a utilizar:
    // paquetesEntregados y paquetesDevueltos para almacenar la cantidad de paquetes,
    // y totalAPagar para el cálculo final.
    int paquetesEntregados, paquetesDevueltos;
    float totalAPagar;

    // Pedimos al usuario el número de paquetes entregados.
    //printf("Introduce el total de paquetes entregados: ");
    printf("PACKAGES DELIVERED? ");
    // Leemos el número introducido por el usuario y lo almacenamos en la variable paquetesEntregados.
    scanf("%d", &paquetesEntregados);

    // Repetimos el proceso para los paquetes devueltos.
    //printf("Introduce el total de paquetes devueltos: ");
    printf("PACKAGES RETURNED? ");
    scanf("%d", &paquetesDevueltos);

    // Calculamos el total a pagar. Multiplicamos la cantidad de paquetes entregados y devueltos
    // por sus respectivos costos y sumamos los resultados.
    totalAPagar = (paquetesEntregados * COSTO_POR_ENTREGA) + (paquetesDevueltos * COSTO_POR_DEVOLUCION);

    // Mostramos el resultado al usuario. Usamos %.2f para mostrar el número con dos decimales.
    //printf("El importe que el marketplace debe pagar al punto de recogida es: %.2f euros\n", totalAPagar);
    printf("TOTAL AMOUNT: %.2f \n", totalAPagar);

    // Retornamos 0 para indicar que el programa se ejecutó con éxito.
    return 0;
}
