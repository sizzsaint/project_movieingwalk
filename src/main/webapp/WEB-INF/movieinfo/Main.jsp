<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MovieiengWalk</title>

<script src="../js/html5shiv.js"></script>

<!-- jQuery Framework �����ϱ� -->
		<script type="text/javascript" src="../js/jquery-1.11.0.min.js"></script>

<!-- ����� ��ũ��Ʈ ��� -->
<script type="text/javascript">
$(function(){
		$.ajax({
	  		url: "https://api.themoviedb.org/3/search/movie?api_key=9348030243f7b212abdd53ccc8412e24&language=ko&query=%EA%B4%91%ED%95%B4",
	  		type: "get",
	  		dataType: "json",
	  		cache : false,
	  		timeout : 30000,
	  		success: function(json) {
	  			    var poster_host = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2";
	    			var page = json.page;
	    			var result = json.results;
	    			var str="";
	    			
	    			$(result).each(function(key, value){
	    				var title = value.original_title;
	    				var id = value.id;
	    				var poster_img = value.poster_path;
		
	    			//����� ���� ���� ��� ����
	    			
	    			str +="<div>";
	    			str +="<p>"+title+"</p>";
	    			str +="<p>"+id+"</p>";
	    			str += "<img src='"+poster_host+poster_img+"' style=width:200px;' alt=''/>";
	    			str += "</div>";
	    			    
	    			});
	    			$("#review_order").html(str);

	    			
	  		  },
	   		 error : function(xhr, textStatus, errorThrown){
	    		$("div").html("<div>"+textStatus+" (HTTP-"+xhr.status+" / "+errorThrown +")</div>");
	    		}
	});
});

</script>
</head>
<body>
<h3>���䰡 ���� ��ȭ</h3>

<div id="review_order">
</div>
<h3>�帣�� ��ȭ����</h3>

<div id="genre_movie">
</div>
</body>
</html>