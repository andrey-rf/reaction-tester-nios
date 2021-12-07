#include <stdlib.h>
#include <sys/time.h>
#include <time.h>

#define keys (volatile char*) 0x0003020
#define ledr (volatile char*) 0x0003030
#define ledg (volatile char*) 0x0003010

float time_difference_msec(struct timeval start, struct timeval end) {
    return (end.tv_sec - start.tv_sec) * 1000.0f + (end.tv_usec - start.tv_usec) / 1000.0f;
}


void sleep(unsigned duration) {
    time_t start = time(NULL);
    double end = duration;
    time_t now;
    
    do {
    	now = time(NULL);
        now = now + 1;
	} while (difftime(now, start) < end);
}


void delay() {
    struct timeval start;
    struct timeval end;
    float dif;
    
    int r = rand() % 5;
    
    sleep(r);
    *ledg = 511.0f;
    gettimeofday(&start, 0);
    
    while (1) {
    	gettimeofday(&end, 0);
        dif = time_difference_msec(start, end);
        
      	*ledr = dif;
        
    	if (*(keys + 1) != 0) {
        	break;
        }
    }
}


int main(){
	while(1) {
    	if (*keys != 0) {
        	delay();
        }
	}
	return 0;
}
