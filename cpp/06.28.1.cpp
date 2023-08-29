#include <cstdio>

void print_matrix(int arr[100][100], int m, int n) {
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            printf("%d ", arr[i][j]);
        }
        printf("\n");
    }
}

void average(int arr[100][100], int m, int n) {
    int sum = 0;
    int count = 0;
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            if (arr[i][j] % 2 == 0 && arr[i][j] % 3 == 1) {
                sum += arr[i][j];
                count++;
            }
        }
    }
    if (count == 0) {
        printf("No such element found!");
    } 
    else {
        printf("The average is: %g\n", (double) sum / count);
    }
}


void total_of_row(int arr[100][100], int m, int n) {
    int rowTotal;
    for (int i = 0; i < m; i++) { // iterate through each row
        rowTotal = 0;
        for (int j = 0; j < n; j++) { // iterate through each column in current row
            rowTotal += arr[i][j]; // add current element to rowTotal
        }
        printf("Total of row %d: %d\n", i+1, rowTotal);
    }
}


int main() {
    int m, n;
    char inp[80];scanf("%[^\n]s", inp);
    freopen("inp.inp", "r", stdin);
    freopen("out.out", "w", stdout);
    printf("11234\n");
    scanf("%d %d", &m, &n);
    int arr [100] [100];                 // Can't assign to 1000
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++){
            scanf("%d", &arr [i] [j]);
        }   
    }
    print_matrix(arr, m, n);
    average(arr, m, n);
    total_of_row(arr, m, n);
}
