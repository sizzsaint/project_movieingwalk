<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html>
<%
if(session.getAttribute("mvId")==null){
   response.sendRedirect("/loginMember");
}else{
	Object object = session.getAttribute("mvId");
	String u_id = (String)object;
%> 
<head>
<meta charset="EUC-KR">
<title>MovieingWalk</title>
<!-- css설정 -->
<link href="./../../css/collectionDetail.css" rel ="stylesheet" type="text/css">

<!-- jQuery Framework 참조하기 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>

<!-- 사용자 스크립트 블록 -->
 <script type="text/javascript">

 $(function () {

		var midxList = [];
		midxList[1] = ${ collectionBean.col_midx1 };
		midxList[2] = ${ collectionBean.col_midx2 };
		midxList[3] = ${ collectionBean.col_midx3 };
		midxList[4] = ${ collectionBean.col_midx4 };
		midxList[5] = ${ collectionBean.col_midx5 };
		midxList[6] = ${ collectionBean.col_midx6 };
		midxList[7] = ${ collectionBean.col_midx7 };
		midxList[8] = ${ collectionBean.col_midx8 };
		midxList[9] = ${ collectionBean.col_midx9 };
		midxList[10] = ${ collectionBean.col_midx10 };

		var col_list;
		for (i = 1; i < midxList.length; i++) {
			var m_idx = midxList[i];

			$.ajax({
				async : true,
				url: "https://api.themoviedb.org/3/movie/"+m_idx+"?api_key=9348030243f7b212abdd53ccc8412e24&language=ko",
				type: "get",
				dataType: "json",
				cache: false,
				timeout: 30000,
				success: function (json) {

					var poster_host = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2";
					var title = json.title;
					var poster_img = json.poster_path;
					var m_idx = json.id;

					//출력을 위한 동적 요소 생성
					col_list += "<td>";
					col_list += "<a href='/movieinfo/MovieDetail?m_idx="+m_idx+"'>"+"<img src='"+poster_host+poster_img+"' style='width:100px;' alt=''/></a>";
					col_list += "<p id='movie_name'>" + title + "</p>";
					col_list += "</td>";

					$("#newcolList").html(col_list);
				},
				error: function (xhr, textStatus, errorThrown) {
					$("div").html("<div>" + textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")</div>");
				}
			});
		}
 });

 var checkLike = ${checkLikes};
 var col_idx = ${col_idx};
 var u_id = '${u_id}';
 
 function check123(){
	 
	 if(checkLike == "1"){
		 alert("이미 좋아요를 누른 리뷰입니다.");
		 return false;
	 }else{
		 location.href="collikeUpdate?col_idx="+col_idx+"&u_id="+u_id;
	 }
	 
 }

 </script>

</head>
<body>

	<jsp:include page="../main/header.jsp" />
	
<div class="collection_item">
<h2 id="collection_detail">컬렉션 상세보기</h2>
<div class="collection_text">

<span>제목</span>
<h5><c:out value="${collectionBean.col_title}"/></h5>
<span>작성자</span>
<h5><c:out value="${collectionBean.u_id}"/></h5>
<span>컬렉션소개</span>
<h5><c:out value="${collectionBean.col_memo}"/></h5>
<span>해당 컬렉션에 포함된 영화</span>
<ol id="newcolList"></ol>
<div id="col_btn">
<button id="col_btn" onclick="check123();">좋아요</button>
<input type="hidden" value="${collectionBean.col_idx}"/>
<button id="col_btn" onclick="javascript:history.back();">돌아가기</button>
</div>
</div>
</div>
<jsp:include page="../main/footer.jsp"/>

</body>
<%}%>
</html>