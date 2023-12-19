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
	
	/* Exercise 2.4 */	
	/* Supporters table initialization */
	/* ... */
	
	/* load data from file*/ 
    printf("LOAD DATA FROM FILE. ENTER FILE NAME:\n");
    scanf("%s", filename);	
    /* ... */	
	
	/* Data processing */
	if (retVal == OK) {	
		/* Show supporters list loaded */
		/* ... */	
		
		/* Exercise 2.5 */
		/* Select a supporter by ID */
		/* Data input */
		printf("SELECT SUPPORTER (ID):\n");
		scanf("%d", &supporterId);
		/* Recover supporter's ticket list */		
		/* ... */	
		
		/* Show the list of supporter's tickets and the average spending of the selected event */
		if (retVal == OK) {			
			for (i = 0; i < supporter.tickets.nTickets; i++){
				/* ... */	
			}	
			printf("\n");
			/* Select a event type */
            printf("SELECT EVENT (1-FOOTBALL MATCH, 2-CONCERT, 3-EXPO): ");		
            /* ... */		
		}
		else {
			/* No data recovered */
			/* ... */
		}
	}	
	else {
		/* No data recovered */
		/* ... */	
	}
	
	return 0;
}