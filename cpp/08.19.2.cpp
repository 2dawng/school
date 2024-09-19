#include <bits/stdc++.h>
using namespace std;
int main()
{
    int L = 0, n, a, res = 0;
    map<int, int> mp;
    cin >> n;
    for (int R = 1; R <= n; R++)
    {
        cin >> a;
        if (mp.find(a) != mp.end() && L < mp[a])
            L = mp[a];
        res = max(res, R - L);
        mp[a] = R;
    }
    cout << res;
    return 0;
}
