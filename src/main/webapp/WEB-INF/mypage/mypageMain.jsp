<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page session="true"%>


<!DOCTYPE html>
<c:set var="u_idx" value="${u_idx}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage</title>
<link href="./../../css/layout.css" rel ="stylesheet" type="text/css">
<link href="./../../css/index.css" rel ="stylesheet" type="text/css">
<script src="https://kit.fontawesome.com/8eb5905426.js"></script>

</head>
<body>
<!-- header고정 -->
<jsp:include page="../main/header.jsp"/>

    <ul>
      <li><a class="active" href="#u_reviews">나의 리뷰</a></li>
      <li><a href="#news">내가 좋아한 리뷰</a></li>
      <li><a href="#contact">나의 컬렉션</a></li>
      <li><a href="#about">내가 좋아한 컬렉션</a></li>
      <li><a href="/mypage/modify?u_idx='${memberBean.u_idx}'">회원정보수정</a></li>
    </ul>

<table>
<tr>
<td>Test</td>
</tr>
</table>
<!-- footer고정 -->
<jsp:include page="../main/footer.jsp"/>
</body>
</html>