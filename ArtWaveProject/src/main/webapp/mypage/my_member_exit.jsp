<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
    font-family: Arial, sans-serif;
}

.joinRow {
	width: 800px;
}

.listBody {
	padding: 30px;
	width: 900px;
	background-color: aliceblue;
	border-radius: 30px;
}

.listChart {
	background: white;
	padding: 35px;
	border-radius: 30px;
}

.table {
	width: 100%;
	border-collapse: collapse;
}

.table tr {
	border-bottom: 1px solid #ddd;
}

.table td {
	padding: 10px;
	text-align: left;
}

.table input[type="password"] {
	width: 100%;
	border: 1px solid #ddd; /* 테두리 색상 */
	padding: 10px;
	border-radius: 5px;
	box-sizing: border-box; /* 패딩 포함하여 전체 너비 설정 */
	font-size: 14px;
}

.table input[type="submit"], 
.table input[type="button"] {
	display: inline-block;
	width: 80px;
	height: 35px;
	font-size: 16px;
	color: #ffffff; /* 텍스트 색상 */
	border: none; /* 테두리 제거 */
	border-radius: 5px; /* 둥근 모서리 */
	cursor: pointer; /* 커서 포인터 */
	transition: background-color 0.3s, transform 0.3s; /* 부드러운 색상 변화와 크기 변화 */
	text-align: center; /* 텍스트 중앙 정렬 */
	line-height: 24px; /* 텍스트 수직 중앙 정렬 */
	margin-right: 10px; /* 버튼 간 여백 */
}

.table input[type="submit"]:hover, 
.table input[type="button"]:hover {
	background-color: #e67e22; /* 호버 시 배경색 */
	transform: scale(1.05); /* 호버 시 크기 확대 */
}

.table input[type="submit"]:active, 
.table input[type="button"]:active {
	transform: scale(0.95); /* 클릭 시 크기 축소 */
}

.text-center {
	text-align: center;
}

</style>
<script type="text/javascript">
$(function(){
	$('#pwdBtn').click(function(){
		let pwdjsp=$('#pwdjsp').val()
		if(pwdjsp.trim()==="") // 입력이 안된 상태
		{
			alert("비밀번호를 입력해 주세요")
			$('#pwdjsp').focus()
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
				<form method="post" action="../mypage/my_member_exit_ok.do">
					<table class="table">
						<tr>
							<td colspan="2">
								<p style="text-align: center; font-weight: bold; font-size: 18px;">비밀번호 확인</p>
								<input type="password" name="pwdjsp" id="pwdjsp" size="20">
							</td>
						</tr>
						<tr>
							<td colspan="2" class="text-center">
								<input type="submit" value="확인" class="btn-warning" id="pwdBtn" name="pwdBtn"> 
								<input type="button" value="취소" class="btn-warning" onclick="window.location.href='../mypage/mypage_main.do'">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</main>
	</div>
</body>
</html>