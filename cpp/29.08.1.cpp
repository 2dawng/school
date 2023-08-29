#include <bits/stdc++.h>
using namespace std;

int main()
{
    int n, a, b, c, nc, ans, temp;
    cin >> n;
    for (int i = 0; i < n; i++)
    {
        cin >> a >> b >> c;
        nc = a / b;
        ans = a / b;
        while (nc >= c) 
        {
            temp = nc / c;
            ans += nc / c;
            nc = nc % c;
            nc += temp;
        }
        cout << ans << "\n";
    }
}