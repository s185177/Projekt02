
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>

<!-- import af aft pakke for aftaler -->
<%@ page import="aft.AftaleBean" %>
<%@ page import="aft.AftaleDao" %>

<!-- import af classes pakke - for login -->
<%@ page import="classes.UserBean" %>
<%@ page import="classes.UserDAO" %>
<html>
<head>
    <title>Patient kalender</title>
</head>

    <%--<%
        try {
            UserBean user = new UserBean();
            user.setCpr(request.getParameter("cpr"));
            user.setKode(request.getParameter("pass"));

            user = UserDAO.validering(user);
            if (user.isGodkend()) {
                session = request.getSession(true);
                session.setAttribute("currentSessionUser", user);
                response.sendRedirect("localhost:8080/System_war_exploded/aftaler.jsp");
            } else if (!user.isGodkend()) {
                out.println("Forkert login");
            }
        } catch (Throwable e) {
            System.out.println(e);
        }
    %>--%>

<body>


<div id="title" style="background-color: black;">
    <h2 style="color: white">
        <%
            out.print("Velkommen " + request.getAttribute( "fornavn" ) + " ");
            out.print(request.getAttribute( "efternavn" ));
        %>
    </h2>
    <form action="index.jsp" style="text-align:right";>
        <button type="submit">Log ud</button>
    </form>
    <h1 style="color: white; margin-button: 0px;"><br>Dine tider p&aring; hospital 4:</h1><br>
</div>


<table style="border: solid black;" width="100%" cellpadding="20">
    <thead>
    <tr>
        <td style="border: none; font-weight: bold;">Tidspunkt</td>
        <td style="border: none; font-weight: bold;">Aftale Sted</td>
        <td style="border: none; font-weight: bold;">Aftaletype</td>
        <td style="border: none; font-weight: bold;">Varighed (min)</td>
        <td style="border: none;">&nbsp;</td>
        <td style="border: none;">&nbsp;</td>
    </tr>
    </thead>


    <tbody style= "border: none;">

    <%
    List<AftaleBean> aftaler = AftaleDao.hentAftaler( request.getAttribute( "cpr" ));
    System.out.println("list aftale bean: "+aftaler.size());
        for(int i=0; i<aftaler.size() ;i++){
            AftaleBean aftale= aftaler.get(i);
            String sygehus      = aftale.getSygehus();
            String dato         = aftale.getDato();
            String type         = aftale.getType();
            int varighed     = aftale.getVarighed() / 60 ;

            request.setAttribute( "tid" , dato );
    %>
            <tr>
                <td style="border: none;"><%out.println(dato);%></td>
                <td style="border: none;"><%out.println(sygehus);%></td>
                <td style="border: none;"><%out.println(type);%></td>
                <td style="border: none;"><%out.println(varighed);%></td>
                <td style="border: none;"><form action="ændreTider.jsp">
                    <button type="submit">&AElig;ndre tid</button>
                </form></td>
                <td style="border: none;"><form action="AflyseTid.jsp">
                    <button type="submit">Aflys tid</button>
                </form></td>
            </tr>

       <%
        }
        %>
</table>

<!---

    <tr>
        <td style="border: none;">29/10 Kl. 12.40</td>
        <td style="border: none;">Blodpr&oslash;ve</td>
        <td style="border: none;">15</td>
        <td style="border: none;"><button type="button">&AElig;ndre tid</button></td>
        <td style="border: none;"><button type="button">Aflys tid</button></td>
    </tr>
    <tr>
        <td style="border: none;">03/11 Kl. 9.20</td>
        <td style="border: none;">Konsultation</td>
        <td style="border: none;">45</td>
        <td style="border: none;"><button type="button">&AElig;ndre tid</button></td>
        <td style="border: none;"><button type="button">Aflys tid</button></td>
    </tr>
    </tbody>
</table>

-->
</body>
</html>
