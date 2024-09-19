#include<bits/stdc++.h>
using namespace std;
int main(){
    int n,m,K;
    cin >> n >> m >> K;
    int a[n] = {};
    int L,R;
    for (int i = 1; i <= n; i++){ 
        cin >> L >> R;
        a[L]++;
        a[R]--;
    }
    partial_sum(a, a+m, a);
    int res = 0;
    for (int i = 0; i < m - 1; i++){
        if (a[i] >=K) {
            res++;
        }
            
    }
    cout << res;


}