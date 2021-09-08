<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
 <script type="text/javascript">
 
 $(function(){
	 
	 $.ajax({
			
	  		url: "http://api.themoviedb.org/3/movie/top_rated?api_key=9348030243f7b212abdd53ccc8412e24&language=ko&page=1&region=KR",
	  		type: "get",
	  		dataType: "json",
	  		success: function(json) {
	  				var genretable = "<div class='topRated'>";
	  			
	  				var result = json.results;
	  				
	  				for(var j=0; j<8; j++){
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
<table class="show">
<thead>
<tr><th><i class="fas fa-angle-right"></i> Walker추천작</th></tr>
</thead>
	<tbody>
	<tr>
	<td>
	<div id="hotMovies"></div></td></tr></tbody>
</table>

</body>
</html>