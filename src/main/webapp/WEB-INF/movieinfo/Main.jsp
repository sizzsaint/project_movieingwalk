<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MovieiengWalk</title>



<!-- jQuery Framework �����ϱ� -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
  
<!-- ����� ��ũ��Ʈ ��� -->
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
	    					
	    			//����� ���� ���� ��� ����
	    			reviewtable +="<td>";
	    			reviewtable += "<a href='/movieinfo/MovieDetail?m_idx="+m_idx+"'>"+"<img src='"+poster_host+poster_img+"' style=width:170px;' alt=''/></a>";
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

 $(function(){

		const genreList = ['18,80', '10749', '35', '28', '9648', '14', '99', '16']
		const genreNameList = ['crimeThriller','romance', 'comedy', 'action', 'mystery', 'fantasy', 'documentary','animation']	
		
		for(i=0;i<genreList.length;i++){
			
			var genreIndex = genreList[i];
			var genreName = genreNameList[i];
			
			genretable = "<tr id="+genreName+">";
			
		$.ajax({
				
	  		url: "https://api.themoviedb.org/3/discover/movie?api_key=9348030243f7b212abdd53ccc8412e24&language=ko&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_genres="+genreIndex+"&with_watch_monetization_types=flatrate",
	  		type: "get",
	  		dataType: "json",
	  		cache : false,
	  		timeout : 30000,
	  		success: function(json) {
	  				var result = json.results;
	  				
	  				for(var j=0; j<5;j++){
	  			    var poster_host = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2";
	    			var title = result[j].title;
	    			var poster_img = result[j].poster_path;
	    					
	    			//����� ���� ���� ��� ����
	    			genretable +="<td>";
	    			genretable += "<img src='" +poster_host + poster_img+ "' style=width:170px;' alt=''/>";
	    			genretable +="<p>"+title+"</p>";
	    			genretable += "</td>";
	  				}
	  				genretable += "</tr>"
	  			
	    			$("#genretable").html(genretable);
	  		},
	   		 error : function(xhr, textStatus, errorThrown){
	    		$("div").html("<div>"+textStatus+" (HTTP-"+xhr.status+" / "+errorThrown +")</div>");
	    		}
		});

 }
 });

 $(function(){
		//�帣�� ��Ӵٿ�

			//1depth�� ���� change �̺�Ʈ ����
			$("#category1").on("change", function(){
				//���õ� �׸��� �����ϴ� ���� ī�װ� �������� URL����
				
			});
	 });
</script>

</head>
<body>
<h3>�ֱ� ���䰡 ��ϵ� ��ȭ</h3>
<table id="newReviewlist"></table>
<hr>
<h3>�帣�� ��ȭ����</h3>
<div class="exec">

				<!-- �� �ܰ躰 dropdown�� ǥ���� span�±� -->
				<span id="category1">
				
				<!-- 1depth ī�װ� -->
				<select name="category1" id="category1">
					<option value="����/������" data-target="#crimeThriller">����/������</option>
					<option value="�θǽ�" data-target="#romance">�θǽ�</option>
					<option value="�ڹ̵�" data-target="#comedy">�ڹ̵�</option>
					<option value="�׼�" data-target="#action">�׼�</option>
					<option value="�̽��͸�" data-target="#mystery">�̽��͸�</option>
					<option value="��Ÿ��" data-target="#fantasy">��Ÿ��</option>
					<option value="��ť���͸�" data-target="#documentary">��ť���͸�</option>
					<option value="�ִϸ��̼�" data-target="#animation">�ִϸ��̼�</option>
				</select>
				<table id="genretable">
				
				</table>

				</span>
		</div>
		<!-- ���� ���� ����� ǥ���� �� -->
		<table class="console"></table>
		
</body>
</html>