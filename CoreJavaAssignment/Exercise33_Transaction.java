import java.sql.*;
public class Exercise33_Transaction {
    public static void main(String[] args)
            throws Exception {
        Connection con =
                DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/community_portal",
                        "root",
                        "YOUR_PASSWORD"
                );
        try {
            con.setAutoCommit(false);
            Statement stmt =
                    con.createStatement();
            stmt.executeUpdate(
                    "UPDATE accounts SET balance=balance-100 WHERE id=1"
            );
            stmt.executeUpdate(
                    "UPDATE accounts SET balance=balance+100 WHERE id=2"
            );
            con.commit();
            System.out.println("Success");
        } catch(Exception e) {
            con.rollback();
            System.out.println("Rollback");
        } finally {
            con.close();
        }
    }
}