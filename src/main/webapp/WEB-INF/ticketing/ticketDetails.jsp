<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html>
<%-- 로그인세션  --%>
<%
if(session.getAttribute("mvId")==null){
   response.sendRedirect("/loginMember");
}else{
   Object object = session.getAttribute("mvId");
   String u_id = (String)object;
%>
<head>
<meta charset="UTF-8">
<title>movieingwalk</title>
<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
<style type="text/css">
td{
color:#000
}
</style>
</head>

<body>
<div class="ticketDetail">
<h2 style='color:#000'' >예매내역상세</h2>


<input type="hidden" value="<c:out value="${ticketbean.t_idx}"/>"/>
<table border="1" style='color:white'>
<tr>
	<td>영화제목</td>
	<td>${ticketbean.m_idx}</td>
</tr>
<tr><td>유저명</td><td>
<c:out value="${ticketbean.u_id}"/>
<c:set value="${ticketbean.u_id}" var="u_id"/>
</td>
</tr>
<tr><td>예매날짜</td><td>
<c:out value="${ticketbean.tt_date}"/>
</td></tr>
<tr><td>예매시간</td><td>
<c:out value="${ticketbean.t_date}"/>
</td></tr>
<tr><td>좌석번호</td><td>
<c:out value="${ticketbean.seat_idx}"/>
</td></tr>
</table>
<input type="button" onclick="history.back()" value="돌아가기">
<hr>
</div>
</body>
</html>
<%-- --%>
<%}%>