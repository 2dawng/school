#include<bits/stdc++.h>
using namespace std;


void NhapGiaTri(int a, int arr[1000]){
    // cin >> a;
    for(int i = 0; i < a; i++){
        cin >> arr[i];
    }
    // return arr[0];

}

long double TinhS(int n, int m, int d1, int d2, int arr1[1000], int arr2[1000]){
    long long p, q;
    long double s;
    for(int i = 0; i < n; i++){
        p += arr1[i] * pow(d1, i);
        cout << "p"<< i << ": " << p << " " << arr1[i] << " " << pow(d1, i) << "\n";
    }
    for(int i = 0; i < n; i++){
        q += arr2[i] * pow(d2, i);
    }
    cout << p << " " << q;
    s = sqrt(p - q) - 2023;
    cout << s;
    return(s);
}

int main(){
    int n, m, arr_p[1000], arr_q[1000], d1, d2;
    cin >> n;
    NhapGiaTri(n, arr_p);
    // cout<<n<<" "<<arr_p[0]<<" "<<arr_p[1]<<" "<<arr_p[2];
    cin >> m;
    NhapGiaTri(m, arr_q);
    cin >> d1 >> d2;
    cout << TinhS(n, m, d1, d2, arr_p, arr_q);
    
}