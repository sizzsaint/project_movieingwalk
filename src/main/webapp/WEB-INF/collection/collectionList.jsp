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

<link href="../css/loading.css" rel ="stylesheet" type="text/css">

<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>


<script type="text/javascript">

function FunLoadingBarStart() {
	var backHeight = $(document).height(); //뒷 배경의 상하 폭
	var backWidth = window.document.body.clientWidth; //뒷 배경의 좌우 폭
	var backGroundCover = "<div id='back'></div>"; //뒷 배경을 감쌀 커버
	var loadingBarImage = ''; //가운데 띄워 줄 이미지
	loadingBarImage += "<div id='loadingBar'>";
	loadingBarImage += " <img src='../images/loading.gif'/>"; //로딩 바 이미지
	loadingBarImage += "</div>";
	$('body').append(backGroundCover).append(loadingBarImage);
	$('#back').css({ 'width': backWidth, 'height': backHeight, 'opacity': '0.3' });
	$('#back').show();
	$('#loadingBar').show();
	}


</script>



<script type="text/javascript">

$(function(){
	FunLoadingBarStart(); //로딩바 생성
	});

$(function(){
	
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

	var collectionList = "<div id='collection_"+cnt+"' style='border:1px solid gray; height:315px; width:1270px;'><p><a href = 'collectiondetail?col_idx="+col_idx+"' style='color:white;'>"+"${collection.col_title}"+"</a></p>";
	
	for (var i=0;i<list1.length;i++){
		m_idx = list1[i];
	
		$.ajax({
		url: "https://api.themoviedb.org/3/movie/"+m_idx+"?api_key=9348030243f7b212abdd53ccc8412e24&language=ko",
		type: "get",
		dataType: "json",
		cache : false,
		async : false,
		timeout : 30000,
		success: function(json) {
			
			var poster_host = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2";
			var title = json.title;
			var poster_img = json.poster_path;
			var m_idx = json.id;
					
			//출력을 위한 동적 요소 생성
			collectionList +="<div style='position:relative; border:1px solid gray; float:left; right-margin:10px'>";
			collectionList += "<a href='/movieinfo/MovieDetail?m_idx="+m_idx+"'>"+"<img src='"+poster_host+poster_img+"' style='width:120px;' alt=''/></a>";
			collectionList +="<p style='color:white; width:170; height:81;'>"+title+"</p>";
			collectionList += "</div>";	
		},
		 error : function(xhr, textStatus, errorThrown){
		$("div").html("<div>"+textStatus+" (HTTP-"+xhr.status+" / "+errorThrown +")</div>");
		}
		
});
}	collectionList +="</div>";
	$("#collections").append(collectionList);
	</c:forEach>
});

$(function(){
	 var img = document.getElementById("loadingimg1");
	 img.remove(); //로딩바 제거
	});
		

</script>

</head>
<body>
<jsp:include page="../main/header.jsp"/>
<h2 style="color:white">해당 영화가 담긴 모든 컬렉션 보기</h2>
	
<a href="javascript:history.back();">뒤로가기</a>

<img id='loadingimg1' src='../images/loading.gif'/>

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


</body>
</html>
<%}%>