package data;

import data.AftaleBean;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AftaleDao {

    public static List<AftaleBean> hentAftaler ( String bruger ) throws ClassNotFoundException, SQLException {
        Connection conn         =   null;
        ResultSet resultSet;
        List<AftaleBean> listofbeans = new ArrayList<AftaleBean>();
        try {
            // SQLite afprøvning
            Class.forName("org.sqlite.JDBC").newInstance();
            conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\mathi\\Dropbox\\DTU\\3. Semester\\It og kommunikation\\Projekt\\Hospital09.db");
            // SQLite afprøvning
            /*Class.forName("org.mariadb.jdbc.Driver"); //Nødvendigt for Tomcat
            conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/sygehus9", "bruger", "1111");*/

            String query = "SELECT Aftale.idAftale, Aftale.fkCPR , Aftale.fkAftaleType , Aftale.dato , Aftale.sygehus , Aftale.free " +
                    ", AftaleType.Varighed FROM Aftale , AftaleType " +
                    "WHERE fkCPR='" + bruger + "' AND Aftale.fkAftaleType =  AftaleType.idAftaleType ";

            Statement stmt = conn.createStatement();
            resultSet = stmt.executeQuery(query);

            //Test af forbindelse
            System.out.println( "Åbner aftaler database-forbindelse = " + conn );    // Skriver i catalina.out til afprøvning

            while (resultSet.next()) {
                AftaleBean bean = new AftaleBean();
                String dato = resultSet.getString("dato");
                String type = resultSet.getString("fkAftaleType");
                String sygehus = resultSet.getString("sygehus");
                String kommentar = resultSet.getString("free");
                String cpr = resultSet.getString("fkCPR");
                int varighed = resultSet.getInt("varighed");
                int id = resultSet.getInt("idAftale");

                bean.setId(id);
                bean.setCpr(cpr);
                bean.setDato(dato);
                bean.setKommentar(kommentar);
                bean.setSygehus(sygehus);
                bean.setType(type);
                bean.setVarighed(varighed);

                listofbeans.add(bean);
            }
            System.out.println( "Antal aftaler" + listofbeans );
        } /*catch (SQLException e) {
            e.printStackTrace();
        }*/
        // SQLite afprøvning
        catch (SQLException | InstantiationException | IllegalAccessException e) {
            System.out.println("Database undtagelse : " + e.getMessage());
            e.printStackTrace();
        }
        // SQLite afprøving
        finally {
            if (conn != null) {
                try {
                    conn.close();
                    System.out.println( "Lukker aftaler database-forbindelse" + "\n" );
                } catch (Exception e) {
                    System.out.println(e);
                }
            }
        }
        return listofbeans;
    }
}


