<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${remove eq 'member'}">
	<script type="text/javascript">
	alert('삭제되었습니다.')
		location.href='/mInfo_udateSort'
	</script>
</c:if>
<c:if test="${remove eq 'movie'}">
	<script type="text/javascript">
		alert('삭제되었습니다.')
		location.href='/mInfo_mdateSort'
	</script>
</c:if>
<c:if test="${remove eq 'review'}">
	<script type="text/javascript">
		alert('삭제되었습니다.')
		location.href='/rInfo_ridxSort'
	</script>
</c:if>
</body>
</html>