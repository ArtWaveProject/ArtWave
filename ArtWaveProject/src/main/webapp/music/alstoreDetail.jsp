<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
.featured-games {
	display: flex;
	flex-wrap: wrap;
}

.cover {
	flex: 1;
	max-width: 300px;
}

.book-info {
	flex: 2;
	margin-left: 20px;
	max-width: calc(100% - 340px);
}

.pricing-info {
	display: flex;
	width: 400px;
}

.price-label {
	font-size: 14px;
	color: #000000;
	font-weight: 400;
	width: 400px;
}

.book-in th, .book-in td {
	border: 1px solid #ddd;
	padding: 8px;
	padding-left: 15px;
	font-size: 13px;
}

.book-in th {
	border-left: none;
}

.book-in td {
	border-right: none;
}

.b-info {
	font-weight: 550;
	width: 200px;
	text-align: center;
}

.b-in {
	width: 1000px;
	text-align: left;
}

.price-value {
	font-size: 20px;
	text-align: left;
}

.discount-price {
	color: #E53935;
}

.discount-rate {
	font-size: 13px;
	color: #E53935;
	text-align: left;
}

.delivery-info {
	font-size: 12px;
	color: #979797;
	text-align: left;
}

.hr-container {
	margin: 10px 0;
	text-align: left;
}

.hr-container hr {
	width: 700px;
	border: 1px solid
}

.buttons {
	margin-top: 20px;
	width: 400px;
	display: flex;
	align-items: center;
}

.buttons a {
	text-decoration: none;
	padding: 10px;
	margin-right: 10px;
	color: #fff;
	border-radius: 5px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.buttons a.add-to-cart {
	background-color: #4CAF50;
	height: 40px;
}

.buttons a.like-button {
	background-color: transparent;
	border: 1px solid #ccc;
	color: #fff;
	width: 42px;
	height: 40px;
	border-radius: 8px;
	display: flex;
	align-items: center;
	justify-content: center;
	cursor: pointer;
}

.buttons a.like-button img {
	width: 20px;
	height: 20px;
}

.buy-now {
	background-color: #E53935;
	height: 40px;
	border: none;
	color: white;
	border-radius: 4px;
}

.account-control {
	display: flex;
	align-items: center;
	width: 200px;
	margin: 10px 0;
}

.account-control button {
	width: 30px;
	height: 30px;
	font-size: 18px;
	background-color: #4CAF50;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.2s;
}

.account-control button:hover {
	background-color: #45a049;
}

.account-control button:disabled {
	background-color: #ccc;
	cursor: not-allowed;
}

.account-control input {
	width: 50px;
	text-align: center;
	font-size: 15px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin: 0 5px;
	padding: 3px;
}

.account-control input:focus {
	outline: none;
	border-color: #4CAF50;
}

.star-rating {
	display: flex;
	font-size: 24px;
}

.star-rating input[type="radio"] {
	display: none;
}

.star-rating label {
	cursor: pointer;
	color: #ddd; /* 기본 색상: 선택되지 않은 상태 */
	transition: color 0.2s;
}

.star-rating label:before {
	content: '\f005'; /* Font Awesome star icon */
	font-family: 'Font Awesome 6 Free';
	font-weight: 900;
}

.star-rating input[type="radio"]:checked ~ label {
	color: #779BC9; /* 선택된 별점의 색상 */
}

.star-rating input[type="radio"]:checked ~ input[type="radio"] ~ label {
	color: #779BC9; /* 선택된 별점과 그 이전 별점의 색상 */
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
	background-color: #506CAD;
}

.review-form .review-container {
	display: flex;
	align-items: center;
}

.review-form .review-container textarea {
	margin-right: 10px;
}

.button-container {
	display: flex;
	margin: 30px 0 0 0;
}

.action-button {
	background-color: #fff;
	color: #000;
	padding: 12px 20px;
	border: 1.5px solid #000;
	border-radius: 10px 10px 0 0;
	cursor: pointer;
	font-size: 16px;
	font-weight: bold;
	height: 50px;
	width: 110px;
	text-align: center;
	display: inline-block;
	transition: background-color 0.2s, color 0.2s;
}

.action-button:hover {
	background-color: #f0f0f0;
	color: #333;
}

.action-button.active {
	background-color: #000;
	color: #fff;
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

.r-content {
	margin-top: 10px;
}

.average-rating {
	display: flex;
	align-items: center;
}

#avgnumber {
	margin-left: 5px;
}

.avgRating {
	display: flex;
	align-items: center;
}

#avgN {
	margin-left: 10px;
}

