package classes;

import aft.AftaleBean;
import aft.AftaleDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/Borger")
public class BorgerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();

            UserBean user = new UserBean();
            user.setCpr(request.getParameter("cpr"));
            user.setKode(request.getParameter("pass"));

            user = UserDAO.validering(user);

            if (user.isGodkend()) {
                HttpSession session = request.getSession(true);
                session.setAttribute("bruger", user);   // Tildeler string "bruger" objektet user - som er bean.
                request.setAttribute( "cpr" , user.getCpr() );
                request.setAttribute( "fornavn" , user.getFornavn());
                request.setAttribute( "efternavn" , user.getEfternavn());
                    // Test af bruger objekt
                    /*
                    String navn = session.getAttribute( "bruger" ):
                    out.println(navn);*/
                    // Test af bruger objekt

                /*String bruger = user.getCpr();
                List<AftaleBean> aftaler = AftaleDao.hentAftaler( bruger );
                System.out.println("list aftale bean: "+aftaler.size());

                // For løkke der undersøger om flere aftaler findes for fundne bruger
                for(int i=0; i<aftaler.size() ;i++){
                    System.out.println(aftaler.get(i));         // Finder objekt (i), der hver er et aftale objekt og er en aftale
                }*/


                //response.sendRedirect("/aftaler.jsp");
                RequestDispatcher rd = request.getRequestDispatcher("/aftaler.jsp");
                rd.forward( request , response );

                System.out.println("Bruger objekt: " + user);
                System.out.println("Fornavn: " + user.getFornavn());
                System.out.println( "Efternavn: " + user.getEfternavn());
                System.out.println( "CPR: " + user.getCpr());

            } else  {
                request.setAttribute( "forkert" , "Du indtastet et forkert CPR eller kodeord, prøv venligst igen" );
                RequestDispatcher rd = request.getRequestDispatcher( "index.jsp" );
                rd.forward( request , response );
            }
        } catch (Throwable e) {
            System.out.println(e);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
//Kilde:
//http://met.guc.edu.eg/OnlineTutorials/JSP%20-%20Servlets/Full%20Login%20Example.aspx
//response.sendRedirect("http://localhost:8080/System_war_exploded/aftaler.jsp");
//https://www.geeksforgeeks.org/getattribute-passing-data-from-server-to-jsp/