<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
	color: #0197A3; /* 링크 색상 */
	padding: 8px 12px;
	border: 1px solid #0197A3; /* 링크 테두리 색상 */
	border-radius: 4px; /* 둥근 모서리 */
	transition: background-color 0.3s, color 0.3s; /* 부드러운 색상 변화 */
}

.page a:hover {
	background-color: #0197A3; /* 호버 시 배경색 */
	color: #fff; /* 호버 시 텍스트 색상 */
}

.page .current a {
	background-color: #0197A3; /* 현재 페이지 배경색 */
	color: #fff; /* 현재 페이지 텍스트 색상 */
	border: 1px solid #0197A3; /* 현재 페이지 테두리 색상 */
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

.listTitle {
	font-size: 13px;
}

.listTitle a {
	color: black;
}

.listArtist {
	font-size: 11px;
}

.genreTable {
	border: transparent;
	margin-top: 15px;
	margin-bottom: -1px;
}

.genreTable td {
	padding: 0px;
	vertical-align: middle;
}

.genreTable td a {
	text-align: center;
	color: #aaa;
	display: block;
	width: 100%;
	border: 2px solid #aaa;
	border-bottom: 2px solid #777;
	border-right: none;
	border-radius: 7px 7px 0px 0px;
	height: 35px;
	vertical-align: middle;
	background: white;
	font-size: 13px;
	padding-top: 6px;
}

.genreTable td:first-child a {
	
}

.genreTable td:last-child a {
	width: 100%;
	border: 2px solid #aaa;
}

.genreTable .active a {
	border-left: 2px solid #777 !important;
	border-top: 2px solid #777 !important;
	border-right: 2px solid #777 !important;
	border-bottom: 2px solid #777 !important;
	background-color: white;
}

.genreTable .anext a {
	border-left: none !important;
}

.genreTable td {
	padding: 0px !important;
	border: none;
}

.bono {
	border: none !important;
}

#likeBtn {
	border: transparent;
	background: none;
	width: 40px;
	height: 35px;
}

#middle {
	vertical-align: middle !important;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<div class="container" style="margin-top: 10px;">
		<div class=" listBody">
			<table class="table genreTable">
				<tr>
					<td width="11%" class="typeBtn ${type==0?'active':''}"><a href="../mypage/myPayment.do?type=0">전체</a> <input type="hidden"
						value="${sessionScope.id}" id="id"></td>
					<td width="11%" class="typeBtn ${type==1?'active':type==0?'anext':''}"><a href="../mypage/myPayment.do?type=1">음악</a></td>
					<td width="11%" class="typeBtn ${type==2?'active':type==1?'anext':''}"><a href="../mypage/myPayment.do?type=2">도서</a></td>
					<td width="11%" class="typeBtn ${type==3?'active':type==2?'anext':''}"><a href="../mypage/myPayment.do?type=3">앨범</a></td>

				</tr>
			</table>
			<table class="table listChart" id="middle">
				<tr>
					<th width="10%" class="text-center">번호</th>
					<th width="15%" class="text-center"></th>
					<th width="40%" class="text-center">제목</th>
					<th width="20%" class="text-center">분류</th>
				</tr>
				<c:forEach var="vo" items="${list}" varStatus="i">
					<tr style="vertical-align: middle; height: 50px;">
						<td width="10%" class="text-center">${i.index+1}</td>
						<td width="15%" class="text-center"><a href="${vo.type==1?'../music/musicDetail.do?mno=':vo.type==2?'../book/detail.do?bno=':'../alstore/alstoreDetail.do?ano='}${vo.gno}"> <img src="${vo.type==1?vo.mvo.poster:vo.type==2?vo.book.cover:vo.avo.aphoto}" class="listImg">
						</a></td>
						<td width="40%"><span class="listTitle"><a href="${vo.type==1?'../music/musicDetail.do?mno=':vo.type==2?'../book/detail.do?bno=':'../alstore/alstoreDetail.do?ano='}${vo.gno}">${vo.ptitle}</a></span></td>
						<td width="20%"><span class="listArtist">${vo.typeDetail }</span></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>