<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./../../css/ticket.css" rel="stylesheet" type="text/css">
</head>
<body>
<br><br><br><br>
  <nav id="Menu">
    <ul class="ticketing">
      <li><a class="ticketing" href="/ticketing/ticketingScreen?u_idx=${memberBean.u_id}">상영작</a></li>
      <li><a href="/ticketing/ticketingScheduled?u_idx=${ticketBean.u_idx}">개봉예정작</a></li>
      <li><a href="/ticketing/ticketingMain?u_idx=${ticketBean.u_idx}">예매하기</a></li>
    </ul>
    </nav>
</body>
</html>