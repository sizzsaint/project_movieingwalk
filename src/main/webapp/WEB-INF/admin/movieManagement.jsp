<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link href="./../../css/adSection.css" rel ="stylesheet" type="text/css">
<script src="https://kit.fontawesome.com/8eb5905426.js"></script>
</head>
<body>
<!-- adHeader고정 -->
<jsp:include page="./adHeader.jsp"/>
<!-- adAside(좌측)고정 -->
<jsp:include page="./adAside.jsp"/>

<section>
	<table>
		<tr>
			<td width="15%"><h1>영화목록</h1></td>
			<td width="69%">
			<!-- 검색창 -->
 				<div class="search">
    				<input type="text" placeholder="검색하세요.">
    				<a href="#"><i class="fas fa-search fa-2x"></i></a>
				</div>
			</td>
			<td width="15%">
				
			</td>
		</tr>
	</table>
	
	<!-- content 테이블 -->
	<table>
		<tr style="text-align: center; font-weight: bold;">
			<td>영화코드</td><!-- m_id-->
			<td>영화명</td><!-- m_title -->
			<td>개봉일</td><!-- m_date-->
		</tr>
		<c:forEach items="${moviesInfo}" var="info">
		<tr> 
			<td>${info.m_idx}</td>
			<td>${info.m_title}</td>
			<td>${info.m_date}</td>
		</tr>
		</c:forEach>
	</table>
</section>

</body>
</html>