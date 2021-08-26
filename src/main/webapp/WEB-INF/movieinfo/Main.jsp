<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- jQuery Framework �����ϱ� -->
		<script type="text/javascript" src="../js/jquery-1.11.0.min.js"></script>

<!-- ����� ��ũ��Ʈ ��� -->
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
			
		//����� �����͸� ȭ�鿡 ����ϱ� ���� HTML ���
		var div = $("<div>");
		var p1 = $("<p>").html(title);
		var p2 = $("<p>").html(date);
		
		//�޼ҵ� ü���� ����� ���� ����� ����
		div.append(p1).append(p2);
		
		//ȭ�鿡 ǥ�� 
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