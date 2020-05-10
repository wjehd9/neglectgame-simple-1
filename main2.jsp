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
	<header>
		NC.13<br />
		<br />
	</header>
	<article>
		<form name="searchform" action="main2process.jsp" method="post">
			<input type="text" name="search">&nbsp; <input type="submit"
				value="검색">
		</form>
	</article>
</body>
</html>