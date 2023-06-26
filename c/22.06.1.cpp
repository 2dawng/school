#include <bits/stdc++.h>
using namespace std;

void print(int arr, int x, int y) {
    for (int i = 0; i < x; i++)
        for (int j = 0; j < y; j++)
            printf("%d", arr[i][j]);
}

int main() {
    // char inp[100];
    // scanf("%s", inp);
    freopen("inp.inp", "r", stdin);

    int x, y;
    scanf("%d %d", &x, &y);

    int arr[x][y]; 

    for (int i = 0; i < x; i++)
        for (int j = 0; j < y; j++)
            scanf("%d", &arr[i][j]);

    print(arr, x, y);
}
