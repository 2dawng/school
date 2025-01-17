dictSV = [
    {
        "MaSV": "001",
        "HoTen": "Nguyen Van A",
        "Diem": [
            {"TenMH": "Toan", "Diem": 8},
            {"TenMH": "Ly", "Diem": 9},
            {"TenMH": "Hoa", "Diem": 7}
        ]
    },
    {
        "MaSV": "002",
        "HoTen": "Tran Thi B",
        "Diem": [
            {"TenMH": "Toan", "Diem": 9},
            {"TenMH": "Ly", "Diem": 8},
            {"TenMH": "Hoa", "Diem": 6}
        ]
    },
    {
        "MaSV": "003",
        "HoTen": "Pham Van C",
        "Diem": [
            {"TenMH": "Toan", "Diem": 7},
            {"TenMH": "Ly", "Diem": 8},
            {"TenMH": "Hoa", "Diem": 9}
        ]
    }
]
print("Diem trung binh cua tung sinh vien la: ")
for i in dictSV:
    sum = 0
    for j in i["Diem"]:
        sum += j["Diem"]
    print(i["MaSV"], i["HoTen"], sum/3)

# Output:
# Diem trung binh cua tung sinh vien la:
# 001 Nguyen Van A 8.0
# 002 Tran Thi B 7.666666666666667
# 003 Pham Van C 7.0
