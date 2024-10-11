#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int gcd(int a, int b) {
	if (a == 0) return b;
	if (b == 0) return a;
	int q = a / b;
	int r = a % b;
	return gcd(b, r);
}

int main() {
	printf("%d\n", gcd(270, 192));
}