.recent-books-container {
	position: fixed;
	right: 60px;
	bottom: 20px;
	width: 200px;
	background-color: #ffffff;
	border: 2px solid #ddd;
	border-radius: 15px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 20px;
	z-index: 1000;
	transition: height 0.3s ease, bottom 0.3s ease;
	overflow: hidden;
	height: 60px;
}

.recent-books-header {
	cursor: pointer;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.recent-books-header h4 {
	margin: 0;
	font-size: 18px;
	color: #333;
}

.recent-books-content {
	display: flex;
	flex-wrap: wrap;
	margin-top: 10px;
}

.recent-books-content ul {
	list-style: none;
	padding: 0;
	margin: 0;
	display: flex;
	flex-wrap: wrap;
}

.recent-books-content li {
	margin: 5px;
}

.recent-books-content img {
	border-radius: 8px;
	display: block;
}

.recent-books-container.expanded {
	padding: 25px;
	height: 250px;
	bottom: 60px;
}
</style>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
var IMP = window.IMP; 
IMP.init("imp68206770");
let ratingCheck=false
function requestPay(json, name, price) {
    IMP.request_pay({
        pg: "html5_inicis",
        pay_method: "card",
        merchant_uid: "ORD20180131-0000011",
        name: name,
        amount: price,
        buyer_email: json.email,
        buyer_name: json.name,
        buyer_tel: json.phone,
        buyer_addr: json.address,
        buyer_postcode: json.post
    }, function (rsp) { 
        alert('구매완료');
    });
}

function toggleRecentBooks() {
    const container = document.querySelector('.recent-books-container');
    const toggleIcon = container.querySelector('.toggle-icon');
    if (container.classList.contains('expanded')) {
        container.classList.remove('expanded');
        toggleIcon.textContent = '+';
    } else {
        container.classList.add('expanded');
        toggleIcon.textContent = '-';
    }
}

$(document).ready(function() {
    // Scroll to review form
    $('#scrollToReview').click(function(event) {
        event.preventDefault();
        $('html, body').animate({
            scrollTop: $('#review-form').offset().top
        }, 10);
    });

    // Scroll to intro section
    $('#scrollToIntro').click(function(event) {
        event.preventDefault();
        $('html, body').animate({
            scrollTop: $('#intro-section').offset().top
        }, 10);
    });

    // Toggle action button
    $('.action-button').click(function() {
        $('.action-button').removeClass('active');
        $(this).addClass('active');
    });

    // Add to cart
    $('.add-to-cart').click(function(event) {
        event.preventDefault();
        let id = '${id}';
        if (id.length === 0) {
            alert('해당 기능은 로그인 시 이용하실 수 있습니다');
            return;
        }
        let ano = $('#ano').val();
        let count = $('#account').val();
        let price = ${vo.adisprice};

        console.log(ano);
        console.log(count);
        console.log(price);

        $.ajax({
            type: 'post',
            url: '../book/cart.do',
            data: {
                'tno': ano,
                'price': price,
                'count': count,
                'type': 3 
            },
            success: function(result) {
                alert('장바구니에 추가되었습니다');
            },
            error: function(request, status, error) {
                alert('오류가 발생했습니다');
            }
        });
    });

    function updateTotalPrice() {
        let quantity = parseInt($('#account').val());
        let price = parseFloat('${vo.adisprice}');
        let totalPrice = quantity * price;
        $('.price-value.total').text(totalPrice.toLocaleString() + '원');
    }

    updateTotalPrice();

    $('#account').change(function() {
        updateTotalPrice();
    });

    $('#buy').click(function() {
        let gno = ${vo.ano};
        let price = ${vo.adisprice};
        let account = parseInt($('#account').val());
        let name = '${vo.aname}';
        let id = '${id}';
        if (id.length < 2) {
            alert('로그인이 필요합니다');
            return;
        }
        $.ajax({
            type: 'post',
            url: '../payment/paymentCheck.do',
            data: {
                'gno': gno,
                'type': 3
            },
            success: function(result) {
                if (result === 'OK') {
                    $.ajax({
                        type: 'post',
                        url: '../payment/paymentInsert.do',
                        data: {
                            "gno": gno,
                            "price": price,
                            "account": account,
                            'type': 3,
                            'title': name
                        },
                        success: function(result) {
                            let json = JSON.parse(result);
                            console.log(json);
                            requestPay(json, name, price);
                        }
                    });
                } else {
                    alert('이미 구매한 도서입니다');
                    return;
                }
            }
        });
    });

    $('.rating').change(function() {
        ratingCheck = true;
        let rating = $('input[name="rating"]:checked').val();
        rating = 6 - rating;
        console.log(rating);
    });

    let avgRating = parseFloat('${avg}');
    let star = '';
    for (let i = 1; i <= 5; i++) {
        if (i <= avgRating) {
            star += '<img src="star.png" style="width:20px;height:20px;">';
        } else {
            star += '<img src="nostar.png" style="width:20px;height:20px;">';
        }
    }
    $('.avgstar').html(star);

    $('#reviewBtn').click(function() {
    	let id=$('#id').val()
    	console.log(ano)
        let rating = 0;
        if (id.length === 0) {
            alert('해당 기능은 로그인 시 이용하실 수 있습니다');
            return;
        }
        if (ratingCheck) {
            rating = $('input[name="rating"]:checked').val();
            rating = 6 - rating;
            console.log(rating);
        } else {
            alert('평점을 선택해주세요');
            return;
        }
        let content = $('#content').val();
        if (content.trim() === '') {
            alert('리뷰를 입력해주세요');
            $('#content').focus();
            return;
        }
        $.ajax({
            type: 'post',
            url: '../review/checkedReview.do',
            data: {
                'tno': ano,
                'userId': id
            },
            success: function(result) {
                if (result === 'NO_REVIEW') {
                    $.ajax({
                        type: 'post',
                        url: '../review/insert.do',
                        data: {
                            'tno': ano,
                            'trating': rating,
                            'tcontent': content,
                            'type': 3
                        },
                        success: function() {
                            let count = $('#rcount').text();
                            count = parseInt(count);
                            $('#content').val('');
                            $('input[name="rating"]').prop('checked', false);
                            reviewlist();
                            $('.rcount').text(count + 1);
                        }
                    });
                } else {
                    alert('이미 작성하신 리뷰가 있습니다.');
                }
            }
        });
    });

    function reviewlist() {
        $.ajax({
            type: 'post',
            url: '../review/list.do',
            data: {
                'tno': ${vo.ano},
                'type': 3
            },
            success: function(result) {
                let json = JSON.parse(result);
                let html = '';
                json.map(function(reply) {
                    let stars = '';
                    for (let i = 1; i <= reply.trating; i++) {
                        stars += '<img src="star.png" style="width:15px;height:15px;">';
                    }
                    for (let i = 1; i <= 5 - reply.trating; i++) {
                        stars += '<img src="nostar.png" style="width:15px;height:15px;">';
                    }
                    html += '<tr>';
                    html += '<td>';
                    html += '<div class="review-list">';
                    html += '<div>';
                    html += '<span class="nick-rate">' + reply.nickname + '</span>';
                    if (reply.id === reply.sessionId) {
                        html += '<input type="button" class="xBtn" value="X" onclick="reviewdelete(' + reply.trno + ')">';
                    }
                    html += '<br>';
                    html += stars + '<br>';
                    html += '<span class="date">' + reply.dbday + '&nbsp;</span>';
                    html += '<div>';
                    html += '<div class="r-content"><pre>' + reply.tcontent + '</pre></div>';
                    html += '</div>';
                    html += '</div>';
                    html += '</td>';
                    html += '</tr>';
                });
                $('#review').html(html);
            }
        });
    }

    function reviewdelete(trno) {
        $.ajax({
            type: 'post',
            url: '../review/delete.do',
            data: {
                'trno': trno
            },
            success: function(result) {
                reviewlist();
                let count = $('#rcount').text();
                count = parseInt(count);
                $('.rcount').text(count - 1);
            }
        });
    }

    // Star rating
    document.addEventListener('DOMContentLoaded', function() {
        const stars = document.querySelectorAll('.star-rating input[type="radio"]');
        stars.forEach(star => {
            star.addEventListener('change', function() {
                updateStars(this);
            });
        });

        function updateStars(selectedStar) {
            const allStars = document.querySelectorAll('.star-rating label');
            allStars.forEach(star => {
                star.style.color = '#ddd';
            });

            const selectedValue = selectedStar.value;
            allStars.forEach(star => {
                const starValue = star.getAttribute('for').replace('star', '');
                if (parseInt(starValue) >= parseInt(selectedValue)) {
                    star.style.color = '#779BC9';
                }
            });
        }
    });

    // Increment and decrement
    function update() {
        let quantity = parseInt($('#account').val());
        let price = parseFloat('${vo.adisprice}');
        let totalPrice = quantity * price;
        $('.price-value.total').text(totalPrice.toLocaleString() + '원');
    }

    var acountInput = $('#account');
    var incrementButton = $('#increment');
    var decrementButton = $('#decrement');

    incrementButton.click(function() {
        var value = parseInt(acountInput.val());
        acountInput.val(value + 1);
        update();
    });

    decrementButton.click(function() {
        var value = parseInt(acountInput.val());
        if (value > 1) {
            acountInput.val(value - 1);
        }
        update();
    });
});



</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="page-content">
					<!-- ***** Featured Games Start ***** -->
					<div class="container" style="padding: 20px;">
						<div class="row" style="display: flex; align-items: flex-start;">
							<div class="col-lg-8" style="flex: 1; margin-right: 10px;">
								<div class="featured-games header-text">
									<div class="cover">
										<img src="${vo.aphoto}" alt=""
											style="width: 300px; height: 400px; border-radius: 23px;">
									</div>
									<div class="book-info">
										<p>${vo.acategory}<br>
										</p>
										<span
											style="font-size: 30px; font-weight: bold; display: block;">${vo.aname}</span>
										<div class="average-rating">
											<span class="avgstar" style="font-weight: bold;"></span>
											<p id="avgnumber" style="font-size: 18px; font-weight: bold;">${avg}</p>
										</div>
										<p>${vo.aartist != null ? ' 노래  ' : ''} ${vo.aartist} | 
											 ${vo.aldate }</p>
										<div class="hr-container">
											<hr>
										</div>
										<table class="pricing-info">
											<tr>
												<th class="price-label">정가</th>
												<td class="price-value"><fmt:formatNumber
														value="${vo.aprice}" type="number" />원</td>
											</tr>
											<tr>
												<th class="price-label">할인가</th>
												<td class="price-value discount-price"><fmt:formatNumber
														value="${vo.adisprice}" type="number" />원 <span
													class="discount-rate"> <c:choose>
															<c:when test="${vo.adisprice<vo.aprice}">
															(<fmt:formatNumber maxFractionDigits="0" type="number"
																	value="${((vo.aprice-vo.adisprice) / vo.aprice*100)}" />% 할인)
                                  </c:when>
															<c:otherwise>(할인 없음)</c:otherwise>
														</c:choose>
												</span></td>
											</tr>
											<tr>
												<th class="price-delivery"
													style="padding-top: 8px; font-size: 13px; color: #979797; font-weight: 300; width: 400px;">배송비</th>
												<td class="delivery-info" style="padding-top: 8px;">무료</td>
											</tr>
											<tr>
												<th class="price-label">수량</th>
												<td><div class="account-control">
														<button id="decrement">-</button>
														<input type="text" id="account" value="1">
														<button id="increment">+</button>
													</div></td>
											</tr>
											<tr>
												<th class="price-label">총 금액</th>
												<td class="price-value total"></td>
											</tr>
										</table>
										<div class="buttons">
											 <a href="" class="add-to-cart"> <i
												class="fa fa-cart-plus">&nbsp;Add to Cart</i>
											</a>
											<button type="button" class="buy-now" style="">
												<i class="fa fa-credit-card" id="buy">&nbsp;Buy Now</i>
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="button-container">
								<a href="#review-form" id="scrollToReview" class="action-button">상품
									리뷰</a> <a href="#intro-section" id="scrollToIntro"
									class="action-button">상품 소개</a>
							</div>
							<div class="top-streamers"
								style="flex: 1; margin-top: 0px; border-radius: 0 10px 10px 10px;">
								<div class="heading-section">
									<span style="font-size: 20px; font-weight: bold;">앨범 정보</span>
								</div>
								<table class="book-in" style="margin-top: 20px;">
									<tbody class="book-size">
										<tr>
											<th class="b-info">발매일</th>
											<td class="b-in">${vo.aldate }</td>
										</tr>
										<tr>
											<th class="b-info">카테고리</th>
											<td class="b-in">${vo.acategory }</td>
										</tr>
										<tr>
											<th class="b-info">상세정보</th>
											<td class="b-in">${vo.adetail }</td>
										</tr>

									</tbody>
								</table>
								<div id="intro-section" style="margin-top: 50px;">
									<div class="heading-section" style="padding: 0 0 15px 0;">
										<span style="font-size: 20px; font-weight: bold;">상품소개</span>
									</div>
									<p>${vo.aintro }</p>

									<div class="heading-section" style="padding: 50px 0 10px 0;">
										<span style="font-size: 20px; font-weight: bold;">소개
											이미지</span>
									</div>
									<img src="${vo.aimg }" alt="" style="padding-bottom: 80px;">
									<br>
									
									<!-- 리뷰 작성 폼 -->
									<div class="heading-section" style="padding: 0 0 15px 0;">
										<span style="font-size: 25px; font-weight: bold;"><span
											class="rcount" style="font-size: 30px; color: #7400e8">${rcount}</span>
											명의&nbsp;회원이&nbsp;평가한&nbsp;이&nbsp;상품의&nbsp;평균별점</span>
									</div>
									<div class="avgRating">
										<span class="avgstar" style="font-weight: bold;"></span>
										<p id="avgN" style="font-size: 30px; font-weight: bold;">${avg}</p>
										<p style="font-size: 25px; font-weight: bold;">&nbsp;/ 5.0</p>
									</div>
									<div id="review-form" class="review-form"
										style="margin-top: 40px;">
										<div class="heading-section" style="padding: 0 0 15px 0;">
											<span style="font-size: 20px; font-weight: bold;">상품
												리뷰(<span id="rcount" class="rcount">${rcount}</span>)
											</span>
										</div>
										<input type="hidden" id="ano" name="ano" value="${vo.ano}" />
										<div>
											<div class="star-rating">
												<input class="rating" type="radio" id="star1" name="rating"
													value="1" required /> <label for="star1"></label> <input
													class="rating" type="radio" id="star2" name="rating"
													value="2" /> <label for="star2"></label> <input
													class="rating" type="radio" id="star3" name="rating"
													value="3" /> <label for="star3"></label> <input
													class="rating" type="radio" id="star4" name="rating"
													value="4" /> <label for="star4"></label> <input
													class="rating" type="radio" id="star5" name="rating"
													value="5" /> <label for="star5"></label>
											</div>
										</div>
										<table>
											<tr>
												<td>
													<div class="review-container">
														<textarea id="content" style="resize: none;"
															name="content" required placeholder="리뷰를 작성해주세요!!"></textarea>
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
						</div>
					</div>
					<!-- ***** Featured Games End ***** -->
				</div>
			</div>
		</div>
	</div>
<input type="hidden" value="${sessionScope.id }" id="id">
	<!-- <a href="https://www.flaticon.com/kr/free-icons/" title="심장 아이콘">심장 아이콘 제작자: hazhio - Flaticon</a> -->
</body>
</html>