
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Patient Kalender</title>
</head>
<body>
<div id="title" style="background-color: black;">
    <h1 style="color: white; margin-bottom: 0px;"><br>Du er nu ved at aflyse følgende tid:</h1><br>

</div>
<table style="border: solid black;" width="100%" cellpadding="20">
    <thead>
    <tr>
        <td style="border: none;">&nbsp;</td>
        <td style="border: none; font-weight: bold;">Tidspunkt</td>
        <td style="border: none; font-weight: bold;">Aftaletype</td>
        <td style="border: none; font-weight: bold;"></td>
        <td style="border: none;">&nbsp;</td>

    </tr>
    </thead>
    <tbody style= "border: none;">
    <td style="border: none;"></td>
    <td style="border: none;">25/10 Kl. 10.30</td>
    <td style="border: none;">Røntgen</td>

    <td style="border: none;"></td>
    <td style="border: none;"><form action="aftaler.jsp">
        <button type="submit">OK</button>
    </form></td>

    </tr>



    </tbody>

</table>

<form action="aftaler.jsp">
    <button type="submit">Tilbage</button>
</form>
</body>
</html>
