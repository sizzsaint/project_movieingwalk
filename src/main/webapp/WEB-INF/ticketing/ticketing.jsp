<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<!DOCTYPE html>
<html>
<%-- 로그인세션 // 유저 아이디값 가져오기  --%>
<%
if(session.getAttribute("mvId")==null){
   response.sendRedirect("/loginMember");
}else{
   Object object = session.getAttribute("mvId");
   String u_id = (String)object;
%> 
<head> 
<meta charset="UTF-8">
<title>예매하기</title>
<!-- 여기 싹고쳐보고계세요 sf붙인데는 path로 넴-->
<link href="./../../css/ticket.css" rel="stylesheet" type="text/css">
</head>
	<header>
		<table>
			<tr>
				<td width="30%"></td>
					<td width="30%"><c:choose>
						<c:when test="${mvId == null }">
							<input type="button" value="로그인"
								onclick="location.href=''ticketings">
							<input type="button" value="회원가입"
								onclick="showPopup()">
						</c:when>
						<c:otherwise>
							<h2>${mvId}님 환영합니다.</h2>
						</c:otherwise>
					</c:choose></td>
			</tr>
		</table>
	</header>
<body>
<%-- <center> --%>
<c:url var="insertUrl" value="/ticketings" />
<sf:form modelAttribute="ticketBean" method="POST" action="${insertUrl}">
<!-- 이거쓰려면 name대신 path가 들어가야되요 sf:form select도 sf붙은게 있긴하던데..-->	
	<h6>시간</h6>
	<input type="hidden" value="${u_id}" name="u_id">
	<sf:select path="t_date">
		<sf:option value="09:30~11:00" selected>09:30~11:00</sf:option>
		<sf:option value="12:00~13:40">12:00~13:40</sf:option>
		<sf:option value="14:30~16:00">14:30~16:00</sf:option>
		<sf:option value="18:00~19:50">18:00~19:50</sf:option>
		<sf:option value="21:00~22:30">21:00~22:30</sf:option>
	</sf:select>	
			<h6>지역</h6>
	<sf:select path="theater_idx">
		<sf:option value="1" selected>서울</sf:option>
		<sf:option value="2">경기</sf:option>
		<sf:option value="3">인천</sf:option>
		<sf:option value="4">강원</sf:option>
		<sf:option value="5">부산</sf:option>
	</sf:select>

	<a href='/movieinfo/MovieDetail?m_idx="+m_idx"'></a> <!-- 여기경로도 다시보셔야할듯 -->			
	<div><h5>좌석 선택</h5></div>
	<div class="seat_idx">
		<ul class="screen-view">SCREEN</ul>
		<ul>
			<li class="seat_1">
			<sf:input type="checkbox" name="seat_idx" value="1"/>
			<sf:input type="checkbox" name="seat_idx" value="2"/>
			<sf:input type="checkbox" name="seat_idx" value="3"/>
			<sf:input type="checkbox" name="seat_idx" value="4"/>
			<sf:input type="checkbox" name="seat_idx" value="5"/>
			</li>		
		</ul>
		<ul>
			<li>
			<sf:input type="checkbox" name="seat_idx" value="6"/>
			<sf:input type="checkbox" name="seat_idx" value="7"/>
			<sf:input type="checkbox" name="seat_idx" value="8"/>
			<sf:input type="checkbox" name="seat_idx" value="9"/>
			<sf:input type="checkbox" name="seat_idx" value="10"/>
			</li>
		</ul>
		<ul>
			<li>
			<input type="checkbox" name="seat_idx" value="11"/>
			<input type="checkbox" name="seat_idx" value="12"/>
			<input type="checkbox" name="seat_idx" value="13"/>
			<input type="checkbox" name="seat_idx" value="14"/>
			<input type="checkbox" name="seat_idx" value="15"/>
			</li>
		</ul>
		<ul>
			<li>
			<input type="checkbox" name="seat_idx" value="16">
			<input type="checkbox" name="seat_idx" value="17">
			<input type="checkbox" name="seat_idx" value="18">
			<input type="checkbox" name="seat_idx" value="19">
			<input type="checkbox" name="seat_idx" value="20">
			</li>
		</ul>
	</div>
	<br><br><br>
	<input type="submit" value="예매하기"/>
	<input type="reset" value="초기화하기"/>
</sf:form>
<!-- </center> -->
</body>
<%}%>
</html>