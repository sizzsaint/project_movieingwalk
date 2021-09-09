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
</head>
<body>

<script type="text/javascript">

var r_idx =${r_idx};
var u_id = '${u_id}';
	alert('좋아요가 반영되었습니다.');
	location.href="/review/reviewDetail?r_idx="+r_idx+"&u_id="+u_id;
</script>

</body>
</html>
<%}%>