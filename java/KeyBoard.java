import java.util.Scanner;

public class KeyBoard {
    static Scanner sc = new Scanner(System.in);

    public static String readString(String message) {
        System.out.println(message);
        String input = sc.nextLine();
        return input;
    }

    public static int readInt(String message) {
        System.out.println(message);
        int input = Integer.parseInt(sc.nextLine());
        return input;
    }

    public static double readDouble(String message) {
        System.out.println(message);
        double input = Double.parseDouble(sc.nextLine());
        return input;
    }
}
