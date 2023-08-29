#include<bits/stdc++.h>
// inline float kc (float x, float y);
// thay tên hàm bằng từ khóa operator r đến phép toán
struct MT
{
    int n, **gt;
};

istream &operator >> (istream &inp, MT &a){
    cout << "Nhap bac cua ma tran: ";
    inp >> a.n;
    cout << "Nhap ma tran:\n";
    a.gt = new int*[a.n];
    for(int i = 0; i < n; i++){
        a.gt[i] = new int[a.n];
    }
    for(int i = 0; i < a.n; i++){
        for(int j = 0; j < a.n; j++){
            inp >> a.gt[i][j];
        }
    }
    return inp;
} 

struct PS{
    int ts, ms;
};
istream & operator >> (istream &is, PS &p){
    is >> p.ts >> p.ms;
    while (p.ms == 0){
        cout << "Hay nhap ms khac 0: ";
    }
    return is;
}