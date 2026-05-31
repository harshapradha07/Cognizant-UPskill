import java.sql.*;
public class Exercise32_StudentDAO {
    static Connection getConnection()
            throws Exception {
        return DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/community_portal",
                "root",
                "YOUR_PASSWORD"
        );
    }
    static void insertUser()
            throws Exception {
        Connection con = getConnection();
        PreparedStatement ps =
                con.prepareStatement(
                        "INSERT INTO Users(full_name,email,city,registration_date) VALUES(?,?,?,?)"
                );
        ps.setString(1,"Test User");
        ps.setString(2,"test@test.com");
        ps.setString(3,"Vizag");
        ps.setDate(
                4,
                Date.valueOf("2025-06-01")
        );
        ps.executeUpdate();
        con.close();
    }
    public static void main(String[] args)
            throws Exception {
        insertUser();
    }
}