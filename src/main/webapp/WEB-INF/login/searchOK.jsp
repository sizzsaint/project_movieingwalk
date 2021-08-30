<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery Framework 참조하기 -->
<script type="text/javascript" src="../js/jquery-1.11.0.min.js"></script>﻿
<title>searchOK</title>
</head>
<body>

<c:choose>
		<c:when test="${UserId == 'none' }">
			<script type="text/javascript">
				alert('해당 아이디는 존재하지 않습니다.')
				location.href='/searchInfo'
			</script>
		</c:when>
		<c:otherwise>
			<h1>${UserId }</h1>
		</c:otherwise>
	</c:choose>
</body>
</html>