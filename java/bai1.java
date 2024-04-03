import java.util.Scanner;

public class bai1 {
  public static void main(String[] args) {
    try (Scanner sc = new Scanner(System.in)) {
      String ht;
      System.out.println("Ho va ten: ");
      ht = sc.nextLine();
      System.out.println("Diem: ");
      Double diem = Double.parseDouble(sc.nextLine());
      System.out.println("Gioi tinh: ");
      sc.nextLine();
      System.out.println(ht + ", diem trung binh la: " + diem + "\n");
    } catch (NumberFormatException e) {

      e.printStackTrace();
    }

  }
}
