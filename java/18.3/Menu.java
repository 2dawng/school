import java.util.Scanner;

public class Menu {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        SinhVienCNTT sinhVienCNTT;
        SinhVienKT[] sinhVienKT;
        int choice;
        do {
            System.out.println("Menu:");
            System.out.println("1. Them Sinh Vien");
            System.out.println("2. Xuat Sinh Vien");
            System.out.println("3. Tim Sinh Vien Theo Ma");
            System.out.println("4. Xoa Sinh Vien Theo Ma");
            System.out.println("0. Thoat");

            System.out.print("Chon chuc nang: ");
            choice = scanner.nextInt();
            scanner.nextLine(); // Consume newline character

            switch (choice) {
                case 1:
                    SinhVienCNTT a;
                    a.nhap();

                    break;
                case 2:
                    sinhVienCNTT.in();
                    break;
                case 3:
                    System.out.print("Nhap ma Sinh Vien can tim: ");
                    String maTim = scanner.nextLine();
                    // Implement logic to find and display student by ID
                    break;
                case 4:
                    System.out.print("Nhap ma Sinh Vien can xoa: ");
                    String maXoa = scanner.nextLine();
                    // Implement logic to delete student by ID
                    break;
                case 0:
                    System.out.println("Thoat chuong trinh.");
                    break;
                default:
                    System.out.println("Lua chon khong hop le. Vui long chon lai.");
            }
        } while (choice != 0);

        scanner.close();
    }
}
