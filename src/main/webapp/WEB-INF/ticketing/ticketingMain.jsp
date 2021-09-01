<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ page import="com.movieingwalk.www.ticketing.PageNumberingManager"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./../../css/mypage.css" rel="stylesheet" type="text/css">
<jsp:include page="../main/header.jsp"/>
<nav class="menu" style="float: left; width: 20%"><jsp:include page="./menu.jsp"/></nav>
</head>
<body>
<!--<script type="text/javascript">
	alert('예매')
</script>
-->
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<center>
	<div style="border: 1px white; float: left; width: 30%; padding:10px;">
		<img src="" width="150" height="200" border="1"><br>
			예매율 순위1<br>
		<input type="button" value="예매"><br>
	</div>

	<div style="border: 1px white; float: left; width: 30%; padding:10px;">
		<img src="" width="150" height="200" border="1"><br>
		예매율 순위2<br>
		<input type="button" value="예매" onclick=""><br>
	</div>

	<div style="border: 1px white; float: left; width: 30%; padding:10px;">
		<img src="" width="150" height="200" border="1"><br>
		예매율 순위3<br>
		<input type="button" value="예매" onclick=""><br>
	</div>

	<div style="border: 1px white; float: left; width: 30%; padding:10px;">
		<img src="" width="150" height="200" border="1"><br>
		예매율 순위4<br>
		<input type="button" value="예매" onclick=""><br>
	</div>
	
	<div style="border: 1px white; float: left; width: 30%; padding:10px;">
		<img src="" width="150" height="200" border="1"><br>
		예매율 순위5<br>
		<input type="button" value="예매" onclick=""><br>
	</div>
	
	<div style="border: 1px white; float: left; width: 30%; padding:10px;">
		<img src="" width="150" height="200" border="1"><br>
		예매율 순위6<br>
		<input type="button" value="예매" onclick=""><br>
	</div>

	<div style="border: 1px white; float: left; width: 30%; padding:10px;">
		<img src="" width="150" height="200" border="1"><br>
		예매율 순위7<br>
		<input type="button" value="예매" onclick=""><br>
	</div>
	
	<div style="border: 1px white; float: left; width: 30%; padding:10px;">
		<img src="" width="150" height="200" border="1"><br>
		예매율 순위8<br>
		<input type="button" value="예매" onclick=""><br>
	</div>
	
	<div style="border: 1px white; float: left; width: 30%; padding:10px;">
		<img src="" width="150" height="200" border="1"><br>
		예매율 순위9<br>
		<input type="button" value="예매" onclick=""><br>
	</div>
</center>
	</body>
</html>