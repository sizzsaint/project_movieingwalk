<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MovieingWalk</title>

<!-- jQuery Framework 참조하기 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
  
<!-- 사용자 스크립트 블록 -->
 <script type="text/javascript">
 
 $(function(){
		 var details="";
		 var m_idx = ${m_idx}
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
	    			var country = json.production_countries[0].name;
	    			
	    			//출력을 위한 동적 요소 생성
	    			<!--포스터-->
	    			details +="<div class='poster_area' style='float:left; margin-right:10px;'>";
	    			details += "<img src='"+poster_host+poster_img+"' style=width:170px;' alt=''>";
	    			details +="</div>"
	    			<!--타이틀&개봉일-->
	    			details +="<div class='info_area' style='float:left;'>";
	    			details +="<h3 class='title_area'>"+title+"</h3>";
	    			details += " "+date;
	    			<!--기본정보-->
	    			details += "<p>상영시간    "+runtime+"분 </p>";
	    			details +="장르    ";
	    			for(i=0;i<genres.length;i++){
	    				var genre = genres[i].name;
	    				details += genre+" ";
	    			}
	    			details += "</p><p>국가    "+country+"</p>";

	    			$("#details").html(details);
	  		},
	   		 error : function(xhr, textStatus, errorThrown){
	    		$("div").html("<div>"+textStatus+" (HTTP-"+xhr.status+" / "+errorThrown +")</div>");
	    		}
		});
	  		  
});
 
 $(function(){
	 var m_idx = ${m_idx}
	 $.ajax({
	  		url: "https://api.themoviedb.org/3/movie/"+m_idx+"/watch/providers?api_key=9348030243f7b212abdd53ccc8412e24",
	  		type: "get",
	  		dataType: "json",
	  		cache : false,
	  		timeout : 30000,
	  		success: function(json) {
	  			
	  			    var ottRaw = json.results.KR.flatrate;
	  			    var ottList ="바로 재생";
	  			    
	    			$(ottRaw).each(function(key,value){
	    				var ottName = value.provider_name;
	    				var ottLogo = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2"+value.logo_path;
	    				
	    				ottList += "<div class='ott_area'><img src='"+ottLogo+"' width='30' height='30' alt=''>";
	    				ottList += ottName+"</div>";
	    				
	    				$("#otts").html(ottList);
	    			})
	    			
	  		},
	   		 error : function(xhr, textStatus, errorThrown){
	    		$("div").html("<div>"+textStatus+" (HTTP-"+xhr.status+" / "+errorThrown +")</div>");
	    		}
		});
	 
 });
 </script>
</head>
<body>
<div id="details" style="float:left; margin-right:20px;"></div>
<div id="otts" style="border:1px solid black; float:left"></div>
</body>
</html>