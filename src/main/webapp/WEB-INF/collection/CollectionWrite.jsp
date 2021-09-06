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
 //팝업창 열기
function movieSelectPopup() { 
	window.open("/collection/CollectionWrite_SelectMovie", "a", "width=900, height=600, left=100, top=50"); 
	}
 
function setSelectedValue(selectedList, midxList){
	$("#selectedList").append(selectedList);
	document.getElementById("col_midx1").value = midxList[0];
	document.getElementById("col_midx2").value = midxList[1];
	document.getElementById("col_midx3").value = midxList[2];
	document.getElementById("col_midx4").value = midxList[3];
	document.getElementById("col_midx5").value = midxList[4];
	document.getElementById("col_midx6").value = midxList[5];
	document.getElementById("col_midx7").value = midxList[6];
	document.getElementById("col_midx8").value = midxList[7];
	document.getElementById("col_midx9").value = midxList[8];
	document.getElementById("col_midx10").value = midxList[9];

}

function formCheck(){
	if($("#title").val() == ''){
		alert("컬렉션 제목을 입력해주세요.");
     	return false;
	}
	if($("#memo").val() == ''){
		alert("컬렉션 소개를 입력해주세요.");
     	return false;
	}
	if($("#selectedList li").length!=10){
		alert("영화의 갯수는 10개를 선택해주세요.");
		return false;
	}
	form.submit();
}

</script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>

<h2 style='color:white'>컬렉션 만들기</h2>
<sf:form action="CollectionWriteOk" modelAttribute="collectionBean">
<table border="1" style='color:white'>
<tr><td>제목</td><td><sf:input path="col_title" id="title" size="20" maxlegth="20"/>
<sf:errors path="col_title"/>
</td></tr>
<tr><td>작성자</td><td><sf:input type="text" path="u_id" id="u_id" value="<%= u_id %>" readonly="true" />
<sf:errors path="u_id"/></td></tr>
<tr><td>컬렉션 소개</td><td><sf:textarea path="col_memo" id="memo" size="80" cssStyle="width:350px;height:100px" maxlength="80"/>
<sf:errors  path="col_memo"/></td></tr>
<tr><td colspan="2">컬렉션에 추가될 영화는 10개 입니다.
<p><input type="button" value="영화 추가하기" onclick="movieSelectPopup();" /></p></td></tr>
</table>
<p><h3 style='color:white'>선택한 영화</h3></p>
<div id="selected">
<ol id="selectedList"></ol>

<sf:input type="hidden" path="col_midx1" class="m_idx"/>
<sf:input type="hidden" path="col_midx2" class="m_idx"/>
<sf:input type="hidden" path="col_midx3" class="m_idx"/>
<sf:input type="hidden" path="col_midx4" class="m_idx"/>
<sf:input type="hidden" path="col_midx5" class="m_idx"/>
<sf:input type="hidden" path="col_midx6" class="m_idx"/>
<sf:input type="hidden" path="col_midx7" class="m_idx"/>
<sf:input type="hidden" path="col_midx8" class="m_idx"/>
<sf:input type="hidden" path="col_midx9" class="m_idx"/>
<sf:input type="hidden" path="col_midx10" class="m_idx"/>
</div>
<input type="button" value="컬렉션 등록" onClick="formCheck();"/>
<input type="reset" value="초기화"/>
</sf:form>
</body>
<%}%>
</html>