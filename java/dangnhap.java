import java.util.Scanner;

public class dangnhap {
    public static void main(String[] args) {
        String username, password;
        try (Scanner scanner = new Scanner(System.in)) {
            int count = 0;
            do {
                count++;
                if (count > 3)
                    break;
                System.out.println("Enter username: ");
                username = scanner.nextLine();
                System.out.println("Enter password: ");
                password = scanner.nextLine();
            } while (!(username.equalsIgnoreCase("2dawng") && password.equals("2dawng")));
            if (!(count > 3))
                System.out.println("Login confirm!");
            else {
                System.out.println("Dumb ass");

            }

            String sv[] = { "Nguyen Van An", "Le Thanh Binh", "Tran Ba Kien", "Le Hien", "Dinh Thi An" };
            String a = "Cong Tang Ton Nu Nguyen Thi Lung Linh";
            a.split(" ");
            String aten = a.split(" ")[a.split(" ").length - 1];
            System.out.println(aten);

            System.out.println("1. Danh sach sinh vien viet hoa:");

            for (String ten : sv) {
                System.out.println(ten.toUpperCase());
            }

            System.out.println("2. Danh sach sinh vien ho Le hoac Nguyen: ");
            for (String ten : sv) {
                if (ten.split(" ")[0].equals("Le") || ten.split(" ")[0].equals("Nguyen"))
                    System.out.println(ten);
            }
            System.out.println("Nhap ho can tim: ");
            String ho = scanner.nextLine();
            System.out.println("Sinh vien co ho " + ho + " la: ");
            for (String ten : sv) {
                if (ten.split(" ")[0].equalsIgnoreCase(ho))
                    System.out.println(ten);
            }
        }
    }
}
