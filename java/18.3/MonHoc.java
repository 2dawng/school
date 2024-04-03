import java.util.Scanner;

public class MonHoc {
    private String tenMonHoc;
    private Double diemMonHoc;

    public MonHoc(String tenMonHoc, Double diemMonHoc) {
        this.tenMonHoc = tenMonHoc;
        this.diemMonHoc = diemMonHoc;
    }

    public String getTenMonHoc() {
        return tenMonHoc;
    }

    public Double getDiemMonHoc() {
        return diemMonHoc;
    }

    public void setTenMonHoc(String tenMonHoc) {
        this.tenMonHoc = tenMonHoc;
    }

    public void setDiemMonHoc(Double diemMonHoc) {
        this.diemMonHoc = diemMonHoc;
    }

    public void nhap() {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Nhap ten mon hoc: ");
        this.tenMonHoc = scanner.nextLine();

        System.out.print("Nhap diem mon hoc: ");
        this.diemMonHoc = scanner.nextDouble();
    }

    public void in() {
        System.out.println("Ten mon hoc: " + this.tenMonHoc);
        System.out.println("Diem mon hoc: " + this.diemMonHoc);
    }
}
