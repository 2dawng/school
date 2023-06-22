#include<stdio.h>
// #include<string>
int fib(int n){
    int a = 0, b = 1, s = 1, temp = 0;
    if (n == 1) {b = 0; s = 0;}
    else for (int i = 2; i < n; i++){
        temp = b;
        b += a;
        a = temp;
        s += b;
    }
    return printf("so fibonacci thu %d la: %d\ntong cac so fibonacci la: %d", n, b, s);
}
// int palindrome(char n[]){
    
//     return n;
// }
int main(){
    int n;
    scanf("%d", &n);
    printf(" hi %d",n);
}