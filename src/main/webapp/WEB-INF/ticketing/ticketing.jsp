<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%-- 로그인세션
<%
if(session.getAttribute("mvId")==null){
   response.sendRedirect("/loginMember");
}else{
%>
  --%>
<head> 
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./../../css/ticket.css" rel="stylesheet" type="text/css">
</head>
<body>
<script type="text/javascript">
// 좌석 만들기
var seats = [];
for (var i = 1; i < 30; i++){
	seats[i] = false;
}
// 좌석유효성검사
function seatok {
	if(n<1 || n > 2)
		alert("좌석은 1~2개까지 선택가능합니다.")
		return;
}
</script>
<center>
<form action="/ticket" name="mform" method="post">
	<h6>영화</h6>
	<select name="movielist">
		<option value="트와일라잇" selected>트와일라잇</option>
		<option value="뉴문">뉴문</option>
		<option value="이클립스">이클립스</option>
		<option value="브레이킹던 part 1">브레이킹던 part 1</option>
		<option value="브레이킹던 part 2">브레이킹던 part 2</option>	
	</select>
		<h6>지역</h6>
	<select name="theaterlist">
		<option value="서울" selected>서울</option>
		<option value="경기">경기</option>
		<option value="인천">인천</option>
		<option value="강원">강원</option>	
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
	<h5>좌석 선택</h5>
	<div class="seatlist" id="n">
		<ul style="background-color: pink; border: 1px; width: 100px;">SCREEN</ul>
		<ul>
			<li class="seat_1">
			<input type="checkbox" value="1" name="seat1">
			<input type="checkbox" value="2" name="seat1">
			<input type="checkbox" value="3" name="seat1">
			<input type="checkbox" value="4" name="seat1">
			<input type="checkbox" value="5" name="seat1">
			</li>		
		</ul>
		<ul>
			<li>
			<input type="checkbox" value="6" name="seat1">
			<input type="checkbox" value="7" name="seat1">			
			<input type="checkbox" value="8" name="seat1">
			<input type="checkbox" value="9" name="seat1">
			<input type="checkbox" value="10" name="seat1">
			</li>
		</ul>
		<ul>
			<li>
			<input type="checkbox" value="11" name="seat1">
			<input type="checkbox" value="12" name="seat1">			
			<input type="checkbox" value="13" name="seat1">
			<input type="checkbox" value="14" name="seat1">
			<input type="checkbox" value="15" name="seat1">
			</li>
		</ul>
		<ul>
			<li>
			<input type="checkbox" value="16" name="seat1">
			<input type="checkbox" value="17" name="seat1">			
			<input type="checkbox" value="18" name="seat1">
			<input type="checkbox" value="19" name="seat1">
			<input type="checkbox" value="20" name="seat1">
			</li>
		</ul>
	</div>	
	<br><br><br>
	<input type="submit" value="예매하기" onclick="alert('예매성공')">
	<input type="reset" value="초기화하기">
</form>
</center>
</body>
<%--
<%}%>
 --%>
</html>