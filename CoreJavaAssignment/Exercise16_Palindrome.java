import java.util.Scanner;
public class Exercise16_Palindrome {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String text = sc.nextLine();
        String clean =
                text.replaceAll("[^a-zA-Z0-9]","")
                .toLowerCase();
        String reverse =
                new StringBuilder(clean)
                .reverse()
                .toString();
        if(clean.equals(reverse))
            System.out.println("Palindrome");
        else
            System.out.println("Not Palindrome");
        sc.close();
    }
}