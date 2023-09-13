#include<bits/stdc++.h>
using namespace std;

class CANHO{
    private:
        string dia_chi;
        float dien_tich;
        int so_phong_ngu;
        short huong;
        long long gia;
        int so_nha_ve_sinh;
    public:
        void nhap(){
            cout << "Nhap dia chi :";
            fflush(stdin);
            getline(cin, dia_chi);
            cout << "Nhap dien tich: ";
            cin >> dien_tich;
            cout << "Nhap so phong ngu: ";
            cin >> so_phong_ngu;
            cout << "Nhap huong: ";
            cin >> huong;
            cout << "Nhap gia: ";
            cin >> gia;
            cout << "Nhap so nha ve sinh: ";
            cin >> so_nha_ve_sinh;
        };
        void xuat(){
            cout << "\ndia chi :";
            cout << dia_chi;
            cout << "\ndien tich: ";
            cout << dien_tich;
            cout << "\nso phong ngu: ";
            cout << so_phong_ngu;
            cout << "\nhuong: ";
            cout << huong;
            cout << "\ngia: ";
            cout << gia;
            cout << "\nso nha ve sinh: ";
            cout << so_nha_ve_sinh;
        }

};
int main(){
    CANHO a;
    for(int i = 0; i < 3; i++){
        a.nhap();
        a.xuat();
        cout << "\n";
    }
}