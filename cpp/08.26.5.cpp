#include <bits/stdc++.h>
using namespace std;
int main()
{
    int n;
    cin >> n;
    int a[n], al[n], ar[n], tong = 0;
    cin >> a[0];
    for (int i = 1; i < n; i++)
    {
        cin >> a[i];
        al[i] = max(a[i], al[i - 1]);
    }
    for (int i = n - 2; i > 0; i--)
    {
        ar[i] = max(a[i], ar[i + 1]);
    }
    for (int i = 1; i < n - 1; i++)
    {
        tong += (min(al[i], ar[i])) - a[i];
        cout << (min(al[i], ar[i])) - a[i] << " ";
    }
    cout << endl
         << tong;
}