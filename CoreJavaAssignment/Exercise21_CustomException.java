import java.util.Scanner;
class InvalidAgeException extends Exception {
    InvalidAgeException(String message) {
        super(message);
    }
}
public class Exercise21_CustomException {
    public static void checkAge(int age)
            throws InvalidAgeException {
        if(age < 18) {
            throw new InvalidAgeException(
                "Age must be 18 or above"
            );
        }
        System.out.println("Eligible");
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        try {
            System.out.print("Enter Age: ");
            int age = sc.nextInt();
            checkAge(age);
        } catch(InvalidAgeException e) {
            System.out.println(e.getMessage());
        }
        sc.close();
    }
}