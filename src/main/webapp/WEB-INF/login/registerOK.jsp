<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입완료</title>
</head>
<body>
	<c:if test="${result==1}">
		<script type="text/javascript">
			alert('회원가입되었습니다.')
			window.close()
		</script>
	</c:if>
</body>
</html>