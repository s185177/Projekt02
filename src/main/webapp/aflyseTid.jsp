<%@ page import="data.AflysTidDao" %>
<%@ page import="data.ChangeBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Patient Kalender</title>
</head>
<body>
<h1>
    <%
        /*   ChangeBean aflys= new ChangeBean();
           aflys.setDato(request.getParameter("dato"));
           aflys.setSygehus(request.getParameter("sygehus"));
           aflys.setType(request.getParameter("type"));*/
        String id=request.getParameter( "id" );
        String type=request.getParameter( "type" );
        String dato=request.getParameter("dato");
        String sygehus= request.getParameter("sygehus");
       /* out.print(request.getParameter( "type" ));
        out.print(request.getParameter( "dato" ));
        out.print(request.getParameter( "sygehus" ));*/
    %>

</h1>


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
    <td style="border: none;"><form action="Aflys" method="post">

        <button type="submit">OK

        </button>
        <input type="hidden" name="id" value="<%=id%>">

    </form></td>

    </tr>



    </tbody>

</table>

<form action="aftaler.jsp">
    <button type="submit">Tilbage</button>
</form>
</body>
</html>
