
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="data.ChangeDao" %>
<%@ page import="data.AftaleBean" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="data.UserBean" %>
<html>
<head>
    <title>Patient kalender</title>
</head>
<body>
    <%
        UserBean bruger = (UserBean) session.getAttribute( "bruger" );
        // Tjekker om man videresendes, hvis ikke man har en session
        //System.out.println( "\n" + "Tjekker om man har session inden ændre tider vises: " + bruger);
        if (bruger == null) {
            //System.out.println("Bruger er ikke logget ind og sendes tilbage til index.jsp");
            request.setAttribute( "ingenlog" ,  "Du har endnu ikke logget ind, indtast venligst dine login oplysninger");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward( request , response );
        }
    %>
<div id="title" style="background-color: black;">
    <form action="logout.jsp" style="text-align:right";>
        <button type="submit">Log ud</button>
    </form>
<h1 style="color: white; margin-button: 0px;">Du er ved at ændre tiden for din
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
                case "EEG":
                    out.print("Encephalografi");
                    break;
                case "EKG":
                    out.print("Elektrokardiografi");
                    break;
                case "ENDOSP":
                    out.print("Endoskopi");
                    break;
                case "MR":
                    out.print("MR-scanning");
                    break;
                case "RTG":
                    out.print("Røntgen");
                    break;
                case "UL":
                    out.print("Ultra-lyd");
                    break;
                case "PET":
                    out.print("PET-scanning");
                    break;
            }
            System.out.println("Valgt aftale type til ændring af tid: " + "\n" + "Type: " + request.getParameter("type") + "\n" + "Dato: " + request.getParameter("dato") + "\n" + "Id: " + request.getParameter("id") );
        %>
    på følgende tispunkt <% out.print(request.getParameter("dato")); %></h1>

<p style="color:white">Vælg Sygehus for at finde ledige tider:
    <form action="">
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
    </form>
</p>
<br>
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
        System.out.println("Antal aftaler af samme type på valgt dag: " + changes.size());

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

            System.out.println("Tidspunkt for valgt aftale: " + finaltime);
            Otid.add(finaltime);
            varighed = change.getVarighed() / 60;
            System.out.println("Varighed for valgt aftale: " + varighed);
        }
    %>
    <thead>
        <tr>
            <td style="border: none; font-weight: bold;">Sygehus</td>
            <td style="border: none; font-weight: bold;">Dato</td>
            <td style="border: none; font-weight: bold;">Tidspunkt</td>
            <td style="border: none; font-weight: bold;">Varighed (min)</td>
            <td style="border: none;">
                <form action="aftaler.jsp">
                <button  align='right' type="submit">Tilbage</button>
                </form>
            </td>
        </tr>
    </thead>
    <tbody style= "border: none;">
        <tr>
            <%
                List<Integer> ledig = ChangeDao.ledig(Otid, varighed);
                if(ledig.size()==0){
            %>
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
    <form action="aftaler.jsp">
        <button type="submit">Tilbage</button>
    </form>
</body>
</html>
