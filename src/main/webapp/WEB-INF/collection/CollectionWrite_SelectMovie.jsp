<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>영화 선택하기</title>
</head>
<body>
<!-- 글검색 하기  -->

<sf:form action="SearchMovie" method="post">
  <input type="text" name="searchStr" size="50" maxlength="100">
  <input type="submit" value="검색">
</sf:form>

</body>
</html>