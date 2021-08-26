<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- jQuery Framework 참조하기 -->
		<script type="text/javascript" src="../js/jquery-1.11.0.min.js"></script>

<!-- 사용자 스크립트 블록 -->
<script type="text/javascript">
$(function(){

	$.ajax({
		url:"http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.xml?key=f5eef3421c602c6cb7ea224104795888&movieCd=20124079",
		type:"get",
		dataType:"xml",
		cache:false,
		timeout:30000,
		success:function(xml){
			//alert(xml)	;	
			alert($(xml).find("movieNm").text());
			var title = $(xml).find("movieNm").text();
			var date = $(xml).find("prdtYear").text();
			
			//alert(title)	;	alert(date)	;	
			
		//추출된 데이터를 화면에 출력하기 위한 HTML 요소
		var div = $("<div>");
		var p1 = $("<p>").html(title);
		var p2 = $("<p>").html(date);
		
		//메소드 체인을 사용한 동적 요소의 결합
		div.append(p1).append(p2);
		
		//화면에 표시 
		$("#result").append(div);
			}
		
	})
})
</script>
</head>
<body>
<h1 class="title"></h1>

<div class="console" id="result">

</div>


</body>
</html>