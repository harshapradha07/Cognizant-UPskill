import java.util.List;
record Person(String name,int age){}
public class Exercise29_Record {
    public static void main(String[] args) {
        List<Person> people =
                List.of(
                        new Person("Harsha",20),
                        new Person("Ravi",25),
                        new Person("Kiran",17)
                );
        people.stream()
                .filter(p -> p.age() >= 18)
                .forEach(System.out::println);
    }
}