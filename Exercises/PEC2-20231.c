#include <stdio.h>
#include <stdbool.h>

// Definición de constantes
#define EDAD_MINIMA 16
#define EDAD_MINIMA_ACOMPANADO 12
#define EDAD_MAXIMA_ACOMPANADO 15
#define ALTURA_MINIMA 1.40
#define ALTURA_MAXIMA 1.95

int main() {
    // Declaración de variables
    int edad;
    bool acompanado, estresAltura, estresVelocidad;
    float altura;

    // Entrada de datos
    printf("Introduzca la edad del visitante: ");
    scanf("%d", &edad);

    printf("¿Está acompañado de un adulto? (1 para sí, 0 para no): ");
    scanf("%d", &acompanado);

    printf("Introduzca la altura del visitante en metros (ejemplo: 1.75): ");
    scanf("%f", &altura);

    printf("¿Le estresa las alturas? (1 para sí, 0 para no): ");
    scanf("%d", &estresAltura);

    printf("¿Le estresa las altas velocidades? (1 para sí, 0 para no): ");
    scanf("%d", &estresVelocidad);

    // Evaluación de condiciones
    if (edad >= EDAD_MINIMA ||
       (edad >= EDAD_MINIMA_ACOMPANADO && edad <= EDAD_MAXIMA_ACOMPANADO && acompanado)) {
        if (altura >= ALTURA_MINIMA && altura <= ALTURA_MAXIMA && !estresAltura && !estresVelocidad) {
            printf("El visitante puede subir a la montaña rusa.\n");
        } else {
            printf("El visitante no cumple con los requisitos de estatura o salud.\n");
        }
    } else {
        printf("El visitante no cumple con los requisitos de edad.\n");
    }

    // Retornamos 0 para indicar que el programa se ejecutó con éxito.
    return 0;
}
