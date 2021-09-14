<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
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
<meta charset="EUC-KR">
<title>��ȭ �����ϱ�</title>

<!-- css���� -->
<link href="../css/collectionWrite_Select.css" rel ="stylesheet" type="text/css">

<!-- jQuery Framework �����ϱ� -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
  
<!-- ����� ��ũ��Ʈ ��� -->
 <script type="text/javascript">
 //��ȭ �˻�
 function searchMovie(){
	 
	 var searchStr = document.getElementById('searchStr').value;
	 var urlRow = "https://api.themoviedb.org/3/search/movie?api_key=9348030243f7b212abdd53ccc8412e24&language=ko&query=" +searchStr+ "&include_adult=true";
	 var url = encodeURI(urlRow);
	var searchResult = "";
	 $.ajax({
	  		url: url,
	  		type: "get",
	  		dataType: "json",
	  		cache : false,
	  		timeout : 30000,
	  		success: function(json) {
	  			var poster_host = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2";
	  			var result = json.results;
	  			
	  			$(result).each(function(key,value){
	  				var poster_img = value.poster_path;
	  				var title = value.title;
	  				var m_idx = value.id;
	  				
	  				//�˻� ��� ������� ����
	  				searchResult += "<div class='result'>";
	  				if(poster_img != null){
		  				searchResult += "<img onClick='selectMovie(" +m_idx+ ")'src='" +poster_host + poster_img+ "' style='width:170px; height:255px;' alt='/'>";
	  				}else{
	  					searchResult += "<img onClick='selectMovie(" +m_idx+ ")' src='../imgdata/img_ready.PNG' style='width:170; height:255;' alt='/'>";
	  				}
	  				searchResult += "<p style='text-align:center; width=:170px; margin-top:5px; margin-bottom:5px;'>"+title+"</p></div>";
	  			})
	  			$("#console").html(searchResult);
	  		},
	  		error : function(xhr, textStatus, errorThrown){
	    		$("div").html("<div>"+textStatus+" (HTTP-"+xhr.status+" / "+errorThrown +")</div>");
	    		}
 });
 };	
//��ȭ ����	 
function selectMovie(m_idx){
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
    			
    			var selected = "<li class='card'>";
    			if(poster_img != null){
    				selected += "<img src='"+poster_host+poster_img+"' style='width:110px; height:150px;' alt='/'>";
    			}else{
    				selected += "<img src='../imgdata/img_ready.PNG' style='width:110px; height:150px;' alt='/'>";
    			}
    			selected += "<p style='color:white; text-align:center; width:110px;'>"+title+"</p>"
    			selected += "<p class='m_idx'>"+m_idx+"</p>";
    			$("#selectedList").append(selected);
	  		},
	  		error : function(xhr, textStatus, errorThrown){
	    		$("div").html("<div>"+textStatus+" (HTTP-"+xhr.status+" / "+errorThrown +")</div>");
	    	}	
});
}

function sendSelected(){
	var selectedList = $("#selectedList").html();
	var listSize=$("#selectedList li").length;
	var midxList =[];
	for(i=0;i<listSize;i++){
		var m_idx = $("#selectedList li").eq(i).find(".m_idx").text();
		midxList.push(m_idx);
	}
	opener.setSelectedValue(selectedList, midxList);
	window.close();
}

</script>


</head>
<body>
<!-- �۰˻� �ϱ�  -->
<div id="search">
  <input type="text" id="searchStr" size="20" maxlength="20">
  <input type="button" value="�˻�" onClick="searchMovie();">
</div>
<div id="console">
<h3>�˻� ���</h3>
</div>
<div id="selected">
<h3 style="color:white;">������ ��ȭ</h3>
<ol id='selectedList' ></ol>
</div>
<div id="buttonDiv">
<input type="button" id="sendButton" value="���ÿϷ�" onClick="sendSelected();">
</div>
</body>
</html>
<%}%>