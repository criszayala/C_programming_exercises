#include <stdio.h>
#include <stdbool.h>

#define MIN_SUPPORTERS 1
#define MAX_SUPPORTERS 10
#define BASE_MEMBERSHIP_YEARS 5
#define SILVER_MEMBERSHIP_YEARS 10

typedef enum {
    BASE, SILVER, GOLD
} tMembershipType;

int main() {
    int supporterIds[MAX_SUPPORTERS];
    int supporterAges[MAX_SUPPORTERS];
    bool supporterRecords[MAX_SUPPORTERS];
    int membershipYears[MAX_SUPPORTERS];
    int numSupporters;
    int recoveredSupporters[MAX_SUPPORTERS];
    tMembershipType supporterMembershipTypes[MAX_SUPPORTERS];
    int sumaAge = 0;
    float averageAge = 0.0;
    int inputType;
    tMembershipType selectedMembershipType;
    int recoveredCount = 0;

    printf("INPUT DATA\n");
    printf("NUMBER OF SUPPORTERS(1-10)?\n");
    scanf("%d", &numSupporters);

    while (numSupporters < MIN_SUPPORTERS || numSupporters > MAX_SUPPORTERS) {
        printf("INVALID DATA, TRY AGAIN!\n");
        printf("NUMBER OF SUPPORTERS(1-10)?\n");
        scanf("%d", &numSupporters);
    }

    for (int i = 0; i < numSupporters; i++) {
        printf("SUPPORTER #%d\n", i + 1); 
        supporterIds[i] = i + 1;

        printf("AGE (AN INTEGER)?\n");
        scanf("%d", &supporterAges[i]);
        sumaAge += supporterAges[i];

        printf("HAS RECORDS (0-FALSE, 1-TRUE)?\n");
        scanf("%d", (int*)&supporterRecords[i]);

        printf("MEMBERSHIP YEARS (AN INTEGER)?\n");
        scanf("%d", &membershipYears[i]);

        if (membershipYears[i] <= BASE_MEMBERSHIP_YEARS) {
            supporterMembershipTypes[i] = BASE;
        } else if (membershipYears[i] <= SILVER_MEMBERSHIP_YEARS) {
            supporterMembershipTypes[i] = SILVER;
        } else {
            supporterMembershipTypes[i] = GOLD;
        }
    }

    if (numSupporters > 0) {
        averageAge = (float)sumaAge / numSupporters;
    }

    printf("LOOKING FOR SUPPORTERS\n");
    printf("MEMBERSHIP TYPE (1-BASE, 2-SILVER, 3-GOLD)?\n");
    scanf("%d", &inputType);

    while (inputType < 1 || inputType > 3) {
        printf("INVALID TYPE, TRY AGAIN!\n");
        printf("MEMBERSHIP TYPE (1-BASE, 2-SILVER, 3-GOLD)?\n");
        scanf("%d", &inputType);
    }

    switch (inputType) {
        case 1: selectedMembershipType = BASE; break;
        case 2: selectedMembershipType = SILVER; break;
        case 3: selectedMembershipType = GOLD; break;
    }

    for (int i = 0; i < numSupporters; i++) {
        if (supporterMembershipTypes[i] == selectedMembershipType && 
            supporterAges[i] <= averageAge &&
            !supporterRecords[i]) {
            recoveredSupporters[recoveredCount++] = supporterIds[i];
        }
    }

    if (recoveredCount == 0) {
        printf("NO SUPPORTERS RECOVERED.\n");
    } else {
        printf("RESULTS\n");
        printf("AVERAGE SUPPORTER AGE: %.2f\n", averageAge);
        for (int i = 0; i < recoveredCount; i++) {
            int id = recoveredSupporters[i];
            printf("SUPPORTER ID: %d\n", id);
            printf("AGE: %d\n", supporterAges[id - 1]);
            printf("HAS RECORDS (0-FALSE, 1-TRUE): %d\n", supporterRecords[id - 1] ? 1 : 0);
            printf("MEMBERSHIP TYPE: %d\n", supporterMembershipTypes[id - 1]);
        }
    }

    return 0;
}
