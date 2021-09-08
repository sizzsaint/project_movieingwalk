<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%
if(session.getAttribute("mvId")==null){
   response.sendRedirect("/loginMember");
}else{
	Object object = session.getAttribute("mvId");
	String u_id = (String)object;
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./../../css/movieDetail.css" rel ="stylesheet" type="text/css">
<link href="./../../css/r_star.css" rel="stylesheet" type="text/css">
<title>리뷰쓰기</title>

<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
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
  
 </script>
</head>
<body>

<jsp:include page="../main/header.jsp"/>

	<!-- 	int r_idx, m_idx, r_star, r_likes, r_hits, r_comments;
	String u_id, r_date, r_memo, r_spoiler; -->


	<article>
		<section>
			<div>
				<button type="button" onclick="location.href=history.go(-1)">돌아가기</button>
				<div>
					<h3 class="m_name">리뷰 상세보기</h3>
				</div>
			</div>
			<div id="details"></div>
		</section>
		<section>

				<div>
					<div>
						<label for="star-rating"><c:out value="<%=u_id%>" />&nbsp;님</label>
						
						<div class="star-rating space-x-4 mx-auto">
						<c:out value="${r_star}"/>
						</div>
						<div class="spoiler">
						<c:out value="${r_spoiler}"/>
						</div>
					
						<div>
							<label for="r_spoiler">스포일러</label> 
							<input id="r_spoiler" type="checkbox"/>
							<sf:input type="hidden" id="spoCheck" path="r_spoiler"/>
						</div>
						<div>
							<sf:textarea  name="r_memo" id="r_memo" path="r_memo" rows="10" cols="70" placeholder="리뷰를 입력해주세요"/>
						</div>
					</div>
					<div>
						<button type="button" onClick="checkForm();">등록하기</button>
						<button type="reset">초기화</button>
					</div>
				</div>
		</section>
	</article>


<jsp:include page="../main/footer.jsp"/>
</body>
</html>
<%}%>