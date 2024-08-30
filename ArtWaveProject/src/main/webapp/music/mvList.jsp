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
	margin: 20px auto; /* 위와 아래 여백을 추가하고 자동으로 가운데 정렬 */
	display: flex;
	justify-content: center; /* 네비게이션 항목을 가운데로 정렬 */
	font-family: Arial, sans-serif;
}

.page li {
	margin: 0 3px; /* 네비게이션 항목 간의 여백 */
}

.page a {
	text-decoration: none;
	color: #9BA8B5; /* 링크 색상 */
	padding: 8px 12px;
	border: 1px solid #9BA8B5; /* 링크 테두리 색상 */
	border-radius: 4px; /* 둥근 모서리 */
	transition: background-color 0.3s, color 0.3s; /* 부드러운 색상 변화 */
}

.page a:hover {
	background-color: #9BA8B5; /* 호버 시 배경색 */
	color: #fff; /* 호버 시 텍스트 색상 */
}

.page .current a {
	background-color: #9BA8B5; /* 현재 페이지 배경색 */
	color: #fff; /* 현재 페이지 텍스트 색상 */
	border: 1px solid #9BA8B5; /* 현재 페이지 테두리 색상 */
	pointer-events: none; /* 현재 페이지 클릭 방지 */
}

.page .current a:hover {
	background-color: #0197A3; /* 현재 페이지 호버 시 배경색 */
	color: #fff; /* 현재 페이지 호버 시 텍스트 색상 */
}

.page li:first-child a {
	border-radius: 4px 0 0 4px; /* 왼쪽 끝 모서리 둥글게 */
}

.page li:last-child a {
	border-radius: 0 4px 4px 0; /* 오른쪽 끝 모서리 둥글게 */
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
					<th width="5%" class="text-center">번호</th>
					<th width="15%" class="text-center"></th>
					<th width="40%" class="text-center">제목</th>
					<th width="33%" class="text-center">아티스트</th>
					<th width="7%" class="text-center">좋아요</th>
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
					<input type="submit" value="검색">
				</div>
			</form>
		</div>
	</div>
</body>
</html>