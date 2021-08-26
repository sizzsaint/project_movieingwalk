<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입완료</title>
</head>
<body>
	<c:if test="${result==1}">
		<script type="text/javascript">
			alert('회원가입되었습니다..')
			location.href = '/'
		</script>
	</c:if>
</body>
</html>