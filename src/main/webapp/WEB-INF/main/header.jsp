<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>movieingwalk</title>

<!-- css -->
<link href="./../../css/header.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	function showPopup() {
		window.open("registmember", "a",
				"width=500, height=1000, left=100, top=50");
	}
</script>
</head>
<body>
	<header>
		<table>
			<tr>
				<td width="30%"></td>
				<td width="30%"><a href="/">
				<img src="./../../imgdata/mwlogo1.png" alt="movieingwalk_logo"></a></td>
				<td width="30%"><c:choose>
						<c:when test="${mvId == null }">
							<input type="button" value="로그인"
								onclick="location.href='/loginMember'">
							<input type="button" value="회원가입"
								onclick="showPopup()">
						</c:when>
						<c:otherwise>
							<h2>${mvId }님 환영합니다.</h2>
							<input type="button" value="로그아웃"
								onclick="location.href='/logoutMember'">
						</c:otherwise>
					</c:choose></td>
			</tr>
		</table>
	</header>

	<nav id="menu">
		<ul class="movie">
			<li><a href="/movieinfo/Main">영화</a></li>
		</ul>
		<ul class="collection">
			<li><a href="#">컬렉션</a></li>
		</ul>
		<ul class="ticketing">
			<li><a href="#">예매</a></li>
		</ul>
		<ul class="my_page">
			<li>
			<c:choose>
			<c:when test="${mvId == null}"><a href="/loginMember">마이페이지</a></c:when>
				<c:otherwise><a href="/mypage?u_id=<c:out value="${mvId}"/>">마이페이지</a></c:otherwise>
			</c:choose>
			</li>
		</ul>
	</nav>

</body>
</html>