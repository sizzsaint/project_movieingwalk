<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MovieingWalk</title>
<!-- css설정 -->
<link href="../css/movieDetail.css" rel ="stylesheet" type="text/css">
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
	    			details += "<img src='"+poster_host+poster_img+"' style=width:170px;' alt=''>";
	    			details +="</div>"
	    			<!--타이틀&개봉일-->
	    			details +="<div class='info_area'>";
	    			details +="<h3 class='title_area'>"+title+"</h3>";
	    			details += " "+date;
	    			<!--기본정보-->
	    			details += "<p>상영시간    "+runtime+"분 </p>";
	    			details +="장르    ";
	    			for(i=0;i<genres.length;i++){
	    				var genre = genres[i].name;
	    				details += genre+" ";
	    			}
	    			if(countries.length>1){
	    			details += "</p><p>국가    "+country+"</p>";
	    			}
	    			$("#details").html(details);
	    			
	    			var overviewStr = "<div class='overview_area'><h3 style='color:white'>줄거리</h3>";
	    			overviewStr += "<p>"+overview+"</p>"
	    			$("#overview").html(overviewStr);
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
	  			    var ottList ="<div class='ott_area'><h3 style='color:white'>스트리밍 가능한 곳</h3>";
	  			    
	    			$(ottRaw).each(function(key,value){
	    				var ottName = value.provider_name;
	    				var ottLogo = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2"+value.logo_path;
	    				
	    				ottList += "<img src='"+ottLogo+"' width='30' height='30' alt=''>";
	    				ottList += "<p>"+ottName+"</p>";
	    			});
	    			
	    			ottList +="</div>";
	    			$("#details").append(ottList);
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
	  			var directorList = "<h3 style='color:white'>감독 및 배우정보</h3>";
	  			
	  			$(crew).each(function(key,value){
	  				var job = value.job;
	  				if(job == "Director"){
	  					var profile_img = value.profile_path;
	  					var directorName = value.name;
	  					
	  					//감독정보 동적요소 생성
	  					if(profile_img != null){
		  					directorList += "<li id='director'><img src='"+profile_host+profile_img+"' width='100' height='120' alt='/'>";
		  				}else{
		  					directorList += "<li id='director'><img src='../imgdata/img_ready.png' width='100' height='120' alt='/'>";
		  				}

	  					directorList += "<p style='color:white'>"+directorName+"</p></li>";
	  					
	  					$(".credit_area").append(directorList);
	  					}
					});
	  			
	  			//배우정보 가져오기
	  			var cast = json.cast;
	  			var actorList = "";
	  			
	  			for(i=0;i<8;i++){
	  				var actorName = cast[i].name;
	  				var profile_img = cast[i].profile_path;
	  				var character = cast[i].character;

	  				//배우정보 동적요소 생성
	  				if(profile_img != null){
	  					actorList += "<li id='actor'><img src='"+profile_host+profile_img+"' width='100' height='120' alt='/'>";
	  				}else{
	  					actorList += "<li id='actor'><img src='../imgdata/img_ready.png' width='100' height='120' alt='/'>";
	  				}
	  				actorList += "<p style='color:white'>"+actorName+"</p>";
	  				actorList += "<p style='color:gray'>"+character+"</p></li>";
	  					
	  				}
	  			$(".credit_area").append(actorList);
	  		
	 		},
 			error : function(xhr, textStatus, errorThrown){
					$("div").html("<div>"+textStatus+" (HTTP-"+xhr.status+" / "+errorThrown +")</div>");
					}
 });
 });
 
 //function MoreReview(${review.r_dix}){
		//url = "./review/reviewDetail?r_idx="+${review.r_dix};
		//window.open(url,"post");
	//}
 //function MoreCollection(${review.r_dix})
 
 
 </script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>

<div id="details"></div>

<!-- 리뷰 하기 -->
<form class="r_star" action="/review/writeReview">

<h3>평가하기</h3>
<input type="hidden" name="m_idx"value="${m_idx}"/>
<div class="star-rating space-x-4 mx-auto">
	<input type="submit" id="5-stars" name="r_star" value="5" v-model="ratings" /> <label for="5-stars" class="star pr-4">★</label>
	<input type="submit" id="4-stars" name="r_star" value="4" v-model="ratings" /> <label for="4-stars" class="star">★</label>
	<input type="submit" id="3-stars" name="r_star" value="3" v-model="ratings" /> <label for="3-stars" class="star">★</label>
	<input type="submit" id="2-stars" name="r_star" value="2" v-model="ratings" /> <label for="2-stars" class="star">★</label>
	<input type="submit" id="1-star" name="r_star" value="1" v-model="ratings" /> <label for="1-star" class="star">★</label>
</div>
</form>

<div id="overview"></div>

<div id="credit">
<ul class="credit_area"> 
</div>

<div id="reviews">
<h3 style='color:white'>리뷰</h3>
	 <input type="button" value="리뷰 더보기" onClick="MoreReview(${review.r_idx})">
	 <ul class="review_area">

	 <c:forEach var="review" items="${reviewBeanList}" begin="0" end="2" step="1">
	 <li id="review">
	 ${review.u_id} &nbsp;&nbsp;&nbsp; <img src='../imgdata/star.png' width='30' height='30' alt='/'>${review.r_star}
	 
	 <c:if  test= "${review.r_spoiler eq 'N'}">
	 <a href="./review/reviewDetail?r_idx="+${review.r_idx}><p>${review.r_memo}</p></a>
	 <img src='../imgdata/like.png' width='30' height='30' alt='/'>${review.r_likes}
	 <img src='../imgdata/comment.png' width='30' height='30' alt='/'>${review.r_comments}
	 </c:if>
	 
	 <c:if  test= "${review.r_spoiler eq 'Y'}">
	 <p><a href="./review/reviewDetail?r_idx="+${review.r_idx}>스포일러가 포함된 리뷰입니다. 읽으시려면 눌러주세요</a></p>
	 <img src='../imgdata/like.png' width='30' height='30' alt='/'>${review.r_likes}
	 <img src='../imgdata/comment.png' width='30' height='30' alt='/'>${review.r_comments}
	 </c:if>
	 </c:forEach>
	 </li>
	 </ul>
</div>

<div id="collections">
<h3 style='color:white'>해당 영화가 담긴 컬렉션들</h3>
<input type="button" value="컬렉션 더보기" onClick="MoreCollection(${review.r_dix})">
<ul class="collection_area">
 <c:forEach var="collection" items="${collectionBeanList}" begin="1" end="5" step="1">
 <li id="collection">
 ${collection.col_title}
 </c:forEach>
</ul>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>