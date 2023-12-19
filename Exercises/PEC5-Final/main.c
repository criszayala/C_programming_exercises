#include "lightbulb.h"

int main() {
    Bulb firstBulb, secondBulb, bestBulb;

    printf("INPUT\n");
    printf("LIGHT BULB 1\n");
    getInputBulb(&firstBulb);
    printf("LIGHT BULB 2\n");
    getInputBulb(&secondBulb);

    pickBestBulb(&firstBulb, &secondBulb, &bestBulb);

    printf("OUTPUT\n");
    printf("BEST LIGHT BULB\n");
    showBulb(&bestBulb);

    getchar();
    getchar();

    return 0;
}
