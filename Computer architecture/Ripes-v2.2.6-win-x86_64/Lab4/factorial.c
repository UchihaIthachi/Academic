#include <stdio.h>

int factorial(int n);

int main() {
    int s;
    int n = 3;
    s = factorial(n);
    printf("%d", s);
}

int factorial(int n) {
    int c = 1;
    int i = 1; 
    while (i <= n) { 
        c *= i++;
    }
    return c;
}
