<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%-- 로그인세션 // 유저 아이디값 가져오기
<%
if(session.getAttribute("mvId")==null){
   response.sendRedirect("/loginMember");
}else{
   Object object = session.getAttribute("mvId");
   String u_id = (String)object;
%> 
출력할때는 <%= u_id %>
  --%>
<head> 
<meta charset="UTF-8">
<title>예매하기</title>
<link href="./../../css/ticket.css" rel="stylesheet" type="text/css">
</head>
<body>
<center>
<form name="ticketing" method="get">
		<h6>지역</h6>
	<select id="regionlist">
		<option value=서울 selected>서울</option>
		<option value="경기">경기</option>
		<option value="인천">인천</option>
		<option value="강원">강원</option>
		<option value="부산">부산</option>
	</select>
	<h6>날짜</h6>
	<select name="datelist">
		<option value="월">월</option>
		<option value="화">화</option>
		<option value="수">수</option>
		<option value="목">목</option>
		<option value="금" selected>금</option>
		<option value="토">토</option>
		<option value="일">일</option>
	</select>
	<h6>시간</h6>
	<select>
		<option value="시간1" selected>09:30~11:00</option>
		<option value="시간2">12:00~13:40</option>
		<option value="시간3">14:30~16:00</option>
		<option value="시간4">18:00~19:50</option>
		<option value="시간5">21:00~22:30</option>
	</select>	
	<br><br><br>
	<input type="button" value="좌석선택하기" onclick="location.href='/ticketings2'">
	<input type="reset" value="초기화하기">
</center>
</form>
</body>
<%--
<%}%>
 --%>
</html>