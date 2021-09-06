<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="utf-8">
<title>movieingwalk</title>

<!-- css -->
<link href="./../../css/index.css" rel="stylesheet" type="text/css">

<script src="https://kit.fontawesome.com/8eb5905426.js"></script>
</head>

<body>
	<!-- header고정 -->
	<jsp:include page="./header.jsp" />

	<section class="index">
		<!-- 검색창 -->
		<div class="search">
			<input type="text" placeholder="보고싶은 영화를 검색하세요."> <a href="#"><i
				class="fas fa-search fa-lg"></i></a>
		</div>
<jsp:include page="./recommand.jsp"/>

		<!-- 최신등록된리뷰 -->
		<table class="review">
			<!-- 영화 포스터 출력부-->
			<thead>
				<tr>
					<th colspan="6"><i class="fas fa-angle-right"></i> 최신등록된리뷰</th>
				</tr>
				<tr>
					<td width="7%"></td>
					<td width="15%"><b>영화명</b></td>
					<td width="15%"><b>작성자</b></td>
					<td width="25%"><b>리뷰</b></td>
					<td width="10%"><b>작성일</b></td>
					<td width="8%"><b>좋아요</b></td>
				</tr>
			</thead>

			<!-- 영화제목 -->
			<tbody>
				<%
					for (int i = 0; i < 3; i++) {
				%>
				<tr>
					<td><img src="./../../imgdata/test.PNG"></td>
					<td>영화명</td>
					<td>작성자</td>
					<td><a href="#">리뷰</a></td>
					<td>작성일</td>
					<td>좋아요수</td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>

<jsp:include page="./screening.jsp"/>

	</section>

	<!-- footer고정 -->
	<jsp:include page="./footer.jsp" />
</body>
</html>
