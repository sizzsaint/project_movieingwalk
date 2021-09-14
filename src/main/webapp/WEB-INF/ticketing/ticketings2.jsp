<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>movieingwalk</title>
</head>
<body>

<c:choose>
	<c:when test="${  msg  eq 'ok'}">
		<script type="text/javascript">
			alert('이미 예약된 좌석 입니다.')
			history.back();
		</script>
	</c:when>
	<c:otherwise>
	<script type="text/javascript">
		alert('예매가 완료되었습니다.')
		location.href="/ticket";
	</script>
	</c:otherwise>
</c:choose>

</body>
</html>