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
	    			reviewtable += "<a href='/movieinfo/MovieDetail?m_idx="+m_idx+"'>"+"<img src='"+poster_host+poster_img+"' style=width:200px;' alt=''/></a>";
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
 </script>
</head>
<body>

		<!-- Walker추천작 -->
		<table class="show">
			<!-- 영화 포스터 출력부-->
			<thead>
				<tr>
					<th colspan="5"><i class="fas fa-angle-right"></i> Walker추천작</th>
				</tr>
				<tr>
					<td><a href="#"><img src="./../../imgdata/test.PNG"></a></td>
					<td><a href="#"><img src="./../../imgdata/test.PNG"></a></td>
					<td><a href="#"><img src="./../../imgdata/test.PNG"></a></td>
					<td><a href="#"><img src="./../../imgdata/test.PNG"></a></td>
					<td><a href="#"><img src="./../../imgdata/test.PNG"></a></td>
				</tr>
			</thead>

			<!-- 영화제목 -->
			<tbody>
				<tr>
					<td>영화제목1</td>
					<td>영화제목2</td>
					<td>영화제목3</td>
					<td>영화제목4</td>
					<td>영화제목5</td>
				</tr>
			</tbody>
		</table>

</body>
</html>