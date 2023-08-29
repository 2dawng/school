#include <bits/stdc++.h>

using namespace std;

struct SV
{
    long long sbd;
    short diem;
    string HT;
};

bool sorter(const SV& lhs, const SV& rhs) {
    return lhs.diem > rhs.diem;
}

istream &operator >> (istream &inp, SV &a)
{
    cout << "Nhap ho ten: ";
    fflush(stdin);
    getline(inp, a.HT);
    cout << "Nhap so bao danh: ";
    inp >> a.sbd;
    cout << "Nhap diem: ";
    inp >> a.diem;
    return inp;
}

ostream& operator<<(ostream& out, const SV& a)
{
    out << "\tSo bao danh: " << a.sbd << " - Ho ten: " << a.HT << " - Diem: " << a.diem << "\n";
    return out;
}
// SV *nhap(int &n)
// {
//     cout << "Nhap so sinh vien: ";
//     cin >> n;
//     SV *a;
//     a = new SV[n];
//     for (int i = 0; i < n; i++)
//     {
//         cout << "Nhap thong tin cho sinh vien thu " << i + 1 << ": " << endl;
//         cin >> a[i];
//     }
//     return a;
// }
int main()
{
    int n;
    SV *a;
    cout << "Nhap so sinh vien: ";
    cin >> n;
    a = new SV[n];
    for (int i = 0; i < n; i++)
    {
        cout << "Nhap thong tin cho sinh vien thu " << i + 1 << ": " << endl;
        cin >> a[i];
    }
    cout << "\nDanh sach sinh vien:\n";
    for (int i = 0; i < n; i++){
        cout << a[i];
    }
    cout << "Sau khi sap xep:\n";
    sort(a, a + n, sorter);
    for (int i = 0; i < n; i++){
        cout << a[i];
    }
}