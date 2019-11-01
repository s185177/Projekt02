
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="aft.AftaleBean" %>
<%@ page import="aft.AftaleDao" %>
<html>
<head>
    <title>Patient kalender</title>
</head>
<body>

<%
    try {
        AftaleBean aftale = new AftaleBean();
        aftale = AftaleDao.hentAftaler(aftale);
        String sygehus = aftale.getSygehus();
        out.println(sygehus);

    }catch (Exception e){}
%>

<%--
<p> test : data-pubid="<%=sygehus%>"</p>
--%>

<div id="title" style="background-color: black;">
    <h1 style="color: white; margin-button: 0px;"><br>Dine tider p&aring; hospital 4:</h1><br>
</div>
<table style="border: solid black;" width="100%" cellpadding="20">
    <thead>
    <tr>
        <td style="border: none; font-weight: bold;">Tidspunkt</td>
        <td style="border: none; font-weight: bold;">Aftaletype</td>
        <td style="border: none; font-weight: bold;">Varighed (min)</td>
        <td style="border: none;">&nbsp;</td>
        <td style="border: none;">&nbsp;</td>
    </tr>
    </thead>
    <tbody style= "border: none;">

    <td style="border: none;">25/10 Kl. 10.30</td>
    <td style="border: none;">Røngten</td>
    <td style="border: none;">30</td>
    <td style="border: none;"><form action="ændreTider.jsp">
        <button type="submit">&AElig;ndre tid</button>
    </form></td>
    <td style="border: none;"><form action="AflyseTid.jsp">
        <button type="submit">Aflys tid</button>
    </form></td>
    </tr>
    <tr>
        <td style="border: none;">29/10 Kl. 12.40</td>
        <td style="border: none;">Blodpr&oslash;ve</td>
        <td style="border: none;">15</td>
        <td style="border: none;"><button type="button">&AElig;ndre tid</button></td>
        <td style="border: none;"><button type="button">Aflys tid</button></td>
    </tr>
    <tr>
        <td style="border: none;">03/11 Kl. 9.20</td>
        <td style="border: none;">Konsultation</td>
        <td style="border: none;">45</td>
        <td style="border: none;"><button type="button">&AElig;ndre tid</button></td>
        <td style="border: none;"><button type="button">Aflys tid</button></td>
    </tr>
    </tbody>
</table>




</body>
</html>
