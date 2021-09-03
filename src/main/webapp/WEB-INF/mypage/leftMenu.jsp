<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sideMenu bar</title>

</head>
<body>
  <nav id="leftMenu" style=" float:left; width:30%;">
    <ul class="mypage">
      <li><a class="mypage" href="/mypage/myreviewlist?u_id=${memberBean.u_id}">리뷰</a></li>
      <li><a href="/mypage/mycollectionlist?u_id=${memberBean.u_id }">컬렉션</a></li>
      <li><a href="#ticket">예매내역</a></li>
      <li><a href="/mypage/modify?u_id=${memberBean.u_id}">정보수정</a></li>
      <li><a href="/mypage/resign?u_id=${memberBean.u_id}">탈퇴하기</a></li>
    </ul>
  </nav>
</body>
</html>