<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1">
</head>
<body>
<%@ page import="java.sql.*" %>
<%
String user, password;
String nachname=request.getParameter("nachname");
String email=request.getParameter("email");
String kommentar=request.getParameter("kommentar");
try {
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ghost", "root", "root");
Statement stmt = conn.createStatement();
String sql="insert into comments values ('"+nachname+"', '"+email+"', now(), '"+kommentar+"')";
stmt.executeUpdate(sql);
out.println ("<p>Vielen Dank f�r Ihren Eintrag!</p>");
out.println ("<a href='comments.jsp'>Zur�ck zum G�stebuch</a>!");
}
catch (ClassNotFoundException err) {
out.println("DB-Driver nicht gefunden!");
out.println(err);
}
catch (SQLException err) {
out.println("Connect nicht m�glich");
out.println(err);
}
%>
</body>
</html>
