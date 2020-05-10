<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="thinkonweb.util.ConnectionContext"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%
String job = "학생";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title></title>
<script>
var log;
var strLog = '';
var exec1, exec2, exec3, exec4;
var map; // 맵에 대한 기능을 구현하기 위한 변수이다.
var gold; // 게임 상에서 구현하기 위한 골드이다.
var exp; // 게임 상에서 구현하기 위한 경험치이다.
var item; // 게임 상에서 구현하기 위한 아이템이다.
var count1 = 0, count2 = 0, count3 = 0, count4 = 0;
var strExp = 0, strGold = 0;

function init() {
	strLog += "카우에 접속하였습니다.<br/>";
	document.getElementById('log').innerHTML = strLog;
}

function map1() {
	map = 1;
	
	strLog += "본관에 입장하였습니다.<br/>";
	document.getElementById('log').innerHTML = strLog;
	exec1 = setInterval(message, 1000);
	stop(exec2);
	stop(exec3);
	stop(exec4);
}

function map2() {
	map = 2;
		
	strLog += "학관에 입장하였습니다.<br/>";
	document.getElementById('log').innerHTML = strLog;
	exec2 = setInterval(message, 1000);
	stop(exec1);
	stop(exec3);
	stop(exec4);
}

function map3() {
	map = 3;
	
	strLog += "강의동에 입장하였습니다.<br/>";
	document.getElementById('log').innerHTML = strLog;
	exec3 = setInterval(message, 1000);
	stop(exec1);
	stop(exec2);
	stop(exec4);
}

function map4() {
	map = 4;
	
	strLog += "도서관에 입장하였습니다.<br/>";
	document.getElementById('log').innerHTML = strLog;
	exec4 = setInterval(message, 1000);
	stop(exec1);
	stop(exec2);
	stop(exec3);
}

function stop(exec) {
	clearInterval(exec);
}

function message() {
	if(map == 1) {
		gold = 1 + Math.floor(Math.random() * 10);
		exp = 1 + Math.floor(Math.random() * 10);
		item = 1 + Math.floor(Math.random() * 10);
		
		if(item == 1) {
			count1++;
			strLog += "아이템과 ";
			document.getElementById('item1').innerHTML = "아이템 1 : " + count1 + "개";
		}
	}
	if(map == 2) {
		gold = 11 + Math.floor(Math.random() * 90);
		exp = 11 + Math.floor(Math.random() * 90);
		item = 1 + Math.floor(Math.random() * 10);
		
		if(item == 1) {
			count2++;
			strLog += "아이템과 ";
			document.getElementById('item2').innerHTML = "아이템 2 : " + count2 + "개";
		}
	}
	if(map == 3) {
		gold = 101 + Math.floor(Math.random() * 900);
		exp = 101 + Math.floor(Math.random() * 900);
		item = 1 + Math.floor(Math.random() * 10);
		
		if(item == 1) {
			count3++;
			strLog += "아이템과 ";
			document.getElementById('item3').innerHTML = "아이템 3 : " + count3 + "개";
		}
	}
	if(map == 4) {
		gold = 1001 + Math.floor(Math.random() * 9000);
		exp = 1001 + Math.floor(Math.random() * 9000);
		item = 1 + Math.floor(Math.random() * 10);
		
		if(item == 1) {
			count4++;
			strLog += "아이템과 ";
			document.getElementById('item4').innerHTML = "아이템 4 : " + count4 + "개";
		}
	}
	strLog += exp + "경험치, " + gold + "골드를 획득하였습니다." + "<br/>";
	store();
	document.getElementById('exp').innerHTML = strExp;
	document.getElementById('gold').innerHTML = strGold;
	log = document.getElementById('log');
	log.innerHTML = strLog;
	log.scrollTop = log.scrollHeight;
}

function store() {
	strExp += exp;
	strGold += gold;
	
	document.gamedata.exp.value = strExp;
	document.gamedata.gold.value = strGold;
	document.gamedata.count1.value = count1;
	document.gamedata.count2.value = count2;
	document.gamedata.count3.value = count3;
	document.gamedata.count4.value = count4;
}

function goExp() {
	var option = "width=400, height=400";
	window.open("compare_exp.jsp", "", option);
}

