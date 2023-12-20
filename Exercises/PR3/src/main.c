#include <stdio.h>
#include <string.h>
#include "stadium.h"

int main(int argc, char **argv)
{
	tSupporterTable tabSupporters;
	tSupporter supporter;
	char filename[MAX_FILENAME_LENGTH];
	tError retVal;	
	int supporterId;
	int i;
    tEventType eventType;
    float averageSpending;
	
	/* Exercise 2.4 */	
	supporterTableInit(&tabSupporters); 
    printf("LOAD DATA FROM FILE. ENTER FILE NAME:\n");
    scanf("%s", filename);	
    supportersTableLoad(&tabSupporters, filename, &retVal);
	
	if (retVal == OK) {
        writeTabSupporters(tabSupporters);
		
		/* Exercise 2.5 */
        printf("SELECT SUPPORTER (ID):\n");
        scanf("%d", &supporterId);
        selectSupporter(tabSupporters, supporterId, &supporter, &retVal);
		
		if (retVal == OK) {
            for (i = 0; i < supporter.tickets.nTickets; i++) {
                writeTicket(supporter.tickets.table[i]);
            }
            printf("SELECT EVENT TYPE (1-FOOTBALL MATCH, 2-CONCERT, 3-EXPO): ");
            scanf("%d", &eventType);
            averageSpending = averageSpendingByEvent(supporter, eventType);
            printf("AVERAGE SPENDING: %.2f\n", averageSpending);
        } else {
            printf("NO SUPPORTER RECOVERED\n");
        }
    } else {
        printf("NO SUPPORTERS RECOVERED\n");
    }
    
    return 0;
}