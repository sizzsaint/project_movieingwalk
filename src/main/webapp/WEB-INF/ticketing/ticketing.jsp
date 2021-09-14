<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
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
<title>예매하기</title>

<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
function searchParam(key) {
  return new URLSearchParams(location.search).get(key);
};

var m_idx = searchParam('m_idx');
console.log('test',m_idx);
</script>
</head>
<body>
<%-- <center> --%>
<c:if test="${seat_idx == ''}">
<script type="text/javascript">
	alert('좌석을 선택하세요)
	location.href='/ticketings'
</script>
</c:if>
<sf:form action="ticketings2" id="ticketForm" method="post" modelAttribute="ticketbean">
	<sf:input type="hidden" value="${m_idx}" path="m_idx" id="m_idx"/>
	<sf:input type="hidden" value="<%=u_id%>" path="u_id" id="u_id"/>
	<div>
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
	</div>
	<div><h5>좌석 선택</h5></div>
	<div class="ticket_seat_idx">
		<ul class="screen-view">SCREEN</ul>
		<ul>
			<li class="seat_1">
			<input type="radio" value="1" name="seat_idx">
			<input type="radio" value="2" name="seat_idx">
			<input type="radio" value="3" name="seat_idx">
			<input type="radio" value="4" name="seat_idx">
			<input type="radio" value="5" name="seat_idx">
			</li>		
		</ul>
	</div>
	<br><br><br>
	<button type="submit" onclick="checkTForm">예매하기</button>
	<input type="reset" value="초기화하기">
</sf:form>
<!-- </center>-->
</body>
</html>
<%}%>