<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1">
</head>
<body>
<%@ page import="java.sql.*" %>
<%
String password;
String benutzerName=request.getParameter("benutzer");
String pw=request.getParameter("pass");
try {
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ghost", "root", "root");
Statement stmt = conn.createStatement();
String sql="select * from member where user like '"+benutzerName+"'";
ResultSet res=stmt.executeQuery(sql);
if(res.next()) {
 password=res.getString(2);
 if (pw.equals(password)) {
   sql="delete from member where user like '"+benutzerName+"' and password like '"+pw+"'";
   stmt.executeUpdate(sql);
   out.println("<p>Benutzer gelöscht</p>");
  }
 else {
  out.println("<b>Passwort falsch!</b>");
 }
}
else {
 out.println ("<p>Benutzername nicht vorhanden!"); 
}
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
