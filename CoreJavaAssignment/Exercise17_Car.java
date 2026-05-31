class Car {
    String make;
    String model;
    int year;
    void displayDetails() {
        System.out.println(make);
        System.out.println(model);
        System.out.println(year);
    }
}
public class Exercise17_Car {
    public static void main(String[] args) {
        Car car1 = new Car();
        car1.make = "Toyota";
        car1.model = "Camry";
        car1.year = 2024;
        car1.displayDetails();
    }
}