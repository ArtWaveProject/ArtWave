<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	height: 280px;
	background-color: aliceblue;
	border-radius: 30px;
/* 	margin-left: 30px; 
 */}

.listChart {
	background: white;
	padding: 35px;
	border-radius: 30px;
	height: 220px;
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
input[type="password"] {
	width: 100%;
	border: none; /* 테두리 제거 */
	padding: 8px;
	box-sizing: border-box; /* 패딩 포함하여 전체 너비 설정 */
	border-radius: 5px; /* 둥근 모서리 */
	text-align: left; /* 왼쪽 정렬 */
}

input[type="button"] {
	display: inline-block;
	width: 100px;
	height: 37px;
	font-size: 12px;
	color: #ffffff; /* 텍스트 색상 */
	border: none; /* 테두리 제거 */
	border-radius: 5px; /* 둥근 모서리 */
	cursor: pointer; /* 커서 포인터 */
	transition: background-color 0.3s, transform 0.3s; /* 부드러운 색상 변화와 크기 변화 */
	text-align: center; /* 텍스트 중앙 정렬 */
	line-height: 24px; /* 텍스트 수직 중앙 정렬 */
}

input[type="submit"] {
	display: inline-block;
	width: 100px;
	height: 37px;
	font-size: 12px;
	color: #ffffff; /* 텍스트 색상 */
	border: none; /* 테두리 제거 */
	border-radius: 5px; /* 둥근 모서리 */
	cursor: pointer; /* 커서 포인터 */
	transition: background-color 0.3s, transform 0.3s; /* 부드러운 색상 변화와 크기 변화 */
	text-align: center; /* 텍스트 중앙 정렬 */
	line-height: 24px; /* 텍스트 수직 중앙 정렬 */
}

</style>
<script type="text/javascript">
$(function(){
	$('#pwdBtn').click(function(){
		let oldpwd=$('#oldpwd').val()
		let newpwd=$('#newpwd').val()
		if(oldpwd.trim()==="") // 입력이 안된 상태
		{
			alert("비밀번호를 입력해 주세요")
			$('#oldpwd').focus()
			event.preventDefault();
			return
		}else if(newpwd.trim()===""){
			alert("사용할 비밀번호를 입력해 주세요")
			$('#newpwd').focus()
			event.preventDefault();
			return
		}else{

			return
		}
	})
	
})

</script>
</head>
<body>
	<div class="listBody">
		<main class="listChart">
			<div class="row joinRow">
				<form method="post" action="../mypage/my_change_pwd_ok.do">
					<table class="table">
						<tr>
							<th width=20%>현재 비밀번호</th>
							<td width=80%><input type=password name="oldpwd" id="oldpwd" size="20"
								class="input-sm"></td>
						</tr>
						<tr>
							<th width=20%>사용할 비밀번호</th>
							<td width=80%><input type=password name="newpwd" id="newpwd" size="20"
								class="input-sm"></td>
						</tr>
						<tr>
							<td colspan="2" class="text-center inline"><input
								type=submit class="btn-sm btn-info" value="비밀번호 변경"
								id="pwdBtn"
								> 
								<input 
								type=button class="btn-sm btn-primary" value="취소"
								onclick="window.location.href='../mypage/mypage_main.do'"></td>
						</tr>
					</table>
				</form>
			</div>
		</main>
	</div>
</body>
</html>