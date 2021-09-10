<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MovieingWalk</title>

<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function () {
	var cnt = 0;
	<c:forEach items="${getMyLikeCol}" var="collection">

		var list1 = new Array();
		cnt += 1;

		list1.push("${collection.col_midx1}");

		var col_idx = "${collection.col_idx}";

		var getMyLikeCol = "<div id='collection_"+cnt+"' style='border:1px solid gray; float:left;'><p><a href='../collection/collectiondetail?col_idx="+col_idx+"' style='color:white;'>"+"${collection.col_title}"+"</a></p>";
	
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
				var poster_img = json.poster_path;
			
				//출력을 위한 동적 요소 생성
				<!--포스터-->
				getMyLikeCol +="<div class='poster_area'>";
				getMyLikeCol += "<a href='/collection/collectiondetail?col_idx="+col_idx+"'>"
				getMyLikeCol += "<img src='"+poster_host+poster_img+"' style='width:170px;' alt='' /></a>";
				getMyLikeCol +="</div>"

		    }, // json
		  
			error : function(xhr, textStatus, errorThrown){
				$("div").html("<div>" + textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")</div>");
			} // error
	}); // ajax
			} //for
			getMyLikeCol +="</div>";
		$("#getMyLikeCol").append(getMyLikeCol);
		</c:forEach>
}); // function
</script>
</head>
<body>

<jsp:include page="../main/header.jsp"/>
<jsp:include page="./leftMenu.jsp"/>

	<section style="display: inline-block;">
		<h2 style="color: white;">내가 좋아한 컬렉션</h2>
		<div id="getMyLikeCol"></div>

	</section>

<jsp:include page="../main/footer.jsp"/>
</body>
</html>