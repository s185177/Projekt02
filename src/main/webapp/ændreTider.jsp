
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Patient kalender</title>
</head>
<body>
<h1>Ledige Tider</h1>
<h2>Du er nu ved at ændre tiden for din Røngten undersøgelse</h2>  <%-- der skal indsættes aftaletype som attribut --%>
<p>Vælg Sygehus:</p>

<form action="">
    <select name="Sygehus">
        <option value="">Sygehus 1 </option>
        <option value="">Sygehus 2</option>
        <option value="">Sygehus 3</option>
        <option value="">Sygehus 4</option>
        <option value="">Sygehus 5</option>
        <option value="">Sygehus 6</option>
        <option value="">Sygehus 7</option>
        <option value="">Sygehus 8</option>
    </select>
    <br><br>
    <button type="submit">OK</button>
</form>
        <%--
  String Tid= "Ingen Ledige Tider";
  String Sygehus = "Intet Sygehus";
  String Varighed = "0";
--%>


<table style="border: solid black;" width="100%" cellpadding="20">
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
        <td style="border: none;"><button type="button">V&AElig;LG</button></td>

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
