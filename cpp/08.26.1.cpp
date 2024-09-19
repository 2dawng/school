#include <bits/stdc++.h>
using namespace std;

int main()
{
    int n;
    cin >> n;
    set<pair<int, int>> s;
    for (int i = 0; i < n; i++)
    {
        int x, y;
        cin >> x >> y;
        int d = abs(__gcd(x, y));
        s.insert({x / d, y / d});
    }
    cout << s.size();
}
