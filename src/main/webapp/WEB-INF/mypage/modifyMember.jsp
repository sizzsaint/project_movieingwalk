<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
    <%@page session="true"%>
    
    <%@page
	import="com.movieingwalk.www.bean.MemberBean,
	java.util.ArrayList,
	java.util.Properties,
	java.io.IOException,java.io.FileInputStream
	"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<body>
<table>
<tr>
<td>id</td>
<td>password</td>
<td>password확인</td>
<td>이름</td>
<td>전화번호</td>
<td>성별</td>
<td>이메일</td>
<td>생년월일</td>
</tr>
<tr>
<td><c:out value=""></c:out></td>
<td>password</td>
<td>password확인</td>
<td>이름</td>
<td>전화번호</td>
<td>성별</td>
<td>이메일</td>
<td>생년월일</td>
</tr>
</table>



<table>
<tr>
<td><form name="modifymember" method="post" action="">
<input type="button" value="수정하기"></form>
<td><input type="button" value="돌아가기" onclick="history.go(-1)">
</table>

</body>
</html>