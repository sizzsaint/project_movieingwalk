<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>MyCollection</title>

<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
<script type="text/javascript">


 //영화 상세정보 가져오기
$(function () {
	var cnt = 0;
	<c:forEach items="${myCollectionList}" var="collection">

		var list1 = new Array();
		cnt += 1;

		list1.push("${collection.col_midx1}");

		var col_idx = "${collection.col_idx}";
		var u_id = "${collection.u_id}";
		var mycollection = "<div id='collection_"+cnt+"' style='border:1px solid gray; height:315px; width:1270px;'><p><a href = '/collection/collectiondetail?col_idx="+col_idx+"&u_id="+u_id+"' style='color:white;'>"+"${collection.col_title}"+"</a></p>";
	
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
				mycollection +="<div class='poster_area'>";
				mycollection += "<a href = '/collection/collectiondetail?col_idx="+col_idx+"&u_id="+u_id+"' style='color:white;'>"
				mycollection += "<img src='"+poster_host+poster_img+"' style='width:170px;' alt='' /></a>";
				mycollection +="</div>"

		    }, // json
		  
			error : function(xhr, textStatus, errorThrown){
				$("div").html("<div>" + textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")</div>");
			} // error
	}); // ajax
			} //for
		mycollection +="</div>";
		$("#mycollection").append(mycollection);
		</c:forEach>
}); // function


</script>
</head>
<body >


<jsp:include page="../main/header.jsp"/>
<jsp:include page="./leftMenu.jsp"/>


<!-- 내가 쓴 컬렉션 -->
<section style="display:inline-block;">
<h2 style="color:white;">나의 컬렉션</h2>
<div id="mycollection"></div>

</section>




<jsp:include page="../main/footer.jsp"/>
</body>
<%} %>
</html>