<%--
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
    <% session.invalidate();
        response.sendRedirect("index.jsp");
    %>
</body>
</html>
