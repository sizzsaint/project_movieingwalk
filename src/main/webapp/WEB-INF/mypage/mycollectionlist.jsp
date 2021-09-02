<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body >
<jsp:include page="../main/header.jsp"/>
<jsp:include page="./leftMenu.jsp"/>
<!-- 나의된리뷰 -->
<table class="mycollection" style="color:white;">

	<thead>
		<tr>
			<th colspan="6"><i class="fas fa-angle-right"></i> 내가등록한리뷰</th>
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
	<tbody>
	<% for(int i=0; i<3; i++) {%>
		<tr>
			<td><img src="./../../imgdata/test.PNG"></td>
			<td>영화명</td>
			<td>작성자</td>
			<td><a href="#">리뷰</a></td>
			<td>작성일</td>
			<td>좋아요수</td>
		</tr>
	<%}%>
		<tr>
		<td align="right"><a href="">전체보기</a></td>
	</tbody>
	<thead>
		<tr>
			<th colspan="6"><i class="fas fa-angle-right"></i> 내가좋아요한리뷰</th>
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
	<tbody>
	<% for(int i=0; i<3; i++) {%>
		<tr>
			<td><img src="./../../imgdata/test.PNG"></td>
			<td>영화명</td>
			<td>작성자</td>
			<td><a href="#">리뷰</a></td>
			<td>작성일</td>
			<td>좋아요수</td>
		</tr>
	<%}%>
		<tr>
		<td align="right"><a href="">전체보기</a></td>
	</tbody>
</table>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>