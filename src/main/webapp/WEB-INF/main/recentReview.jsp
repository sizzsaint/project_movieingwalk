<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MovieingWalk</title>

<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
</head>
<body>
<table class="show">
<thead>
<tr><th><i class="fas fa-angle-right"></i> 최신등록된리뷰</th></tr>
</thead>
	<tbody><tr><td>
	<div id="reviews">
		 <div class="review_area" style="color:white; border:1px solid gray;">
	
		 <c:forEach var="review" items="${mainRecent}" varStatus="status" begin="0" end="5">
		 <div id="review" style="border-radius:5px; border:1px solid #ff8000; text-align: left;">
		 ${review.u_id} &nbsp;&nbsp;&nbsp; <img src='../imgdata/star.png' width='25' height='25' alt='/'>${review.r_star}
		 
		 <c:if  test= "${review.r_spoiler eq 'N'}">
		 <p><a href="/review/reviewDetail?r_idx=${review.r_idx}" style="color:whtie">${review.r_memo}</a>
		 </c:if>
		 
		 <c:if  test= "${review.r_spoiler eq 'Y'}">
		 <p><a href="/review/reviewDetail?r_idx=${review.r_idx}" style="color:whtie">스포일러가 포함된 리뷰입니다. 읽으시려면 눌러주세요</a>
		 </c:if>
		 
		 <div id="icons" style="position:relative; float:right;">
		 <img src='../imgdata/like.png' width='25' height='25' alt='/'>${review.r_likes}
		 <img src='../imgdata/comment.png' width='25' height='25' alt='/'>${review.r_comments}
		 </p>
		 </div>
		 
		 </div>
		 </c:forEach>
		 </div>
	</div>
	</td></tr>
	</tbody>
</table>    
</body>
</html>
