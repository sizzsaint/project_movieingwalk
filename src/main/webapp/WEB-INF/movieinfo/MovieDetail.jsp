<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MovieingWalk</title>
<!-- css설정 -->
<link href="../../css/movieDetail.css" rel ="stylesheet" type="text/css">
<link href="./../../css/r_star.css" rel="stylesheet" type="text/css">
<!-- jQuery Framework 참조하기 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>

<!-- 사용자 스크립트 블록 -->
 <script type="text/javascript">

 var m_idx = ${m_idx};
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
	    			var title = json.title;
	    			var date =json.release_date;
	    			var runtime = json.runtime;
	    			var overview = json.overview;
	    			var poster_img = json.poster_path;
	    			var genres = json.genres;
	    			var countries = json.production_countries
	    			var overview = json.overview;
	    			
	    			if(countries.length>1){
	    			var country = json.production_countries[0].name;
	    			}
	    			//출력을 위한 동적 요소 생성
	    			<!--포스터-->
	    			var details ="<div class='poster_area'>";
	    			details += "<img src='"+poster_host+poster_img+"' style=height:350px; ' alt=''>";
	    			details +="</div>"
	    			<!--타이틀&개봉일-->
	    			details +="<div class='info_area'>";
	    			details +="<h1 class='title_area'>"+title+"</h3>";
	    			details += "<p>상영일 :  "+date+"</p>";
	    			<!--기본정보-->
	    			details += "<p>상영시간 :  "+runtime+"분 </p>";
	    			details +="장르 :  ";
	    			for(i=0;i<genres.length;i++){
	    				var genre = genres[i].name;
	    				details += genre+" ";
	    			}
	    			if(countries.length>1){
	    			details += "</p><p>국가 :  "+country+"</p>" ;
	    			}
	    			details += "<div id='buttonDiv'><button id='reviewbutton' onClick='location.href=\"/review/writeReview?m_idx=${m_idx}\"'>평가하기</button></div>"
	    			details += "</div>";
	    			$("#details").html(details);
	    			
	    			var overviewStr = "<h3 style='color:white'>줄거리</h3>";
	    			overviewStr += "<p>"+overview+"</p>"
	    			$("#overview_area").html(overviewStr);
	    			
	  		},
	   		 error : function(xhr, textStatus, errorThrown){
	    		$("div").html("<div>"+textStatus+" (HTTP-"+xhr.status+" / "+errorThrown +")</div>");
	    		}
		});
	  		  
});
 
 //ott 리스트 가져오기
 $(function(){
	 $.ajax({
	  		url: "https://api.themoviedb.org/3/movie/"+m_idx+"/watch/providers?api_key=9348030243f7b212abdd53ccc8412e24",
	  		type: "get",
	  		dataType: "json",
	  		cache : false,
	  		timeout : 30000,
	  		success: function(json) {
	  			
	  			    var ottRaw = json.results.KR.flatrate;
	  			    var ottList ="<h3 style='color:white'>스트리밍 가능한 곳</h3>";
	  			    
	    			$(ottRaw).each(function(key,value){
	    				var ottName = value.provider_name;
	    				var ottLogo = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2"+value.logo_path;
	    				
	    				ottList += "<img src='"+ottLogo+"' width='30' height='30' alt=''>";
	    				ottList += "<p>"+ottName+"</p>";
	    			});
	    			
	    			ottList +="</div>";
	    			$("#ott_area").append(ottList);
	  		},
	   		 error : function(xhr, textStatus, errorThrown){
	    		$("div").html("<div>"+textStatus+" (HTTP-"+xhr.status+" / "+errorThrown +")</div>");
	    		}
		});
	 
 });

 //크레딧 정보 가져오기
 $(function(){
	 
	 $.ajax({
	  		url: "https://api.themoviedb.org/3/movie/"+m_idx+"/credits?api_key=9348030243f7b212abdd53ccc8412e24&language=ko",
	  		type: "get",
	  		dataType: "json",
	  		cache : false,
	  		timeout : 30000,
	  		success: function(json) {
	  			var profile_host = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2";
	  			
	  			//감독정보 가져오기
	  			var crew = json.crew;
	  			var directorList = "<h3>감독 및 배우정보</h3>";
	  			
	  			$(crew).each(function(key,value){
	  				var job = value.job;
	  				if(job == "Director"){
	  					var profile_img = value.profile_path;
	  					var directorName = value.name;
	  					
	  					//감독정보 동적요소 생성
	  					if(profile_img != null){
		  					directorList += "<li class='director'><img src='"+profile_host+profile_img+"' width='110' height='120' alt='/'>";
		  				}else{
		  					directorList += "<li class='director'><img src='../imgdata/img_ready.png' width='110' height='120' alt='/'>";
		  				}

	  					directorList += "<p style='color:white; top-margin:5px;'>"+directorName+
	  					"</p></li>";
	  					
	  					$("#credit_area").append(directorList);
	  					}
					});
	  			
	  			//배우정보 가져오기
	  			var cast = json.cast;
	  			var actorList = "";
	  			
	  			for(i=0;i<7;i++){
	  				var actorName = cast[i].name;
	  				var profile_img = cast[i].profile_path;
	  				var character = cast[i].character;

	  				//배우정보 동적요소 생성
	  				if(profile_img != null){
	  					actorList += "<li class='actor'><img src='"+profile_host+profile_img+"' width='110' height='120' alt='/'>";
	  				}else{
	  					actorList += "<li class='actor'><img src='../imgdata/img_ready.png' width='110' height='120' alt='/'>";
	  				}
	  				actorList += "<p style='color:white; width:110px; top-margin:5px;'>"+actorName+"</p>";
	  				actorList += "<p style='color:gray; width:110px;'>"+character+"</p></li>";
	  					
	  				}
	  			$("#credit_area").append(actorList);
	  		
	 		},
 			error : function(xhr, textStatus, errorThrown){
					$("div").html("<div>"+textStatus+" (HTTP-"+xhr.status+" / "+errorThrown +")</div>");
					}
 });
 });
 
 //컬렉션 리스트
 $(function () {
		var cnt = 0;
		<c:forEach items="${collectionBeanList}" var="collection">

			var list1 = new Array();
			cnt += 1;

			list1.push("${collection.col_midx1}");

			var col_idx = "${collection.col_idx}";
			var u_id = "${collection.u_id}";
			var collections = "<div id='collection_"+cnt+"' style='border:1px solid gray; height:315px;'><p><a href = '/collection/collectiondetail?col_idx="+col_idx+"&u_id="+u_id+"' style='color:white;'>"+"${collection.col_title}"+"</a></p>";
		
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
					collections +="<div class='poster_area'>";
					collections += "<a href = '/collection/collectiondetail?col_idx="+col_idx+"&u_id="+u_id+"' style='color:white;'>"
					collections += "<img src='"+poster_host+poster_img+"' style='width:170px;' alt='' /></a>";
					collections +="</div>"

			    }, 
			  
				error : function(xhr, textStatus, errorThrown){
					$("div").html("<div>" + textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")</div>");
				} 
		}); 
				} 
			collections +="</div>";
			$("#collection_area").append(collections);
			</c:forEach>
	}); 


 
 function MoreReview(){
	 
		var url = "/review/reviewList?m_idx="+${m_idx};
		window.open(url,"post");
	}
 function MoreCollection(){
	 
	 var url = "/collection/collectionList?m_idx="+${m_idx};
	 window.open(url,"post");
 }
 
 </script>
 <!-- 구글차트 참조 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

 <script type="text/javascript">
 
