<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page session="true"%>
<!DOCTYPE html>

<html>
<%
if(session.getAttribute("mvId")==null){
   response.sendRedirect("/loginMember");
}else{
	Object object = session.getAttribute("mvId");
	String u_id = (String)object;
%> 
<head>
<meta charset="UTF-8">
<title>Mypage</title>
<script src="https://kit.fontawesome.com/8eb5905426.js"></script>

</head>
<body>
<!-- header고정 -->
<jsp:include page="../main/header.jsp"/>
<!-- 좌측 메뉴 -->
<jsp:include page="./leftMenu.jsp"/>

<table style= "width:500px; height:800px;">
<tr>
<td>
</table>

<!-- footer고정 -->
<jsp:include page="../main/footer.jsp"/>
</body>
<%} %>
</html>
