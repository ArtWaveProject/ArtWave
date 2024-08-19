<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    max-width: calc(100% - 340px); /* cover의 width와 마진을 고려하여 최대 너비를 설정 */
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
}
.buttons a {
	text-decoration: none;
	padding: 10px 20px;
	margin-right: 10px;
	color: #fff;
	border-radius: 5px;
	display: inline-block;
	text-align: center;
}

.buttons a.add-to-cart {
	background-color: #4CAF50;
}

.buttons a.buy-now {
	background-color: #E53935;
}

.quantity-control {
	display: flex;
	align-items: center;
	width: 200px; 
	margin: 10px 0;
}

.quantity-control button {
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

.quantity-control button:hover {
	background-color: #45a049;
}

.quantity-control button:disabled {
	background-color: #ccc;
	cursor: not-allowed;
}

.quantity-control input {
	width: 50px;
	text-align: center;
	font-size: 15px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin: 0 5px;
	padding: 3px;
}

.quantity-control input:focus {
	outline: none;
	border-color: #4CAF50;
}
</style>

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
										<img src="${vo.cover}" alt=""
											style="width: 300px; height: 400px; border-radius: 23px;">
									</div>
									<div class="book-info">
										<p>${vo.bgenre}<br>
										</p>
										<span
											style="font-size: 30px; font-weight: bold; display: block; margin-bottom: 10px;">${vo.btitle}</span>
										<p>${vo.writer}${vo.writer != null ? '저 | ' : ''}${vo.publisher}
											| ${vo.dbday}</p>
										<p>${vo.btag}</p>
										<div class="hr-container">
											<hr>
										</div>
										<table class="pricing-info">
											<tr>
												<th class="price-label">정가</th>
												<td class="price-value"><fmt:formatNumber
														value="${vo.price}" type="number" />원</td>
											</tr>
											<tr>
												<th class="price-label">할인가</th>
												<td class="price-value discount-price"><fmt:formatNumber
														value="${vo.sale_price}" type="number" />원 <span
													class="discount-rate"> <c:choose>
															<c:when test="${vo.sale_price < vo.price}">
																<c:out
																	value="(${((vo.price - vo.sale_price) / vo.price * 100)}" />% 할인)
                    </c:when>
															<c:otherwise>
                    할인 없음
                    </c:otherwise>
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
												<td><div class="quantity-control">
														<button id="decrement">-</button>
														<input type="text" id="quantity" value="1">
														<button id="increment">+</button>
													</div></td>
											</tr>
											<tr>
												<th class="price-label">총 금액</th>
												<td class="price-value"></td>
											</tr>
										</table>
										<div class="buttons">
											<a href="#" class="add-to-cart"><i
												class="fa fa-cart-plus">&nbsp;Add to Cart</i></a> <a href="#"
												class="buy-now"><i class="fa fa-credit-card">&nbsp;Buy
													Now</i></a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="top-streamers" style="flex: 1; margin-top: 20px;">
								<div class="heading-section">
									<span style="font-size: 20px; font-weight: bold;">도서 정보</span>
								</div>
								<table class="book-in" style="margin-top: 20px;">
								 <tbody class="book-size">
								  <tr>
								   <th class="b-info">발행일</th>
								   <td class="b-in">${vo.dbday }</td>
								  </tr>
								  <tr>
								   <th class="b-info">쪽수</th>
								   <td class="b-in">${vo.pages }</td>
								  </tr>
								  <tr>
								   <th class="b-info">isbn13</th>
								   <td class="b-in">${vo.isbn13 }</td>
								  </tr>
								  <tr>
								   <th class="b-info">isbn10</th>
								   <td class="b-in">${vo.isbn10 }</td>
								  </tr>
								 </tbody>
								</table>
								<div class="heading-section" style="padding: 40px 0 10px 0;">
									<span style="font-size: 20px; font-weight: bold;">책 소개</span>
								</div>
								<p>${vo.intro }</p>
							
							<div class="heading-section" style="padding: 40px 0 10px 0;">
									<span style="font-size: 20px; font-weight: bold;">소개 이미지</span>
								</div>
								<img src="${vo.intro_img }" alt="">
						</div>
						</div>
					</div>
					<!-- ***** Featured Games End ***** -->
				</div>
			</div>
		</div>
	</div>


</body>
</html>