<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MovieiengWalk</title>



<!-- jQuery Framework 참조하기 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
  
<!-- 사용자 스크립트 블록 -->
 <script type="text/javascript">
 
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
	    			reviewtable += "<a href='/movieinfo/MovieDetail?m_idx="+m_idx+"'>"+"<img src='"+poster_host+poster_img+"' style=width:170px;' alt=''/></a>";
	    			reviewtable +="<p>"+title+"</p>";
	    			reviewtable += "</td>";
	    			
	    			$("#newReviewlist").html(reviewtable);
	  		},
	   		 error : function(xhr, textStatus, errorThrown){
	    		$("div").html("<div>"+textStatus+" (HTTP-"+xhr.status+" / "+errorThrown +")</div>");
	    		}
		});
	  		}   
});

 $(function(){

		const genreList = ['18,80', '10749', '35', '28', '9648', '14', '99', '16']
		const genreNameList = ['crimeThriller','romance', 'comedy', 'action', 'mystery', 'fantasy', 'documentary','animation']	
		
		for(i=0;i<genreList.length;i++){
			
			var genreIndex = genreList[i];
			var genreName = genreNameList[i];
			
			genretable = "<tr id="+genreName+">";
			
		$.ajax({
				
	  		url: "https://api.themoviedb.org/3/discover/movie?api_key=9348030243f7b212abdd53ccc8412e24&language=ko&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_genres="+genreIndex+"&with_watch_monetization_types=flatrate",
	  		type: "get",
	  		dataType: "json",
	  		cache : false,
	  		timeout : 30000,
	  		success: function(json) {
	  				var result = json.results;
	  				
	  				for(var j=0; j<5;j++){
	  			    var poster_host = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2";
	    			var title = result[j].title;
	    			var poster_img = result[j].poster_path;
	    					
	    			//출력을 위한 동적 요소 생성
	    			genretable +="<td>";
	    			genretable += "<img src='" +poster_host + poster_img+ "' style=width:170px;' alt=''/>";
	    			genretable +="<p>"+title+"</p>";
	    			genretable += "</td>";
	  				}
	  				genretable += "</tr>"
	  			
	    			$("#genretable").html(genretable);
	  		},
	   		 error : function(xhr, textStatus, errorThrown){
	    		$("div").html("<div>"+textStatus+" (HTTP-"+xhr.status+" / "+errorThrown +")</div>");
	    		}
		});

 }
 });

 $(function(){
		//장르별 드롭다운

			//1depth에 대한 change 이벤트 정의
			$("#category1").on("change", function(){
				//선택된 항목이 지시하는 하위 카테고리 페이지의 URL열기
				
			});
	 });
</script>

</head>
<body>
<h3>최근 리뷰가 등록된 영화</h3>
<table id="newReviewlist"></table>
<hr>
<h3>장르별 영화보기</h3>
<div class="exec">

				<!-- 각 단계별 dropdown을 표시할 span태그 -->
				<span id="category1">
				
				<!-- 1depth 카테고리 -->
				<select name="category1" id="category1">
					<option value="범죄/스릴러" data-target="#crimeThriller">범죄/스릴러</option>
					<option value="로맨스" data-target="#romance">로맨스</option>
					<option value="코미디" data-target="#comedy">코미디</option>
					<option value="액션" data-target="#action">액션</option>
					<option value="미스터리" data-target="#mystery">미스터리</option>
					<option value="판타지" data-target="#fantasy">판타지</option>
					<option value="다큐멘터리" data-target="#documentary">다큐멘터리</option>
					<option value="애니메이션" data-target="#animation">애니메이션</option>
				</select>
				<table id="genretable">
				
				</table>

				</span>
		</div>
		<!-- 최종 선택 결과를 표시할 곳 -->
		<table class="console"></table>
		
</body>
</html>