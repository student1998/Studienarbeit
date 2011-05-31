<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head><title>Tabelle erweitern</title></head>
<body>
<p>Tabelle erweitern</p>
<%@ page import="java.sql.*" %>
<%
try {
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ghost", "root", "root");
Statement stmt = conn.createStatement();
String sql="alter table member add email varchar(60)";
stmt.executeUpdate(sql);
}
catch (ClassNotFoundException err) {
out.println("DB-Driver nicht gefunden!");
out.println(err);
}
catch (SQLException err) {
out.println("Connect nicht moeglich");
out.println(err);
}
%>
</body>
</html>
