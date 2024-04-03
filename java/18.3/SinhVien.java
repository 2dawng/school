import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class SinhVien {
    private String maSV;
    private String hoTen;
    private String ngaySinh;
    private String gioiTinh;
    protected List<MonHoc> monHoc = new ArrayList<>();

    public SinhVien(String maSV, String hoTen, String ngaySinh, String gioiTinh) {
        this.maSV = maSV;
        this.hoTen = hoTen;
        this.ngaySinh = ngaySinh;
        this.gioiTinh = gioiTinh;
        // this.monHoc = monHoc;
    }

    public String getMaSV() {
        return maSV;
    }

    public String getHoTen() {
        return hoTen;
    }

    public String getNgaySinh() {
        return ngaySinh;
    }

    public String getGioiTinh() {
        return gioiTinh;
    }

    // public MonHoc[] getMonHoc() {
    // return monHoc;
    // }

    public void setMaSV(String maSV) {
        this.maSV = maSV;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public void setNgaySinh(String ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public void setGioiTinh(String gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    // public void setMonHoc(MonHoc[] monHoc) {
    // this.monHoc = monHoc;
    // }

    public void nhap() {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Nhap ma sinh vien: ");
        this.maSV = scanner.nextLine();

        System.out.print("Nhap ho ten: ");
        this.hoTen = scanner.nextLine();

        System.out.print("Nhap ngay sinh: ");
        this.ngaySinh = scanner.nextLine();

        System.out.print("Nhap gioi tinh: ");
        this.gioiTinh = scanner.nextLine();
        List<MonHoc> monHocs = new ArrayList<>();
        monHocs.add(new MonHoc("Tin dai cuong", 0.0));
        monHocs.add(new MonHoc("Chinh tri", 0.0));
        monHocs.add(new MonHoc("Phap luat", 0.0));
        monHoc.addAll(monHocs);SinhVienCNTT[] sinhVienCNTT;
    }

    public void in() {
        System.out.println("Ma SV: " + this.maSV);
        System.out.println("Ho ten: " + this.hoTen);
        System.out.println("Ngay sinh: " + this.ngaySinh);
        System.out.println("Gioi tinh: " + this.gioiTinh);
        System.out.println("Mon hoc:");
        for (var x : monHoc) {
            x.in();
        }
    }
}
