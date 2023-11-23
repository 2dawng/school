#include <bits/stdc++.h>
using namespace std;

class Diem
{
private:
    string ho_ten;
    char *so_bao_danh;
    float diem;

public:
    Diem(string ten, const char *sbd, float diem)
    {
        ho_ten = ten;
        so_bao_danh = new char[strlen(sbd) + 1];
        strcpy(so_bao_danh, sbd);
        this->diem = diem;
    }

    ~Diem()
    {
        delete[] so_bao_danh;
    }

    Diem(const Diem &sv)
    {
        ho_ten = sv.ho_ten;
        so_bao_danh = new char[strlen(sv.so_bao_danh) + 1];
        strcpy(so_bao_danh, sv.so_bao_danh);
        diem = sv.diem;
    }

    Diem &operator=(const Diem &sv)
    {
        if (this == &sv)
            return *this;

        ho_ten = sv.ho_ten;
        if (so_bao_danh != nullptr)
            delete[] so_bao_danh;
        so_bao_danh = new char[strlen(sv.so_bao_danh) + 1];
        strcpy(so_bao_danh, sv.so_bao_danh);
        diem = sv.diem;

        return *this;
    }

    string getHo_Ten() const
    {
        return ho_ten;
    }

    char *getSo_Bao_Danh() const
    {
        return so_bao_danh;
    }

    float getDiem() const
    {
        return diem;
    }
};

class BangDiem
{
private:
    vector<Diem> danh_sach_diem;

public:
    void addDiem(Diem d)
    {
        danh_sach_diem.push_back(d);
    }

    void sortDescending()
    {
        sort(danh_sach_diem.begin(), danh_sach_diem.end(), [](const Diem &a, const Diem &b)
             { return a.getDiem() > b.getDiem(); });
    }

    int countGradeA()
    {
        int count = 0;
        for (const auto &d : danh_sach_diem)
        {
            if (d.getDiem() >= 8.5)
                count++;
        }
        return count;
    }

    void printScores()
    {
        cout << "Danh sach diem theo thu tu giam dan cua diem thi:" << endl;
        for (const auto &d : danh_sach_diem)
        {
            cout << "Ho ten: " << d.getHo_Ten() << ", So bao danh: " << d.getSo_Bao_Danh() << ", Diem: " << d.getDiem() << endl;
        }
    }

    void printGradeA()
    {
        cout << "Danh sach sinh vien dat diem A:" << endl;
        for (const auto &d : danh_sach_diem)
        {
            if (d.getDiem() >= 8.5)
                cout << "Ho ten: " << d.getHo_Ten() << ", So bao danh: " << d.getSo_Bao_Danh() << ", Diem: " << d.getDiem() << endl;
        }
    }

    void printClass()
    {
        cout << "Danh sach sinh vien toan lop:" << endl;
        for (const auto &d : danh_sach_diem)
        {
            cout << "Ho ten: " << d.getHo_Ten() << ", So bao danh: " << d.getSo_Bao_Danh() << ", Diem: " << d.getDiem() << endl;
        }
    }
};

int main()
{
    BangDiem bang_diem;

    bang_diem.addDiem(Diem("Nguyen Tran 2dawng", "221230797", 9.0));
    bang_diem.addDiem(Diem("NGUyen Hoang Dat", "333333", 7.5));
    bang_diem.addDiem(Diem("NGUyen Duy Bien", "324tergfdbvc", 8.8));
    bang_diem.addDiem(Diem("Vuong Duc Hung", "3bie", 8.2));

    bang_diem.sortDescending();

    bang_diem.printScores();

    int countA = bang_diem.countGradeA();
    cout << "So luong sinh vien dat diem A: " << countA << endl;

    bang_diem.printGradeA();

    bang_diem.printClass();

    return 0;
}
