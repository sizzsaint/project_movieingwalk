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
		 alert(r_idx);
		 alert(u_id);
		 location.href="likeUpdate?r_idx="+r_idx+"&u_id="+u_id ;
	 }
	 
 }
 </script>
 
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<a href="javascript:history.back();" style="color:white">뒤로가기</a>
<h3 style="color:white">리뷰 상세보기</h3>
<div id="reviewDetail" style="border:1px solid gray; color:white;">
<p>
	 ${reviewBean.u_id} &nbsp;&nbsp;&nbsp; <img src='../imgdata/star.png' width='30' height='30' alt='/'>${reviewBean.r_star}
	 <c:if  test= "${reviewBean.r_spoiler eq 'Y'}">
	 스포일러 O
	 </c:if>
	 <c:if  test= "${reviewBean.r_spoiler eq 'N'}">
	 스포일러 X
	 </c:if>
	 ${reviewBean.r_memo}
	 <img src='../imgdata/like.png' width='30' height='30' alt='/'>${reviewBean.r_likes}
	 <img src='../imgdata/comment.png' width='30' height='30' alt='/'>${reviewBean.r_comments}
	${reviewBean.r_date}
	조회수 : ${reviewBean.r_hits}
</div>
<div id="buttons">
<input type="button" value="좋아요" onClick="check123();">
</div>
</body>
</html>
<%}%>