<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
	function logout() {

		location.href = "logout.jsp";
		parent.frames['second'].location.href = "main2.jsp"
	}
	function run() {

		parent.frames['second'].location.href = "game.jsp";
	}
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	NC.13
	<form id="info" name="info" action="login.jsp" method="post">
		<%=session.getAttribute("ID")%>
		welcome! <input type="button" value="logout" onclick="logout()">
		<input type="button" value="게임 실행" onclick="run()"><br />
	</form>

</body>
</html>