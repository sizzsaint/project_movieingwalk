<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<%
	if (session.getAttribute("mvId") == null) {
	response.sendRedirect("/loginMember");
} else {
	Object object = session.getAttribute("mvId");
	String u_id = (String) object;
%>
<html>
<head>
<meta charset="EUC-KR">
<title>MovieingWalk</title>

<!-- css설정 -->
<link href="../css/collectionWrite.css" rel ="stylesheet" type="text/css">


<!-- jQuery Framework 참조하기 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<!-- 사용자 스크립트 블록 -->
<script type="text/javascript">
//글자수제한 정규식
	var titleJ = /^.{2,20}$/;     //모든 글자 2글자이상 20글자 이하
	var memoJ = /^.{5,80}$/;        //모든글자 5자이상 80글자 이하
	
	//팝업창 열기
	function movieSelectPopup() {
		window.open("/collection/CollectionWrite_SelectMovie", "a",
				"width=1000, height=600, left=100, top=50");
	}

	function setSelectedValue(selectedList, midxList) {
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

	function formCheck() {
		if ($("#title").val() == '') {
			alert("컬렉션 제목을 입력해주세요.");
			return false;
		}
		
		if (titleJ.test($("#title").val())){
			console.log('true');
			$('#title').text('');
		}else{
			alert("제목을 1글자이상 20글자 이하로 입력해주세요.");
			return false;
		}
		
		if ($("#memo").val() == '') {
			alert("컬렉션 소개를 입력해주세요.");
			return false;
		}
		
		if(memoJ.test($("#memo").val())){
			console.log('true');
			$('#memo').text('');
		}else{
			alert("소개를 5글자이상 80글자이하로 입력해주세요.")
			return false;
		}
		
		if ($("#selectedList li").length != 10) {
			alert("영화의 갯수는 10개를 선택해주세요.");
			return false;
		}
		document.getElementById("collectionForm").submit();
	}
</script>
</head>
<body>

	<jsp:include page="../main/header.jsp" />
		<h2>컬렉션 만들기</h2>
	<section id="writeSection">
		<sf:form action="CollectionWriteOk" id="collectionForm"
			modelAttribute="collectionBean">
			<table id="writeform">
				<tr>
					<td>제목</td>
					<td><sf:input path="col_title" id="title" size="30"
							maxlegth="20" /> <sf:errors path="col_title" /></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><sf:input type="text" path="u_id" id="u_id"
							value="<%=u_id%>" readonly="true" /> <sf:errors path="u_id" /></td>
				</tr>
				<tr>
					<td>컬렉션 소개</td>
					<td><sf:textarea path="col_memo" id="memo" size="100"
							cssStyle="width:400px;height:150px" maxlength="80" /> <sf:errors
							path="col_memo" /></td>
				</tr>
				<tr>
					<td colspan="2">컬렉션에 추가될 영화는 10개 입니다.
						<div id="buttonDiv1">
							<input type="button" id="Sbutton" onclick="movieSelectPopup();" value="영화 추가하기"/>
						</div>
					</td>
				</tr>
			</table>
			<p>
			<h3 style='color: white'>선택한 영화</h3>
			</p>
			<div id="selected">
				<ol id="selectedList"></ol>

				<sf:input type="hidden" path="col_midx1" class="m_idx" />
				<sf:input type="hidden" path="col_midx2" class="m_idx" />
				<sf:input type="hidden" path="col_midx3" class="m_idx" />
				<sf:input type="hidden" path="col_midx4" class="m_idx" />
				<sf:input type="hidden" path="col_midx5" class="m_idx" />
				<sf:input type="hidden" path="col_midx6" class="m_idx" />
				<sf:input type="hidden" path="col_midx7" class="m_idx" />
				<sf:input type="hidden" path="col_midx8" class="m_idx" />
				<sf:input type="hidden" path="col_midx9" class="m_idx" />
				<sf:input type="hidden" path="col_midx10" class="m_idx" />
			</div>
			<div id="buttonDiv2">
			<input type="button" id="colbutton" value="컬렉션 등록" onClick="formCheck();"/>
			<input type="button" id="colRbutton" onClick="window.location.reload();" value="초기화"/>
			</div>
		</sf:form>
	</section>
</body>
<%
	}
%>
</html>