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
String pw=request.getParameter("pass");
try {
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ghost", "root", "root");
Statement stmt = conn.createStatement();
String sql="select * from member where user like '"+benutzerName+"'";
ResultSet res=stmt.executeQuery(sql);
if(res.next()) {
 user=res.getString(1);
  if (benutzerName.equals(user)) {
   password=res.getString(2);
   if (pw.equals(password)) {
     out.println("<form action='change.jsp' method='post'>");
     out.println("Bitte geben Sie Ihr neues Passwort ein:<br>");
     out.println("<input type='text' size='20' name='pass_new'><br>");
     out.println("<input type='hidden' name='benutzer' value='"+benutzerName+"'>");
     out.println("<input type='hidden' name='pass_old' value='"+pw+"'>");
     out.println("<input type='submit' value='Absenden'>");
     out.println("<input type='submit' value='L�schen'>");
     out.println("</form>");
   }
   else {
    out.println("<b>Passwort falsch</b><br>");
    out.println("<a href='login.html'>noch ein Versuch</a>");
   }
  }
  else {
    out.println("<b>Benutzername falsch</b><br>");
    out.println("<a href='login.html'>noch ein Versuch</a>");
   }
}
else {
 out.println("<b>Benutzername nicht vorhanden</b><br>");
 out.println("<a href='login.html'>noch ein Versuch</a>");
}

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
