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
    <%--<%
        UserBean bruger = (UserBean) session.getAttribute( "bruger" );
        // Tjekker om man videresendes, hvis ikke man har en session
        //System.out.println( "\n" + "Tjekker om man har session i bekræft ændring" + bruger );
        if (bruger == null) {
            //System.out.println("Bruger er ikke logget ind og sendes tilbage til index.jsp");
            request.setAttribute( "ingenlog" ,  "Du har endnu ikke logget ind, indtast venligst dine login oplysninger");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward( request , response );
        }
    %>--%>
    <%System.out.println("TEST");%>
<div id="title" style="background-color: black;">
    <h1 style="color: white; margin-button: 0px;"><br>Er du sikker på at du vil ændre den tid for din <% out.print(request.getParameter("type"));%> undersøgelse</h1><br>  <%-- der skal indsættes aftaletype som attribut --%>
</div>
<table style="border: solid black;" width="100%" cellpadding="20">
    <thead>
    <%
    String nydato = request.getParameter("nydato");
    String ledigetid = request.getParameter("ledigetid");
        //System.out.println("dette er ledigetid " + ledigetid);
    int length = ledigetid.length();
    String first ="";
    String second ="";
    if(length==4){
       first =ledigetid.substring(0,2);
       second = ledigetid.substring(2);

    }else{
        first =ledigetid.substring(0,1);
        first="0"+first;
        second = ledigetid.substring(1);
    }
    String datotildatabase = nydato+" "+first+":"+second+":"+"00";
        //System.out.println("datotildatabase "+datotildatabase);
    %>
    </thead>
    <tbody style= "border: none;">
    <tr>

        <td style="border: none; text-align:center;">Fra den <% out.print(request.getParameter("dato"));%></td>
        <td>
            <form action="aftaler.jsp">
                <%ChangeDao.changetid(request.getParameter("id"),datotildatabase);%>
                <button type="submit">Ja</button></form>
        </td>
    </tr>

    <tr>

        <td style="border: none; text-align:center;">Til den <%out.print(request.getParameter("nydato")); %> kl. <%out.print(ledigetid);%> </td>
        <td>
            <form action="ændreTider.jsp">
                <input type="hidden" name="dato" value="<%=request.getParameter("dato")%>">
                <input type="hidden" name="type" value="<%=request.getParameter("type")%>">
                <button type="submit">Nej</button></form>
        </td>
    </tr>

    </tbody>
</table>

</body>
</html>
