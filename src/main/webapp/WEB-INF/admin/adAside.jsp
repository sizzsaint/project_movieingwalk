<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adAside</title>
<link href="./../../css/adAside.css" rel ="stylesheet" type="text/css">
</head>
<body>
<aside>
	<ul>
		<li>
			<p>회원관리</p>
		</li>
		<li>
			<input type="button" value="회원명단" onclick="location.href='/mInfo_udateSort'">
		</li>
		<li>
			<p>컨텐츠 관리</p>
		</li>
		<li>
			<input type="button" value="리뷰" onclick="location.href='/rInfo_rdateSort'">
		</li>
	</ul>
</aside>
</body>
</html>