function goGold() {
	var option = "width=400, height=400";
	window.open("compare_gold.jsp", "", option);
}
</script>
<style>
section {
	float: left;
	width: 400px;
	height: 420px;
}

#form1 {
	float: left;
	width: 400px;
	height: 250px;
}

#form2 {
	float: left;
	width: 400px;
	height: 100px;
}

#itemlist {
	line-height: 11px;
}

#itemlist2 {
	line-height: 11px;
}

.button {
	border: 2px solid #4caf50;
	background-color: white;
	color: black;
	text-align: center;
	padding: 10px 15px;
}

.button2 {
	border: 2px solid #ff6666;
	background-color: white;
	color: black;
	text-align: center;
	padding: 10px 20px;
}

#part2 {
	width: 500px;
}

#log {
	float: left;
	width: 500px;
	height: 400px;
	overflow: auto;
	background: #c0c0c0;
}
</style>
</head>
<body onload="init();">
<%
String name = "";
int temp1 = 0, temp2 = 0, temp3 = 0, temp4 = 0, temp5 = 0, temp6 = 0;
Connection conn = ConnectionContext.getConnection();
Statement stmt = conn.createStatement();
Object o = session.getAttribute("ID");
String id = (String)o;
ResultSet rs = stmt.executeQuery("SELECT * FROM UserReg WHERE ID='" + id + "'");
String nick = "";
while(rs.next()) {
	nick = rs.getString("Nickname");
}
rs = stmt.executeQuery("SELECT * FROM Game WHERE Nickname='" + nick + "'");
while(rs.next()) {	
	name = rs.getString("Nickname");
	temp1 = rs.getInt("strExp");
	temp2 = rs.getInt("strGold");
	temp3 = rs.getInt("strItem1");
	temp4 = rs.getInt("strItem2");
	temp5 = rs.getInt("strItem3");
	temp6 = rs.getInt("strItem4");
}
session.setAttribute("nick", nick);
%>
	<section>
		<article id="form1">
			<table border="10">
				<tr>
					<td><strong>닉네임 : </strong></td>
					<td><strong><%=nick%></strong></td>
					<td>이전 값</td>
				</tr>
				<tr>
					<td>직업</td>
					<td colspan="2"><%=job%></td>
				</tr>
				<tr>
					<td>EXP</td>
					<td><p id="exp">0</p></td>
					<td><%=temp1 %></td>
				</tr>
				<tr>
					<td>골드</td>
					<td><p id="gold">0</p></td>
					<td><%=temp2%></td>
				</tr>
				<tr>
					<td>아이템</td>
					<td>
						<article id="itemlist">
							<p id="item1">아이템 1 : 0개</p>
							<p id="item2">아이템 2 : 0개</p>
							<p id="item3">아이템 3 : 0개</p>
							<p id="item4">아이템 4 : 0개</p>
						</article>
					</td>
					<td>
						<article id="itemlist2">
							<p>아이템 1 : <%=temp3 %>개</p>
							<p>아이템 2 : <%=temp4 %>개</p>
							<p>아이템 3 : <%=temp5 %>개</p>
							<p>아이템 4 : <%=temp6 %>개</p>
						</article>
					</td>
				</tr>
			</table>
		</article>
		<article id="form2">
			<button class="button" id="button1" onclick="map1();">본관</button>
			<button class="button" id="button2" onclick="map2();">학관</button>
			<button class="button" id="button3" onclick="map3();">강의동</button>
			<button class="button" id="button4" onclick="map4();">도서관</button>
			<form name="gamedata" action="gamedata.jsp" method="post">
			<input type="hidden" name="exp">
			<input type="hidden" name="gold">
			<input type="hidden" name="count1">
			<input type="hidden" name="count2">
			<input type="hidden" name="count3">
			<input type="hidden" name="count4">
			<input type="submit" class="button2" value="게임 종료">
			</form>
			<button class="button2" onclick="goExp();">Exp 순위</button>
			<button class="button2" onclick="goGold();">Gold 순위</button>
			</br>
		</article>
	</section>
	<section id="part2">
		<article id="log"></article>
	</section>
</body>
</html>