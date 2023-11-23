#include<bits/stdc++.h>
using namespace std;
class NgayThang{
    int ngay, thang, nam;
    public:
        NgayThang(int d = 11, int m = 10, int y = 2023){
            ngay = d;
            thang = m;
            nam = y;
        }
        friend istream& operator>>(istream &cin, NgayThang &d){
            cout << "nhap ngay: "; cin >> d.ngay;
            cout << "nhap thang: "; cin >> d.thang;
            cout << "nhap nam: "; cin >> d.nam;
            return cin;
        }
        friend ostream& operator<<(ostream &cout, NgayThang &d){
            cout << d.ngay << "/" << d.thang << "/" << d.nam;
            return cout;
        };
};
class Nguoi{
    protected:
        string ho_ten;
        NgayThang ngay_sinh;
        string dia_chi;
    public:
    Nguoi(string ht = "", string dc = ""){
        ho_ten = ht;
        dia_chi = dc;
    };
    friend istream& operator>>(istream &cin, Nguoi &p){
        cout << "nhap ten: ";
        fflush(stdin);
        getline(cin,p.ho_ten);
        cin >> p.ngay_sinh;
        cout << "nhap dia chi: ";
        fflush(stdin);
        getline(cin, p.dia_chi);
        return cin;
        
        
    }
    
    friend ostream& operator<<(ostream &cout, Nguoi &p){
        cout << "Ho ten: " << p.ho_ten << "\n";
        cout << "Ngay sinh: " << p.ngay_sinh << "\n";
        cout << "Dia chi: " << p.dia_chi << "\n";
        return cout;
    }
};
int main(){
    // cin.ignore();
    // NgayThang a;
    // cin >> a;
    // cout << a.nam;
    Nguoi a;    
    cin >> a;
    cout << a;
}