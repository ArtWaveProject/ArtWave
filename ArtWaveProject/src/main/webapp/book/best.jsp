<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<style type="text/css">

.page-line {
    padding: 40px;
    background-color: #FFFFFF;
    border-radius: 24px;
    margin: 20px auto;
    max-width: 1200px; 
}

body {
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif;
}


.book-list {
	display: flex;
	flex-direction: column;
	gap: 20px;
	padding: 40px;
	background-color: #f9f9f9;
	border-radius: 24px;
}

.book-item {
	display: flex;
	border: 1px solid #ddd;
	border-radius: 8px;
	background-color: #fff;
	padding: 15px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	height: auto; /* Dynamic height for each book item */
	box-sizing: border-box;
	position: relative;
}

.book-cover {
	flex-shrink: 0;
	width: 120px;
	height: 160px;
	margin-right: 20px;
	overflow: hidden;
}

.book-cover img {
	width: 100%;
	height: 100%;
	border-radius: 4px;
	border: 0.5px solid #ddd;
}

.book-info {
	flex: 1;
	text-align: start;
	margin-left: 15px;
}

.book-title {
	font-size: 1.2em;
	margin: 0;
	color: #333;
}

.book-author, .book-genre {
	margin: 2px 0;
	color: #666;
	font-size: 12px;
}

.book-price {
	color: #E53935;
	font-weight: bold;
	margin-bottom: 10px;
}

.book-price .discount {
	font-size: 0.8em; /* 할인 부분의 폰트 크기를 줄임 */
	color: #E53935; /* 할인 부분의 색상을 조정 (선택 사항) */
	margin-top: 5px; /* 상단 여백 추가 */
}

.book-actions {
	width: 140px;
	height: 32px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	margin-left: 20px;
	margin-top: 10px;
}

.book-actions button {
	border: none;
	border-radius: 4px;
	padding: 8px 12px;
	margin-bottom: 8px;
	cursor: pointer;
	font-size: 12px;
}

.book-actions button:hover {
	background-color: #EA0035;
}

.book-actions select {
	padding: 8px;
	border-radius: 4px;
	border: 1px solid #ddd;
	margin-bottom: 8px;
}

.book-actions .quantity-control {
	display: flex;
	gap: 5px;
	justify-content: center;
	margin: 0 0 0 0;
}

.quantity-control button {
	width: 30px;
	height: 30px;
	font-size: 18px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #f0f0f0;
	cursor: pointer;
	transition: background-color 0.3s ease;
	display: flex;
	align-items: center;
	justify-content: center;
}

.quantity-control button:hover {
	background-color: #ddd;
}

.quantity-control input {
	width: 72px;
	height: 30px;
	text-align: center;
	font-size: 15px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
}

.page {
	list-style: none;
	padding: 0;
	margin: 20px auto; 
	display: flex;
	justify-content: center; 
	font-family: Arial, sans-serif;
}

.page li {
	margin: 0 3px; 
}

.page a {
	text-decoration: none;
	color: #0197A3; 
	padding: 8px 12px;
	border: 1px solid #0197A3; 
	border-radius: 4px; 
	transition: background-color 0.3s, color 0.3s; 
}

.page a:hover {
	background-color: #0197A3; 
	color: #fff; 
}

.page .current a {
	background-color: #0197A3; 
	color: #fff;
	border: 1px solid #0197A3; 
	pointer-events: none; 
}

.page .current a:hover {
	background-color: #0197A3; 
	color: #fff; 
}

.page li:first-child a {
	border-radius: 4px 0 0 4px;
}

.page li:last-child a {
	border-radius: 0 4px 4px 0;
}

}
</style>
</head>
<body>
<div class="row">
				<div class="col-lg-12">
	<div class="page-line" style="margin-top: 150px;">
		<h2 style="color: black; margin-top: -50px; margin-bottom: 40px; text-align: center;">베스트셀러</h2>
		<div class="book-list">
			<c:forEach var="vo" items="${tList}">
				<div class="book-item">
					<div class="book-cover">
						<a href="../book/cookie.do?bno=${vo.bno }"> 
						<img height=100%;	src="${vo.cover }" alt="">
						</a>
					</div>
					<div class="book-info">
						<p class="book-genre">${vo.bgenre }</p>
						<a href="../book/cookie.do?bno=${vo.bno }">
							<h2 class="book-title">${vo.btitle }</h2></a>
							<p class="book-author">${vo.writer}${vo.writer != null ? ' 저 | ' : ''}${vo.publisher}&nbsp;|
								${vo.dbday}</p>
							<p class="book-price">
								<fmt:formatNumber value="${vo.sale_price}" type="number" />원
								<c:choose>
									<c:when test="${vo.sale_price < vo.price}">
										<span class="discount"> (<fmt:formatNumber
												maxFractionDigits="0" type="number"
												value="${((vo.price - vo.sale_price) / vo.price * 100)}" />% 할인)
										</span>
									</c:when>
									<c:otherwise>
										<span class="discount">(할인 없음)</span>
									</c:otherwise>
								</c:choose>
							</p>
					</div>
					<div class="book-actions">
						<button type="button" class="fa fa-heart">&nbsp;좋아요</button>
						<div class="quantity-control">
							<button id="decrement">+</button>
							<input type="text" id="quantity" value="1">
							<button id="increment">-</button>
						</div>
						<button type="button" class="fa fa-cart-plus"
							style="background-color: #99D9EA;">&nbsp;Add to Cart</button>
						<button type="button" class="fa fa-credit-card"
							style="background-color: #7396EA">&nbsp;Buy Now</button>
					</div>
				</div>
			</c:forEach>
			</div>
			</div>
			</div>
				<ul class="page page-xg">
					<c:if test="${startPage > 1}">
						<li><a href="../book/best.do?page=${startPage-1}">&laquo;
								Previous</a></li>
					</c:if>
					<c:forEach var="t" begin="${startPage}" end="${endPage}">
						<li ${n == curpage ? "class='current'" : ""}><a
							href="../book/best.do?page=${t}">${t}</a></li>
					</c:forEach>
					<c:if test="${endPage < totalpage}">
						<li><a href="../book/best.do?page=${endPage+1}">Next
								&raquo;</a></li>
					</c:if>
				</ul>
		</div>
</body>
</html>