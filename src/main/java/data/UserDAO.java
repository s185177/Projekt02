package data;
import java.sql.*;

public class UserDAO {
    public static UserBean validering ( UserBean bean ) throws ClassNotFoundException, SQLException {
        Connection conn = null;
        ResultSet resultSet;
        try {
            String cpr      =   bean.getCpr();
            String kode     =   bean.getKode();
            String query    =   "SELECT * FROM Patient WHERE CPR='" + cpr + "' AND Kode='" + kode + "'; ";
                //Afprøvning sqlite
                Class.forName( "org.sqlite.JDBC" ).newInstance();
                conn = DriverManager.getConnection(
                        "jdbc:sqlite:C:\\Users\\Rune\\Desktop\\DTU\\3. semester\\" +
                                "IT og Kommunikation\\Projekt\\Projekt 2\\Ny database\\Hospital09.db" );
                //Afprøvning sqlite
            /*Class.forName( "org.mariadb.jdbc.Driver" ); //Nødvendigt for Tomcat
            conn = DriverManager.getConnection( "jdbc:mariadb://localhost:3306/sygehus9", "bruger", "1111" );*/
            Statement statement = conn.createStatement();
            resultSet = statement.executeQuery(query);

            //Test af forbindelse
            System.out.println( "Åbner login database forbindelse = " + conn );    // Skriver i catalina.out til afprøvning

            boolean next = resultSet.next();
            if (!next) {
                // Ved forkert login
                System.out.println("Du har brugt forkert login");
                bean.setGodkend(false);
            } else if (next) {
                String borger = resultSet.getString("cpr");
                String fornavn = resultSet.getString("fornavn");
                String efternavn = resultSet.getString("efternavn");

                // Test der skriver aflæste kolonner fra tabel
                System.out.println("Korrekt login database siger velkommen: " + cpr + " " + fornavn + " " + efternavn);    //Skriver i catalina.out til afprøvning

                bean.setCpr(borger);
                bean.setFornavn(fornavn);
                bean.setEfternavn(efternavn);
                bean.setGodkend(true);
            }
        } /*catch (SQLException e) {
            e.printStackTrace();
        }*/
        //SQLite afprøvning
        catch (ClassNotFoundException | SQLException | InstantiationException | IllegalAccessException e) {
            e.printStackTrace();
        }
        //SQLite afprøvning
        // lukker database til sidst
        finally {
            if (conn != null) {
                try {
                    conn.close();
                    System.out.println( "Lukker login database-forbindelse " + "\n" );
                } catch (Exception e) {

                }
            }
        }
        return bean;
    }
}
