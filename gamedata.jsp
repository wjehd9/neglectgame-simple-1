<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="thinkonweb.util.ConnectionContext"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%
String tempExp = request.getParameter("exp");
int exp = Integer.parseInt(tempExp);
String tempGold = request.getParameter("gold");
int gold = Integer.parseInt(tempGold);
String tempstrItem1 = request.getParameter("count1");
int strItem1 = Integer.parseInt(tempstrItem1);
String tempstrItem2 = request.getParameter("count2");
int strItem2 = Integer.parseInt(tempstrItem2);
String tempstrItem3 = request.getParameter("count3");
int strItem3 = Integer.parseInt(tempstrItem3);
String tempstrItem4 = request.getParameter("count4");
int strItem4 = Integer.parseInt(tempstrItem4);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title></title>
</head>
<body>
<%
Object o = session.getAttribute("nick");
String nick = (String)o;
Connection conn = ConnectionContext.getConnection();
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("SELECT count(*) AS recordCount FROM Game WHERE Nickname='temp'");
while(rs.next()) {
	int recordCount = rs.getInt("recordCount");
	if(recordCount != 1) {
		
	} else {
		PreparedStatement pstmt = conn.prepareStatement("DELETE FROM Game WHERE Nickname=?");
		pstmt.setString(1, "temp");
		pstmt.executeUpdate();
		pstmt.close();
	}
	PreparedStatement pstmt = conn.prepareStatement("INSERT INTO Game (Nickname, Job, strExp, strGold, strItem1, strItem2, strItem3, strItem4)"
			+ " VALUES (?,?,?,?,?,?,?,?)");
	pstmt.setString(1, "temp");
	pstmt.setString(2, "Student");
	pstmt.setInt(3, exp);
	pstmt.setInt(4, gold);
	pstmt.setInt(5, strItem1);
	pstmt.setInt(6, strItem2);
	pstmt.setInt(7, strItem3);
	pstmt.setInt(8, strItem4);
	pstmt.executeUpdate();
	pstmt.close();
}

int temp1 = 0, temp2 = 0, temp3 = 0, temp4 = 0, temp5 = 0, temp6 = 0;
int total1 = 0, total2 = 0, total3 = 0, total4 = 0, total5 = 0, total6 = 0;
rs = stmt.executeQuery("SELECT * FROM Game WHERE Nickname='" + nick +"'");
while(rs.next()) {
	temp1 = rs.getInt("strExp");
	temp2 = rs.getInt("strGold");
	temp3 = rs.getInt("strItem1");
	temp4 = rs.getInt("strItem2");
	temp5 = rs.getInt("strItem3");
	temp6 = rs.getInt("strItem4");	
}

total1 = exp + temp1;
total2 = gold + temp2;
total3 = strItem1 + temp3;
total4 = strItem2 + temp4;
total5 = strItem3 + temp5;
total6 = strItem4 + temp6;

rs = stmt.executeQuery("SELECT count(*) AS recordCount FROM Game WHERE Nickname='" + nick + "'");
while(rs.next()) {
	int recordCount = rs.getInt("recordCount");
	if(recordCount != 1) {
		
	} else {
		PreparedStatement pstmt = conn.prepareStatement("DELETE FROM Game WHERE Nickname=?");
		pstmt.setString(1, nick);
		pstmt.executeUpdate();
	}
	PreparedStatement pstmt = conn.prepareStatement("INSERT INTO Game (Nickname,  Job, strExp, strGold, strItem1, strItem2, strItem3, strItem4)"
			+ " VALUES (?,?,?,?,?,?,?,?)");
	pstmt.setString(1, nick);
	pstmt.setString(2, "Student");
	pstmt.setInt(3, total1);
	pstmt.setInt(4, total2);
	pstmt.setInt(5, total3);
	pstmt.setInt(6, total4);
	pstmt.setInt(7, total5);
	pstmt.setInt(8, total6);
	pstmt.executeUpdate();
	pstmt.close();
}
rs.close();
response.sendRedirect("main2.jsp");
%>
</body>
</html>