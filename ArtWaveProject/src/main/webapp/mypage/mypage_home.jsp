<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>

<script type="text/javascript">

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
	height: 600px;
	background-color: aliceblue;
	border-radius: 30px;
/* 	margin-left: 30px; 
 */}

.listChart {
	background: white;
	padding: 35px;
	border-radius: 30px;
	height: 540px;
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
    margin: 20px auto; /* 중앙 정렬 */
    padding: 5px;
    font-size: 16px;
    color: #ffffff; /* 텍스트 색상 */
    background-color: #6C86D6; /* 배경색 */
    border: none; /* 테두리 제거 */
    border-radius: 5px; /* 둥근 모서리 */
}

.inline{
 font-size: 15px;

}

</style>
<script type="text/javascript">

</script>
</head>
<body>
	<div class="listBody">
		<main class="listChart">
			<div class="row joinRow">

				<form method="post" action="../mypage/my_edit_member.do" name="frm">
					<table class="table">
						<tr>
							<th class="text-left" width="10%" style="padding-left: 15px;">ID</th>
							<td width="40%" class="inline">${sessionScope.id}
							<th class="text-left" width="10%" style="padding-left: 15px;">닉네임</th>
							<td width="40%" class="inline">${sessionScope.nickname}</td>
							</td>
						</tr>

						<tr>
							<th class="text-left" width="10%" style="padding-left: 15px;">이름</th>
							<td width="40%">${sessionScope.name}</td>
							<th class="text-left" width="10%" style="padding-left: 15px;">성별</th>
							<td width="40%" class="inline">${sessionScope.sex}</td>
						</tr>
						<tr>
							<th class="text-left" width="10%" style="padding-left: 15px;">생년월일</th>
							<td width="40%">${sessionScope.bday}</td>
							<th class="text-left" width="10%" style="padding-left: 15px;">가입일</th>
							<td width="40%" class="inline">${sessionScope.regdate}</td>
						</tr>
						<tr>
							<th class="text-left" width="15%" style="padding-left: 15px;">이메일</th>
							<td colspan="3" width="85%">${sessionScope.email}</td>
						</tr>
						<tr>
							<th class="text-left" width="15%" style="padding-left: 15px;">우편번호</th>
							<td colspan="3" width="85%" class="inline">${sessionScope.post}</td>
						</tr>
						<tr>
							<th class="text-left" width="15%" style="padding-left: 15px;">주소</th>
							<td colspan="3" width="85%">${sessionScope.addr1}</td>
						</tr>
						<tr>
							<th class="text-left" width="15%" style="padding-left: 15px;">상세주소</th>
							<td colspan="3" width="85%">${sessionScope.addr2}</td>
						</tr>
						<tr>
							<th class="text-left" width="15%" style="padding-left: 15px;">전화번호</th>
							<td colspan="3" width="85%" class="inline">${sessionScope.phone}</td>
						</tr>
						
						<tr>
							<td colspan="4" >
								<input class="btnposi btn-sm" type="submit" value="수정하기" id="checkBtn" >
							</td>
						</tr>
					</table>
				</form>
			</div>
		</main>
	</div>

</body>
</html>