<%@ page import="data.UserBean" %><%--
  Created by IntelliJ IDEA.
  User: Rune
  Date: 06-11-2019
  Time: 19:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Logout</title>
</head>
<body>
    <%
        UserBean bruger = (UserBean) session.getAttribute( "bruger" );
        session.invalidate();
        bruger = null;

        //System.out.println( "Session efter logout: " + bruger);
        response.sendRedirect("index.jsp");
    %>
</body>
</html>
