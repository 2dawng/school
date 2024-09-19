#include <bits/stdc++.h>
using namespace std;
int main()
{
    int n, M;
    cin >> n >> M;
    int a[n];
    for (auto &x : a)
        cin >> x;
    queue<int> Q;
    map<int, int> mp = {{0, 0}};
    Q.push(0);
    while (Q.size() and mp.count(M) == 0)
    {
        int u = Q.front();
        Q.pop();
        for (auto x : a)
            if (u + x <= M and mp.count(u + x) == 0)
            {
                Q.push(u + x);
                mp[u + x] = mp[u] + 1;
            }
    }
    if (mp.find(M) != mp.end())
        cout << mp[M];
    else
        cout << "khong doi duoc";
    return 0;
}