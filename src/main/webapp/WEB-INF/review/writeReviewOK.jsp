<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>MovieingWalk</title>
	<script type="text/javascript">
		alert('리뷰가 등록되었습니다.')
		location.href="/movieinfo/MovieDetail?m_idx="+${m_idx};
	</script>
</head>
<body>
</body>
</html>
<%}%>