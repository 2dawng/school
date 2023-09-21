#include <iostream>
using namespace std;

class DienThoai {
  public:
    string model;
    string hangSanXuat;
    float gia;

    DienThoai(string model, string hangSanXuat, float gia) {
        this->model = model;
        this->hangSanXuat = hangSanXuat;
        this->gia = gia;
    }

    friend istream& operator>>(istream& in, DienThoai& dt) {
        cout << "Nhap model: ";
        in >> dt.model;
        cout << "Nhap hang san xuat: ";
        in >> dt.hangSanXuat;
        cout << "Nhap gia: ";
        in >> dt.gia;
        return in;
    }

    friend ostream& operator<<(ostream& out, const DienThoai& dt) {
        out << "Model: " << dt.model << endl;
        out << "Hang san xuat: " << dt.hangSanXuat << endl;
        out << "Gia: " << dt.gia << endl;
        return out;
    }
};

float tinhGiaTrungBinh(DienThoai dt1, DienThoai dt2, DienThoai dt3) {
    float tongGia = dt1.gia + dt2.gia + dt3.gia;
    return tongGia / 3.0;
}

int main() {
    DienThoai dt1("Model 1", "Hang SX 1", 100);
    DienThoai dt2("Model 2", "Hang SX 2", 200);
    DienThoai dt3("Model 3", "Hang SX 3", 300);

    // Nhập thông tin cho ba điện thoại từ người dùng
    cout << "Nhap thong tin cho 3 dien thoai:" << endl;
    cin >> dt1 >> dt2 >> dt3;

    float giaTrungBinh = tinhGiaTrungBinh(dt1, dt2, dt3);
    cout << "Gia trung binh cua 3 dien thoai la: " << giaTrungBinh << endl;

    // Xuất thông tin của ba điện thoại ra màn hình
    cout << "Thong tin cua 3 dien thoai:" << endl;
    cout << dt1 << dt2 << dt3;

    return 0;
}
