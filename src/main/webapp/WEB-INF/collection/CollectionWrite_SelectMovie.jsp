<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>영화 선택하기</title>

<!-- jQuery Framework 참조하기 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
  
<!-- 사용자 스크립트 블록 -->
 <script type="text/javascript">
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
	  				
	  				//검색 결과 동적요소 생성
	  				searchResult += "<div style='float:left; margin-right:20px;'>";
	  				if(poster_img != null){
		  				searchResult += "<img src='" +poster_host + poster_img+ "' style=width:170px;' alt=''/>";
	  				}else{
	  					searchResult += "<img src='../imgdata/img_ready.png' width='170' height='255' alt='/'>";
	  				}
	  				searchResult += "<p>"+title+"</p></div>";
	  				//searchResult += "<input type='button' value='선택' onClick='selectMovie(title);'>";
	  			})
	  			$("#console").html(searchResult);
	  		},
	  		error : function(xhr, textStatus, errorThrown){
	    		$("div").html("<div>"+textStatus+" (HTTP-"+xhr.status+" / "+errorThrown +")</div>");
	    		}
 });
 };	
	 
function selectMovie(title){
	$("#selected").html(title);
	
	
}
</script>
</head>
<body>
<!-- 글검색 하기  -->
<div id="search">
  <input type="text" id="searchStr" size="50" maxlength="100">
  <input type="button" value="검색" onClick="searchMovie()">
</div>
<div id="console" style='float:left; right-margin:20px;'>
</div>
<div id="selected" style='float:left;'>
</body>
</html>