//차트 그리기
 var stars = "${stars}";
 var star1 = ${stars.star1};
 var star2 = ${stars.star2};
 var star3 = ${stars.star3};
 var star4 = ${stars.star4};
 var star5 = ${stars.star5};
 
 google.charts.load('current', {packages: ['corechart', 'bar']}); 
 google.charts.setOnLoadCallback(drawChart); 
 
function drawChart(){ 
	var data = new google.visualization.DataTable();
	data.addColumn('string', '별점');
	data.addColumn('number', '별점 수');

	  
	data.addRows([
		['1점', star1],
		['2점', star2],
		['3점', star3],
		['4점', star4],
		['5점', star5],
	]);  

	var options = {
		title: '별점 분포도',
		hAxis: {
		title: '별점',
		backgroundColor:'#D8D9E1', //배경색
		viewWindow: {
	 }
	 },
	}

	var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));

	chart.draw(data, options);
 
 }

 </script>
 
 
</head>
<body>
<jsp:include page="../main/header.jsp"/>

<div id="details">
</div>


<div id='chart_div'>
</div>

<div id='ott_area'></div>

<div id="overview">
<div id='overview_area'>
</div></div>
<div id="credit">
<ul id="credit_area"></ul>
</div>

<div id="review_area">
<h3>리뷰</h3>
<div id="rButtonDiv">
	 <button id="moreReview" onClick="MoreReview()">리뷰 더보기</button>
</div>

	 <c:forEach var="review" items="${reviewBeanList}" begin="0" end="2" step="1">
	 <div class="review">
	 ${review.u_id} &nbsp;&nbsp;&nbsp; <img src='../imgdata/star.png' width='30' height='30' alt='/'>${review.r_star}
	 
	 <c:if  test= "${review.r_spoiler eq 'N'}">
	 <a href="../review/reviewDetail?r_idx=${review.r_idx}&u_id=${review.u_id}" style="color:whtie"><p>${review.r_memo}</p></a>
	 </c:if>
	 
	 <c:if  test= "${review.r_spoiler eq 'Y'}">
	 <p><a href="../review/reviewDetail?r_idx=${review.r_idx}&u_id=${review.u_id}" style="color:whtie">스포일러가 포함된 리뷰입니다. 읽으시려면 눌러주세요</a></p>
	 </c:if>
	 
	 <div class="icons">
	 <img src='../imgdata/like.png' width='25' height='25' alt='/'>${review.r_likes}
	 <img src='../imgdata/comment.png' width='25' height='25' alt='/'>${review.r_comments}
	 </div>
	 
	 </div>
	 <hr>
	 </c:forEach>
</div>

<div id="collections">
<h3 style='color:white'>해당 영화가 담긴 컬렉션들</h3>
<input type="button" value="컬렉션 더보기" onClick="MoreCollection()">
<div id="collection_area">
</div>
</div>

<jsp:include page="../main/footer.jsp"/>
</body>
</html>