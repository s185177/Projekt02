
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="test.Database" %>
<html>
    <head>
        <title>Patient kalender</title>
    </head>
    <body style="text-align:center";>
    <div id="title" style="background-color: black;">
        <h1 style="color: white; margin-button: 0px;"><br>Login for at se dine aftaler på sygehus 9</h1><br>  <%-- der skal indsættes aftaletype som attribut --%>
    </div>
    <br>
        <div><a href="aftaler.jsp">Aftaler</a></div>
    <form>
        <br action="Borger" method="get">
            <!-- Action giver URL videre til borger, som her er java servlet, der validerer og redirecter-->
            CPR:            <input type="text" name="cpr"> <br>
            kode:    <input type="password" name="pass"> </br><br>
                            <input type="submit" value="Login">

        </form>
    </body>
</html>
