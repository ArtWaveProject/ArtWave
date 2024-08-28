<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
a {
	color: black;
}

#row {
	width: 1200px;
	margin: 0px auto;
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

<title>Insert title here</title>
</head>
<body>
	<div class="container" style="margin-top: 150px; background: #9BA8B5; padding: 50px; border-radius: 50px;">
		<h3 style="margin-bottom: 40px;">앨범 목록</h3>
		<div id="row">
			<div class="row" style="display: flex; flex-wrap: wrap; background: white; border-radius: 30px;">
				<c:forEach var="vo" items="${list}">
					<div class="col-sm-2" style="padding: 10px;">
						<a href="../music/artistDetail.do?ano=${vo.ano}">
							<img src="${vo.poster }">
						</a>
					</div>
					<div class="col-sm-2" style="padding: 10px;">
						<table class="table">
							<tr>
								<td>
									<a href="../music/artistDetail.do?ano=${vo.ano}">${vo.aname }</a>
								</td>
							</tr>
							<tr>
								<td>${vo.type }</td>
							</tr>
							<tr>
								<td>${vo.nation }</td>
							</tr>
						</table>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="row text-center">
			<nav>
				<ul class="page page-lg">
					<c:if test="${startPage > 1}">
						<li>
							<a href="../music/artistList.do?page=${startPage-1}&ss=${ss}&genre=${genre}">&laquo; Previous</a>
						</li>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<li ${i == curPage ? "class='current'" : ""}>
							<a href="../music/artistList.do?page=${i}&ss=${ss}&genre=${genre}">${i}</a>
						</li>
					</c:forEach>
					<c:if test="${endPage < totalPage}">
						<li>
							<a href="../music/artistList.do?page=${endPage+1}&ss=${ss}&genre=${genre}">Next &raquo;</a>
						</li>
					</c:if>
				</ul>
			</nav>
		</div>
</body>
</html>