#include <stdio.h>
#include <string.h>
#include <stdbool.h>

//Defino las constantes
#define NUM_SUPPORTERS 3
#define BASE_MEMBERSHIP_YEARS 5
#define SILVER_MEMBERSHIP_YEARS 10
#define BASE_MEMBERSHIP_POINTS 10
#define SILVER_MEMBERSHIP_POINTS 15
#define GOLD_MEMBERSHIP_POINTS 20
#define RECORDS_PENALTY_POINTS 5

//Defino los tipos de membresía (mismos que la PR1)
typedef enum {
    BASE, SILVER, GOLD
} tMembershipType;

//Defino la estructura para guardar la información del SUPPORTER (tupla)
typedef struct {
    char name[26];
    int age;
    int membershipYears;
    bool hasRecords;
    tMembershipType membershipType;
} tSupporter;

//Defino la función para copiar de un SUPPORTER a otro (tupla->tupla) 
void supporterCpy(tSupporter *supporterDst, tSupporter supporterSrc) {
    strcpy(supporterDst->name, supporterSrc.name);
    supporterDst->age = supporterSrc.age;
    supporterDst->membershipYears = supporterSrc.membershipYears;
    supporterDst->hasRecords = supporterSrc.hasRecords;
}

//Defino función que determina el tipo de membresía según los años
tMembershipType getMembershipType(int membershipYears) {
    if (membershipYears <= BASE_MEMBERSHIP_YEARS) {
        return BASE;
    } else if (membershipYears <= SILVER_MEMBERSHIP_YEARS) {
        return SILVER;
    } else {
        return GOLD;
    }
}

int getPoints(tSupporter supporter) {
    int points = 0;
    
    //Asigno puntuación dependiendo el tipo de membresía
    if (supporter.membershipType == BASE) {
        points = BASE_MEMBERSHIP_POINTS;
    } else if (supporter.membershipType == SILVER) {
        points = SILVER_MEMBERSHIP_POINTS;
    } else if (supporter.membershipType == GOLD) {
        points = GOLD_MEMBERSHIP_POINTS;
    }

    //Si el SUPPORTER tiene antecedentes aplico la penalización
    if (supporter.hasRecords) {
        points -= RECORDS_PENALTY_POINTS;
    }

    return points;
}

//Defino función para obtener información de los SUPPORTERS
void readSupporter(tSupporter *supporter) {
    printf("NAME (25 CHAR MAX, NO SPACES)?\n");
    scanf("%25s", supporter->name);
    
    printf("AGE (AN INTEGER)?\n");
    scanf("%d", &supporter->age);
    
    printf("MEMBERSHIP YEARS (AN INTEGER)?\n");
    scanf("%d", &supporter->membershipYears);
    
    int hasRecords;
    printf("HAS RECORDS (0-FALSE, 1-TRUE)?\n");
    scanf("%d", &hasRecords);
    supporter->hasRecords = hasRecords;
    supporter->membershipType = getMembershipType(supporter->membershipYears);
}

//Se define esta función para mostrar por pantalla la información del SUPPORTER
void writeSupporter(tSupporter supporter) {
    printf("NAME: %s\n", supporter.name);
    printf("AGE: %d\n", supporter.age);
    printf("MEMBERSHIP YEARS: %d\n", supporter.membershipYears);
    printf("HAS RECORDS (0-FALSE, 1-TRUE): %d\n", supporter.hasRecords);
    printf("MEMBERSHIP TYPE (1-BASE, 2-SILVER, 3-GOLD): %d\n", supporter.membershipType + 1);
    printf("POINTS: %d\n", getPoints(supporter));
}

int main() {
    tSupporter supporters[NUM_SUPPORTERS];
    tSupporter selectedSupporter;
    int i, maxPoints, currentPoints;

    //Solicito al usuario que ingrese los datos de cada SUPORTERS
    printf("INPUT DATA\n");
    for (i = 0; i < NUM_SUPPORTERS; i++) {
        readSupporter(&supporters[i]);
    }

    selectedSupporter = supporters[0];
    maxPoints = getPoints(selectedSupporter);

    //Esto me sirve para identificar el SUPPORTER que tiene más puntos
    for (i = 1; i < NUM_SUPPORTERS; i++) {
        currentPoints = getPoints(supporters[i]);
        if (currentPoints > maxPoints ||
            (currentPoints == maxPoints && supporters[i].membershipYears > selectedSupporter.membershipYears)) {
            supporterCpy(&selectedSupporter, supporters[i]);
            maxPoints = currentPoints;
        }
    }
    //Se muestra por pantalla el SUPPORTER seleccionado
    printf("SELECTED SUPPORTER\n");
    writeSupporter(selectedSupporter);

    getchar();  //Se limpia el buffer del último '\n'
    getchar();  //Se Espera una entrada del teclado antes de cerrar la terminal
    return 0;
}