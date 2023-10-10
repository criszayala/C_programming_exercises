// Definimos las constantes como se ha solicitado en el enunciado.
#define COSTO_POR_ENTREGA 0.35
#define COSTO_POR_DEVOLUCION 0.15

int main() {
    int paquetesEntregados, paquetesDevueltos;
    float totalAPagar;

    // Solicitamos al usuario los datos necesarios.
    printf("Introduce el total de paquetes entregados: ");
    scanf("%d", &paquetesEntregados);

    printf("Introduce el total de paquetes devueltos: ");
    scanf("%d", &paquetesDevueltos);

    // Calculamos el importe total que el marketplace debe abonar al punto de recogida.
    totalAPagar = (paquetesEntregados * COSTO_POR_ENTREGA) + (paquetesDevueltos * COSTO_POR_DEVOLUCION);

    // Mostramos el resultado con dos decimales.
    printf("El importe que el marketplace debe pagar al punto de recogida es: %.2f euros\n", totalAPagar);

    return 0;
}