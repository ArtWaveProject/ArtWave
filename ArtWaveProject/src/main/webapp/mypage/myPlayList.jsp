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
						data-target="#myModal">플레이리스트 추가</span></td>
				</tr>
				<tr>
					<th width="10%" class="text-center">번호</th>
					<th width="40%" class="text-center">이름</th>
					<th width="20%" class="text-center">생성일</th>
					<th width="20%" class="text-center">노래개수</th>
					<th width="10%" class="text-center"></th>
				</tr>
				<c:forEach var="vo" items="${list}" varStatus="i">
					<tr style="vertical-align: middle;">
						<td class="text-center">${i.index+1}</td>
						<td style="text-align: left;"><a href="../mypage/myPlayListDetail.do?plno=${vo.plno}">${vo.plname}</a></td>
						<td class="text-center">${vo.dbday}</td>
						<td class="text-cemter">${vo.count}</td>
						<td class="text-cemter inline">
							<a href="../mypage/myPlayListDelete.do?plno=${vo.plno}" class="btn">삭제</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
			<h2 class="text-center">플레이리스트 생성</h2>
				<div class="modal-body">
					<form action="../mypage/myPlayListMake.do" method="post">
						<input type="text" name="plname"> <input type="submit" value="생성">
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