<html>
<title>Logout</title>
<body>
<%
session.invalidate();
response.sendRedirect("index.html");
%>
</body>
</html>