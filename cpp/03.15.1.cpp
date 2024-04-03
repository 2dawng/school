#include <bits/stdc++.h>
using namespace std;
int main()
{
    int money;
    int currency[] = {1, 2, 5, 10, 50, 100};
    do
    {
        cout << "Nhap so tien muon rut:";
        cin >> money;
    } while (money <= 0);
    cout << "So to tien phai tra la:\n";
    for (int i = size(currency) - 1; i >= 0; i--)
    {
        if (money / currency[i] > 0)
        {
            cout << money / currency[i] << " to " << currency[i] << "k\n";
            money -= (money / currency[i]) * currency[i];
        }
    }
}
