import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class SinhVienCNTT extends SinhVien {
    private String chuyenNganh;

    public SinhVienCNTT(String maSV, String hoTen, String ngaySinh, String gioiTinh, String chuyenNganh,
            MonHoc[] monHoc) {
        super(maSV, hoTen, ngaySinh, gioiTinh);
        this.chuyenNganh = chuyenNganh;
    }

    public String getChuyenNganh() {
        return chuyenNganh;
    }

    public void setChuyenNganh(String chuyenNganh) {
        this.chuyenNganh = chuyenNganh;
    }

    public void nhap() {
        Scanner scanner = new Scanner(System.in);
        super.nhap();
        System.out.print("Nhap chuyen nganh: ");
        this.chuyenNganh = scanner.nextLine();
        List<MonHoc> monHocs = new ArrayList<>();
        monHocs.add(new MonHoc("CTDL_GT", 0.0));
        monHocs.add(new MonHoc("Toan RR", 0.0));
        monHocs.add(new MonHoc("CSDL", 0.0));
        monHocs.add(new MonHoc("Lap Trinh OOP", 0.0));
        monHoc.addAll(monHocs);
    }

    public void in() {
        super.in();
        System.out.println("Chuyen nganh: " + this.chuyenNganh);
    }

    public Double diemTrungBinh() {
        Double DiemTB = 0.0;
        // monHoc.
        for (var x : monHoc) {
            DiemTB += x.getDiemMonHoc();
        }
        return DiemTB / monHoc.size();
    }

    public String xepLoaiHocTap() {
        double diemTB = this.diemTrungBinh();

        switch (diemTB) {
            case 0.0:
                return "Chua co diem";

            case 5.0:
                return "Yeu";

            case 7.0:
                return "Trung binh";

            case 8.0:
                return "Kha";

            case 9.0:
                return "Gioi";

            case 10.0:
                return "Xuat sac";

            default:
                return "Khong xac dinh";
        }
    }

}
