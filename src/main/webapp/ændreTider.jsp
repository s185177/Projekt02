
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="data.ChangeDao" %>
<%@ page import="data.AftaleBean" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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
            request.getParameter( "type" );
        System.out.println("parameter " + request.getParameter("type"));
        out.print(request.getParameter( "type" ));
        %>
     undersøgelse på følgende tispunkt <% out.print(request.getParameter("dato")); %></h1>  <%-- der skal indsættes aftaletype som attribut --%>


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
       String dato = request.getParameter("dato");
       String id = request.getParameter("id");
       String [] Vdato = dato.split(" ");
       List<String> Otid = new ArrayList<String>();
       String ledigetid ="";
       String aaaammdd="";
       int varighed = 0;
        List<AftaleBean> changes = ChangeDao.usedappointments(type, Vdato[0]);
        System.out.println("Antal CHANGE objekter: " + changes.size());


        for(int i=0; i<changes.size() ;i++) {
            AftaleBean change = changes.get(i);
            String Odato = change.getDato();
            String [] Otider = Odato.split(" ");
            aaaammdd =Otider[0];
            String [] time =Otider[1].split(":");
            String finaltime = "";
            boolean startermednul = time[0].startsWith("0");
            if(startermednul==true){
               String [] time2=time[0].split("0",2);
               finaltime = time2[1]+time[1];
                startermednul=false;
            }else finaltime = time[0]+time[1];

            System.out.println(finaltime);
            Otid.add(finaltime);
            varighed = change.getVarighed() / 60;
            System.out.println(varighed);
        }
        List<Integer> ledig = ChangeDao.ledig(Otid, varighed);

        //System.out.println("parameter " + request.getParameter("type"));
        //out.print(request.getParameter( "type" ));






    %>

    <thead>
    <tr>
        <td style="border: none; font-weight: bold;">Sygehus</td>
        <td style="border: none; font-weight: bold;">Dato</td>
        <td style="border: none; font-weight: bold;">Tidspunkt</td>
         <td style="border: none; font-weight: bold;">Varighed (min)</td>
        <td style="border: none;"><form action="aftaler.jsp">
            <button  align='right' type="submit">Tilbage</button>
        </form></td>

    </tr>
    </thead>
    <tbody style= "border: none;">
    <tr>
        <% if(ledig.size()==0){%>
            <h3> Der er ingen ledige tider denne dag</h3>
        <%
        }
        for(int i=0; i<ledig.size();i++){
        int dinetider=ledig.get((i));
        ledigetid = dinetider+"";


        %>
        <form method="post" >
        <td>sygehus 1</td> <!-- dette er til sygehus nummer -->
        <td style="border: none;"><input type="hidden" name="nydato" value="<%=aaaammdd%>"><%=aaaammdd%></td>
        <td style="border: none;"><input type="hidden" name="ledigetid" value="<%=ledigetid%>"><%=ledigetid%></td> <%--Henter her timestamp--%>

        <td style="border: none;"><input type="hidden" name="varighed" value="<%=varighed%>"><%=varighed%></td> <%--Henter her varighed--%>
            <input type="hidden" name="dato" value="<%=dato%>">
            <input type="hidden" name="type" value="<%=type%>">
            <input type="hidden" name="id" value="<%=id%>">
        <td style="border: none;">

            <button type="submit" formaction="ConfirmChangeAppoint.jsp">VÆLG</button>
        </form></td>

    </tr>
    <%}%>
</table>

</body>
</html>
