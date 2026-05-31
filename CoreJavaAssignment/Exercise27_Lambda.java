import java.util.*;
public class Exercise27_Lambda {
    public static void main(String[] args) {
        List<String> names =
                Arrays.asList(
                        "Ravi",
                        "Harsha",
                        "Kiran"
                );
        Collections.sort(
                names,
                (a,b) -> a.compareTo(b)
        );
        System.out.println(names);
    }
}