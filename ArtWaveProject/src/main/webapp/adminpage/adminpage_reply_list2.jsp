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
	white-space: nowrap; /* 한 줄로 표시 */
	overflow: hidden; /* 넘치는 부분 숨기기 */
	text-overflow: ellipsis; /* 생략 표시 (...) */
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

input[type="submit"] {
	background-color: #3b84d1;
	color: white;
	border: none;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	border-radius: 4px;
	transition: background 0.3s;
}

input[type="submit"]:hover {
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
function replyInsert(no) {
	location.href="../adminpage/reply_insert.do?no="+no
}
function replyInfo(gi, no) {
	$.ajax({
		type:'post',
		url:'../admin/replyInfo.do',
		data:{'gi':gi},
		success:function(result){
			let json=JSON.parse(result)
			console.log(json)
			let html=''
			html+='<tr>'
			html+='<th width="20%">제목</th>'
			html+='<td width="80%">'+json.subject+'</td>'
			html+='</tr>'
			html+='<tr>'
			html+='<th width="20%">내용</th>'
			html+='<td width="80%"><pre style="background:white;">'+json.content+'</pre></td>'
			html+='</tr>'
			html+='<tr>'
			html+='<td colspan="2" style="text-align:right"><button type="button" onclick="boardDelete('+json.no+', '+no+')">삭제</button></td>'
			html+='</tr>'
			$('#boardTbody'+gi).html(html)
			$('#boardTr'+gi).css('display', '')
		}
	})
}
function boardDelete(no, rno) {
	$.ajax({
		type:'post',
		url:'../admin/replyDelete.do',
		data:{
			'no':no,
			'rno':rno
		},
		success:function(){
			location.href="../adminpage/reply_list.do"
		}
	})
}
</script>
</head>
<body>
	<div class="container" style="margin: 0px;">
		<h3 style="margin-bottom: 50px; margin-top: 0px!important;"><b>1:1 문의</b></h3>
		<table class="table">
			<thead>
				<tr>
					<th width="10%" class="text-center">번호</th>
					<th width="45%" class="text-center">제목</th>
					<th width="15%" class="text-center">작성자</th>
					<th width="20%" class="text-center">작성일</th>
					<th width="10%" class="text-center">답변상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${arList}" varStatus="i">
					<tr>
						<td>${count-i.index}</td>
						<td style="text-align: left;">
							<a href="../admin/detail.do?no=${vo.no }" class="title">${vo.subject}</a>
						</td>
						<td>${vo.name}</td>
						<td>${vo.dbday}</td>
						<td>
							<c:choose>
								<c:when test="${vo.group_step>0}">
									<span style="color: orange;">답변</span>
								</c:when>
								<c:when test="${vo.isreply == 0}">
									<span style="color: blue; cursor: pointer;" onclick="replyInsert(${vo.no})">답변대기</span>
								</c:when>
								<c:when test="${vo.isreply != 0}">
									<span style="color: green; cursor: pointer;" onclick="replyInfo(${vo.group_id}, ${vo.no })">답변완료</span>
								</c:when>
							</c:choose>
						</td>
					</tr>
					<tr id="boardTr${vo.group_id }" style="display: none;">
						<td colspan="5">
							<table class="table">
								<tbody id="boardTbody${vo.group_id}"></tbody>
							</table>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="row text-center">
		<table>
			<tr class="text-center">
				<td class="text-center">
					<c:choose>
						<c:when test="${curpage > 1}">
							<a href="../adminpage/reply_list.do?page=${curpage - 1}" class="btn btn-sm btn-success">이전</a>
						</c:when>
						<c:otherwise>
							<a href="#" class="btn btn-sm btn-success disabled">이전</a>
						</c:otherwise>
					</c:choose>
					<span class="mx-2">${curpage} page / ${totalpage} pages</span>
					<c:choose>
						<c:when test="${curpage < totalpage}">
							<a href="../adminpage/reply_list.do?page=${curpage + 1}" class="btn btn-sm btn-info">다음</a>
						</c:when>
						<c:otherwise>
							<a href="#" class="btn btn-sm btn-info disabled">다음</a>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>