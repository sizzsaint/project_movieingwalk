<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page session="true"%>


<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Mypage</title>
<link href="./../../css/layout.css" rel ="stylesheet" type="text/css">

<!-- <script src="https://kit.fontawesome.com/8eb5905426.js"></script> -->
<script type="text/javascript">

</script>
</head>
<body>
<!-- header고정 -->
<jsp:include page="../main/header.jsp"/>


<table>
<tr>
<td width="400"><jsp:include page="./leftMenu.jsp"/></td>
<td></td>
</tr>
</table>
<!-- footer고정 -->
<jsp:include page="../main/footer.jsp"/>
</body>
</html>