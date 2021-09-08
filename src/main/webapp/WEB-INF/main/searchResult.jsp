<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery Framework 참조하기 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
  
<!-- 사용자 스크립트 블록 -->
 <script type="text/javascript">
 //영화 검색
 function searchMovie(){
	 var searchStr = document.getElementById('searchStr').value;
	 var urlRow = "https://api.themoviedb.org/3/search/movie?api_key=9348030243f7b212abdd53ccc8412e24&language=ko&query=" +searchStr+ "&include_adult=true";
	 var url = encodeURI(urlRow);
	var searchResult = "";
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
		  				searchResult += "<img onClick='selectMovie(" +m_idx+ ")'src='" +poster_host + poster_img+ "' style='width:170px;' alt='/'>";
	  				}else{
	  					searchResult += "<img onClick='selectMovie(" +m_idx+ ")' src='../imgdata/img_ready.png' width='170' height='255' alt='/'>";
	  				}
	  				searchResult += "<p>"+title+"</p></div>";
	  			})
	  			$("#console").html(searchResult);
	  		},
	  		error : function(xhr, textStatus, errorThrown){
	    		$("div").html("<div>"+textStatus+" (HTTP-"+xhr.status+" / "+errorThrown +")</div>");
	    		}
 });
 };	
 </script>
</head>
<body>
	<!-- header고정 -->
	<jsp:include page="./header.jsp" />
	
<h2>검색 결과</h2>
<div id="result">

</div>
</body>
</html>