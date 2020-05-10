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
<style>
header {
	width: 100%;
	height: 100px;
	font-size: 60px;
	padding-top: 20px;
	text-align: center;
}

article {
	width: 100%;
	text-align: center;
}
</style>
</head>
<body>
	<%
		String searchName = request.getParameter("search");
		if (searchName == null || searchName == "") {
			searchName = "no search";
		}
		int temp1 = 0, temp2 = 0, temp3 = 0, temp4 = 0, temp5 = 0, temp6 = 0;
		Connection conn = ConnectionContext.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM Game WHERE Nickname='" + searchName + "'");
		while (rs.next()) {
			temp1 = rs.getInt("strExp");
			temp2 = rs.getInt("strGold");
			temp3 = rs.getInt("strItem1");
			temp4 = rs.getInt("strItem2");
			temp5 = rs.getInt("strItem3");
			temp6 = rs.getInt("strItem4");
		}
	%>
	<header>
		NC.13<br />
		<br />
	</header>
	<article>
		<form name="searchform" action="main2process.jsp" method="post">
			<input type="text" name="search">&nbsp; <input type="submit"
				value="검색">
		</form>
		검색된 이름 :&nbsp;<%=searchName%>&nbsp;EXP :&nbsp;<%=temp1%>&nbsp;Gold
		:&nbsp;<%=temp2%>&nbsp; 아이템 1의 개수 :&nbsp;<%=temp3%>&nbsp;아이템 2의 개수
		:&nbsp;<%=temp4%>&nbsp; 아이템 3의 개수 :&nbsp;<%=temp5%>&nbsp;아이템 4의 개수
		:&nbsp;<%= temp6%>
	</article>
</body>
</html>