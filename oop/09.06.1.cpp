#include<bits/stdc++.h>
using namespace std;

class SV{
    private:
        string sbd, ten;
        float toan, van, anh;
    public:
        void nhap();
        void xuat();
        float TongDiem(){return toan + van + anh;}
        float DiemToan(){return toan;}
        float DiemVan(){return van;}
        float DiemAnh(){return anh;}
};
void SV::nhap(){
    cout << "So bao danh: ";
    cin >> sbd;
    cout << "Ho va ten: ";
    fflush(stdin);
    getline(cin, ten);
    cout << "Diem toan: ";
    cin >> toan;
    cout << "Diem van: ";
    cin >> van;
    cout << "Diem anh: "; 
    cin >> anh;
}
void SV::xuat(){
    cout << "So bao danh: ";
    cout << sbd;
    cout << "\nHo va ten: ";
    cout << ten;
    cout << "\nDiem toan: ";
    cout << toan;
    cout << "\nDiem van: ";
    cout << van;
    cout << "\nDiem anh: "; 
    cout << anh;
}
int main(){
    SV a;
    a.nhap();
    a.xuat();
}