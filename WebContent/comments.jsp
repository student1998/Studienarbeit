<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1">
<title>Gästebuch</title></head>
<body>
<h3>Gästebuch</h3>
<p>Wollen Sie sich ins <a href="eintrag.html">Kommentar eintragen?</a>!</p>
<%@ page import="java.sql.*" %>
<%
String nachname, email, zeit, kommentar;
try {
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ghost", "root", "root");
Statement stmt = conn.createStatement();
String sql="select * from comments";
ResultSet res=stmt.executeQuery(sql);
res.afterLast();
while (res.previous()) {
 nachname=res.getString(1); 
 email=res.getString(2); 
 zeit=res.getString(3); 
 kommentar=res.getString(4);
 out.println("<p><div style='font-family:verdana; font-size:10pt'><b>Name: </b>"+nachname+"<br>\n");
 out.println("<b>E-Mail: </b><a href = 'mailto:"+email+"'>"+email+"</a><br>\n");
 out.println("<b>Datum: </b>"+zeit.substring(6,8)+"."+zeit.substring(4,6)+"."+zeit.substring(0,4));
 out.println(" um "+zeit.substring(8,10)+":"+zeit.substring(10,12)+":"+zeit.substring(12)+"<br>\n");
 out.println("<b>Kommentar: </b>"+kommentar+"</div></p><br><br>\n");
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
