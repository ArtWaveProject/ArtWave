<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
	color: #9BA8B5; /* ��ũ ���� */
	padding: 8px 12px;
	border: 1px solid #9BA8B5; /* ��ũ �׵θ� ���� */
	border-radius: 4px; /* �ձ� �𼭸� */
	transition: background-color 0.3s, color 0.3s; /* �ε巯�� ���� ��ȭ */
}

.page a:hover {
	background-color: #9BA8B5; /* ȣ�� �� ���� */
	color: #fff; /* ȣ�� �� �ؽ�Ʈ ���� */
}

.page .current a {
	background-color: #9BA8B5; /* ���� ������ ���� */
	color: #fff; /* ���� ������ �ؽ�Ʈ ���� */
	border: 1px solid #9BA8B5; /* ���� ������ �׵θ� ���� */
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
</style>
</head>
<body>
	<div class="container" style="margin-top: 150px;">
		<div class="row">
			<c:forEach var="vo" items="${list}">
				<div class="col-sm-2">
					<img src="${vo.poster }">
				</div>
				<div class="col-sm-2">
					<span>${vo.aname }<br></span> <span>${vo.type }<br></span> <span>${vo.nation }</span>
				</div>
			</c:forEach>
		</div>
		<div style="height: 20px;"></div>
	</div>
</body>
</html>