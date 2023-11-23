#include <bits/stdc++.h>
using namespace std;

class Book {
    char ma_so_xuat_ban[12];
    string ten;
    string tac_gia;

public:
    Book() {
        strcpy(ma_so_xuat_ban, "00000000000");
        ten = "";
        tac_gia = "";
    }

    void nhap() {
        // cout << "Nhap ma so xuat ban: ";
        cin >> ma_so_xuat_ban;
        cin.ignore();
        // cout << "Nhap ten sach: ";
        getline(cin, ten);
        // cout << "Nhap ten tac gia: ";
        getline(cin, tac_gia);
    }

    void xuat() {
        cout << "\nMa so xuat ban: " << ma_so_xuat_ban;
        cout << "\nTen sach: " << ten;
        cout << "\nTac gia: " << tac_gia;
    }

    friend void so_sanh(const string& tgia, const Book& a);
};

void so_sanh(const string& tgia, const Book& a) {
    if (a.tac_gia.compare(tgia) == 0)
        cout << "\nMa so xuat ban: " << a.ma_so_xuat_ban;
        cout << "\nMa so xuat ban: " << a.ma_so_xuat_ban;
        cout << "\nTen sach: " << a.ten;
        cout << "\nTac gia: " << a.tac_gia;
}

int main() {
    freopen("inp.txt", "r", stdin);
    int n;
    // cout << "Nhap so sach: ";
    cin >> n;
    Book* b = new Book[n];
    for (int i = 0; i < n; i++)
        b[i].nhap();

    string tgia;
    // cout << "Nhap ten tac gia can tim: ";
    cin.ignore();
    getline(cin, tgia);
    int count = 0;
    for (int i = 0; i < n; i++) {
        so_sanh(tgia, b[i]);
        count ++;
    }
    if(count == 0)cout<< "K tim thay";
    cout <<"END";

    return 0;
}
