<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@page import="java.io.*, java.text.*" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

<c:url var="registmember" value="registmember"/>
<sf:form modelAttribute="memberBean" method="POST" action="${registmember}">
아이디 : <sf:input path="u_id" size="50" maxlength="50"/>&nbsp;
<sf:errors path="u_id" cssClass="error"/><br>

비밀번호 : <sf:input path="u_password" size="50" maxlength="50"/>&nbsp;
<sf:errors path="u_password" cssClass="error"/><br>

비밀번호확인 : <input type="password" >&nbsp;
<br>

이름 : <sf:input path="u_name" size="50" maxlength="50"/>&nbsp;
<sf:errors path="u_name" cssClass="error"/><br>

전화번호 : <sf:input path="u_phone" size="50" maxlength="50"/>&nbsp;
<sf:errors path="u_phone" cssClass="error"/><br>

성별 : <sf:input path="u_sex" size="50" maxlength="50"/>&nbsp;
<sf:errors path="u_sex" cssClass="error"/><br>

이메일 : <sf:input path="u_email" size="50" maxlength="50"/>&nbsp;
<sf:errors path="u_email" cssClass="error"/><br>

생년월일 : <sf:input path="u_age" size="50" maxlength="50"/>&nbsp;
<sf:errors path="u_age" cssClass="error"/><br>


<input type="submit" value="가입하기">&nbsp;
<input type="button" value="돌아가기" onclick="history.go(-1)">

</sf:form>
 
</body>
</html>