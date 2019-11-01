import java.sql.*;


public class UserDAO {
    static Connection conn = null;
    static ResultSet resultSet = null;

    public static UserBean validering ( UserBean bean) throws ClassNotFoundException, SQLException {
        try {
            String cpr = bean.getCpr();
            String kode = bean.getKode();
            String query = "SELECT (*) FROM Patient WHERE CPR='"+cpr+"' AND Kode='" + kode + "'; ";

            //Afprøvning sqlite
            /*String query ="SELECT* FROM Person WHERE cpr='" + cpr + "' AND kode='" + kode + "' ";
            Class.forName("org.sqlite.JDBC").newInstance(); //Afprøvning sqlite
            conn = DriverManager.getConnection(
                    "jdbc:sqlite:C:\\Users\\Rune\\Desktop\\DTU\\3. semester\\" +
                            "IT og Kommunikation\\Projekt\\Projekt 2\\Ny database\\Hospital09.db");*/
            //Afprøvning sqlite

            Class.forName("org.mariadb.jdbc.Driver"); //Nødvendigt for Tomcat

            conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/sygehus9","bruger","1111");
            Statement statement = conn.createStatement();
            resultSet = statement.executeQuery(query);

            boolean next = resultSet.next();
            if( !next ) {
                System.out.println("Du findes ikke");
                bean.setGodkend(false);
            } else if ( next ) {
                String bruger = resultSet.getString("cpr");
                System.out.println("Velkommen: " + bruger );
                bean.setFornavn( bruger );
                bean.setGodkend( true );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //SQLite afprøvning
        /*catch (ClassNotFoundException | SQLException | InstantiationException | IllegalAccessException e) {
            e.printStackTrace();
        }*/
        //SQLite afprøvning
        finally {
            if (conn!=null){
                try {
                    conn.close();
                } catch ( Exception e ) {

                }
            }
        }
        return bean;
    }
}
