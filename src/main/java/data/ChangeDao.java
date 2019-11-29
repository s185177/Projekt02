package data;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class ChangeDao {

    public static List<AftaleBean> usedappointments (String type, String Vdato)throws ClassNotFoundException, SQLException{
        Connection conn = null;
        ResultSet resultSet;
        List<AftaleBean> listofChange = new ArrayList<AftaleBean>();
        try {

            String query    =   "SELECT Aftale.dato, AftaleType.Varighed  FROM Aftale, AftaleType WHERE fkAftaleType='"+type+"'AND Aftale.dato LIKE '"+Vdato+"%' AND Aftale.fkAftaleType =  AftaleType.idAftaleType ";

            //Afprøvning sqlite
            Class.forName( "org.sqlite.JDBC" ).newInstance();
            conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\mathi\\Dropbox\\DTU\\3. Semester\\It og kommunikation\\Projekt\\Hospital09.db");
            //Afprøvning sqlite*/
            /*
            Class.forName( "org.mariadb.jdbc.Driver" ); //Nødvendigt for Tomcat
            conn = DriverManager.getConnection( "jdbc:mariadb://localhost:3306/sygehus9", "bruger", "1111" );
            */

            Statement statement = conn.createStatement();
            resultSet = statement.executeQuery(query);

            //Test af forbindelse
            System.out.println( "Åbner ændre aftale forbindelse = " + conn );    // Skriver i catalina.out til afprøvning

            while (resultSet.next()) {
                AftaleBean bean = new AftaleBean();
                String dato = resultSet.getString("dato");
                int varighed = resultSet.getInt("varighed");
                bean.setDato(dato);
                bean.setVarighed(varighed);

                //System.out.println(dato);
                //System.out.println(varighed);
                System.out.println("JEG ER NU I CHANGEDAO");
                listofChange.add(bean);

            }

        /*} catch (SQLException e) {
            e.printStackTrace();*/
        }
        //SQLite afprøvning
        catch (ClassNotFoundException | SQLException | InstantiationException | IllegalAccessException e) {
            e.printStackTrace();
        }
        //SQLite afprøvning*/
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

    public static boolean changetid(String type, String dato, String nydato ){
        boolean confirm = false;
        return confirm;
    }





    public static List<Integer> ledig (List<String> Ltid , int varighed)throws ClassNotFoundException{

        List<Integer> listofledig = new ArrayList<Integer>();
        int elementer = Ltid.size();
        boolean nonelemter= false;
        for(int i = 800; i<=1600-varighed; i+=varighed) {
            System.out.println("dette er mit første i: "+i);
            String jegeri = i+"";
            int add40 = jegeri.indexOf("6");
            if(add40!=-1){
                i=i+40;
            }
            if(i<1600) {
                for (int k = 0; k < elementer; k++) {
                    if (i == Integer.parseInt(Ltid.get(k))) {
                        nonelemter = true;
                    }
                }
                System.out.println("nonelementer " + nonelemter);
                if (nonelemter) {
                    nonelemter = false;
                } else {
                    listofledig.add(i);
                    System.out.println("dette er i: " + i);

                }
            }

        }

        return listofledig;
    }




}


