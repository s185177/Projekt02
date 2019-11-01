package aft;

import java.sql.*;

public class AftaleDao {

   // private static ArrayList<> bean = new ArrayList<>();

    public static AftaleBean hentAftaler(AftaleBean bean) throws ClassNotFoundException, SQLException {

        try {

            Class.forName("org.sqlite.JDBC").newInstance();
            Connection conn = DriverManager.getConnection("C:\\Users\\iskin\\Desktop\\Hospital09.db");

            String query = "SELECT Aftale*";

            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                for (int i = 1; i < 8; i++) {
                    System.out.println(rs.getString(i));
                }
            }


            String dato = rs.getString("dato");
            String type = rs.getString("fkAftaleType");
            String sygehus = rs.getString("sygehus");
            String kommentar = rs.getString("free");
            String cpr = rs.getString("fkCPR");

            bean.setCpr(cpr);
            bean.setDato(dato);
            bean.setKommentar(kommentar);
            bean.setSygehus(sygehus);
            bean.setType(type);


        } catch (Exception e) {
            System.out.println("Database undtagelse : " + e.getMessage());
            e.printStackTrace();

                }
   return bean;

            }
}



