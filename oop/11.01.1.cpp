#include<bits/stdc++.h>
using namespace std;
class NhanVien{
        string id;
        string name;
        int dob;
    public:
        NhanVien(string ID = "", string NAME = "", int DOB = -1){
            id = ID; name = NAME; dob = DOB;
        }
        void nhap(){
            cout << "Nhap ma nhan vien: ";
            cin >> id;
            cout << "Nhap ho ten: ";
            fflush(stdin);
            getline(cin, name);
            cout << "Nhap nam sinh: ";
            cin >> dob;
        }
        void xuat(){
            cout << "\n\nMa nhan vien: " << id;
            cout << "\nHo ten: " << name;
            cout << "\nNam sinh: " << dob;
        }
        string getID(){
            return id;
        }
        string getName(){
            return name;
        }
        int getDOB(){
            return dob;
        }
        bool compareName(string NAME){
            return NAME.compare(name);
        }
};

class HopDong:public NhanVien{
        long tiencong;
        int ngaycong;
    public:
    void nhap(){
        NhanVien :: nhap();
        cout << "Nhap tien cong: ";
        cin >> tiencong;
        cout << "Nhap ngay cong: ";
        cin >> ngaycong;
    }
    void xuat(){
        NhanVien :: xuat();
        cout << "\nTien cong: " << tiencong;
        cout << "\nNgay cong: " << ngaycong;
    }
    float tinhluong(){
        return tiencong * ngaycong;
    }
};

int main(){
    int n;
    cout << "Nhap so nhan vien: ";
    cin >> n;
    HopDong arr[n];
    for (int i = 0; i < n; i ++){
        arr[i].nhap();
    }
    cout << "Nhap ten muon tim: ";
    string ten;
    bool flag = 1;
    int youngest = INT_MAX, user = -1;
    fflush(stdin);
    getline(cin, ten);
    for (int i = 0; i < n; i ++){
        if (arr[i].compareName(ten) == 0){
            arr[i].xuat();
            flag = 0;
        }
        if (arr[i].getDOB() < youngest){
            user = i;
            youngest = arr[i].getDOB();
        }
    }
    if (flag) cout <<"\nKhong tim thay nhan vien " << ten;
    cout << "\n\nNhan vien tre nhat la: ";
    arr[user].xuat();
    cout << "\n\nSap xep theo thu tu luong tang dan: ";
    sort(arr, arr + n, [](HopDong& a, HopDong& b) {
        return a.tinhluong() > b.tinhluong();
    });

    for (int i = 0; i < n; i ++){
        arr[i].xuat();
    }   
}