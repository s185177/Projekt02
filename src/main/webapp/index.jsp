
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="test.Database" %>
<html>
    <head>
        <title>Patient kalender</title>
    </head>
    <body>
        <h1>Login her!</h1><br>
        <div><a href="ændreTider.jsp">Ændre Tider</a></div>
        <form action="Borger" method="get">
            <!-- Action giver URL videre til borger, som her er java servlet, der validerer og redirecter-->
            CPR:            <input type="text" name="cpr">
            Adgangskode:    <input type="password" name="pass">
                            <input type="submit" value="Login">

        </form>
    </body>
</html>
