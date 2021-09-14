<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="java.util.ArrayList"%>
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

<!-- css -->
<link href="../css/loading.css" rel ="stylesheet" type="text/css">
<link href="../css/collectionMain.css" rel ="stylesheet" type="text/css">

<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>

<script type="text/javascript">

$(function(){
	var u_id = "<%=u_id%>";
	
	var cnt = 0;
	<c:forEach items="${collectionBeanList}" var="collection">
	
	var list1 = new Array();
	cnt += 1;
	
	list1.push("${collection.col_midx1}");
	list1.push("${collection.col_midx2}");
	list1.push("${collection.col_midx3}");
	list1.push("${collection.col_midx4}");
	list1.push("${collection.col_midx5}");
	list1.push("${collection.col_midx6}");
	list1.push("${collection.col_midx7}");
	list1.push("${collection.col_midx8}");
	list1.push("${collection.col_midx9}");
	list1.push("${collection.col_midx10}");
	
	var col_idx = "${collection.col_idx}";

	var collectionList = "<div class='collection' id='collection_"+cnt+"' ><p><a href = '/collection/collectiondetail?col_idx="+col_idx+"&u_id="+u_id+"' class='col_title'>"+"${collection.col_title}"+"</a></p>";
	
	for (var i=0;i<list1.length;i++){
		m_idx = list1[i];
		
	$.ajax({
		url: "https://api.themoviedb.org/3/movie/"+m_idx+"?api_key=9348030243f7b212abdd53ccc8412e24&language=ko",
		type: "get",
		dataType: "json",
		cache : false,
		async : false,
		success: function(json) {
			
			var poster_host = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2";
			var title = json.title;
			var poster_img = json.poster_path;
			var m_idx = json.id;
					
			//출력을 위한 동적 요소 생성
			collectionList +="<div class='movieCard'>";
			collectionList += "<a href='/movieinfo/MovieDetail?m_idx="+m_idx+"'>"+"<img class='poster' src='"+poster_host+poster_img+"' alt='../imgdata/img_ready.PNG'/></a>";
			collectionList +="<p class='m_title'>"+title+"</p>";
			collectionList += "</div>";
			
		},
		 error : function(xhr, textStatus, errorThrown){
		$("div").html("<div>"+textStatus+" (HTTP-"+xhr.status+" / "+errorThrown +")</div>");
		}
});
}
	collectionList +="</div>";
	$("#collections").append(collectionList);
	</c:forEach>
	
			
});

</script>

</head>
<body>
<jsp:include page="../main/header.jsp"/>
<h2>모든 컬렉션 보기</h2>
<div id="buttonDiv">
<button id="colbutton" onclick="location.href='/collection/CollectionWrite'">컬렉션 만들기</button>
</div>
<div id="collections">
	
</div>

<div style="color:white">
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
                
<div style="color:white">
         총 게시글 수 : ${pagination.listCnt } /    총 페이지 수 : ${pagination.pageCnt } / 현재 페이지 : ${pagination.curPage } / 현재 블럭 : ${pagination.curRange } / 총 블럭 수 : ${pagination.rangeCnt }
</div>

<jsp:include page="../main/footer.jsp"/>

</body>
</html>
<%}%>