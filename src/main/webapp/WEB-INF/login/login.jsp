<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<link rel = "stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>로그인</title>
</head>
<body>
<div class="container">
	<form action="loginOK.jsp" method="post">
		<table class="table table-hover" style="width: 400px;">
			<caption>세션로그인</caption>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="u_id" size="20" placeholder="아이디" required="required" >
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="u_password" size="20" placeholder="비밀번호" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="로그인">
					<input type="button" value="회원가입" onclick="location.href='#'">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>