<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
if(session.getAttribute("u_id")==null){
   response.sendRedirect("/loginMember");
}else{
	Object object = session.getAttribute("u_id");
	String u_id = (String)object;
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sideMenu bar</title>

</head>
<body>
  <nav id="leftMenu" style=" float:left; width:30%; height:75%;">
    <ul class="mypage">
      <li><a href="/mypage/myreviewlist?u_id=<%=u_id%>">리뷰</a></li>
      <li><a href="/mypage/mycollection?u_id=<%=u_id%>">컬렉션</a></li>
      <li><a href="#ticket">예매내역</a></li>
      <li><a href="/mypage/modify?u_id=<%=u_id%>">정보수정</a></li>
      <li><a href="/mypage/resign?u_id=<%=u_id%>">탈퇴하기</a></li>
    </ul>
  </nav>
</body>
</html>
<%
}
%>