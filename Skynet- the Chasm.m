#include <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    int road; // the length of the road before the gap.
    scanf("%d", &road);
    int gap; // the length of the gap.
    scanf("%d", &gap);
    int platform; // the length of the landing platform.
    scanf("%d", &platform);

    // game loop
    while (1) {
        int speed; // the motorbike's speed.
        scanf("%d", &speed);
        int coordX; // the position on the road of the motorbike.
        scanf("%d", &coordX);

        // Write an action using printf(). DON'T FORGET THE TRAILING NEWLINE \n
        // To debug: fprintf(stderr, [@"Debug messages\n" UTF8String]);
         // A single line containing one of 4 keywords: SPEED, SLOW, JUMP, WAIT.
    
        fprintf(stderr, [[NSString stringWithFormat:@"coordX: %d, road: %d", coordX, road] UTF8String]);

        if (coordX < road && coordX + speed + 1 > road + gap) {
            printf([@"JUMP\n" UTF8String]);
        }
        else if (coordX > road - speed) {
            printf([@"SLOW\n" UTF8String]);
        }
        else {
            if (speed == gap + 1) {
                printf([@"WAIT\n" UTF8String]);
            } else if (speed < gap + 1) {
                printf([@"SPEED\n" UTF8String]);
            } else {
                printf([@"SLOW\n" UTF8String]);
            }
        }
    
    }
}