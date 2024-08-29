<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	font-family: Arial, sans-serif;
}

.header {
	text-align: center;
	margin-bottom: 20px;
}

.header h4 {
	margin: 0;
	font-size: 30px;
	color: #333;
}

.search-bar {
	display: flex;
	justify-content: flex-end;
	margin-bottom: 20px;
}

.search-bar select, .search-bar input[type="text"], .search-bar input[type="button"]
	{
	margin-left: 5px;
	padding: 8px;
	border: 1px solid #ddd;
	border-radius: 4px;
}

.search-bar input[type="button"] {
	background-color: #3b84d1;
	color: white;
	cursor: pointer;
	width: 60px;
}

.search-bar input[type="button"]:hover {
	background-color: #0056b3;
}

.genreTable {
	width: 100%;
	margin-bottom: 0px;
	border-collapse: collapse;
}

.genreTable td {
	padding: 0;
	vertical-align: middle;
}

.genreTable a {
	display: block;
	padding: 10px;
	text-align: center;
	color: #333;
	text-decoration: none;
	border: 2px solid #ddd;
	border-radius: 4px 4px 0 0;
	background: #fff;
	font-size: 14px;
	transition: background 0.3s, border-color 0.3s;
}

.genreTable a:hover {
	background: #3b84d1;
	color: #fff;
	border-color: #3b84d1;
}

.genreTable .active a {
	background: #3b84d1;
	color: #fff;
	border-color: #3b84d1;
}

.genreTable .anext a {
	border-left: none;
}

.table {
	width: 100%;
	margin-bottom: 50px;
	border-collapse: collapse;
	background: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.table th, .table td {
	padding: 12px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}

.table th {
	background: #f4f4f4;
}

.table tr:hover {
	background: #f1f1f1;
}

.table .title {
	color: #3b84d1;
	text-decoration: none;
}

.table .title:hover {
	text-decoration: underline;
}

.button-container {
	text-align: right;
	margin-top: 20px;
}

.button-container input[type="button"] {
	background-color: #3b84d1;
	color: white;
	border: none;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	border-radius: 4px;
	transition: background 0.3s;
}

.button-container input[type="button"]:hover {
	background-color: #0056b3;
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
	color: #3b84d1; /* 링크 색상 */
	padding: 8px 12px;
	border: 1px solid #3b84d1; /* 링크 테두리 색상 */
	border-radius: 4px; /* 둥근 모서리 */
	transition: background-color 0.3s, color 0.3s; /* 부드러운 색상 변화 */
}

.page a:hover {
	background-color: #3b84d1; /* 호버 시 배경색 */
	color: #fff; /* 호버 시 텍스트 색상 */
}

.page .current a {
	background-color: #3b84d1; /* 현재 페이지 배경색 */
	color: #fff; /* 현재 페이지 텍스트 색상 */
	border: 1px solid #3b84d1; /* 현재 페이지 테두리 색상 */
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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function check(id) {
		if (id === '')
			alert('로그인이 필요합니다')
		else {
			location.href = "../noticeboard/boardInsert.do"
		}
	}
</script>
</head>
<body>
	<div class="container" style="margin-top: 200px;">
		<div class="header">
			<h4>공지</h4>
		</div>
		<table class="genreTable">
			<tr>
				<td width="25%" class="genreBtn ${type==''?'active':''}">
					<a href="../noticeboard/boardList.do">전체</a>
				</td>
				<td width="25%" class="genreBtn ${type==5?'active':type==''?'anext':''}">
					<a href="../noticeboard/boardList.do?type=5">영화</a>
				</td>
				<td width="25%" class="genreBtn ${type==6?'active':type=='5'?'anext':''}">
					<a href="../noticeboard/boardList.do?type=6">도서</a>
				</td>
				<td width="25%" class="genreBtn ${type==7?'active':type==6?'anext':''}">
					<a href="../noticeboard/boardList.do?type=7">음악</a>
				</td>
			</tr>
		</table>
		<table class="table">
			<thead>
				<tr>
					<th width="5%" class="text-center">번호</th>
					<th width="50%" class="text-center">제목</th>
					<th width="15%" class="text-center">작성자</th>
					<th width="20%" class="text-center">작성일</th>
					<th width="10%" class="text-center">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${bList}" varStatus="i">
					<tr>
						<td>${count-i.index}</td>
						<td>
							<a href="../noticeboard/boardDetail.do?fbno=${vo.fbno}" class="title">[${vo.typeDetail}] ${vo.fbsubject}</a>
						</td>
						<td>${vo.nick}</td>
						<td>${vo.dbday}</td>
						<td>${vo.fbhit}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="button-container">
			<c:if test="${sessionScope.admin==1}">
				<input type="button" id="writeBtn" value="글 작성" onclick="check('${sessionScope.id}')">
			</c:if>
		</div>
	</div>
	<div class="row text-center">
		<nav>
			<ul class="page page-lg">
				<c:if test="${startPage > 1}">
					<li>
						<a href="../music/albumList.do?page=${startPage-1}&ss=${ss}&genre=${genre}">&laquo; Previous</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<li ${i == curPage ? "class='current'" : ""}>
						<a href="../music/albumList.do?page=${i}&ss=${ss}&genre=${genre}">${i}</a>
					</li>
				</c:forEach>
				<c:if test="${endPage < totalPage}">
					<li>
						<a href="../music/albumList.do?page=${endPage+1}&ss=${ss}&genre=${genre}">Next &raquo;</a>
					</li>
				</c:if>
			</ul>
		</nav>
	</div>
</body>
</html>