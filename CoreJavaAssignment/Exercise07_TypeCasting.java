public class Exercise07_TypeCasting {
    public static void main(String[] args) {
        double d = 99.99;
        int i = (int)d;
        System.out.println("Double: " + d);
        System.out.println("Converted Int: " + i);
        int num = 100;
        double converted = (double)num;
        System.out.println("Int: " + num);
        System.out.println("Converted Double: " + converted);
    }
}