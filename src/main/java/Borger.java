import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/Borger")
public class Borger extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();
            String test1 = request.getParameter("cpr");
            String test2 = request.getParameter("pass");
            out.println(test1 + test2);

            UserBean user = new UserBean();
            user.setCpr(request.getParameter("cpr"));
            user.setKode(request.getParameter("pass"));

            user = UserDAO.validering(user);
            out.println(user.isGodkend());
            if (user.isGodkend()) {
                System.out.println("Hej");
                HttpSession session = request.getSession(true);
                session.setAttribute("currentSessionUser", user);
                response.sendRedirect("http://localhost:8080/System_war_exploded/aftaler.jsp");
            }
        } catch (Throwable e) {
            System.out.println(e);
        }
    }
}
//Kilde:
//http://met.guc.edu.eg/OnlineTutorials/JSP%20-%20Servlets/Full%20Login%20Example.aspx
//response.sendRedirect("http://localhost:8080/System_war_exploded/aftaler.jsp");