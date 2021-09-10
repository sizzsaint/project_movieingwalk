<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<%
if(session.getAttribute("mvId")==null){
   response.sendRedirect("/loginMember");
}else{
	Object object = session.getAttribute("mvId");
	String u_id = (String)object;
%> 
<html>
<head>
<meta charset="EUC-KR">
<title>MovieingWalk</title>

<!-- css설정 -->
<link href="../css/collectionWrite.css" rel ="stylesheet" type="text/css">

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
		for (i = 0; i < midxList.length; i++) {
			var m_idx = midxList[i];

			$.ajax({
				async : false,
				url: "https://api.themoviedb.org/3/movie/" + m_idx + "?api_key=9348030243f7b212abdd53ccc8412e24&language=ko",
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
					col_list += "<a href='/movieinfo/MovieDetail?m_idx=" + m_idx + "'>" + "<img src='" + poster_host + poster_img + "' style='width:100px;' alt=''/></a>";
					col_list += "<p style='color:white width:170; height:81;'>" + title + "</p>";
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
<jsp:include page="../main/header.jsp"/>

<h2 style='color:white'>컬렉션 상세보기</h2>
<input type="hidden" value="<c:out value="${collectionBean.col_idx}"/>"/>
<table border="1" style='color:white'>
<tr><td>제목</td><td><c:out value="${collectionBean.col_title}"/>
</td></tr>
<tr><td>작성자</td><td><c:out value="${collectionBean.u_id}"/>
<c:set value="${collectionBean.u_id}" var="u_id"/>
</td></tr>
<tr><td>컬렉션 소개</td><td>
<c:out value="${collectionBean.col_memo}"/>
</td></tr>

<tr><td colspan="2">컬렉션
<ol id="newcolList"></ol>
</td></tr>
</table>
<input type="button" value="좋아요" onClick="check123();">
<button onclick="javascript:history.back();">돌아가기</button>


</body>
<%}%>
</html>