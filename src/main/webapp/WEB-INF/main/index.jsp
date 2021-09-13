<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="utf-8">
<title>MovieingWalk</title>

<!-- css -->
<link href="./../../css/index.css" rel="stylesheet" type="text/css">

<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
  
<!-- 사용자 스크립트 블록 -->
 <script type="text/javascript">
 //영화 검색
 function searchMovie(){
	 var searchStr = document.getElementById('searchStr').value;
	 
	 if(searchStr == ""){
		alert("검색어를 입력해 주세요");
		return false;
	 }else{
	 var urlRow = "https://api.themoviedb.org/3/search/movie?api_key=9348030243f7b212abdd53ccc8412e24&language=ko&query=" +searchStr+ "&include_adult=true";
	 var url = encodeURI(urlRow);
	var searchResult = "<h3 style='color:white;'>검색결과</h3>";
	 $.ajax({
	  		url: url,
	  		type: "get",
	  		dataType: "json",
	  		cache : false,
	  		timeout : 30000,
	  		success: function(json) {
	  			var poster_host = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2";
	  			var result = json.results;
	  			
	  			$(result).each(function(key,value){
	  				var poster_img = value.poster_path;
	  				var title = value.title;
	  				var m_idx = value.id;
	  				
	  				//검색 결과 동적요소 생성
	  				searchResult += "<div class='result'>";
	  				if(poster_img != null){
		  				searchResult += "<a href='/movieinfo/MovieDetail?m_idx="+m_idx+"'>"+"<img src='"+poster_host+poster_img+"' style='width:200px;' alt='/'/></a>";
	  				}else{
	  					searchResult += "<a href='/movieinfo/MovieDetail?m_idx="+m_idx+"'><img src='../imgdata/img_ready.PNG' style='width:200px;' alt='/'></a>";
	  				}
	  				searchResult += "<p style='color:white; text-align:center;' width='170px' height='81px'>"+title+"</p></div>";
	  			})
	  			$("#console").html(searchResult);
	  		},
	  		error : function(xhr, textStatus, errorThrown){
	    		$("div").html("<div>"+textStatus+" (HTTP-"+xhr.status+" / "+errorThrown +")</div>");
	    		}
 });
 }
 }
 </script>


</head>

<body>
	<!-- header고정 -->
	<jsp:include page="./header.jsp" />

	<section class="index">
		<!-- 검색창 -->
		<div class="search">
			<input type="text" id="searchStr" placeholder="보고싶은 영화를 검색하세요."> <input type="button"  value="검색" width='45' height='30' onClick="searchMovie();">
		</div>
<div id="console">
<!-- 추천영화 -->
<jsp:include page="./recommand.jsp"/>

<!-- 최신등록된리뷰 -->
 <jsp:include page="./recentReview.jsp"/>

<!-- 상영중인영화 -->
<jsp:include page="./screening.jsp"/>
</div>
	</section>

	<!-- footer고정 -->
	<jsp:include page="./footer.jsp" />
</body>
</html>
