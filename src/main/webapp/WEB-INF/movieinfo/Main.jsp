<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MovieiengWalk</title>

<!-- css설정 -->
<link href="../css/MovieMain.css" rel ="stylesheet" type="text/css">

<!-- jQuery Framework 참조하기 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
  
<!-- 사용자 스크립트 블록 -->
 <script type="text/javascript">
 
 //최근 리뷰가 등록된 영화
 $(function(){
		 var reviewtable="";
		 
	for(i=0;i<${newReviewMList}.length;i++){
		var m_idx = ${newReviewMList}[i];
		 
		$.ajax({
	  		url: "https://api.themoviedb.org/3/movie/"+m_idx+"?api_key=9348030243f7b212abdd53ccc8412e24&language=ko",
	  		type: "get",
	  		dataType: "json",
	  		cache : false,
	  		timeout : 30000,
	  		success: function(json) {
	  			
	  			    var poster_host = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2";
	    			var title = json.title;
	    			var poster_img = json.poster_path;
	    			var m_idx = json.id;
	    					
	    			//출력을 위한 동적 요소 생성
	    			reviewtable +="<td>";
	    			reviewtable += "<a href='/movieinfo/MovieDetail?m_idx="+m_idx+"'>"+"<img src='"+poster_host+poster_img+"' style='width:200px;' alt=''/></a>";
	    			reviewtable +="<p style='color:white width:170; height:81;'>"+title+"</p>";
	    			reviewtable += "</td>";
	    			
	    			$("#newReviewlist").html(reviewtable);
	  		},
	   		 error : function(xhr, textStatus, errorThrown){
	    		$("div").html("<div>"+textStatus+" (HTTP-"+xhr.status+" / "+errorThrown +")</div>");
	    		}
		});
	  		}   
});
//범죄&스릴러 장르 기본 출력
 $(function(){

		$.ajax({
					
			  		url: "https://api.themoviedb.org/3/discover/movie?api_key=9348030243f7b212abdd53ccc8412e24&language=ko&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_genres=18%2C80&watch_region=KR&with_watch_monetization_types=flatrate",
			  		type: "get",
			  		dataType: "json",
			  		success: function(json) {
			  				var genretable = "<div id='crimeThriller'>";
			  			
			  				var result = json.results;
			  				
			  				for(var j=0; j<6; j++){
			  			    var poster_host = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2";
			  			    var m_idx = result[j].id;
			    			var title = result[j].title;
			    			var poster_img = result[j].poster_path;
			    					
			    			//출력을 위한 동적 요소 생성
			    			genretable +="<div style='float:left; margin-right:10px;'>";
			    			genretable += "<a href='/movieinfo/MovieDetail?m_idx="+m_idx+"'><img src='" +poster_host + poster_img+ "' style='width:170px;' alt=''/></a>";
			    			genretable +="<p style='color:white width:170; height:81;'>"+title+"</p>";
			    			genretable += "</div>";
			  				}
			  				genretable += "</div>"

			    			$("#genre_console").html(genretable);
			  		},
			   		 error : function(xhr, textStatus, errorThrown){
			    		$("div").html("<div>"+textStatus+" (HTTP-"+xhr.status+" / "+errorThrown +")</div>");
			    		}
				});

 });

//장르별 드롭다운
 $(function(){
			//1depth에 대한 change 이벤트 정의
			$('#category1').change(function(){
				//선택된 항목이 지시하는 하위 카테고리 페이지의 tr 열기
				var genreCode = $("#category1 :selected").val();
				var genreName = $("#category1 :selected").text();

				$.ajax({
					
			  		url: "https://api.themoviedb.org/3/discover/movie?api_key=9348030243f7b212abdd53ccc8412e24&language=ko&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_genres="+genreCode+"&watch_region=KR&with_watch_monetization_types=flatrate",
			  		type: "get",
			  		dataType: "json",
			  		success: function(json) {
			  				var genretable = "<div id='"+genreName+"'>";
			  			
			  				var result = json.results;
			  				
			  				for(var j=0; j<6; j++){
			  			    var poster_host = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2";
			  			    var m_idx = result[j].id;
			    			var title = result[j].title;
			    			var poster_img = result[j].poster_path;
			    					
			    			//출력을 위한 동적 요소 생성
			    			genretable +="<div style='float:left; margin-right:10px;'>";
			    			genretable += "<a href='/movieinfo/MovieDetail?m_idx="+m_idx+"'><img src='" +poster_host + poster_img+ "' style='width:170px;' alt=''/></a>";
			    			genretable +="<p style='color:white width:170; height:81;'>"+title+"</p>";
			    			genretable += "</div>";
			  				}
			  				genretable += "</div>"

			    			$("#genre_console").html(genretable);
			  		},
			   		 error : function(xhr, textStatus, errorThrown){
			    		$("div").html("<div>"+textStatus+" (HTTP-"+xhr.status+" / "+errorThrown +")</div>");
			    		}
				});
				
			});
	 });
 
//요즘 뜨는 영화
 $(function(){
	 
	 $.ajax({
			
	  		url: "http://api.themoviedb.org/3/movie/top_rated?api_key=9348030243f7b212abdd53ccc8412e24&language=ko&page=1&region=KR",
	  		type: "get",
	  		dataType: "json",
	  		success: function(json) {
	  				var genretable = "<div class='topRated'>";
	  			
	  				var result = json.results;
	  				
	  				for(var j=0; j<10; j++){
	  			    var poster_host = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2";
	  			    var m_idx = result[j].id;
	    			var title = result[j].title;
	    			var poster_img = result[j].poster_path;
	    					
	    			//출력을 위한 동적 요소 생성
	    			genretable +="<div style='float:left; margin-right:10px;'>";
	    			genretable += "<a href='/movieinfo/MovieDetail?m_idx="+m_idx+"'><img src='" +poster_host + poster_img+ "' style=width:170px;' alt=''/></a>";
	    			genretable +="<p style='color:white; width:170; height:81;'>"+title+"</p>";
	    			genretable += "</div>";
	  				}
	  				genretable += "</div>"

	    			$("#hotMovies").html(genretable);
	  		},
	   		 error : function(xhr, textStatus, errorThrown){
	    		$("div").html("<div>"+textStatus+" (HTTP-"+xhr.status+" / "+errorThrown +")</div>");
	    		}
		});

	 
 })
</script>

</head>
<body>
<jsp:include page="../main/header.jsp"/>

<h3 style='color:white'>최근 리뷰가 등록된 영화</h3>
<table id="newReviewlist"></table>
<hr>
<h3 style='color:white'>요즘 뜨는 영화</h3>
<div id="hotMovies"></div>
<hr>
<h3 style='color:white'>장르별 영화보기</h3>
<div class="dropdown">
				
	<!-- 1depth 카테고리 -->
	<select name="category1" id="category1">
		<option value="18,80">범죄/스릴러</option>
		<option value="10749">로맨스</option>
		<option value="35">코미디</option>
		<option value="28">액션</option>
		<option value="9648">미스터리</option>
		<option value="14">판타지</option>
		<option value="99">다큐멘터리</option>
		<option value="16">애니메이션</option>
	</select>
</div>
<!-- 최종 선택 결과를 표시할 곳 -->
<div id="genre_console">

</div>

		
</body>
</html>