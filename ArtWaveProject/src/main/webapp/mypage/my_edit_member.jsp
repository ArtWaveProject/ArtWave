<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript"
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	$(function() {
		$('#postBtn').click(function() {
			new daum.Postcode({
				oncomplete : function(data) {
					$('#post1').val(data.zonecode)
					$('#addr1').val(data.address)
				}
			}).open()
		})
	})
</script>
<style type="text/css">
body {
    font-family: Arial, sans-serif;
}

.joinRow {
	width: 800px 
}

.black {
	color: black;
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
	height: 650px;
	background-color: aliceblue;
	border-radius: 30px;
/* 	margin-left: 30px; 
 */}

.listChart {
	background: white;
	padding: 35px;
	border-radius: 30px;
	height: 590px;
}

.listChart tr td {
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

.listTitle {
	font-size: 13px;
}

.listTitle a {
	color: black;
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

.table tr:last-child td {
    border-bottom: none; /* 맨 아래 선 제거 */
}

.table th {
    background-color: #f9f9f9; /* 헤더 배경색 */
    font-weight: bold; /* 텍스트 두껍게 */
}

.btnposi {
    display: block;
    width: 120px;
    height: 35px;
    padding: 5px;
    font-size: 16px;
    color: #ffffff; /* 텍스트 색상 */
    border: none; /* 테두리 제거 */
    border-radius: 5px; /* 둥근 모서리 */
}

.btnposi.btn-info {
    background-color: #17a2b8; /* 저장 버튼 배경색 */
}

.btnposi.btn-warning {
    background-color: #ffc107; /* 취소 버튼 배경색 */
}

.button-container {
    display: flex;
    justify-content: center;
    gap: 10px; /* 버튼 간의 간격 */
    margin-top: 20px; /* 버튼과 테이블 사이의 간격 */
}

.table th, .table td {
    padding: 10px;
    text-align: left; /* 모든 셀을 왼쪽 정렬 */
}

.table td input,
.table td select {
    border: none; /* 입력 필드와 선택 박스의 테두리 제거 */
    padding: 8px;
    box-sizing: border-box; /* 패딩을 포함하여 전체 너비를 설정 */
}

input[type="text"]{
 font-size: 14px;

}

input[type="date"]{
 font-size: 14px;

}

</style>
</head>
<body>
	<div class="listBody">
		<main class="listChart">
			<div class="row joinRow">
				<form method="post" action="../mypage/my_edit_member_ok.do" name="frm">
					<table class="table">
						<tr>
							<th class="text-left" width="10%" style="padding-left: 15px;">ID</th>
							<td width="40%" class="inline"><input type="text" size=20 class="input-sm" name="id" id="id" value="${sessionScope.id}" readonly></td>
							<th class="text-left" width="10%" style="padding-left: 15px;">닉네임</th>
							<td width="40%" class="inline"><input type="text" size=20 class="input-sm" name="nickname" id="nickname" value="${sessionScope.nickname}"></td>
						</tr>
						<tr>
							<th class="text-left" width="10%" style="padding-left: 15px;">이름</th>
							<td width="40%"><input type="text" size=20 class="input-sm" name="name" id="name" value="${sessionScope.name}"></td>
							<th class="text-left" width="10%" style="padding-left: 15px;">성별</th>
							<td width="40%" class="inline">
								<input type="radio" name="sex" value="남자" ${sessionScope.sex == '남자' ? 'checked' : ''}> 남자 
								<input type="radio" name="sex" value="여자" ${sessionScope.sex == '여자' ? 'checked' : ''}> 여자
							</td>
						</tr>
						<tr>
							<th class="text-left" width="10%" style="padding-left: 15px;">생년월일</th>
							<td width="40%"><input type="date" size=30 class="input-sm" name="birthday" id="day" value="${sessionScope.bday}"></td>
						</tr>
						<tr>
							<th class="text-left" width="15%" style="padding-left: 15px;">이메일</th>
							<td colspan="3" width="85%" style="padding-left: 15px;"><input type="text" size=70 class="input-sm" name="email" id="email" value="${sessionScope.email}"></td>
						</tr>
						<tr>
							<th class="text-left" width="15%" style="padding-left: 15px;">우편번호</th>
							<td colspan="3" width="85%" style="padding-left: 15px;" class="inline">
								<input type="text" size=15 class="input-sm" name="post" readonly id="post1" value="${sessionScope.post}">
								<input type="button" value="우편번호검색" class="btn btn-sm btn-primary" id="postBtn">
							</td>
						</tr>
						<tr>
							<th class="text-left" width="15%" style="padding-left: 15px;">주소</th>
							<td colspan="3" width="85%" style="padding-left: 15px;"><input type="text" size=70 class="input-sm" name="addr1" readonly id="addr1" value="${sessionScope.addr1}"></td>
						</tr>
						<tr>
							<th class="text-left" width="15%" style="padding-left: 15px;">상세주소</th>
							<td colspan="3" width="85%" style="padding-left: 15px;"><input type="text" size=70 class="input-sm" name="addr2" value="${sessionScope.addr2}"></td>
						</tr>
						<tr>
							<th class="text-left" width="15%" style="padding-left: 15px;">전화번호</th>
							<td width="85%" colspan="3" class="inline">
								<select class="input-sm" name="phone1">
									<option>02</option>
									<option>010</option>
									<option>011</option>
								</select>
								<input type="text" size=20 class="input-sm" name="phone2" id="phone2" value="${sessionScope.phone}">
							</td>
						</tr>
						<tr>
							<th class="text-left" width="15%" style="padding-left: 15px;">비밀번호 확인</th>
							<td colspan="3" width="85%" style="padding-left: 15px;" class="inline">
								<input type="password" size=20 class="input-sm" name="pwd" id="pwd">
							</td>
						</tr>
						<tr>
							<td colspan="4" class="text-center">
								<div class="button-container">
									<input type="submit" value="저장" class="btnposi btn-sm btn-info" id="joinBtn">
									<input type="button" value="취소" class="btnposi btn-sm btn-warning" onclick="window.location.href='../mypage/mypage_main.do'">
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</main>
	</div>
</body>
</html>