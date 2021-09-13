<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%
if(session.getAttribute("mvId")==null){
   response.sendRedirect("/loginMember");
}else{
	Object object = session.getAttribute("mvId");
	String u_id = (String)object;
%> 
<head>
<meta charset="UTF-8">
<title>MovieingWalk</title>
<link href="../../css/movieDetail.css" rel ="stylesheet" type="text/css">

</head>
<body>
<jsp:include page="../main/header.jsp"/>
<jsp:include page="./leftMenu.jsp"/>
<!-- 나의된리뷰 -->
<h2 style="color:white;">나의리뷰보기</h2>
	
<!-- 내가 쓴 리뷰 -->
<section style="display:inline-block; width:70%">
<div id="review_area" style="width:auto !important; display: inline-block;">
	 <c:forEach var="review" items="${myReviewList}" begin="0" end="5">
	 <div class="review" style="width:95% !important;">
	 ${review.u_id} &nbsp;&nbsp;&nbsp; <img src='../imgdata/star.png' width='30' height='30' alt='/'>${review.r_star}
	 
	 <c:if  test= "${review.r_spoiler eq 'N'}">
	 <a href="../review/reviewDetail?r_idx=${review.r_idx}&u_id=${review.u_id}" style="color:whtie"><p>${review.r_memo}</p></a>
	 </c:if>
	 
	 <c:if  test= "${review.r_spoiler eq 'Y'}">
	 <p><a href="../review/reviewDetail?r_idx=${review.r_idx}&u_id=${review.u_id}" style="color:whtie">스포일러가 포함된 리뷰입니다. 읽으시려면 눌러주세요</a></p>
	 </c:if>
	 
	 <div class="icons">
	 <img src='../imgdata/like.png' width='25' height='25' alt='/'>${review.r_likes}
	 <img src='../imgdata/comment.png' width='25' height='25' alt='/'>${review.r_comments}
	 </div>
	 </div>
	 </c:forEach>
	 <div id="rButtonDiv" style= "position: static;">
	 <button id="moreReview" onclick="location.href='/mypage/myreviewall?u_id=${u_id}'">리뷰 더보기</button>
	 </div>
</div>

<hr>
<!-- 내가좋아한 리뷰 -->
<h2 style="color:white;">내가좋아한리뷰</h2>
<div id="review_area" style="width:auto !important; display: inline-block;">
	 <c:forEach var="review" items="${getMyLikeReview}" begin="0" end="5">
	 <div class="review" style="width:95% !important;">
	 ${review.u_id} &nbsp;&nbsp;&nbsp; <img src='../imgdata/star.png' width='30' height='30' alt='/'>${review.r_star}
	 
	 <c:if  test= "${review.r_spoiler eq 'N'}">
	 <a href="../review/reviewDetail?r_idx=${review.r_idx}&u_id=${review.u_id}" style="color:whtie"><p>${review.r_memo}</p></a>
	 </c:if>
	 
	 <c:if  test= "${review.r_spoiler eq 'Y'}">
	 <p><a href="../review/reviewDetail?r_idx=${review.r_idx}&u_id=${review.u_id}" style="color:whtie">스포일러가 포함된 리뷰입니다. 읽으시려면 눌러주세요</a></p>
	 </c:if>
	 
	 <div class="icons">
	 <img src='../imgdata/like.png' width='25' height='25' alt='/'>${review.r_likes}
	 <img src='../imgdata/comment.png' width='25' height='25' alt='/'>${review.r_comments}
	 </div>
	 </div>
	 </c:forEach>
	 <div id="rButtonDiv">
	 <button id="moreReview" onclick="location.href='/mypage/likesreviewall?u_id=${u_id}'">리뷰 더보기</button>
	 </div>
</div>

</section>

<jsp:include page="../main/footer.jsp"/>
</body>
<%} %>
</html>