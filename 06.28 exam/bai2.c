#include <stdio.h>
#include <limits.h>

int doc_va_in(int (*arr)[100]) {
    int n;
    scanf("%d", &n);
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            scanf("%d", &arr[i][j]);
            printf("%d ", arr[i][j]);
        }
        printf("\n");
    }
    return n;
}

int max_arr(int (*arr)[100], int n) {
    int max = INT_MIN;
    for (int i = n - 1; i >= 0; i--) {
        for (int j = n - i; j < n; j++) {
            if (arr[i][j] % 2 == 1 && arr[i][j] > max) {
                max = arr[i][j];
            }
        }
    }
    printf("%d", max);
    return max;
}

int main() {
    int arr[100][100];
    freopen("inp.inp", "r", stdin);
    freopen("out.out", "w", stdout);
    int n = doc_va_in(arr);
    int max = max_arr(arr, n);
    return 0;
}
