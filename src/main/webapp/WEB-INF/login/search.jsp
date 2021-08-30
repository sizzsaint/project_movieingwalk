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
<script type="text/javascript" src="../js/jquery-1.11.0.min.js"></script>﻿

<!-- header+footer>-->
<link href="./../../css/layout.css" rel ="stylesheet" type="text/css">

<title>로그인</title>

</head>

<body>
<!-- header고정 -->
<jsp:include page="../main/header.jsp"/>

<section>
	<div id="search_box" style="margin:0 auto;">
		<h2>회원 아이디/비밀번호를 잊으셨습니까?</h2>
		
		<form action="/searchInfo" method="post">
			<table>
				<tr>
					<td>
					<h2>아이디 찾기</h2>
						<ul id="search">
							<li id="search_id">
							<ul>
								<li>
									<span>이름</span>
									<input type="text" id="u_name" name="u_name" size="20" placeholder="이름" required="required" >
								</li>
								<li>
									<span>이메일</span>
									<input type="text" id="u_email" name="u_email" size="20" placeholder="이메일" required="required">
								</li>
								<li>
									<span>휴대전화</span>
									<input type="text" id="u_phone" name="u_phone" size="20" placeholder="휴대전화" required="required">
								</li>
							</ul>
							</li>	
				
							<li id="btn">
								<input type="submit" value="확인">
							</li>
						</ul>
					</td>
				</tr>
			</table>
		</form>
		
		
		
		
	</div>
</section>

<!-- footer고정 -->
<jsp:include page="../main/footer.jsp"/>
</body>
</html>