<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery Framework 참조하기 -->
<script type="text/javascript" src="../../js/jquery-3.1.1.min.js"></script>﻿

<!-- search_팝업창 -->
<link href="./../../css/searchPopup.css" rel ="stylesheet" type="text/css">

<script type="text/javascript">
	$(document).ready(function(){
		$("#popup").fadeIn();
    	$("#exit").click(function(){
        	$("#exit").fadeOut();
        	location.href='/searchInfo'
    	});
	});
</script>
<title>searchOK</title>
</head>
<body>

<c:choose>
		<c:when test="${UserPw == 'none' }">
			<script type="text/javascript">
				alert('비밀번호를 찾을 수 없습니다.')
				location.href='/searchInfo'
			</script>
		</c:when>
		<c:otherwise>
			<!-- pop up -->
			<div id="popup">
				<div id="popmenu">
					<p>${UserPw } 입니다.</p>
					<div id="exit" class="exit">닫기</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>