<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="URF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style type="text/css">
.caret {
	display: none !important;
}
.listImg {
	width: 45px !important;
	height: 45px !important;
}

.iconImg {
	width: 20px !important;
	height: 20px !important;
}

.listBody {
	padding: 30px;
	width: 900px;
	background-color: aliceblue;
	border-radius: 30px;

}
body {
    margin-left: 180px;
    padding: 0;
}
.listChart {
	background: white;
	padding: 5px;
	vertical-align: middle !important;
}

.listChart tr td {
	padding: 0px;
	height: 50px;
	margin: 0px;
}

.row .row {
	width: 800px;
}

.page {
	padding: 0;
	margin: 20px 0;
	display: flex;
	justify-content: center;
	font-family: Arial, sans-serif;
}

.page {
	list-style: none;
	padding: 0;
	margin: 20px auto; /* ���� �Ʒ� ������ �߰��ϰ� �ڵ����� ��� ���� */
	display: flex;
	justify-content: center; /* �׺���̼� �׸��� ����� ���� */
	font-family: Arial, sans-serif;
}

.page li {
	margin: 0 3px; /* �׺���̼� �׸� ���� ���� */
}

.page a {
	text-decoration: none;
	color: #0197A3; /* ��ũ ���� */
	padding: 8px 12px;
	border: 1px solid #0197A3; /* ��ũ �׵θ� ���� */
	border-radius: 4px; /* �ձ� �𼭸� */
	transition: background-color 0.3s, color 0.3s; /* �ε巯�� ���� ��ȭ */
}

.page a:hover {
	background-color: #0197A3; /* ȣ�� �� ���� */
	color: #fff; /* ȣ�� �� �ؽ�Ʈ ���� */
}

.page .current a {
	background-color: #0197A3; /* ���� ������ ���� */
	color: #fff; /* ���� ������ �ؽ�Ʈ ���� */
	border: 1px solid #0197A3; /* ���� ������ �׵θ� ���� */
	pointer-events: none; /* ���� ������ Ŭ�� ���� */
}

.page .current a:hover {
	background-color: #0197A3; /* ���� ������ ȣ�� �� ���� */
	color: #fff; /* ���� ������ ȣ�� �� �ؽ�Ʈ ���� */
}

.page li:first-child a {
	border-radius: 4px 0 0 4px; /* ���� �� �𼭸� �ձ۰� */
}

.page li:last-child a {
	border-radius: 0 4px 4px 0; /* ������ �� �𼭸� �ձ۰� */
}

.listTitle {
	font-size: 13px;
}

.listTitle a {
	color: black;
}

.listArtist {
	font-size: 11px;
}



.bono {
	border: none !important;
}
</style>
</head>
<body>
	<div class="container" style="margin-top: 10px;">
		<div class=" listBody">
			<table class="table listChart">
				<tr>
					<td class="text-right" colspan="6"><span style="height: 30px; width:130px; display: block; border: 1px solid black; padding:5px; cursor: pointer;" class="playlistBtn" data-toggle="modal"
						data-target="#myModal">�÷��̸���Ʈ �߰�</span></td>
				</tr>
				<tr>
					<th width="10%" class="text-center">��ȣ</th>
					<th width="40%" class="text-center">�̸�</th>
					<th width="20%" class="text-center">������</th>
					<th width="20%" class="text-center">�뷡����</th>
					<th width="10%" class="text-center"></th>
				</tr>
				<c:forEach var="vo" items="${list}" varStatus="i">
					<tr style="vertical-align: middle;">
						<td class="text-center">${i.index+1}</td>
						<td style="text-align: left;"><a href="../mypage/myPlayListDetail.do?plno=${vo.plno}">${vo.plname}</a></td>
						<td class="text-center">${vo.dbday}</td>
						<td class="text-cemter">${vo.count}</td>
						<td class="text-cemter inline">
							<a href="../mypage/myPlayListDelete.do?plno=${vo.plno}" class="btn">����</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
			<h2 class="text-center">�÷��̸���Ʈ ����</h2>
				<div class="modal-body">
					<form action="../mypage/myPlayListMake.do" method="post">
						<input type="text" name="plname"> <input type="submit" value="����">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
</body>
</html>