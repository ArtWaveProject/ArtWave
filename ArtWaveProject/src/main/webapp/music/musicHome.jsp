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
	$(function() {
		$('#btn').click(function() {
			console.log($('#btn').attr('src'))
		})
	})
</script>
<style type="text/css">
.listImg {
	width: 45px !important;
	height: 45px !important;
}

.iconImg {
	width: 20px !important;
	height: 20px !important;
}

.listChart tr td {
	padding: 0px;
}

.btnhe {
	margin-bottom: 61px;
}

.textblck {
/*     margin-top: 15px;
 */    font-size: 30px; /* 폰트 사이즈 */
    font-weight: bold; /* 폰트 굵기 */
    color: #000 !important; /* 폰트 색상 (검정색) */
    text-decoration: none; /* 밑줄 제거 */
    background-color: rgba(128, 128, 128, 0.2); /* 반투명 회색 */
}
</style>
</head>
<body>
	<div class="container" style="margin-top: 150px;">
		<div class="row">
			<div style="height: 30px;"></div>
			<div class="row">
				<c:forEach var="vo" items="${list}">
					<div class="col-sm-2" style="margin: 0px 0px 15px 0px;">
						<img src="${vo.poster}">
					</div>
				</c:forEach>
			</div>
			<div class="col-lg-8">
				<h3>실시간 차트</h3>
				<table class="table listChart">
					<c:forEach var="mvo" items="${mList}" varStatus="i">
						<tr style="vertical-align: middle;">
							<td width="5%" class="text-center">${i.index+1}</td>
							<td width="15%" class="text-center"><img src="${mvo.poster}"
								class="listImg"></td>
							<td width="51%">${mvo.title}</td>
							<td width="20%" class="text-center">${mvo.aname}</td>
							<td width="3%" class="text-center"><a> <img
									class="iconImg" src="play.png">
							</a></td>
							<td width="3%" class="text-center"><a>+</a></td>
							<td width="3%" class="text-center"><a href="${mvo.urlmp4}"
								id="btn" target="_blank"> <img class="iconImg" src="mv.png">
							</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>


			<div id="carouselExampleIndicators" class="carousel slide col-lg-4"
				data-bs-ride="carousel">
				<h4>Goods</h4>
				<div class="carousel-indicators btnhe">
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="0" class="active" aria-current="true"
						aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="2" aria-label="Slide 3"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="3" aria-label="Slide 4"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="../music/img/083622.png" class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="../music/img/083650.png" class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="../music/img/083708.png" class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="../music/img/083736.png" class="d-block w-100" alt="...">
					</div>
				</div>
				<button class="carousel-control-prev btncolor" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next btncolor" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
				<div>
					<ul class="text-center textblck">
						<li><a href="../music/alstoreList.do">스토어 바로가기</a></li>
					</ul>
				</div>
			</div>

		</div>
	</div>
</body>
</html>