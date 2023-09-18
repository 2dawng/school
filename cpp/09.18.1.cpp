#include<bits/stdc++.h>
using namespace std;
void thap_ha_noi(int a, int b, int c, int n)
{
    if (n == 0)return;
    thap_ha_noi(a, b, c, n - 1);
    cout << a << " " << b << "\n";
    thap_ha_noi(b, c, a, n - 1);
}
int main(){
    int n , dem = 1;
    cin >> n;
    int a = 1, b = 2, c = 3;
    cout << pow(2, n) - 1 << endl;
    thap_ha_noi(a, b, c, n, dem);
}