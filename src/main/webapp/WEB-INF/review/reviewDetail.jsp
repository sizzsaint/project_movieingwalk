<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
    
    <%
if(session.getAttribute("mvId")==null){
   response.sendRedirect("/loginMember");
}else{
	Object object = session.getAttribute("mvId");
	String u_id = (String)object;
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MovieingWalk</title>

<link href="../css/reviewDetail.css" rel ="stylesheet" type="text/css">

<!-- jQuery Framework 참조하기 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
 
 <!-- 사용자 스크립트 블록 -->
 <script type="text/javascript">
 var checkLike = ${checkLikes};
 var r_idx = ${r_idx};
 var u_id = '${u_id}';
 function check123(){
	 
	 if(checkLike == "1"){
		 alert("이미 좋아요를 누른 리뷰입니다.");
		 return false;
	 }else{

		 location.href="likeUpdate?r_idx="+r_idx+"&u_id="+u_id ;
	 }
	 
 }
 </script>
 
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<a href="javascript:history.back();" style="color:white">뒤로가기</a>
<h2>리뷰 상세보기</h2>
<div id="reviewDetail">
<h3>${reviewBean.u_id} &nbsp;&nbsp;<img src='../imgdata/star.png' width='25' height='25' alt='/'>${reviewBean.r_star}</h3> 
<hr>
	 <c:if  test= "${reviewBean.r_spoiler eq 'Y'}">
	<h4 style="color:#d92e12; border:1px;"> 스포 포함</h4>
	 </c:if>
	 <c:if  test= "${reviewBean.r_spoiler eq 'N'}">
	<h4 style="color:#183c77; border:1px;"> 스포 미포함</h4>
	 </c:if>
	 <p>${reviewBean.r_memo}</p>
	 <hr>
	 작성일 :&nbsp;${reviewBean.r_date} &nbsp;&nbsp;&nbsp;&nbsp;조회수 :&nbsp;${reviewBean.r_hits}
	 <div id="icons">
	 <img src='../imgdata/like.png' width='25' height='25' alt='/'>${reviewBean.r_likes}
	 &nbsp;&nbsp;&nbsp;&nbsp;
	 <img src='../imgdata/comment.png' width='25' height='25' alt='/'>${reviewBean.r_comments}
	</div>
	
</div>
<div id="buttonDiv">
<button id="likebutton" onClick="check123();">좋아요</button>
</div>
</body>
</html>
<%}%>