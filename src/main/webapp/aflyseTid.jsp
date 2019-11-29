<%@ page import="data.UserBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Patient Kalender</title>
</head>
<body>
    <%
        UserBean bruger = (UserBean) session.getAttribute( "bruger" );
        // Tjekker om man videresendes, hvis ikke man har en session
        //System.out.println( "\n" + "Tjekker om man har session i aflysning" + bruger);
        if (bruger == null) {
            //System.out.println("Bruger er ikke logget ind og sendes tilbage til index.jsp");
            request.setAttribute( "ingenlog" ,  "Du har endnu ikke logget ind, indtast venligst dine login oplysninger");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward( request , response );
        }
        String id=request.getParameter( "id" );
        String type=request.getParameter( "type" );
        String dato=request.getParameter("dato");
        String sygehus= request.getParameter("sygehus");
    %>
<div id="title" style="background-color: black;">
    <h1 style="color: white; margin-bottom: 0px;"><br>Du er nu ved at aflyse følgende tid:</h1><br>
</div>
<table style="border: solid black;" width="100%" cellpadding="20">
    <thead>
        <tr>
            <td style="border: none;">&nbsp;</td>
            <td style="border: none; font-weight: bold;">Tidspunkt</td>
            <td style="border: none; font-weight: bold;">Sygehus</td>
            <td style="border: none; font-weight: bold;">Aftaletype</td>
            <td style="border: none; font-weight: bold;"></td>
            <td style="border: none;">&nbsp;</td>

        </tr>
    </thead>
    <tbody style= "border: none;">
        <td style="border: none;"></td>
        <td style="border: none;"><%=dato%></td>
        <td style="border: none;"><%=sygehus%></td>
        <td style="border: none;"><%=type%></td>
        <td style="border: none;"></td>
        <td style="border: none;">
            <form action="Aflys" method="post">
                <button type="submit">OK</button>
                <input type="hidden" name="id" value="<%=id%>">
            </form>
        </td>
    </tbody>
</table>
<form action="aftaler.jsp">
    <button type="submit">Tilbage</button>
</form>
</body>
</html>
