#include<stdio.h>
// #include<string.h>

int main(){
    // ios_base::sync_with_stdio(false);cin.tie(NULL);cout.tie(NULL);
    char file[1000];
    scanf("%s", &file);
    freopen(file,"r",stdin);
    // freopen("out.out","w",stdout);
    int a, x, y, temp = 0;
    scanf("%d", &a);
    for (int i=0; i<a; i++){
        scanf("%d%d", &x, &y);
        if (y > 0)
            temp++;
    }
    printf("%d", temp);
}