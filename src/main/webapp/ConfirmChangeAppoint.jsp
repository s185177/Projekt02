    <%--
  Created by IntelliJ IDEA.
  User: iskin
  Date: 05-11-2019
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="data.ChangeDao" %>
<html>

<head>
    <title>Patient kalender</title>
</head>
<body style="text-align:center";>
<div id="title" style="background-color: black;">
    <h1 style="color: white; margin-button: 0px;"><br>Er du sikker på at du vil ændre følgende tider for Røntgen?</h1><br>  <%-- der skal indsættes aftaletype som attribut --%>
</div>
<table style="border: solid black;" width="100%" cellpadding="20">
    <thead>

    </thead>
    <tbody style= "border: none;">
    <tr>

        <td style="border: none; text-align:center;">Fra den <% out.print(request.getParameter("dato"));%></td>
        <td>
            <form action="aftaler.jsp">
                <button type="submit">Ja</button></form>
        </td>
    </tr>

    <tr>

        <td style="border: none; text-align:center;">Til den <%out.print(request.getParameter("nydato")); %> kl. <%out.print(request.getParameter("ledigetid"));%> </td>
        <td>
            <form action="ændreTider.jsp">
                <button type="submit">Nej</button></form>
        </td>
    </tr>

    </tbody>
</table>

</body>
</html>
