#include <bits/stdc++.h>
using namespace std;
int main()
{
    int n;
    cin >> n;
    set<pair<int, int>> s;
    int cnt = 0;
    for (int i = 0; i < n; i++)
    {
        int a, b;
        cin >> a >> b;
        int d = abs(__gcd(a, b));
        auto res = s.insert({a / d, b / d});
        if (res.second == false)
            cnt++;
    }
    cout << cnt;
    return 0;
}
