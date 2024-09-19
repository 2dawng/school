#include <bits/stdc++.h>
using namespace std;
int main()
{
    int n, M, a, T = 0, res = 0;
    map<int, int> mp = {{0, 0}};
    cin >> n >> M;
    for (int i = 1; i <= n; i++)
    {
        cin >> a;
        T += a;
        if (mp.count(T - M))
            res = max(res, i - mp[T - M]);
        if (!mp.count(T))
            mp[T] = i;
    }
    cout << res;
    return 0;
}