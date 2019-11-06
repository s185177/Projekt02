package aft;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AftaleDao {
    static Connection conn;
    static ResultSet resultSet;
    // private static ArrayList<> bean = new ArrayList<>();

    public static List<AftaleBean> hentAftaler( Object bruger ) throws ClassNotFoundException, SQLException {
        List<AftaleBean> listofbeans = new ArrayList<AftaleBean>();
        try {

            Class.forName("org.sqlite.JDBC").newInstance();
            conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Rune\\Desktop\\DTU\\3. semester\\IT og Kommunikation\\Projekt\\Projekt 2\\Ny database\\Hospital09.db");
            System.out.println("conn =" + conn);
            String query = "SELECT Aftale.fkCPR , Aftale.fkAftaleType , Aftale.dato , Aftale.sygehus , Aftale.free , AftaleType.Varighed FROM Aftale , AftaleType WHERE fkCPR='" + bruger + "' AND Aftale.fkAftaleType =  AftaleType.idAftaleType ";

            Statement stmt = conn.createStatement();
            resultSet = stmt.executeQuery(query);

            while (resultSet.next()) {
                AftaleBean bean = new AftaleBean();
                /*for (int i = 1; i < 8; i++) {
                    System.out.println(resultSet.getString(i));
                }*/
                System.out.println("Inden noget gemmes");
                String dato = resultSet.getString("dato");
                String type = resultSet.getString("fkAftaleType");
                String sygehus = resultSet.getString("sygehus");
                String kommentar = resultSet.getString("free");
                String cpr = resultSet.getString("fkCPR");
                System.out.println("Inden varighed gemmes");
                int    varighed = resultSet.getInt( "varighed" );

                bean.setCpr(cpr);
                bean.setDato(dato);
                bean.setKommentar(kommentar);
                bean.setSygehus(sygehus);
                bean.setType(type);
                bean.setVarighed( varighed );

                listofbeans.add(bean);
            }
        } catch (SQLException | InstantiationException | IllegalAccessException e) {
            System.out.println("Database undtagelse : " + e.getMessage());
            e.printStackTrace();

        }finally {
            if (conn!=null){
                try {
                    conn.close();
                } catch ( Exception e ) {

                }
            }
        }
        return listofbeans;
    }
}



