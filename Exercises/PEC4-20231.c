#include <stdio.h>

//Se definen las constantes de los diferentes vuelos y la cantidad de vuelos a comparar
#define TYPE_TOURIST_CLASS 0
#define TYPE_BUSINESS_CLASS 1
#define TYPE_FIRST_CLASS 2
#define NUM_FLIGHTS 2

//Se crea tupla para representar la duración de la escala
typedef struct {
    int days;
    int hours;
    int minutes;
} WaitingTime;

//Se crea tupla para representar el vuelo con su respectiva características
typedef struct {
    char id[21];
    int classType;
    WaitingTime layoverDuration;
    int numberOfStops;
} Flight;

int main() {
    Flight flights[NUM_FLIGHTS]; //Este array lo uso para almacenar los vuelos, en este caso 2
    int totalInMinutes[NUM_FLIGHTS]; //Este array lo uso para almacenar la duración total de las escalas en minutos

    //Se crea bucle para leer todos los datos de cada vuelo
    for (int i = 0; i < NUM_FLIGHTS; ++i) {
        // Lectura de datos para cada vuelo
        printf("FLIGHT %d\n", i + 1);
        printf("ID?");
        scanf("%20s", flights[i].id);
        printf("CLASS (0-TOURIST, 1-BUSINESS, 2-FIRST)?");
        scanf("%d", &flights[i].classType);
        printf("LAYOVER DAYS?");
        scanf("%d", &flights[i].layoverDuration.days);
        printf("LAYOVER HOURS?");
        scanf("%d", &flights[i].layoverDuration.hours);
        printf("LAYOVER MINUTES?");
        scanf("%d", &flights[i].layoverDuration.minutes);
        printf("CONNECTIONS?");
        scanf("%d", &flights[i].connections);

        //Se realiza la conversión a minutos del tiempo total de la escala
        totalInMinutes[i] = flights[i].layoverDuration.days * 1440 + flights[i].layoverDuration.hours * 60 + flights[i].layoverDuration.minutes;
    }

    //Se realiza la comparación de vuelos suponiendo que el primero será el más conveniente
    int indexMostConvenient = 0; 
    if (flights[1].classType > flights[0].classType ||
        (flights[1].classType == flights[0].classType && totalInMinutes[1] < totalInMinutes[0]) ||
        (flights[1].classType == flights[0].classType && totalInMinutes[1] == totalInMinutes[0] && flights[1].connections < flights[0].connections)) {
        indexMostConvenient = 1;
    }
    //Se muestra en pantalla el ID del vuelo que es más conveniente (según la comparación realizada)
    printf("MOST CONVENIENT FLIGHT: %s\n", flights[indexMostConvenient].id);

    return 0;
}