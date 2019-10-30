<%--
  Created by IntelliJ IDEA.
  User: Rune
  Date: 27-10-2019
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Patientkalender</title>
    </head>
    <body>
        <h1>Login her!</h1><br>

        <form action="Borger" method="get">
            <!-- Action giver URL videre til borger, som her er java servlet, der validerer og redirecter-->
            CPR:            <input type="text" name="cpr">
            Adgangskode:    <input type="password" name="pass">
                            <input type="submit" value="Login">

        </form>
    </body>
</html>
