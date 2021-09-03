<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="../js/jquery-1.11.0.min.js"></script>﻿
<title>Movieing Walk</title>

</head>
<body>
<c:if test="${result eq 'same'}">
	<script type="text/javascript">
		alert('탈퇴되었습니다')
		location.href='/'
	</script>
</c:if>
<c:if test="${result eq 'diff'}">
	<script type="text/javascript">
		alert('비밀번호가 올바르지 않습니다.')
		location.href='/'
	</script>
</c:if>
</body>
</html>