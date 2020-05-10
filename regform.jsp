<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="thinkonweb.util.ConnectionContext"%>
<%@ page import="java.sql.*"%>
<%
	String ID = request.getParameter("ID");
	String PW = request.getParameter("PW");
	String PWCK = request.getParameter("PWCK");
	String NICK = request.getParameter("NICK");
	Connection conn = ConnectionContext.getConnection();
	Statement stmt = conn.createStatement();

	ResultSet rs = stmt.executeQuery("SELECT count(*) AS recordCount FROM UserReg   WHERE ID='" + ID + "'");
	while (rs.next()) {
		int recordCount = rs.getInt("recordCount");

		if (recordCount != 1) {
			PreparedStatement pstmt = conn
					.prepareStatement("INSERT INTO UserReg (ID,PW,Nickname) VALUES(?,?,?);");
			pstmt.setString(1, ID);
			pstmt.setString(2, PW);
			pstmt.setString(3, NICK);
			pstmt.executeUpdate();
			pstmt.close();
%>
<script>
	alert("REGISTER SUCCESS!!!");
	location.href = "main1.html";
</script>


<%
	} else {
%>
<script>
	alert("ID  exist!!!");
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