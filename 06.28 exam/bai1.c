#include <stdio.h>

int doc_va_in(float *arr) {
    int i = 0;
    scanf("%f", &i);
    i = 0;
    while (scanf("%f", &arr[i]) == 1) {
        printf("%g ", arr[i]);
        i++;
    }

    return i;
}

void min(float *arr, int i) {
    float min = arr[0];
    int occur = 1;
    for (int j = 1; j < i; j++) {
        if (arr[j] == min)
            occur++;
        else if (arr[j] < min) {
            min = arr[j];
            occur = 1;
        }
    }
    printf("\nGia tri nho nhat la: %g xuat hien %d lan", min, occur);
}

int main() {
    float arr[100];
    freopen("inp.inp", "r", stdin);
    freopen("out.out", "w", stdout);
    int i = doc_va_in(arr);
    min(arr, i);
    return 0;
}
