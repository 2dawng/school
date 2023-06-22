#include<iostream>
using namespace std;

int factorial(int a){
    int ans = 1;
    for (int i = 2; i <= a; i++)
        ans *= i;
    return ans;
}

int main(){
    freopen("inp.inp","r",stdin);
    freopen("out.out","w",stdout);

    int n, out = 0, in = 0;
    cin>>n;
    int x[n], y[n];
    for (int i = 0; i < n; i++){
        cin >> x[i] >> y[i];
        // cout << (x[i] * x[i]) + (y[i] * y[i]) << "\n";
        if((x[i] * x[i]) + (y[i] * y[i]) > 25)
            out++;
        else if((x[i] * x[i]) + (y[i] * y[i]) < 25)
            in++;
    }
    cout << "Co " << in << " phan tu nam trong duong tron va "
    << out << " phan tu nam ngoai duong tron\nCo " <<
    factorial(in)/(factorial(in - 2) * 2) << 
    " duong thang noi tu 2 diem trong duong tron";
    
}