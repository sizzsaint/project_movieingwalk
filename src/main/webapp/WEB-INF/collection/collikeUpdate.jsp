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

var col_idx =${col_idx};
var u_id = '${u_id}';
	alert('좋아요가 반영되었습니다.');
	location.href="/collection/collectiondetail?col_idx='"+col_idx;"'"
</script>

</head>
<body>


</body>
</html>
<%}%>