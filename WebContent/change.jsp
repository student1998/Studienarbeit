<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1">
</head>
<body>
<%@ page import="java.sql.*" %>
<%
String user, password;
String benutzerName=request.getParameter("benutzer");
String pw_old=request.getParameter("pass_old");
String pw_new=request.getParameter("pass_new");
try {
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ghost", "root", "root");
Statement stmt = conn.createStatement();
String sql="update member set password='"+pw_new+"' where user like '"+benutzerName+"' and password like '"+pw_old+"'"; 
stmt.executeUpdate(sql);
out.println("Ihr Passwort wurde aktualisiert<br>");
}
catch (ClassNotFoundException err) {
out.println("DB-Driver nicht gefunden!");
out.println(err);
}
catch (SQLException err) {
out.println("Connect nicht möglich");
out.println(err);
}
%>
</body>
</html>
