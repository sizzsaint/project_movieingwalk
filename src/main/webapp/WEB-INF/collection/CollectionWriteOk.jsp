<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <%
if(session.getAttribute("mvId")==null){
   response.sendRedirect("/loginMember");
}else{
	Object object = session.getAttribute("mvId");
	String u_id = (String)object;
%> 
<meta charset="UTF-8">
<title>MovieingWalk</title>
</head>
<body>

<script type="text/javascript">
	alert('컬렉션이 등록되었습니다.');
	location.href="/mypage/mycollection?u_id="+"<%=u_id%>";
</script>
</body>
</html>
<%}%>