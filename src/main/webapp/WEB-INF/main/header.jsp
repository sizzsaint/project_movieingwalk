<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>movieingwalk</title>
<link href="./../../css/index.css" rel ="stylesheet" type="text/css">
</head>
<body>

<header>
	<table>
		<tr>
			<td width="30%"></td>
			<td width="30%"><a href="#"><img src="./../../imgdata/mwlogo1.png" alt="movieingwalk_logo"></a></td>
			<td width="30%">
				<input type="button" value="로그인" onclick="location.href='./../login/login.jsp'">
				<input type="button" value="회원가입" onclick="location.href='#'">
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