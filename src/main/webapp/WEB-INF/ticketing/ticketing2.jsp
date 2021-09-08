<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
function(){
	if(numberP == null){
		alert('인원을 선택하세요');
		focus(numberP)
	}	
</script>
</head>
<meta charset="UTF-8">
<title>Insert title here</title>
<body>
	<center>
	<div class="nplist"><h5>인원 수</h5></div>
	<div>
		<input type="radio" name="numberP">1인<br>
		<input type="radio" name="numberP">2인
	</div>	
			
	<div><h5>좌석 선택</h5></div>
	<table>
	<form action="/ticketdetails" method="get" name="sform">
	<div class="seatlist">
		<ul class="screen-view">SCREEN</ul>
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
	</form>
<table>
		<input type="button" value="예매하기" onclick="location.href='/ticket'">
	</div>
</center>
</body>
</html>