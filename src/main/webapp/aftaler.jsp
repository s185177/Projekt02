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
    <h1 style="color: white">
    <%
        UserBean bruger = (UserBean) session.getAttribute( "bruger" );
        // Tjekker om man videresendes, hvis ikke man har en session
        //System.out.println( "\n" + "Tjekker om man har session, inden aftaler findes: " + bruger );
        if (bruger == null) {
            //System.out.println("Bruger er ikke logget ind og sendes tilbage til index.jsp");
                request.setAttribute( "ingenlog" ,  "Du har endnu ikke logget ind, indtast venligst dine login oplysninger");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward( request , response );
        }else {
            out.print("Velkommen " + " " + bruger.getFornavn() + " " + bruger.getEfternavn());
        }
    %>
    </h1>
    <form action="logout.jsp" style="text-align:right";>
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
        //System.out.println("Antal aftale objekter: " + aftaler.size() + "\n" + "Til følgende bruger: " + bruger.getCpr());
            for(int i=0; i<aftaler.size() ;i++){
                AftaleBean aftale= aftaler.get(i);
                String sygehus      = "Sygehus " + aftale.getSygehus();
                String dato         = aftale.getDato();
                String type         = aftale.getType();
                int varighed     = aftale.getVarighed() / 60 ;
                int id              =aftale.getId();
        %>
            <form method="post">
                <tr>
                    <td style="border: none;"><input type="hidden" name="dato" value="<%=dato%>"> <%=dato%></td>
                    <td style="border: none;"><input type="hidden" name="sygehus" value="<%=sygehus%>"> <%=sygehus%></td>
                    <td style="border: none;" ><input type="hidden" name="type" value="<%=type%>"> <%=type%> </td>
                    <td style="border: none;"><input type="hidden" name="varighed" value="<%=varighed%>"> <%=varighed%></td>
                    <input type="hidden" name="id" value="<%=id%>">

                    <td style="border: none;">
                        <button formaction="ændreTider.jsp" type="submit">Ændre tid</button>

                    </td>
                    <td style="border: none;">
                            <button formaction="aflyseTid.jsp" type="submit">Aflys tid</button>
                        </form>
                    </td>
                </tr>
           <%
            }
            %>
    </tbody>
</table>
</body>
</html>
