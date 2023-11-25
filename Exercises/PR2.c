#include <stdio.h>
#include <string.h>
#include <stdbool.h>

#define NUM_SUPPORTERS 3
#define BASE_MEMBERSHIP_YEARS 5
#define SILVER_MEMBERSHIP_YEARS 10
#define BASE_MEMBERSHIP_POINTS 10
#define SILVER_MEMBERSHIP_POINTS 15
#define GOLD_MEMBERSHIP_POINTS 20
#define RECORDS_PENALTY_POINTS 5

typedef enum {
    BASE, SILVER, GOLD
} tMembershipType;

typedef struct {
    char name[26];
    int age;
    int membershipYears;
    bool hasRecords;
    tMembershipType membershipType;
} tSupporter;

void supporterCpy(tSupporter *supporterDst, tSupporter supporterSrc) {
    strcpy(supporterDst->name, supporterSrc.name);
    supporterDst->age = supporterSrc.age;
    supporterDst->membershipYears = supporterSrc.membershipYears;
    supporterDst->hasRecords = supporterSrc.hasRecords;
    // Note: Assuming membershipType is also to be copied
    supporterDst->membershipType = supporterSrc.membershipType;
}

tMembershipType getMembershipType(int membershipYears) {
    if (membershipYears <= BASE_MEMBERSHIP_YEARS) {
        return BASE;
    } else if (membershipYears <= SILVER_MEMBERSHIP_YEARS) {
        return SILVER;
    } else {
        return GOLD;
    }
}

void readSupporter(tSupporter *supporter) {
    printf("Ingrese el nombre del seguidor (max 25 caracteres, sin espacios): ");
    scanf("%25s", supporter->name);
    
    printf("Ingrese la edad del seguidor (un entero): ");
    scanf("%d", &supporter->age);
    
    printf("Ingrese los años de membresía del seguidor (un entero): ");
    scanf("%d", &supporter->membershipYears);
    
    printf("El seguidor tiene antecedentes (0 para NO, 1 para SÍ): ");
    scanf("%d", (int *)&supporter->hasRecords);

    supporter->membershipType = getMembershipType(supporter->membershipYears);
}

int getPoints(tSupporter supporter) {
    int points = 0;
    switch (supporter.membershipType) {
        case BASE: points = BASE_MEMBERSHIP_POINTS; break;
        case SILVER: points = SILVER_MEMBERSHIP_POINTS; break;
        case GOLD: points = GOLD_MEMBERSHIP_POINTS; break;
    }

    if (supporter.hasRecords) {
        points -= RECORDS_PENALTY_POINTS;
    }

    return points;
}

void writeSupporter(tSupporter supporter) {
    printf("Nombre: %s\n", supporter.name);
    printf("Edad: %d\n", supporter.age);
    printf("Años de Membresía: %d\n", supporter.membershipYears);
    printf("Tiene Antecedentes: %d\n", supporter.hasRecords);
    printf("Tipo de Membresía: %d\n", supporter.membershipType);
}

int main() {
    tSupporter supporters[NUM_SUPPORTERS];
    tSupporter selectedSupporter;
    int i, maxPoints, currentPoints;

    printf("DATOS DE ENTRADA\n");
    for (i = 0; i < NUM_SUPPORTERS; i++) {
        readSupporter(&supporters[i]);
    }

    selectedSupporter = supporters[0];
    maxPoints = getPoints(selectedSupporter);

    for (i = 1; i < NUM_SUPPORTERS; i++) {
        currentPoints = getPoints(supporters[i]);
        if (currentPoints > maxPoints ||
            (currentPoints == maxPoints && supporters[i].membershipYears > selectedSupporter.membershipYears)) {
            supporterCpy(&selectedSupporter, supporters[i]);
            maxPoints = currentPoints;
        }
    }

    printf("SEGUIDOR SELECCIONADO\n");
    writeSupporter(selectedSupporter);

    return 0;
}
