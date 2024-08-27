<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<style type="text/css">
li {
	color: white !important;
	font-size: 20px !important;
}

.sp {
	/*  	margin-top: 10px !important;
	margin-bottom: 10px !important; */
	float: left !important;
}

.sl {
	/*  	margin-top: 10px !important;
	margin-bottom: 10px !important; */
	text-align: right !important; /* 오른쪽 정렬 */
	color: black !important;
}

.db {
	height: 230px !important;
	text-align: center !important; /* 전체 리스트를 가운데 정렬 */
}

.black {
	color: black !important;
}

.img {
	width: 1115px;
}

.dis {
	display: inline;
}

.size {
	width: 120px;
	height: 40px;
}

.imgBtn {
	border: none; /* 기본 버튼 스타일 제거 */
	padding: 0; /* 여백 제거 */
	background: none; /* 배경 제거 */
	cursor: pointer; /* 클릭 커서 모양 */
	display: block; /* 이미지 주변 여백 제거 */
	width: 30px; /* 원하는 너비로 조절 */
	height: auto; /* 비율 유지 */
	display: inline;
}

.ulmar {
	margin-top: -10px;
}

.textsize {
	width: 35px;
	height: 40px;
	margin-top: -3px;
}
.marginnone{
	margin-top: -5px !important;
}
.review-form {
	margin-top: 20px;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 8px;
	background-color: #f9f9f9;
}

.review-form label {
	display: block;
	margin-bottom: 8px;
	font-weight: bold;
}

.review-form textarea {
	padding: 8px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
	width: 800px;
	min-height: 68px;
	box-sizing: border-box;
	vertical-align: middle;
}

.review-form button {
	background-color: #5D7DC9;
	color: #fff;
	padding: 12px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
	height: 50px;
	vertical-align: middle;
	box-sizing: border-box;
	margin-bottom: 10px;
}

.review-form button:hover {
	background-color: #45a049;
}

.review-form .review-container {
	display: flex;
	align-items: center;
}

.review-form .review-container textarea {
	margin-right: 10px;
}

.review-list {
	border: 1px solid #ddd;
	border-radius: 8px;
	background-color: #fff;
	padding: 15px;
	margin-bottom: 15px;
	width: 1022px;
}

.review-list .nick-rate {
	font-weight: bold;
	font-size: 16px;
	color: #333;
}

.review-list .date {
	font-size: 14px;
	color: #888;
}

.review-list .xBtn, .review-list .rBtn {
	background: none;
	border: none;
	cursor: pointer;
	font-size: 14px;
	margin-left: 5px;
	padding: 0;
}

.review-list .xBtn {
	float: right;
}

.review-list .rBtn {
	color: #888;
}

.review-list .xBtn:hover, .review-list .rBtn:hover {
	text-decoration: underline;
}

.review-list .rating {
	margin: 10px 0;
}

.review-list .r-content {
	font-size: 14px;
}
</style>
<script type="text/javascript">
	function changeQuantity(change) {
		var quantityInput = document.getElementById('quantity');
		var currentQuantity = parseInt(quantityInput.value);
		var newQuantity = currentQuantity + change;

		if (newQuantity < 0) {
			newQuantity = 0;
		}

		quantityInput.value = newQuantity;
	}
