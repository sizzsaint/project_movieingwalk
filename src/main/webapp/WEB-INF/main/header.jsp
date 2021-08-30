<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>movieingwalk</title>
<link href="./../../css/layout.css" rel ="stylesheet" type="text/css">
<link href="./../../css/index.css" rel ="stylesheet" type="text/css">

</head>
<body>

<header>
	<table style="color:white;">
		<tr>
			<td width="30%"></td>
			<td width="30%"><a href="#"><img src="./../../imgdata/mwlogo1.png" alt="movieingwalk_logo"></a></td>
			<td width="30%">
				<c:choose>
					<c:when test="${mvId == null }">
						<input type="button" value="로그인" onclick="location.href='loginMember'">
						<input type="button" value="회원가입" onclick="location.href='registmember'">
					</c:when>
					<c:otherwise>
						<h2>${mvId }님 환영합니다.</h2>
						<input type="button" value="로그아웃" onclick="location.href='/logoutMember'">
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>
</header>

<nav id="menu">
    <ul class="movie"><li><a href="#">영화</a></li></ul>
    <ul class="collection"><li><a href="#">컬렉션</a></li></ul>
    <ul class="ticketing"><li><a href="#">예매</a></li></ul>
    <ul class="my_page"><li><a href="#">마이페이지</a></li></ul>
</nav>

</body>
</html>