<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="thinkonweb.util.ConnectionContext"%>
<%@ page import="java.sql.*"%>
<%
	String ID = request.getParameter("id");
	String PW = request.getParameter("pass");

	Connection conn = ConnectionContext.getConnection();
	Statement stmt = conn.createStatement();

	ResultSet rs = stmt.executeQuery("SELECT * from UserReg where ID ='" + ID + "'");
	String PWS;
	if (rs.next()) {
		PWS = rs.getString("PW");

		if (PW.equals(PWS)) {

			session.setAttribute("ID", ID);
%>
<script>
	alert("login success!");
	location.href = "main1_2.jsp";
</script>

<%
	} else {
%>
<script>
	alert("login failed");
	history.go(-1);
</script>
<%
	}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>