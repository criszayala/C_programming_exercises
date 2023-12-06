#ifndef LIGHTBULB_H
#define LIGHTBULB_H
#include <stdio.h>

//Realizo la creación de la estructura que contiene características de la bombilla
typedef struct {
    char id[11];
    int efficacy;
    float price;
    char Class;
} Bulb;

//Realizo la declaración de las funciones
char classifyEfficacy(int efficacy);
void transferBulb(const Bulb *source, Bulb *target);
void getInputBulb(Bulb *newBulb);
void pickBestBulb(const Bulb *first, const Bulb *second, Bulb *best);
void showBulb(const Bulb *bulb);

#endif