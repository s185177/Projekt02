import java.sql.*;

public class UserDAO {
    static Connection conn = null;
    static ResultSet resultSet = null;

    public static UserBean validering ( UserBean bean) throws ClassNotFoundException, SQLException {
        try {
            String username = bean.getCpr();
            String password = bean.getKode();

            Class.forName("com.mysql.cj.jdbc.Driver"); //Nødvendigt for Tomcat
            conn = DriverManager.getConnection("jdbc:mysql://ec2-52-30-211-3.eu-west-1.compute.amazonaws.com/IT3?"
                    + "user=IT3&password=IT3&allowMultiQueries=true");
            Statement statement = conn.createStatement();
            resultSet = statement.executeQuery("SELECT COUNT(*) FROM usertable WHERE username='" + username + "' AND password='" + password + "';");
            System.out.println(resultSet);
            boolean next = resultSet.next();
                    /*int anInt = resultSet.getInt(1);
                    if (anInt == 1){
                        return true;
                    }*/
            if( !next ) {
                System.out.println("Du findes ikke");
                bean.setGodkend(false);
            } else if ( next ) {
                String bruger = resultSet.getString("username");
                System.out.println("Velkommen Rune nu leger vi lidt :)" + bruger );
                bean.setFornavn( bruger );
                bean.setGodkend( true );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
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
