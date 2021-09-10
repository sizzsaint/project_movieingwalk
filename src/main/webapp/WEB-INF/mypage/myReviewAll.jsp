<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="../main/header.jsp"/>
<jsp:include page="./leftMenu.jsp"/>

<section style="display:inline-block;">
<div id="reviews" style="display:inline-block;">
	 <ul class="review_area" style="color:white; border:1px solid gray;">

	 <c:forEach var="review" items="${myReviewList}">
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
</div>
<div style="float: none;">
	<c:if test="${pagination.curRange ne 1 }">
    	<a href="#" onClick="fn_paging(1)">[처음]</a> 
	</c:if>
	<c:if test="${pagination.curPage ne 1}">
		<a href="#" onClick="fn_paging('${pagination.prevPage }')">[이전]</a> 
	</c:if>
	<c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
	<c:choose>
        <c:when test="${pageNum eq  pagination.curPage}">
        <span style="font-weight: bold;"><a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></span> 
        </c:when>
        <c:otherwise>
        <a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a> 
       </c:otherwise>
	</c:choose>
    </c:forEach>
    <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
         <a href="#" onClick="fn_paging('${pagination.nextPage }')">[다음]</a> 
    </c:if>
    <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
         <a href="#" onClick="fn_paging('${pagination.pageCnt }')">[끝]</a> 
    </c:if>
</div>
                
<div>
         총 게시글 수 : ${pagination.listCnt } /    총 페이지 수 : ${pagination.pageCnt } / 현재 페이지 : ${pagination.curPage } / 현재 블럭 : ${pagination.curRange } / 총 블럭 수 : ${pagination.rangeCnt }
</div>
</section>

<jsp:include page="../main/footer.jsp"/>

</body>
</html>