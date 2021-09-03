<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MovieingWalk</title>

<!-- jQuery Framework �����ϱ� -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>

<!-- ����� ��ũ��Ʈ ��� -->
 <script type="text/javascript">
function showPopup() { 
	window.open("/CollectionWrite_SelectMovie.jsp", "a", "width=500, height=400, left=100, top=50"); 
	}
</script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>

<h2>�÷��� �����</h2>
<sf:form action="CollectionWriteOk">
<table>
<tr><td><sf:input path="col_title" size="20" maxlegth="20"/></td></tr>
<tr><td><sf:textarea path="col_memo" size="80" cssStyle="width:350px;height:100px" maxlength="80"/></td></tr>
<tr><td>��ȭ�� �ִ� 10������ �߰��� �� �ֽ��ϴ�
<p><input type="button" value="��ȭ �߰��ϱ�" onclick="showPopup();" /></p></td></tr>
</table>
<input type="submit" value="�÷��� ���">
<input type="reset" value="�ʱ�ȭ">
</sf:form>
</body>
</html>