
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="data.ChangeDao" %>
<%@ page import="data.ChangeBean" %>

<%@ page import="java.util.List" %>
<html>
<head>
    <title>Patient kalender</title>
</head>
<body>
<div id="title" style="background-color: black;">
    <form action="logout.jsp" style="text-align:right";>
        <button type="submit">Log ud</button>
    </form>
<h1 style="color: white; margin-button: 0px;">Du er ved at ændre tiden for din
    <!-- Forsøgt men ikke officielt afprøvet -->
        <%
            request.setCharacterEncoding("UTF-8");
            switch (request.getParameter( "type" )) {
                case "BP":
                    out.print("Blod Prøve");
                    break;
                case "CT":
                    out.print("CT-scanning");
                    break;
                case "BIOPS":
                    out.print("Biopsi");
                    break;
            }
        System.out.println("parameter " + request.getParameter("type"));
        //out.print(request.getParameter( "type" ));
        %>
    undersøgelse</h1>  <%-- der skal indsættes aftaletype som attribut --%>


<p style="color:white">Vælg Sygehus for at finde ledige tider:<form action="">
    <select name="Sygehus">
        <option value="1">Sygehus 1 </option>
        <option value="2">Sygehus 2</option>
        <option value="3">Sygehus 3</option>
        <option value="4">Sygehus 4</option>
        <option value="5">Sygehus 5</option>
        <option value="6">Sygehus 6</option>
        <option value="7">Sygehus 7</option>
        <option value="8">Sygehus 8</option>
    </select>

    <button type="submit">OK</button> <br>
</form> </p>
<br>

        <%--
  String Tid= "Ingen Ledige Tider";
  String Sygehus = "Intet Sygehus";
  String Varighed = "0";
--%>
</div>

<table style="border: solid black;" width="100%" cellpadding="20">
    <% String type = request.getParameter( "type" );
        List<ChangeBean> changes = ChangeDao.usedappointments(type);
        System.out.println("Antal CHANGE objekter: " + changes.size());
        for(int i=0; i<changes.size() ;i++) {
            ChangeBean change = changes.get(i);
            String dato = change.getDato();
            int varighed = change.getVarighed() / 60;
            System.out.println(dato);
            System.out.println(varighed);
        

        }
        //System.out.println("parameter " + request.getParameter("type"));
        //out.print(request.getParameter( "type" ));






    %>
    <thead>
    <tr>
        <td style="border: none; font-weight: bold;">Sygehus</td>
        <td style="border: none; font-weight: bold;">Dato</td>
        <td style="border: none; font-weight: bold;">Tidspunkt</td>
         <td style="border: none; font-weight: bold;">Varighed (min)</td>
        <td style="border: none;">&nbsp;</td>

    </tr>
    </thead>
    <tbody style= "border: none;">
    <tr>
        <td></td>
        <td style="border: none;">01.11.2019</td>
        <td style="border: none;">Kl 10.00</td> <%--Henter her timestamp--%>

        <td style="border: none;">15 min</td> <%--Henter her varighed--%>
        <td style="border: none;"><form action="ConfirmChangeAppoint.jsp">
            <button type="submit">VÆLG</button>
        </form></td>

    </tr>
    <tr>
        <td></td>
        <td style="border: none;">05.11.2019</td>
        <td style="border: none;">Kl 14.00</td> <%--Henter her timestamp--%>
        <td style="border: none;">15 min</td> <%--Henter her varighed--%>
        <td style="border: none;"><button type="button">V&AElig;LG</button></td>

    </tr>
    <tr>
        <td></td>
        <td style="border: none;">20.11.2019</td>
        <td style="border: none;">Kl 11.00</td> <%--Henter her timestamp--%>
        <td style="border: none;">15 min</td> <%--Henter her varighed--%>
        <td style="border: none;"><button type="button">V&AElig;LG</button></td>

    </tr>
</table>
    <form action="aftaler.jsp">
        <button  align='right' type="submit">Tilbage</button>
    </form>
</body>
</html>
