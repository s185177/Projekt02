package business;

import data.UserBean;
import data.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Borger")
public class BorgerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            UserBean user = new UserBean();
            user.setCpr(request.getParameter("cpr"));
            user.setKode(request.getParameter("pass"));

            user = UserDAO.validering( user );
            // Test om validering, og ændring af Godkend er sket
            //System.out.println( "Validering af bruger inden session & videresendelse: " + user.isGodkend() );

            if (user.isGodkend()) {
                HttpSession session = request.getSession(true);
                session.setAttribute("bruger", user );   // Tildeler string "bruger" objektet user - som er bean.
                // Viser nuværende indloggede bruger objekt
                //System.out.println( "Nuværende bruger-objekt efter database godkend: " + session.getAttribute( "bruger" ) );
                response.sendRedirect("aftaler.jsp");
            } else  {
                // Angiver forkert login er benyttet - minder om print fra UserDAO
                request.setAttribute( "forkert" , "Du indtastet et forkert CPR eller kodeord, prøv venligst igen." );
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
//Benytttet kilde:
//http://met.guc.edu.eg/OnlineTutorials/JSP%20-%20Servlets/Full%20Login%20Example.aspx