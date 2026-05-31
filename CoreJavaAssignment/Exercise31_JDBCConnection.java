import java.sql.*;
public class Exercise31_JDBCConnection {
    public static void main(String[] args) {
        String url =
                "jdbc:mysql://localhost:3306/community_portal";
        String user = "root";
        String password = "YOUR_PASSWORD";
        try {
            Connection con =
                    DriverManager.getConnection(
                            url,user,password
                    );
            Statement stmt =
                    con.createStatement();
            ResultSet rs =
                    stmt.executeQuery(
                            "SELECT * FROM Users"
                    );
            while(rs.next()) {
                System.out.println(
                        rs.getString("full_name")
                );
            }
            con.close();
        } catch(Exception e) {
            System.out.println(e.getMessage());
        }
    }
}