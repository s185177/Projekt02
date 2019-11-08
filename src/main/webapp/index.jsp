<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Patient kalender</title>
    </head>
    <body style="text-align:center";>
    <div id="title" style="background-color: black;">
        <h1 style="color: white; margin-button: 0px;"><br>Login for at se dine aftaler på sygehus 9</h1><br>  <%-- der skal indsættes aftaletype som attribut --%>
    </div>
    <br>
        <h3 style="color: red;">
            ${forkert}
            <!-- Forsøgt men ikke officielt afprøvet -->
                <%--${ingenlog}--%>
        </h3>
        <form action="Borger" method="post">
            <!-- Action giver URL videre til borger, som her er java servlet, der validerer og redirecter-->
            CPR:            <input type="text" name="cpr"><br>
            Kode:    <input type="password" name="pass"></br><br>
                            <input type="submit" value="Login">

        </form>

    </body>
</html>
