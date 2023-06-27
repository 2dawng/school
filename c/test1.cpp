#include<stdio.h>
#include<algorithm>

struct toado
{
    float x, y;
};
bool sorter(toado const& lhs,toado const& rhs)
    {return lhs.x < rhs.x;}

int main(){
    // char file[1000];
    // scanf("%s", &file);
    freopen("inp.inp","r",stdin);
    freopen("out.out","w",stdout);
    int n, out = 0, in = 0;
    scanf("%d", &n);
    toado arr[n];
    for (int i=0; i<n; i++){
        scanf("%f%f", &arr[i].x, &arr[i].y);
        printf("%f %f\n", arr[i].x, arr[i].y);
        printf("%f\n", arr[i].x * arr[i].x + arr[i].y * arr[i].y);
        if (arr[i].x * arr[i].x + arr[i].y * arr[i].y > 25)
            out++;
        else if (arr[i].x * arr[i].x + arr[i].y * arr[i].y < 25)
                in++;
    }
    printf("%d %d\n", in, out);
    std::sort(arr, arr + n, sorter);

    for (int i=0; i<n; i++)
        printf("%f %f:%d\n", arr[i].x, arr[i].y, i);
    printf("next\n");
    
    for (int i = 0; i < n; i++){
        for (int j = i+1; j < n; j++){
            if (arr[i].x = -arr[j].x){
                if(arr[i].y = -arr[j].y)
                printf("x:%f %f y:%f %f :%d %d\n",
                        arr[i].x,
                        arr[i].y,
                        arr[j].x,
                        arr[j].y,
                        i,
                        j);
            }
            else if(arr[i].x < -arr[j].x)
                break;
        }
    }
}