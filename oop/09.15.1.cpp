#include<iostream>
using namespace std;

class SO_PHUC {
private:
    float phan_thuc, phan_ao;
public:
    friend istream& operator>>(istream &input, SO_PHUC &s);
    friend ostream& operator<<(ostream &output, const SO_PHUC &s);
    friend SO_PHUC operator+(const SO_PHUC& sp1, const SO_PHUC& sp2);
};

istream& operator>>(istream &input, SO_PHUC &s) {
    cout << "Nhap phan thuc: ";
    input >> s.phan_thuc;
    cout << "Nhap phan ao: ";
    input >> s.phan_ao;
    return input;
}
ostream& operator<<(ostream &output, const SO_PHUC &s) {
    output << s.phan_thuc;

    if (s.phan_ao >= 0)
        output << " + " << s.phan_ao << "i";
    else
        output << " - " << abs(s.phan_ao) << "i";

    return output;
}
SO_PHUC operator+(const SO_PHUC& sp1, const SO_PHUC& sp2) {
    SO_PHUC sum;
    sum.phan_thuc = sp1.phan_thuc + sp2.phan_thuc;
    sum.phan_ao = sp1.phan_ao + sp2.phan_ao;
    return sum;
}
int main() {
    SO_PHUC sp1, sp2;
    cin >> sp1 >> sp2;
    SO_PHUC sum = sp1 + sp2;
    cout << "Sum: " << sum << endl;
    return 0;
}
