import java.util.Scanner;
public class Exercise11_Factorial {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter number: ");
        int n = sc.nextInt();
        long factorial = 1;
        for(int i=1;i<=n;i++) {
            factorial *= i;
        }
        System.out.println("Factorial = " + factorial);
        sc.close();
    }
}