<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1">
</head>
<body>
<%@ page import="java.sql.*, java.util.*, javax.mail.*, javax.mail.internet.*" %>
<%
String user, password, email, body;
String benutzerName=request.getParameter("benutzer");
try {
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ghost", "root", "root");
Statement stmt = conn.createStatement();
String sql="select * from member where user like '"+benutzerName+"'";
ResultSet res=stmt.executeQuery(sql);
if(res.next()) {
 user=res.getString(1);
  if (benutzerName.equals(user)) {
    //Passwort und Mail-Adresse auslesen
    password=res.getString(2);
    email=res.getString(3);
    //Mail-Text generieren:
    body="\nIhre Zugangsdaten lauten:\n\n";
    body=body+"Benutzername: "+user;
    body=body+"\nPasswort: "+password;
    body=body+"\nE-Mail: "+email;
    body=body+"\n\nIhre Support-Abteilung";
    //E-Mail verschicken:
   try {
     Properties prop = new Properties();
     prop.put("mail.smtp.host", "imap.googlemail.com");
     Session s = Session.getInstance(prop);
     MimeMessage message = new MimeMessage(s);
     InternetAddress from = new InternetAddress("myevents24@googlemail.com");
     message.setFrom(from);
     InternetAddress rcpt = new InternetAddress(email); 
     message.addRecipient(Message.RecipientType.TO, rcpt);
     message.setSubject("Ihre Zugangsdaten");
     message.setText(body);
     Transport.send(message);
     out.println("<p>E-Mail wurde verschickt....</p>");
   }
 catch (MessagingException msgexcep) {
    out.println (msgexcep.getMessage());

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
out.println("Connect nicht möglich");
out.println(err);
}
%>
</body>
</html>
