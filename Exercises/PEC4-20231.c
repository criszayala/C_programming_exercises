#include <stdio.h>

#define ECONOMY_CLASS 0
#define BUSINESS_CLASS 1
#define FIRST_CLASS 2

typedef struct {
    int days, hours, minutes;
} WaitingTime;

typedef struct {
    char id[21];
    int classType;
    WaitingTime layover;
    int numberOfStops;
} Flight;

int main() {
    Flight flight1, flight2;
    int totalMinutesFlight1, totalMinutesFlight2;

    // Lectura de datos para ambos vuelos
    for (int i = 0; i < 2; ++i) {
        Flight *flight = (i == 0) ? &flight1 : &flight2;
        printf("FLIGHT %d\nEnter ID, Class (0-Tourist, 1-Business, 2-First), Layover (Days, Hours, Minutes), and Connections:\n", i + 1);
        scanf("%20s %d %d %d %d %d", flight->id, &flight->classType, &flight->layover.days, &flight->layover.hours, &flight->layover.minutes, &flight->numberOfStops);
    }

    // Convertir el tiempo de espera a minutos
    totalMinutesFlight1 = flight1.layover.days * 1440 + flight1.layover.hours * 60 + flight1.layover.minutes;
    totalMinutesFlight2 = flight2.layover.days * 1440 + flight2.layover.hours * 60 + flight2.layover.minutes;

    // Comparación y determinación del vuelo más cómodo
    Flight *mostConvenient = &flight2; // Default to the last flight if all else is equal
    if (flight1.classType > flight2.classType ||
        (flight1.classType == flight2.classType && totalMinutesFlight1 < totalMinutesFlight2) ||
        (flight1.classType == flight2.classType && totalMinutesFlight1 == totalMinutesFlight2 && flight1.numberOfStops < flight2.numberOfStops)) {
        mostConvenient = &flight1;
    }

    printf("MOST CONVENIENT FLIGHT: %s\n", mostConvenient->id);

    return 0;
}
