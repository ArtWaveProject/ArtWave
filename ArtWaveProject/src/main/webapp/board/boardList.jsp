<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.genreTable {
	border: transparent;
	margin-top: 15px;
	margin-bottom: -1px;
	width: 300px;
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

.genreTable td:nth-child(4) a {
	width: 100%;
	border: 2px solid #aaa;
	border-bottom: 2px solid #777;
}

.genreTable .active a {
	border-left: 2px solid #777 !important;
	border-top: 2px solid #777 !important;
	border-right: 2px solid #777 !important;
	border-bottom: none !important;
}

.genreTable .anext a {
	border-left: none !important;
}

.genreTable td {
	padding: 0px;
}
</style>
<script type="text/javascript" src=""></script>
</head>
<body>
	<div class="container" style="margin-top: 130px;">
		<div class="row">
			<h4 class="text-center" style="margin-bottom: 25px;">자유게시판</h4>
			<table class="table" style="margin-bottom: 50px; border: transparent;">
				<tr>
					<td width="72%" style="text-align: right;">
						<select name="option">
							<option value="0">검색 옵션 선택</option>
							<option value="1">닉네임</option>
							<option value="2">제목</option>
							<option value="3">내용</option>
						</select>
						<input type="text" size="25" name="ss" class="input input-sm">
						<input type="button" value="검색">
					</td>
				</tr>
			</table>
			<table class="table genreTable">
				<tr>
					<td width="25%" class="genreBtn ${type==1?'active':''}">
						<a href="../music/musicList.do?genre=1">전체</a>
					</td>
					<td width="25%" class="genreBtn ${type==2?'active':type==1?'anext':''}">
						<a href="../music/musicList.do?genre=2">영화</a>
					</td>
					<td width="25%" class="genreBtn ${type==3?'active':type==2?'anext':''}">
						<a href="../music/musicList.do?genre=3">책</a>
					</td>
					<td width="25%" class="genreBtn ${type==4?'active':type==3?'anext':''}">
						<a href="../music/musicList.do?genre=4">음악</a>
					</td>
				</tr>
			</table>
			<table class="table">
				<tr>

				</tr>
				<tr>
					<th width="5%" class="text-center">번호</th>
					<th width="50%" class="text-center">제목</th>
					<th width="15%" class="text-center">닉네임</th>
					<th width="20%" class="text-center">작성일</th>
					<th width="10%" class="text-center">조회수</th>
				</tr>
				<tr height="500px">
					<td width="5%" class="text-center">번호</td>
					<td width="50%">제목</td>
					<td width="15%" class="text-center">닉네임</td>
					<td width="20%" class="text-center">작성일</td>
					<td width="10%" class="text-center">조회수</td>
				</tr>
				<tr>
					<td colspan="5" style="text-align: right;">
						<a href="../board/boardInsert.do" class="btn">글 작성</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>