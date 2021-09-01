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
<script type="text/javascript" src="../js/jquery-1.11.0.min.js"></script>
﻿
<!-- header+footer>-->
<link href="./../../css/layout.css" rel ="stylesheet" type="text/css">
<!-- login_section -->
<link href="./../../css/login.css" rel ="stylesheet" type="text/css">
<title>관리자 로그인</title>

</head>

<body>

<section>
	<form action="/loginAdmin" method="post">
		<div id="login_box" style="margin:0 auto;">
			<h2>로그인</h2>
			<ul id="input_button">
				<li id="id_pass">
					<ul id="ad">
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
			</ul>
			<ul id="btns">
				<li><input type="button" value="뒤로 가기" onclick="location.href='#'"></li>
				<li><input type="submit" value="로그인"></li>
			</ul>
		</div>	
	</form>
</section>

</body>
</html>