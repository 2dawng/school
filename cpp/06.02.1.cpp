#include<stdio.h>
#include<string.h>

struct SV
{
    char ht[30];
    float dtp, dt;
};

int main(){
    freopen("inp.inp","r",stdin);
    freopen("out.out","w",stdout);

    SV b;
    
    // fgets(a.ht, 30, stdin);
    // // fflush();
    // a.ht[strlen(a.ht)-1] = '\0';
    // scanf("%f%f ", &a.dtp, &a.dt);
    // printf("Ho ten:%s, dtp:%f, dt:%f\n", a.ht, a.dtp, a.dt);
    char a;
    while(scanf("%s", a) != EOF){
    fgets(b.ht, 30, stdin);
    b.ht[strlen(b.ht)-1] = '\0';
    scanf("%f%f ", &b.dtp, &b.dt);
    printf("Ho ten:%s, dtp:%f, dt:%f\n", b.ht, b.dtp, b.dt);
    }

    // while(scanf("%s", words) != EOF)

}