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
String mail=request.getParameter("mail");
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ghost", "root", "root");
	Statement stmt = conn.createStatement();
	String sql="select * from member where user like '"+benutzerName+"'";
	ResultSet res=stmt.executeQuery(sql);
	if(res.next()) {
		out.println ("<b>Benutzername schon vorhanden!</b>");
		out.println ("<br>Bitte wählen Sie einen neuen Namen:<br><br>");
		out.println ("<a href='neu.html'>Registrierung</a>!");
	}
	else {
		sql="insert into member values ('"+benutzerName+"', '"+pw+"','"+mail+"')";
		stmt.executeUpdate(sql);
		out.println ("<p>Sie wurden erfolgreich in die Datenbank aufgenommen."); 
		out.println ("<br>Danke für die Registrierung</p>");
		out.println ("<br>Sie können sich jetzt sofort <a href='login.html'>einloggen</a>!");
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
