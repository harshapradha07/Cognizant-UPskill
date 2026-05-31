import java.util.ArrayList;
public class Exercise24_ArrayList {
    public static void main(String[] args) {
        ArrayList<String> students =
                new ArrayList<>();
        students.add("Harsha");
        students.add("Ravi");
        students.add("Kiran");
        for(String s : students) {
            System.out.println(s);
        }
    }
}