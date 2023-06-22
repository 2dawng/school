#include<iostream>
using namespace std;
typedef long long ll;

int *reqa(int *n, int*m){
    cin>>*n>>*m;
    int *arr = new int[*n][*m];
    for (int i=0; i<*n; i++)
        for (int j=0; j<*m; j++)
            cin>>arr[i][j];
    return arr;
}

int main(){
    int *n, *m;
    int *arr = new int[*n][*m];
    arr = reqa(n, m);

}