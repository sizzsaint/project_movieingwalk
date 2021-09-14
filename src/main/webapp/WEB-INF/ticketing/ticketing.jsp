<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ page import = "java.sql.*" %>
<%
if(session.getAttribute("mvId")==null){
   response.sendRedirect("/loginMember");
}else{
   Object object = session.getAttribute("mvId");
   String u_id = (String)object;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./../../css/ticket.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/hiphop5782/js@0.0.13/cinema/hacademy-cinema.css">
    <style>
        *{
            box-sizing: border-box;
        }
        .float-box > div{
            float:left;
            width:50%;
        }
        .float-box::after{
            content:"";
            display: block;
            clear:both;
        }
        .float-box > .result {
            padding:0.5rem;
        }
    </style>
<script src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
<title>movieingwalk</title>

<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/gh/hiphop5782/js@0.0.13/cinema/hacademy-cinema.js"></script>
<script type="text/javascript">
// 영화코드 넘겨받기
function searchParam(key) {
  return new URLSearchParams(location.search).get(key);
};
var m_idx = searchParam('m_idx');
console.log('test',m_idx);

// 유효성
function Checkform(){
	var f = document.ticketForm; // 폼
	var radios = document.getElementsByName("seat_idx");
    if(!radios.checked)  {
      alert("좌석을 선택하세요")
      return false;
    } else if(radios.checked=true){
    	return true;
    }
    
  }
    f.submit();
}
</script>
</head>
<body>
<%-- <center> --%>
<sf:form action="ticketings2" id="ticketForm" method="post" modelAttribute="ticketbean"  onsubmit="return Checkform();">
	<sf:input type="hidden" value="${m_idx}" path="m_idx" id="m_idx"/>
	<sf:input type="hidden" value="<%=u_id%>" path="u_id" id="u_id"/>
		<div class="reserve-container">
            <div class="reserve-title">현재날짜기준</div>
            	<input type="date" name="tt_date" min="2021-09-14" max="2021-09-30">
         </div>
	<h6>시간</h6>
	<sf:select path="t_date">
		<sf:option value="09:30~11:00">09:30~11:00</sf:option>
		<sf:option value="12:00~13:40">12:00~13:40</sf:option>
		<sf:option value="14:30~16:00">14:30~16:00</sf:option>
		<sf:option value="18:00~19:50">18:00~19:50</sf:option>
		<sf:option value="21:00~22:30">21:00~22:30</sf:option>
	</sf:select>	
			<h6>지역</h6>
	<sf:select path="theater_idx">
		<sf:option value="1">서울</sf:option>
		<sf:option value="2">경기</sf:option>
		<sf:option value="3">인천</sf:option>
		<sf:option value="4">강원</sf:option>
		<sf:option value="5">부산</sf:option>
	</sf:select>
	<div><h5>좌석 선택</h5></div>
	<div class="ticket_seat_idx">
		<ul class="screen-view">SCREEN</ul>
		<ul>
			<li class="seat_1">
			<input type="radio" value="1" name="seat_idx" id="1">
			<input type="radio" value="2" name="seat_idx" id="2">
			<input type="radio" value="3" name="seat_idx" id="3">
			<input type="radio" value="4" name="seat_idx" id="4">
			<input type="radio" value="5" name="seat_idx" id="5">
			</li>		
		</ul>
		<ul>
			<li>
			<input type="radio" value="6" name="seat_idx" id="6">
			<input type="radio" value="7" name="seat_idx" id="7">
			<input type="radio" value="8" name="seat_idx" id="8">
			<input type="radio" value="9" name="seat_idx" id="9">
			<input type="radio" value="10" name="seat_idx" id="10">
			</li>
		</ul>
		<ul>
			<li>
			<input type="radio" value="11" name="seat_idx" id="11">
			<input type="radio" value="12" name="seat_idx" id="12">
			<input type="radio" value="13" name="seat_idx" id="13">
			<input type="radio" value="14" name="seat_idx" id="14">
			<input type="radio" value="15" name="seat_idx" id="15">
			</li>
		</ul>
		<ul>
			<li>
			<input type="radio" value="16" name="seat_idx" id="16">
			<input type="radio" value="17" name="seat_idx" id="17">
			<input type="radio" value="18" name="seat_idx" id="18">
			<input type="radio" value="19" name="seat_idx" id="19">
			<input type="radio" value="20" name="seat_idx" id="20">
			</li>
		</ul>
	</div>
	<br><br><br>
	<input type="submit" value="예매하기">
	<input type="reset" value="초기화하기">
</sf:form>
<!-- </center>-->
</body>
</html>
<%}%>