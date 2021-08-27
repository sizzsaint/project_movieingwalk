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
<title>로그아웃</title>
</head>
<body>
	<div style="position:absolute; left:200px; top:150px;">
	${u_name }님이 로그인 중입니다. &nbsp;&nbsp;&nbsp;&nbsp;
	
	<input type="button" value="로그아웃" onclick="location.href='#'">
	</div>
</body>
</html>