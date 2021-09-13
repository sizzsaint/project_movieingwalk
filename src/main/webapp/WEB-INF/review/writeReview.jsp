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
<link href="../css/reviewWrite.css" rel ="stylesheet" type="text/css">
<link href="./../../css/r_star.css" rel="stylesheet" type="text/css">
<title>리뷰쓰기</title>

<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
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
		viewWindow: {
	 }
	 },
	}

	var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));

	chart.draw(data, options);
 
 }

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
	    			details += "<img src='"+poster_host+poster_img+"' style=height:350px;' alt=''>";
	    			details +="</div>"
	    			<!--타이틀&개봉일-->
	    			details +="<div class='info_area'>";
	    			details +="<h2 class='title_area' style='text-align:left;'>"+title+"</h2>";
	    			details += "상영일 :  "+date;
	    			<!--기본정보-->
	    			details += "<p>상영시간 :  "+runtime+"분 </p>";
	    			details +="장르  :  ";
	    			for(i=0;i<genres.length;i++){
	    				var genre = genres[i].name;
	    				details += genre+" ";
	    			}
	    			if(countries.length>1){
	    			details += "</p><p>국가 :   "+country+"</p>";
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
 
 //라디오 값 가져오기
  $(function(){
	  
	  
	  
	  $("input[name='r_star']:radio").change(function () {
	        //라디오 버튼 값을 가져온다.
	        var r_star = this.value;  
			$("#r_star").val(r_star);
	});
  });
 
 //유효성 검사
 function checkForm(){
		if($("#r_memo").val() == ''){
			alert("영화의 별점을 선택해주세요.");
	     	return false;
		}
		
		if($("#r_spoiler").is(":checked")){
			$("#spoCheck").val("Y");
			alert("스포일러가 포함되었습니다");
		}else{
			$("#spoCheck").val("N");
			alert("스포일러가 포함되지 않았습니다.");
		}
		
		if($("#r_memo").val() == ''){
			alert("리뷰 내용을 입력해주세요");
	     	return false;
		}
		if($("#r_memo").val().length < 5){
			alert("리뷰 내용은 5자 이상 입력해주세요.");;
            return false;
        }
		
		document.getElementById("reviewForm").submit();
	 }
 </script>
</head>
<body>

<jsp:include page="../main/header.jsp"/>

	<!-- 	int r_idx, m_idx, r_star, r_likes, r_hits, r_comments;
	String u_id, r_date, r_memo, r_spoiler; -->


<h2>리뷰 작성하기</h2>
<div id="details"></div>
<div id="chart_div"></div>

<div id="writeSection">
	<sf:form action="writeReviewOK"  id="reviewForm" method="post" modelAttribute="reviewBean">
	<sf:input type="hidden" id="u_id" path="u_id" value="<%=u_id%>"/>
	<sf:input type="hidden" id="m_idx" path ="m_idx" value="${m_idx}"/>
<h3><%=u_id%>님의 평점</h3>

	<div class="star-rating space-x-4 mx-auto">
	<input type="radio" id="5-stars" name="r_star" value="5" v-model="ratings" /> <label for="5-stars" class="star pr-4">★</label>
	<input type="radio" id="4-stars" name="r_star" value="4" v-model="ratings" /> <label for="4-stars" class="star">★</label>
	<input type="radio" id="3-stars" name="r_star" value="3" v-model="ratings" /> <label for="3-stars" class="star">★</label>
	<input type="radio" id="2-stars" name="r_star" value="2" v-model="ratings" /> <label for="2-stars" class="star">★</label>
	<input type="radio" id="1-star" class="r_star" value="1" v-model="ratings" /> <label for="1-star" class="star">★</label>
	<sf:input type="hidden" id="r_star" path="r_star"/>
	</div>
					
<div id="spoDiv">
<h4>스포일러<input id="r_spoiler" type="checkbox"/></h4>
<sf:input type="hidden" id="spoCheck" path="r_spoiler"/>
</div>
<div id="textbox">
<sf:textarea  name="r_memo" id="r_memo" path="r_memo" rows="10" cols="70" placeholder="리뷰를 입력해주세요"/>
</div>
</div>
<div id="rButtonDiv">
<input type="button" id="submitButton" onClick="checkForm();" value="등록하기"/>
<input id="resetButton" type="reset" value="초기화"/>
</div>
</sf:form>



<jsp:include page="../main/footer.jsp"/>
</body>
</html>
<%}%>