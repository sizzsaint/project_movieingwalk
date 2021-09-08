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
<title>로그인확인</title>
</head>
<body>
<c:if test="${result eq 'same'}">
	<script type="text/javascript">
		alert('로그인 되었습니다.')
		history.bakc();
	</script>
</c:if>
<c:if test="${result eq 'noID'}">
	<script type="text/javascript">
		alert('해당 아이디는 존재하지 않습니다.')
		location.href='/loginMember'
	</script>
</c:if>
<c:if test="${result eq 'different'}">
	<script type="text/javascript">
		alert('비밀번호가 올바르지 않습니다.')
		location.href='/loginMember'
	</script>
</c:if>
</body>
</html>