</script>
</head>
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<div class="page-content">

				<!-- ***** Banner Start ***** -->
				<div class="row">
					<div class="col-lg-12">
						<div class="gaming-library profile-library">
							<div class="row">

								<div class="col-lg-4">
									<img src="${vo.aphoto}" alt="" style="border-radius: 23px;">
								</div>

								<div class="col-lg-8">
									<div class="heading-section">
										<h3 class="black">${vo.aname }</h3>
									</div>
									<br>
									<div class="item">
										<ul class="ulmar">
											<li><span class="sp">아티스트</span></li>
											<li></li>
											<li></li>
											<li></li>
											<li class="black">${vo.aartist }</li>
										</ul>
									</div>
									<div class="item">
										<ul class="ulmar">
											<li><span class="sp">발매일</span></li>
											<li></li>
											<li></li>
											<li></li>
											<li class="black">${vo.aldate }</li>
										</ul>
									</div>
									<div class="item">
										<ul class="ulmar">
											<li><span class="sp">정가</span></li>
											<li class="black">${vo.aprice}</li>
											<li></li>
											<li><span class="sp">할인가</span></li>
											<li class="black">${vo.adisprice}</li>
										</ul>
									</div>
									<div class="item last-item">
										<ul class="ulmar">
											<li><img src="../music/img/add.png" class="size marginnone"></li>&nbsp;&nbsp;
											<li><img src="../music/img/buy.png" class="size marginnone"></li>
											<li></li>
											<li><span class="sp">수량</span></li>
											<li>
												<button type="button" class="imgBtn"
													onclick="changeQuantity(-1)">
													<img src="../music/img/minus.png" class="marginnone">
												</button> <input type="text" id="quantity" class="textsize text-center" value="0"
												readonly>
												<button type="button" class="imgBtn"
													onclick="changeQuantity(1)">
													<img src="../music/img/plus.png" class="marginnone">
												</button>
											</li>
										</ul>
									</div>


								</div>
							</div>

						</div>
					</div>
				</div>
				<!-- ***** Banner End ***** -->

				<!-- ***** Gaming Library Start ***** -->
				<div class="gaming-library profile-library">
					<div class="col-lg-12">
						<div class="heading-section">
							<h3 class="black">${vo.aname }</h3>
						</div>
						<br> <br>
						<div class="item">
							<h4 class="black">음반 소개</h4>
							<br>
							<table>
								<tr>
									<td class="black">${vo.aintro}</td>
								</tr>
							</table>
						</div>
						<div class="item">
							<div>
								<h4 class="black">음반 사양</h4>
								<br>
								<table>
									<tr>
										<td class="white">${vo.adetail}</td>
									</tr>
								</table>
							</div>
						</div>

						<div class="item last-item">
							<h4 class="black">상세 이미지</h4>
							<br>
							<ul>
								<c:if test="${vo.aimg != null}">
									<li><img class="img" src="${vo.aimg}" alt=""></li>
								</c:if>
								<c:if test="${vo.aimg == null }">
									<li></li>
								</c:if>
							</ul>
						</div>

						<div id="review-form" class="review-form"
							style="margin-top: 40px;">
							<div class="heading-section" style="padding: 0 0 15px 0;">
								<span style="font-size: 20px; font-weight: bold;">리뷰(<span
									id="rcount">${rcount}</span>)
								</span>
							</div>
							<input type="hidden" id="bno" name="bno" value="${vo.ano}" />
							<div>
								<div class="star-rating">
									<input class="rating" type="radio" id="star5" name="rating"
										value="5" required /> <label for="star5"></label> <input
										class="rating" type="radio" id="star4" name="rating" value="4" />
									<label for="star4"></label> <input class="rating" type="radio"
										id="star3" name="rating" value="3" /> <label for="star3"></label>
									<input class="rating" type="radio" id="star2" name="rating"
										value="2" /> <label for="star2"></label> <input
										class="rating" type="radio" id="star1" name="rating" value="1" />
									<label for="star1"></label>
								</div>
							</div>
							<table>
								<tr>
									<td>
										<div class="review-container">
											<textarea id="content" style="resize: none;" name="content"
												required placeholder="리뷰를 작성해주세요!!"></textarea>
											<button type="button" id="reviewBtn">리뷰 작성</button>
										</div>
									</td>
								</tr>
							</table>
							<table>
								<tbody id="review">
								</tbody>
							</table>
						</div>

					</div>
				</div>
				<!-- ***** Gaming Library End ***** -->
			</div>
		</div>
	</div>
</div>


<!-- Scripts -->
<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

<script src="assets/js/isotope.min.js"></script>
<script src="assets/js/owl-carousel.js"></script>
<script src="assets/js/tabs.js"></script>
<script src="assets/js/popup.js"></script>
<script src="assets/js/custom.js"></script>


</body>

</html>
