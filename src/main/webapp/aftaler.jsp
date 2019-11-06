
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>

<!-- Import af java klasser -->
<%@ page import="data.AftaleBean" %>
<%@ page import="data.AftaleDao" %>
<%@ page import="data.UserBean" %>

<html>
<head>
    <title>Patient kalenderen</title>
</head>
<body>
<div id="title" style="background-color: black;">
    <h2 style="color: white">
        <%
            UserBean bruger = (UserBean) session.getAttribute( "bruger" );
            // Tjekker om man videresendes, hvis ikke man har en session
            System.out.println( "\n" + "Tjekker om man har session, inden aftaler findes: " + bruger );
            if (bruger == null) {

                response.sendRedirect("index.jsp");
            }
            out.print("Velkommen " + " " + bruger.getFornavn() + " " + bruger.getEfternavn());
        %>

    </h2>
    <form action="index.jsp" style="text-align:right";>
        <button type="submit">Log ud</button>
    </form>
    <h1 style="color: white; margin-button: 0px;"><br>Dine tider p&aring; sygehus 9:</h1><br>
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
    List<AftaleBean> aftaler = AftaleDao.hentAftaler( bruger.getCpr() );

    // Udskriver hvor mange aftaler der er på følgende person
    System.out.println("Antal aftale objekter: " + aftaler.size() + "\n" + "Til følgende bruger: " + bruger.getCpr());
        for(int i=0; i<aftaler.size() ;i++){
            AftaleBean aftale= aftaler.get(i);
            String sygehus      = aftale.getSygehus();
            String dato         = aftale.getDato();
            String type         = aftale.getType();
            int varighed     = aftale.getVarighed() / 60 ;
    %>
            <tr>
                <td style="border: none;"><%=dato%></td>
                <td style="border: none;"><%=sygehus%></td>
                <td style="border: none;"><%=type%></td>
                <td style="border: none;"><%=varighed%></td>
                <td style="border: none;"><form action="ændreTider.jsp">
                    <button type="submit">&AElig;ndre tid</button>
                </form></td>
                <td style="border: none;"><form action="aflyseTid.jsp">
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
