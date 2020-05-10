<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="thinkonweb.util.ConnectionContext"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%
request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title></title>
</head>
<body>
<%
int i = 1;
String nick = "";
int exp = 0;
Connection conn = ConnectionContext.getConnection();
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("SELECT Nickname AS 'Nickname', strExp FROM Game ORDER BY strExp DESC");
while(rs.next()) {	
	nick = rs.getString("Nickname");
	exp = rs.getInt("strExp");
	if(!nick.equals("temp")) {
		out.println(i + "등 >> " + nick + " : " + exp + "<br/>");
		i++;
	}
}
%>
</body>
</html>