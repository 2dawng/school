#include<stdio.h>

int main(){
    // ios_base::sync_with_stdio(false);cin.tie(NULL);cout.tie(NULL);
    freopen("inp.inp","r",stdin);
    freopen("out.out","w",stdout);
    int x, y, temp = 0;
    scanf("%d%d", &x, &y);
    int arr[x][y];

    for (int i=0; i<x; i++)
        for (int j=0; j<y; j++){
            scanf("%d", &arr[i][j]);
            temp+=arr[i][j];
        }
    for (int i=0; i<x; i++){
        for (int j=0; j<y; j++){
            printf("%d ", arr[i][j]);
        }
        printf("\n");
    }
    float f = float(temp)/float(x*y);
    printf("%f", f);
}
