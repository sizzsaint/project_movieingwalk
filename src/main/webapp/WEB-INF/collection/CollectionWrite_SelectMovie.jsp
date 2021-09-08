<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>영화 선택하기</title>

<!-- css설정 -->
<link href="../css/collectionWrite_Select.css" rel ="stylesheet" type="text/css">

<!-- jQuery Framework 참조하기 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
  
<!-- 사용자 스크립트 블록 -->
 <script type="text/javascript">
 //영화 검색
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
	  				
	  				//검색 결과 동적요소 생성
	  				searchResult += "<div class='result'>";
	  				if(poster_img != null){
		  				searchResult += "<img onClick='selectMovie(" +m_idx+ ")'src='" +poster_host + poster_img+ "' style='width:170px;' alt='/'>";
	  				}else{
	  					searchResult += "<img onClick='selectMovie(" +m_idx+ ")' src='../imgdata/img_ready.png' width='170' height='255' alt='/'>";
	  				}
	  				searchResult += "<p>"+title+"</p></div>";
	  			})
	  			$("#console").html(searchResult);
	  		},
	  		error : function(xhr, textStatus, errorThrown){
	    		$("div").html("<div>"+textStatus+" (HTTP-"+xhr.status+" / "+errorThrown +")</div>");
	    		}
 });
 };	
//영화 선택	 
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
    				selected += "<img src='"+poster_host+poster_img+"' style='width:100px;' alt='/'>";
    			}else{
    				selected += "<img src='../imgdata/img_ready.png' width='100px' height='150px' alt='/'>";
    			}
    			selected += "<p style='color:red;'>"+title+"</p>"
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
<!-- 글검색 하기  -->
<div id="search">
  <input type="text" id="searchStr" size="20" maxlength="20">
  <input type="button" value="검색" onClick="searchMovie();">
</div>
<div id="console">
</div>
<div id="selected">
<ol id='selectedList' ></ol>
<input type="button" value="선택완료" onClick="sendSelected();">
</div>
</body>
</html>