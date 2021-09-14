<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
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
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<jsp:include page="../mypage/leftMenu.jsp"/>
<h2 style="color:white;">예매내역 리스트</h2>

<div id="ticketlist">
<table border="1" style="background-color: while;">
<tr style="color: #fff;">
	<th>티켓번호</th>
	<th>아이디</th>
	<th>영화번호</th>
	<th>시간</th>
	<th>날짜</th>
	<th>지역번호</th>
	<th>좌석번호</th>	
	   <td>상세보기</td>
</tr>
<c:forEach var="row" items="${ticketBeanList }">
<tr style="color: #fff;">
   <td>${row.t_idx }</td>
   <td>${row.u_id }</td>
   <td>${row.m_idx }</td>
   <td>${row.t_date }</td>
   <td>${row.tt_date }</td>
   <td>${row.theater_idx }</td>
   <td>${row.seat_idx }</td>
    <td><a href="/ticketing/ticketDetails?t_idx=${row.t_idx}">상세보기</a></td>
 </tr>
</c:forEach>
</table>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>
<%}%>