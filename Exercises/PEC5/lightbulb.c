#include <stdio.h>
#include "lightbulb.h"

//Defino las constantes relacionadas a la eficiencia (información de la tabla del enunciado)
const int EFFICACY_A = 210;
const int EFFICACY_B = 185;
const int EFFICACY_C = 160;
const int EFFICACY_D = 135;
const int EFFICACY_E = 110;
const int EFFICACY_F = 85;

//Seguidamente hago la clasificación y retorno la clase correspondiente
char classifyEfficacy(int efficacy) {
    if (efficacy >= EFFICACY_A) return 'A';
    else if (efficacy < EFFICACY_A && efficacy >= EFFICACY_B) return 'B';
    else if (efficacy < EFFICACY_B && efficacy >= EFFICACY_C) return 'C';
    else if (efficacy < EFFICACY_C && efficacy >= EFFICACY_D) return 'D';
    else if (efficacy < EFFICACY_D && efficacy >= EFFICACY_E) return 'E';
    else if (efficacy < EFFICACY_E && efficacy >= EFFICACY_F) return 'F';
    else return 'G';
}

void transferBulb(const Bulb *source, Bulb *target) {
    *target = *source;
}

//Solicito al usuario la información de la bombilla
void getInputBulb(Bulb *newBulb) {
    printf("ID?\n");
    scanf("%10s", newBulb->id);
    printf("EFFICIENCY?\n");
    scanf("%d", &newBulb->efficacy);
    printf("PRICE?\n");
    scanf("%f", &newBulb->price);
    newBulb->energyClass = classifyEfficacy(newBulb->efficacy);
}

//Comparo las dos bombillas y selecciono la mejor teniendo en cuenta el precio y la eficiencia
void pickBestBulb(const Bulb *first, const Bulb *second, Bulb *best) {
    if (first->energyClass < second->energyClass) {
        transferBulb(first, best);
    } else if (first->energyClass > second->energyClass) {
        transferBulb(second, best);
    } else if (first->price < second->price) {
        transferBulb(first, best);
    } else {
        transferBulb(first, best);
    }
}

//Por último imprimo por pantalla la mejor opción con sus características
void showBulb(const Bulb *bulb) {
    printf("ID: %s\n", bulb->id);
    printf("EFFICIENCY: %d\n", bulb->efficacy);
    printf("PRICE: %.2f\n", bulb->price);
    printf("ENERGY CLASS: %c\n", bulb->energyClass);
}