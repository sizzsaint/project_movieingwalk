<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Movieing Walk</title>
<link href="./../../css/login.css" rel ="stylesheet" type="text/css">
</head>
<body>
<!-- header고정 -->
<jsp:include page="../main/header.jsp"/>

<section>
	<sf:form action="/mypage/resign" method="post" modelAttribute="memberBean" >
		<div id="login_box" style="margin:0 auto;">
			<h2>탈퇴하기</h2>
			<ul id="input_button">
				<li id="id_pass">
					<ul>
						<li>
						<span>아이디</span>
						<sf:input path="u_id" type="text" id="u_id" name="u_id" size="20" value="${u_id}" readonly="true"/>
				
						</li>
						<li>
							<span>비밀번호</span>
							<sf:input path="" type="password" id="u_password" name="u_password" size="20"
							 placeholder="비밀번호" required="required"/>
						</li>
					</ul>
				</li>	
				
				<li id="login_btn">
					<input type="submit" value="탈퇴하기">
					<input type="button" onclick="history.go(-1)" value="돌아가기">
				</li>
			</ul>

		</div>	
	</sf:form>
</section>

<!-- footer고정 -->
<jsp:include page="../main/footer.jsp"/>

</body>
</html>