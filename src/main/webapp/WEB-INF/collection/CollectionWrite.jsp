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

<!-- css���� -->
<link href="../css/collectionWrite.css" rel ="stylesheet" type="text/css">


<!-- jQuery Framework �����ϱ� -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<!-- ����� ��ũ��Ʈ ��� -->
<script type="text/javascript">
//���ڼ����� ���Խ�
	var titleJ = /^.{1,20}$/     //��� ���� 1�����̻� 20���� ����
	var memoJ = /^.{5,80}$/        //������ 5���̻� 80���� ����
	
	//�˾�â ����
	function movieSelectPopup() {
		window.open("/collection/CollectionWrite_SelectMovie", "a",
				"width=900, height=600, left=100, top=50");
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
			alert("�÷��� ������ �Է����ּ���.");
			return false;
		}
		if (titleJ.test($("#title").val())){
			alert("1�����̻� 20���� ���Ϸ� �Է����ּ���.");
			return false;
		}
		if ($("#memo").val() == '') {
			alert("�÷��� �Ұ��� �Է����ּ���.");
			return false;
		}
		if(memoJ.test($("memo").val())){
			alrer("5�����̻� 80�������Ϸ� �Է����ּ���.")
			return false;
		}
		if ($("#selectedList li").length != 10) {
			alert("��ȭ�� ������ 10���� �������ּ���.");
			return false;
		}
		document.getElementById("collectionForm").submit();
	}
</script>
</head>
<body>

	<jsp:include page="../main/header.jsp" />
		<h2>�÷��� �����</h2>
	<section id="writeSection">
		<sf:form action="CollectionWriteOk" id="collectionForm"
			modelAttribute="collectionBean">
			<table id="writeform">
				<tr>
					<td>����</td>
					<td><sf:input path="col_title" id="title" size="20"
							maxlegth="20" /> <sf:errors path="col_title" /></td>
				</tr>
				<tr>
					<td>�ۼ���</td>
					<td><sf:input type="text" path="u_id" id="u_id"
							value="<%=u_id%>" readonly="true" /> <sf:errors path="u_id" /></td>
				</tr>
				<tr>
					<td>�÷��� �Ұ�</td>
					<td><sf:textarea path="col_memo" id="memo" size="80"
							cssStyle="width:350px;height:100px" maxlength="80" /> <sf:errors
							path="col_memo" /></td>
				</tr>
				<tr>
					<td colspan="2">�÷��ǿ� �߰��� ��ȭ�� 10�� �Դϴ�.
						<p>
							<input type="button" value="��ȭ �߰��ϱ�"
								onclick="movieSelectPopup();" />
						</p>
					</td>
				</tr>
			</table>
			<p>
			<h3 style='color: white'>������ ��ȭ</h3>
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
			<div>
			<input type="button" value="�÷��� ���" onClick="formCheck();" />
			<input type="reset" value="�ʱ�ȭ" />
			</div>
		</sf:form>
	</section>
</body>
<%
	}
%>
</html>