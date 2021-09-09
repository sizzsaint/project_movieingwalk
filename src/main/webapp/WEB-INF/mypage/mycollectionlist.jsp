<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyCollection</title>

<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">

var m_idx = '<c:out value="${myCollectionList.col_midx1}"/>'
console.log(m_idx);
var col_idx = '<c:out value="${myCollectionList.col_idx}"/>'
console.log(col_idx);
 //영화 상세정보 가져오기
 $(function(){
		 
		$.ajax({
	  		url: "https://api.themoviedb.org/3/movie/"+m_idx+"?api_key=9348030243f7b212abdd53ccc8412e24&language=ko",
	  		type: "get",
	  		dataType: "json",
	  		cache : false,
	  		timeout : 30000,
	  		success: function(json) {
	  			
	  			    var poster_host = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2";
	
	    			//출력을 위한 동적 요소 생성
	    			<!--포스터-->
	    			var details ="<div class='poster_area'><a href='/collection/collectiondetail?col_idx='"+col_idx+"'>";
	    			details += "<img src='"+poster_host+poster_img+"' style=width:170px;' alt=''>";
	    			details +="</a></div>"
	    			$("#details").html(details);

	  		},
	   		 error : function(xhr, textStatus, errorThrown){
	    		$("div").html("<div>"+textStatus+" (HTTP-"+xhr.status+" / "+errorThrown +")</div>");
	    		}
		});
	  		  
});

</script>
</head>
<body >


<jsp:include page="../main/header.jsp"/>
<jsp:include page="./leftMenu.jsp"/>


<!-- 내가 쓴 컬렉션 -->
<section style="display:inline-block;">
<h2 style="color:white;">나의 컬렉션</h2>
<div id="reviews" style="display:inline-block;">
	 <ul class="review_area" style="color:white; border:1px solid gray;">

	 <c:forEach var="mycollection" items="${myCollectionList}" begin="0" end="6">
	 <li id="details" style="border:1px solid gray;">
	 </li>
	 </c:forEach>
	 </ul>
	   <a  href="/mypage/myrcollectionall?u_id=${u_id}">전체보기</a>
</div>


<!-- 내가좋아한 컬렉션 -->
<h2 style="color:white;">내가 좋아한 컬렉션</h2>
<div id="reviews" style="display:inline-block;">
	 <ul class="review_area" style="color:white; border:1px solid gray;">

	 <c:forEach var="collection" items="${likesCollectionList}" begin="0" end="6">
	 <li id="likescollection" style="border:1px solid gray;">
	
	 </li>
	 </c:forEach>
	 </ul>
	  <a href="/mypage/likescollectionall?u_id=${u_id}">전체보기</a>
</div>
</section>




<jsp:include page="../main/footer.jsp"/>
</body>
</html>