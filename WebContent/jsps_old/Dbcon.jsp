<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
	int pos;
	String user, pw, mail;

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ghost", "root", "root");
	Statement stmt = conn.createStatement();
	
	String sql;
	//Neue DB anlegen
	//sql="create database ghost";
	//stmt.executeUpdate(sql);
	//Neue Tabelle anlegen
	//sql = "create table member(user varchar(50), password varchar(20), email varchar(50))";
	//stmt.executeUpdate(sql);
	//Tabelleneintrag
	//sql = "insert into member values('Paul', '123')";
	//stmt.executeUpdate(sql);
	//Spalte hinzufügen
	//sql = "alter table member add email varchar(60)";
	//stmt.executeUpdate(sql);
	//sql = "insert into member values('Willi1', 'ta123', 'willi@gmail.com')";
	//stmt.executeUpdate(sql);
	
	sql = "create table comments(user varchar(50),email varchar(50), time timestamp, comment text)";
	stmt.executeUpdate(sql);
	
	sql = "select * from member";
	ResultSet res = stmt.executeQuery(sql);
	res.last();
	int anz = res.getRow();
	out.println("<p>Anzahl der Datensätz in der Tabelle");
	out.println(anz);
	out.println("</p>");
	
	res.first();
	out.println("<table border='2'><th>Nummer</th><th>User</th><th>Password</th><th>EMail</th>");
	while(res.next()) {
		pos=res.getRow();
		user=res.getString(1);
		pw=res.getString(2);
		mail=res.getString(3);
		out.println("<tr><td>"+pos+"</td><td>"+user+"</td><td>"+pw+"</td><td>"+mail+"</td></tr>");
	}
	out.println("</table>");
}
// JDBC Treiber vorhanden & korrekt installiert?
catch (ClassNotFoundException err) {
	out.println("DB-Driver nicht gefunden!");
	out.println(err);
}
// Verbindung zur mySQL-DB möglich?
catch (SQLException err) {
	out.println("Connect nicht moeglich");
	out.println(err);
}

%>
</body>
</html>