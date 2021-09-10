<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@page import="com.movieingwalk.www.login.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery Framework 참조하기 -->
<script type="text/javascript" src="./../../js/jquery-3.1.1.min.js"></script>﻿

<!-- header+footer>-->
<!-- <link href="./../../css/layout.css" rel ="stylesheet" type="text/css"> -->
<!-- login_section -->
<link href="./../../css/login.css" rel ="stylesheet" type="text/css">
<title>로그인</title>

</head>

<body>
<!-- header고정 -->
<jsp:include page="../main/header.jsp"/>

<section class="login">
	<form action="/loginMember" method="post">
		<div id="login_box" style="margin:50px auto;">
			<h2>로그인</h2>
			<ul id="input_button">
				<li id="id_pass">
					<ul>
						<li>
							<span>아이디</span>
							<input type="text" id="u_id" name="u_id" size="20" placeholder="아이디" required="required" >
						</li>
						<li id="pass">
							<span>비밀번호</span>
							<input type="password" id="u_password" name="u_password" size="20" placeholder="비밀번호" required="required">
						</li>
					</ul>
				</li>	
				
				<li id="login_btn">
					<input type="submit" value="로그인">
				</li>
			</ul>
			<ul id="btns">
				<li><input type="button" value="회원가입" onclick="location.href='/registmember'"></li>
				<li><input type="button" value="아이디/비밀번호찾기" onclick="location.href='/searchInfo'"></li>
			</ul>
		</div>	
	</form>
</section>

<!-- footer고정 -->
<jsp:include page="../main/footer.jsp"/>
</body>
</html>