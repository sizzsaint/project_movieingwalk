<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>movieingwalk</title>
<link href="../css/ticket.css" rel ="stylesheet" type="text/css">
<jsp:include page="../main/header.jsp"/>

</head>
<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
 <script type="text/javascript"> 
 $(function(){
	 $.ajax({			
	  		url: "https://api.themoviedb.org/3/movie/now_playing?api_key=9348030243f7b212abdd53ccc8412e24&language=ko&page=1",
	  		type: "get",
	  		dataType: "json",
	  		success: function(json) {
	  				var genretable = "<div class='nowscreening'>";
	  			
	  				var result = json.results;
	  				
	  				for(var j=0; j<14; j++){
	  			    var poster_host = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2";
	  			    var m_idx = result[j].id;
	    			var title = result[j].title;
	    			var poster_img = result[j].poster_path;
	    					
	    			//출력을 위한 동적 요소 생성
	    			genretable +="<div style='float:left; margin-right:10px; width:170px;'>";
	    			genretable += "<a href='/movieinfo/MovieDetail?m_idx="+m_idx+"'><img src='" +poster_host + poster_img+ "' style=width:170px;' alt=''/></a>";
	    			genretable +="<p style='color:white; width:170px; height:81px;'>"+title+"</p>";
	    			genretable += "</div>";
	  				}
	  				genretable += "</div>"

	    			$("#nowscreening").html(genretable);
	  		},
	   		 error : function(xhr, textStatus, errorThrown){
	    		$("div").html("<div>"+textStatus+" (HTTP-"+xhr.status+" / "+errorThrown +")</div>");
	    		}
		});
	 
 })
 </script>
</head>
<body>
<nav class="menu" style="float: left; width: 100%"><jsp:include page="./menu.jsp"/></nav>
	<table class="show">
	<tbody>
		<tr>
			<td>
			<div id="nowscreening"></div></td></tr>
	</tbody>
	</table>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>