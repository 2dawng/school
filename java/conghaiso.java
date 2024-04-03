import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class conghaiso {
    public static void main(String[] args) throws IOException {
        int a, b, s;
        String str;
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        System.out.println("Nhap so nguyen thu nhat: ");
        str = br.readLine();
        a = Integer.parseInt(str);

        System.out.println("Nhap so nguyen thu hai: ");
        str = br.readLine();
        b = Integer.parseInt(str);
        s = a + b;
        System.out.println("Tong cua hai so = " + s);
    }
}
