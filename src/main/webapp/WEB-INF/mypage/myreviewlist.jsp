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
<title>MyReview</title>
</head>
<body >
<jsp:include page="../main/header.jsp"/>
<jsp:include page="./leftMenu.jsp"/>
<!-- 나의된리뷰 -->
<h2 style="color:white;">나의리뷰보기</h2>
	
<!-- 내가 쓴 리뷰 -->
<section style="display:inline-block;">
<div id="reviews" style="display:inline-block;">
	 <ul class="review_area" style="color:white; border:1px solid gray;">

	 <c:forEach var="review" items="${myReviewList}" begin="0" end="5">
	 <li id="review" style="border:1px solid gray;">
	 ${review.u_id} &nbsp;&nbsp;&nbsp; <img src='../imgdata/star.png' width='30' height='30' alt='/'>${review.r_star}
	 
	 <c:if  test= "${review.r_spoiler eq 'N'}">
	 <a href="/review/reviewDetail?r_idx=${review.r_idx}&u_id=${review.u_id}"><p>${review.r_memo}</p></a>
	 <img src='../imgdata/like.png' width='30' height='30' alt='/'>${review.r_likes}
	 <img src='../imgdata/comment.png' width='30' height='30' alt='/'>${review.r_comments}
	 </c:if>
	 
	 <c:if  test= "${review.r_spoiler eq 'Y'}">
	 <p><a href="/review/reviewDetail?r_idx=${review.r_idx}&u_id=${review.u_id}">스포일러가 포함된 리뷰입니다. 읽으시려면 눌러주세요</a></p>
	 <img src='../imgdata/like.png' width='30' height='30' alt='/'>${review.r_likes}
	 <img src='../imgdata/comment.png' width='30' height='30' alt='/'>${review.r_comments}
	 </c:if>
	 </li>
	 </c:forEach>
	 
	 </ul>
	   <a style="color: white;" href="/mypage/myreviewall?u_id=${u_id}">전체보기</a>
</div>
<!-- 내가좋아한 리뷰 -->
<h2 style="color:white;">내가좋아한리뷰</h2>
<div id="reviews" style="display:inline-block;">
	 <ul class="review_area" style="color:white; border:1px solid gray;">

	 <c:forEach var="review" items="${getMyLikeReview}" begin="0" end="5">
	 <li id="review" style="border:1px solid gray;">
	 ${review.u_id} &nbsp;&nbsp;&nbsp; <img src='../imgdata/star.png' width='30' height='30' alt='/'>${review.r_star}
	 
	 <c:if  test= "${review.r_spoiler eq 'N'}">
	 <a href="/review/reviewDetail?r_idx=${review.r_idx}&u_id=${review.u_id}"><p>${review.r_memo}</p></a>
	 <img src='../imgdata/like.png' width='30' height='30' alt='/'>${review.r_likes}
	 <img src='../imgdata/comment.png' width='30' height='30' alt='/'>${review.r_comments}
	 </c:if>
	 
	 <c:if  test= "${review.r_spoiler eq 'Y'}">
	 <p><a href="/review/reviewDetail?r_idx=${review.r_idx}&u_id=${review.u_id}">스포일러가 포함된 리뷰입니다. 읽으시려면 눌러주세요</a></p>
	 <img src='../imgdata/like.png' width='30' height='30' alt='/'>${review.r_likes}
	 <img src='../imgdata/comment.png' width='30' height='30' alt='/'>${review.r_comments}
	 </c:if>
	 </li>
	 </c:forEach>
	 </ul>
	  <a style="color: white;" href="/mypage/likesreviewall?u_id=${u_id}">전체보기</a>
</div>
</section>

<jsp:include page="../main/footer.jsp"/>
</body>
<%} %>
</html>