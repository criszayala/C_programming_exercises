#include <stdio.h>
#include <stdbool.h>

//Se definen las constantes
#define MIN_SUPPORTERS 1
#define MAX_SUPPORTERS 10
#define BASE_MEMBERSHIP_YEARS 5
#define SILVER_MEMBERSHIP_YEARS 10

int main() {
    //Se declaran las variables y arreglos
    int supporterIds[MAX_SUPPORTERS];
    int supporterAges[MAX_SUPPORTERS];
    bool supporterRecords[MAX_SUPPORTERS];
    int membershipYears[MAX_SUPPORTERS];
    int recoveredSupporters[MAX_SUPPORTERS];
    int supporterMembershipTypes[MAX_SUPPORTERS];
    int numSupporters;
    int inputType;
    int selectedMembershipType;
    int sumaAge = 0;
    int recoveredCount = 0;
    float averageAge = 0.0;
        
    //Se realiza la solicitud de cantidad de SUPPORTERS
    printf("INPUT DATA\n");
    printf("NUMBER OF SUPPORTERS (1-10)?\n");
    scanf("%d", &numSupporters);

    //Se realiza validación del número de SUPPORTERS ingresado
    while (numSupporters < MIN_SUPPORTERS || numSupporters > MAX_SUPPORTERS) {
        printf("INVALID DATA, TRY AGAIN!\n");
        printf("NUMBER OF SUPPORTERS(1-10)?\n");
        scanf("%d", &numSupporters);
    }

    //Se recogen los datos de cada SUPPORTERS
    for (int i = 0; i < numSupporters; i++) {
        printf("SUPPORTER #%d\n", i + 1);

        printf("ID (AN INTEGER)?\n");
        scanf("%d", &supporterIds[i]);

        printf("AGE (AN INTEGER)?\n");
        scanf("%d", &supporterAges[i]);
        sumaAge += supporterAges[i];

        printf("HAS RECORDS (0-FALSE, 1-TRUE)?\n");
        scanf("%d", (int*)&supporterRecords[i]);

        printf("MEMBERSHIP YEARS (AN INTEGER)?\n");
        scanf("%d", &membershipYears[i]);

        //Se realiza la asignación del tipo de membresía
        if (membershipYears[i] <= BASE_MEMBERSHIP_YEARS) {
            supporterMembershipTypes[i] = 1; //BASE
        } else if (membershipYears[i] <= SILVER_MEMBERSHIP_YEARS) {
            supporterMembershipTypes[i] = 2; //SILVER
        } else {
            supporterMembershipTypes[i] = 3; //GOLD
        }
    }
    //Si es mayor a cero se realiza el cálculo de la edad promedio
    if (numSupporters > 0) {
        averageAge = (float)sumaAge / numSupporters;
    }
    
    //Se solicita el tipo de membresía para luego realizar la búsqueda
    printf("LOOKING FOR SUPPORTERS\n");
    printf("MEMBERSHIP TYPE (1-BASE, 2-SILVER, 3-GOLD)?\n");
    scanf("%d", &selectedMembershipType);

    //Se valida el valor ingresado de la membresía, en caso de ingresar valor inválido se despliega mensaje de error
    while (selectedMembershipType < 1 || selectedMembershipType > 3) {
        printf("INVALID TYPE, TRY AGAIN!\n");
        printf("MEMBERSHIP TYPE (1-BASE, 2-SILVER, 3-GOLD)?\n");
        scanf("%d", &selectedMembershipType);
    }

    //Se realiza búsqueda de SUPPORTERS que cumplen con el criterio solicitado
    for (int i = 0; i < numSupporters; i++) {
        if (supporterMembershipTypes[i] == selectedMembershipType &&
            supporterAges[i] <= averageAge &&
            !supporterRecords[i]) {
            recoveredSupporters[recoveredCount++] = supporterIds[i];
        }
    }

    //Se imprime por pantalla los resultados
    printf("RESULTS\n");
    if (recoveredCount == 0) {
        printf("AVERAGE SUPPORTER AGE: %.2f\n", averageAge);
        printf("NO SUPPORTERS RECOVERED.\n");
    } else {
        printf("AVERAGE SUPPORTER AGE: %.2f\n", averageAge);

        for (int i = 0; i < recoveredCount; i++) {
            int id = recoveredSupporters[i];
            printf("SUPPORTER ID: %d\n", id);
            printf("AGE: %d\n", supporterAges[id - 1]);
            printf("HAS RECORDS (0-FALSE, 1-TRUE): %d\n", supporterRecords[id - 1]);

            //Se realiza impresión del tipo de membresía
            printf("MEMBERSHIP TYPE (1-BASE, 2-SILVER, 3-GOLD): %d\n", supporterMembershipTypes[id - 1]);
        }
    }
    
    getchar();  //Se limpia el buffer del último '\n'
    getchar();  //Se Espera una entrada del teclado antes de cerrar la terminal
    return 0;
}