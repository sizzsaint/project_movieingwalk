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

<section style="display:inline-block; width:70%">
<div id="review_area" style="width:auto !important;">
	 <c:forEach var="review" items="${myReviewList}">
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
	 <hr>
	 </c:forEach>
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
<%} %>
</html>