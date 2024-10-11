#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

unsigned int greet(unsigned int n) {
	if (n == 1) return 0;
	return (n-1) + greet(n-1);
}

int main() {
	printf("%d\n", greet(7));
	printf("%d\n", greet(10));
}