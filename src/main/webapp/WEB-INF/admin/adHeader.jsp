<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link href="./../../css/layout.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
		<table style="color: white;">
			<tr>
				<td width="30%"><a href="#"><img
						src="./../../imgdata/mwlogo1.png" alt="movieingwalk_logo"></a></td>
				<td width="30%" style="font-size:30px; font-weight: bold;">관리자 페이지입니다.</td>
				<td width="30%">
					<c:if test="${mvAdId  != null }">
						<h2>${mvAdId }님환영합니다.</h2>
						<input type="button" value="로그아웃" onclick="location.href='/adLogout'">
					</c:if>
				</td>
			</tr>
		</table>
	</header>


</body>
</html>