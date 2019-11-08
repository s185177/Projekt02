package data;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class ChangeDao {

    public static List<ChangeBean> usedappointments (String type)throws ClassNotFoundException, SQLException{
        Connection conn = null;
        ResultSet resultSet;
        List<ChangeBean> listofChange = new ArrayList<ChangeBean>();
        try {

            String query    =   "SELECT Aftale.dato, AftaleType.Varighed  FROM Aftale, AftaleType WHERE fkAftaleType='"+type+"' AND Aftale.fkAftaleType =  AftaleType.idAftaleType ";

            //Afprøvning sqlite
            Class.forName( "org.sqlite.JDBC" ).newInstance();
            conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\mathi\\Dropbox\\DTU\\3. Semester\\It og kommunikation\\Projekt\\Hospital09.db");
            //Afprøvning sqlite

            /*Class.forName( "org.mariadb.jdbc.Driver" ); //Nødvendigt for Tomcat
            conn = DriverManager.getConnection( "jdbc:mariadb://localhost:3306/sygehus9", "bruger", "1111" );*/


            Statement statement = conn.createStatement();
            resultSet = statement.executeQuery(query);

            //Test af forbindelse
            System.out.println( "Åbner ændre aftale forbindelse = " + conn );    // Skriver i catalina.out til afprøvning

            while (resultSet.next()) {
                ChangeBean bean = new ChangeBean();
                String dato = resultSet.getString("dato");
                int varighed = resultSet.getInt("varighed");
                bean.setDato(dato);
                bean.setVarighed(varighed);

                //System.out.println(dato);
                //System.out.println(varighed);
                System.out.println("JEG ER NU I CHANGEDAO");
                listofChange.add(bean);

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
        return listofChange;
    }
}


