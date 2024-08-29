<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
body {
	margin-left: 180px;
	padding: 0;
}

.container2 {
	width: 80%; /* 원하는 너비로 조정 */
	margin: 0 auto; /* 수평 중앙 정렬 */
}

.black {
	color: black;
	text-align: center;
}

.caret {
	display: none !important;
}
</style>
</head>
<body>
	<div class=" container2 text-center">
		<div class="row" style="margin-top: 150px;">
			<div class="col-lg-2">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">${sessionScope.id}님로그인</h3>
					</div>
					<ul class="list-group">
						<li class="list-group-item"><a href="../mypage/mypage_main.do">마이페이지이동</a></li>
					</ul>
				</div>
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">회원 정보</h3>
					</div>
					<ul class="list-group">
						<li><a href="../adminpage/member_list.do">회원 리스트</a></li>
					</ul>
				</div>
				<div class="panel panel-warning">
					<div class="panel-heading">
						<h3 class="panel-title sinav ">결제관리</h3>
					</div>
					<ul class="list-group">
						<li><a href="">결제목록</a></li>
						<li><a href="../admin/adminReserve.do">예약관리</a></li>
					</ul>
				</div>
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title sinav">고객센터</h3>
					</div>
					<ul class="list-group">
						<li><a href="../adminpage/reply_list.do">1:1문의</a></li>
						<li><a href="../adminpage/notice_list.do">공지사항</a></li>
						<li><a href=""></a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-10">
				<h2 class="black" style="text-align: center; font-weight: bold; font-size: 30px; margin: -30px 0 40px -260px;">${title}</h2>
				<jsp:include page="${admin_jsp}"></jsp:include>
			</div>
		</div>
	</div>
</body>
</html>