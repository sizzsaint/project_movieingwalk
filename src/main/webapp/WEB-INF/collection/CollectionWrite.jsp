<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<%
if(session.getAttribute("mvId")==null){
	response.sendRedirect("/loginMember");
}else{
%>
<html>
<head>
<meta charset="EUC-KR">
<title>MovieingWalk</title>

<!-- jQuery Framework �����ϱ� -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>

<!-- ����� ��ũ��Ʈ ��� -->
 <script type="text/javascript">
function movieSelectPopup() { 
	window.open("/collection/CollectionWrite_SelectMovie", "a", "width=500, height=400, left=100, top=50"); 
	}
</script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>

<h2 style='color:white'>�÷��� �����</h2>
<sf:form action="CollectionWriteOk" modelAttribute="collectionBean">
<table border="1" style='color:white'>
<tr><td><sf:input path="col_title" value="������ �Է����ּ���" size="20" maxlegth="20"/></td></tr>
<tr><td><sf:textarea path="col_memo" size="80" cssStyle="width:350px;height:100px" maxlength="80"/></td></tr>
<tr><td>��ȭ�� �ִ� 10������ �߰��� �� �ֽ��ϴ�
<p><input type="button" value="��ȭ �߰��ϱ�" onclick="movieSelectPopup();" /></p></td></tr>
<tr><td>
</table>
<input type="submit" value="�÷��� ���">
<input type="reset" value="�ʱ�ȭ">
</sf:form>
</body>
<%} %>
</html>