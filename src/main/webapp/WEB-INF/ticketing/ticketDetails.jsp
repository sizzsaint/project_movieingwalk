<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.movieingwalk.www.ticketing.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
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
<title>예매내역보기</title>
</head>
<body>
 <!-- CREATE TABLE ticket(
       t_idx                int NOT NULL auto_increment, #티켓번호
       u_id                varchar(20) NOT NULL, #유저아이디
       m_idx                int , #영화코드(API)
       t_date               datetime , #예매시간
       theater_idx          int , # 영화관코드
       seat_idx             int, # 좌석코드
PRIMARY KEY (t_idx)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE seat (
       seat_idx             int NOT NULL, #좌석코드
       t_idx                int , #티켓번호
       theater_idx          int , # 영화관번호
PRIMARY KEY (seat_idx)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
  -->
<h3>예매내역보기</h3><hr> 
티켓번호 :  ${TicketBean.t_idx} <br>
영화제목 :  ${#} <br>
예매시간 :  ${TicketBean.t_date} <br>
좌석번호 :  ${TicketBean.seat_idx} <br>
<hr>
</body>
<%--
<%}%>
 --%>
</html>