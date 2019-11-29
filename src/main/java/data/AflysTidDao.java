package data;

import com.mysql.cj.result.SqlTimestampValueFactory;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AflysTidDao {
    public static void AflysTid(String id) throws ClassNotFoundException, SQLException {
        Connection conn =   null;
        try {
            // SQLite afprøvning gkfgkgjkkfg
            System.out.println(id);
            Class.forName("org.sqlite.JDBC").newInstance();
            conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\mathi\\Dropbox\\DTU\\3. Semester\\It og kommunikation\\Projekt\\Hospital09.db");
            // SQLite afprøvning
            /*Class.forName("org.mariadb.jdbc.Driver"); //Nødvendigt for Tomcat
            conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/sygehus9", "bruger", "1111");*/
            //Statement stmt = conn.createStatement();

            PreparedStatement stmt= conn.prepareStatement("DELETE FROM Aftale WHERE idAftale=?");
            stmt.setInt(1,Integer.parseInt(id));

            int row = stmt.executeUpdate();
            System.out.println(row+"   test");
            //Test af forbindelse
            System.out.println("Åbner aflys database-forbindelse = " + conn);    // Skriver i catalina.out til afprøvning

         /*catch (SQLException e) {
            e.printStackTrace();
        }*/
            // SQLite afprøvning
        }catch (SQLException | InstantiationException | IllegalAccessException e) {
            System.out.println("Database undtagelse : " + e.getMessage());
            e.printStackTrace();
        }
        // SQLite afprøving
        finally {
            if (conn != null) {
                try {
                    conn.close();
                    System.out.println("Lukker aflys database-forbindelse" + "\n");
                } catch (Exception e) {
                    System.out.println(e);
                }
            }
        }
    }



}
