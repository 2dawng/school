public class mang {
    public static void main(String[] args) {
        int A[] = { 3, 7, 23, -45, 33, 73, -56, };
        int sum = 0, count = 0;
        float aveg = 0;
        for (int i : A) {
            if (i % 2 == 0) {
                count++;
                sum = sum + i;
            }
        }
        aveg = (float) sum / count;
        System.out.printf("Trung binh cong cac so chan: %.2f", aveg);
    }
}
