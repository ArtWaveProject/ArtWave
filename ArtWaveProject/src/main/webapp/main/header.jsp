<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Details Page</title>
<style type="text/css">
/* 기본 스타일 설정 */
nav {
	display: flex;
	align-items: center;
}

/* 드롭다운 메뉴 기본 스타일 */
.dropdown {
	position: relative;
	display: inline-block;
	margin: 0 10px; /* 드롭다운 메뉴 간 간격 조정 */
}

/* 드롭다운 메뉴 스타일 */
.dropmenu {
	display: none;
	position: absolute;
	top: 100%; /* 메뉴가 드롭다운 항목 바로 아래에 위치하도록 */
	left: 0;
	background-color: #ffffff;
	box-shadow: 0 8px 20px rgba(35, 0, 77, 0.2);
	z-index: 999; /* 다른 요소들 위에 표시되도록 */
	border-radius: 8px; /* 메뉴 전체를 둥글게 */
	overflow: hidden; /* 둥글게 처리된 메뉴 항목의 모서리 넘침 방지 */
	width: 110px; /* 드롭다운 메뉴 너비 설정 */
}

/* 드롭다운 메뉴 항목 스타일 */
.dropmenu li {
	padding: 5px;
	text-align: center; /* 항목 내의 텍스트를 수평 중앙 정렬 */
}

/* 드롭다운 메뉴 항목의 링크 스타일 */
.dropmenu a {
	text-decoration: none;
	color: #333; /* 기본 글씨 색상 */
	display: block;
	line-height: 1.0; /* 텍스트 줄 높이 */
}

/* 드롭다운 메뉴의 항목에 마우스를 올렸을 때 링크의 색상 변경 */
.dropmenu li:hover a {
	color: #007bff; /* 마우스 오버 시 글씨 색상 변경 */
	background-color: #C2C2C2; /* 선택된 항목의 배경색 변경 (선택 사항) */
}

/* 드롭다운 메뉴를 표시할 때의 스타일 */
.dropdown:hover .dropmenu {
	display: block;
}

/* 헤더 내 메뉴 항목의 기본 스타일 */
.nav>li {
	list-style: none;
	margin: 0;
	padding: 0;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('#logoutBtn').click(function() {
			$.ajax({
				type : 'post',
				url : '../member/logOut.do',
				success : function(result) {
					console.log(result)
					if (result === 'OK') {
						location.href = "../main/main.do"
					}
				}
			})
		})
		// 기존 드롭다운 메뉴에 마우스 오버 및 아웃 이벤트 적용
		$('.dropdown').hover(function() {
			$(this).find('.dropmenu').stop(true, true).slideDown()
		}, function() {
			$(this).find('.dropmenu').stop(true, true).slideUp()
		})
	})
</script>
</head>
<body>
	<header class="header-area header-sticky">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav class="main-nav navbar">
						<!-- ***** Logo Start ***** -->
						<a href="index.html" class="logo">
							<img src="../assets/images/logo.png" alt="">
						</a>
						<!-- ***** Logo End ***** -->
						<!-- ***** Menu Start ***** -->
						<ul class="nav">
							<li>
								<a href="index.html" class="active">Home</a>
							</li>
							<li class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="../movie/moviemain.do">
									Movie<span class="caret"></span>
								</a>
								<ul class="dropmenu">
									<li class="submenu">
										<a href="#">Page 1-1</a>
									</li>
									<li class="submenu">
										<a href="#">Page 1-2</a>
									</li>
									<li class="submenu">
										<a href="#">Page 1-3</a>
									</li>
								</ul>
							</li>
							<li class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="../book/list.do">
									Books<span class="caret"></span>
								</a>
								<ul class="dropmenu">
									<li class="submenu">
										<a href="../book/list.do">Page 1-1</a>
									</li>
									<li class="submenu">
										<a href="#">Page 1-2</a>
									</li>
									<li class="submenu">
										<a href="#">Page 1-3</a>
									</li>
								</ul>
							</li>
							<li class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="#">
									Music<span class="caret"></span>
								</a>
								<ul class="dropmenu">
									<li class="submenu">
										<a href="../music/musicList.do">Chart</a>
									</li>
									<li class="submenu">
										<a href="../music/albumList.do">Album</a>
									</li>
									<li class="submenu">
										<a href="../music/musicMvList.do">Page 1-3</a>
									</li>
									<li class="submenu">
										<a href="#">store</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="profile.html">
									Profile <img src="../assets/images/profile-header.jpg" alt="">
								</a>
							</li>
						</ul>
						<ul class="nav" style="width: 120px;"></ul>
						<c:if test="${sessionScope.id==null }">
							<ul class="nav">
								<li>
									<a href="#" id="info">SIGN UP</a>
								</li>
								<li>
									<a href="../member/login.do">SIGN IN</a>
								</li>
							</ul>
						</c:if>
						<c:if test="${sessionScope.id!=null }">
							<ul class="nav">
								<li>
									<a id="info">${sessionScope.nickname}님</a>
								</li>
								<li>
									<a id="info">
										<input type="button" id="logoutBtn" value="LogOut" style="color: #666; background-color: transparent; border: none;">
									</a>
								</li>
							</ul>
						</c:if>
						<a class='menu-trigger'>
							<span>Menu</span>
						</a>
						<!-- ***** Menu End ***** -->
					</nav>
				</div>
			</div>
		</div>
	</header>
	<main>
		<!-- 페이지 콘텐츠가 여기에 들어갑니다. -->
	</main>
</body>
</html>