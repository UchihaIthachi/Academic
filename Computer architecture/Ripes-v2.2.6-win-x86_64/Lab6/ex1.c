
asm("li sp, 0x100000"); // SP set to 1 MB
asm("jal main"); // call main
asm("mv a1, a0"); // save return value in a1
asm("li a7, 10"); // prepare ecall exit
asm("ecall"); // now your simulator should stop

#define W 2 // Matrix order

void mmul(const int a[W][W], const int b[W][W], int c[W][W]) {
    for (int row = 0; row < W; row++) {
        for (int col = 0; col < W; col++) {
            for (int k = 0; k < W; k++) {
                c[row][col] += a[row][k] * b[k][col];
            }
        }
    }
}

int main() {
    int A[W][W];
    A[0][0] = 3;
    A[0][1] = 4;
    A[1][0] = 5;
    A[1][1] = 6;
    int B[W][W];
    B[0][0] = 9;
    B[0][1] = 10;
    B[1][0] = 11;
    B[1][1] = 12;
    int C[W][W];
    mmul(A, B, C);
    return 0;
}