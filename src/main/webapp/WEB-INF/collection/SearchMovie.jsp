<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>영화 검색</title>

<
<!-- jQuery Framework 참조하기 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>

<!-- 사용자 스크립트 블록 -->
 <script type="text/javascript">
 $(function(){
	 var searchStr = escape(${searchStr});
	 var searchResult = ""
	 $.ajax({
	  		url: " https://api.themoviedb.org/3/search/movie?api_key=9348030243f7b212abdd53ccc8412e24&language=ko&query="+searchStr+"&include_adult=true",
	  		type: "get",
	  		dataType: "json",
	  		cache : false,
	  		timeout : 30000,
	  		success: function(json) {
	  			var poster_host = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2";
	  			var result = json.results;
	  			
	  			$(result).each(function(key,value){
	  				var poster_img = val.poster_path;
	  				var title = val.title;
	  				
	  				//검색 결과 동적요소 생성
	  				searchResult += "<div style='float:left; margin-right:20px;'>";
	  				searchResult += "<img src='" +poster_host + poster_img+ "' style=width:170px;' alt=''/>";
	  				searchResult += "<p>"+title+"</p></div>";
	  			}
	  			$("#searchResult").html(searchResult);
	  		},
	  		error : function(xhr, textStatus, errorThrown){
	    		$("div").html("<div>"+textStatus+" (HTTP-"+xhr.status+" / "+errorThrown +")</div>");
	    		}
 });
 });	 

</script>		
</head>
<body>
<h3>검색 결과</h3>
<div id="searchResult"></div>

</body>
</html>