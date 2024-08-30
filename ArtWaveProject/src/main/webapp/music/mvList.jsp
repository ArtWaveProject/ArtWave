<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.mvList {
	cursor: pointer;
}

.mv td iframe {
	width: 100%;
	height: 100%;
	position: absolute;
}

.mv td {
	position: relative;
	width: 100%;
	padding-bottom: 56.25%;
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
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		let page = -1
		$('.mvList').click(function() {
			let data = $(this).attr('data-id')
			$('.mv').css('display', 'none')
			if (page != data) {
				page = data
				data = '#mv' + data
				$(data).css('display', '')
			} else {
				page = -1
			}
		})
	})
</script>
</head>
<body>
	<div class="container" style="margin-top: 150px;">
		<div class="row" style="padding: 50px; border: 10px solid #ddd;border-radius:30px; ">
			<table class="table" style="background: white; border-radius: 20px;">
				<tr>
					<th width="5%" class="text-center">��ȣ</th>
					<th width="15%" class="text-center"></th>
					<th width="40%" class="text-center">����</th>
					<th width="33%" class="text-center">��Ƽ��Ʈ</th>
					<th width="7%" class="text-center">���ƿ�</th>
				</tr>
				<c:forEach var="vo" items="${mvList}" varStatus="i">
					<tr class="mvList" data-id="${i.index}">
						<td width="5%" class="text-center">${(curPage-1)*20+i.index+1}</td>
						<td width="15%" class="text-center">
							<img src="${vo.thum}">
						</td>
						<td width="40%">${vo.title}</td>
						<td width="33%" class="text-center">${vo.aname }</td>
						<td width="7%" class="text-center">${vo.likecount }</td>
					</tr>
					<tr id="mv${i.index }" style="display: none; margin-bottom: 30px;" class="mv">
						<td colspan="5">
							<iframe src="https://www.youtube.com/embed/${vo.urlmp4 }" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
						</td>
					</tr>
				</c:forEach>
			</table>
			<form action="../music/musicMvList.do" method="post" style="display: grid;">
				<div class="row text-center">
					<nav>
						<ul class="page page-lg">
							<c:if test="${startPage > 1}">
								<li>
									<a href="../music/musicMvList.do?page=${startPage-1}&ss=${ss}">&laquo; Previous</a>
								</li>
							</c:if>
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<li ${i == curPage ? "class='current'" : ""}>
									<a href="../music/musicMvList.do?page=${i}&ss=${ss}">${i}</a>
								</li>
							</c:forEach>
							<c:if test="${endPage < totalPage}">
								<li>
									<a href="../music/musicMvList.do?page=${endPage+1}&ss=${ss}">Next &raquo;</a>
								</li>
							</c:if>
						</ul>
					</nav>
					</div>
					<div class="text-center">
					<input type="text" size="15" id="ss" name="ss">
					<input type="submit" value="�˻�">
				</div>
			</form>
		</div>
	</div>
</body>
</html>