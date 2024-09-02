<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<link rel="stylesheet" href="./style.css">
<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="./script.js"></script>
</head>
<body>
	<div class="container" style="max-width: 1000px; border-radius: 12px; border: 1px solid #ddd; margin: 0px; padding: 40px;">
		<h3 style="margin-bottom: 50px; margin-top: 0px !important;">
			<b>금일 현황</b>
		</h3>
		<div class="row">
			<table class="table">
				<tr>
					<th width="40%" class="text-center">총 방문자수</th>
					<td width="40%" class="text-center">${visit}명</td>
				</tr>
				<tr>
					<th width="40%" class="text-center">총 음원구매</th>
					<td width="40%" class="text-center">${mBuy}건</td>
				</tr>
				<tr>
					<th width="40%" class="text-center">총 도서구매</th>
					<td width="40%" class="text-center">${bBuy}건</td>
				</tr>
				<tr>
					<th width="40%" class="text-center">총 앨범구매</th>
					<td width="40%" class="text-center">${aBuy}건</td>
				</tr>
				<tr>
					<th width="40%" class="text-center">총 영화예약</th>
					<td width="40%" class="text-center">${reserveCount}건</td>
				</tr>
				<tr>
					<th width="40%" class="text-center">승인 안한 예약</th>
					<td width="40%" class="text-center">${noneAccept}건</td>
				</tr>
				<tr>
					<th width="40%" class="text-center">답변 안한 문의</th>
					<td width="40%" class="text-center">${noneAnswer}건</td>
				</tr>
			</table>
		</div>
		<div class="wrap">
			<h2>7일간 방문자 통계</h2>
			<div class="barGraph">
				<ul class="graph">
					<c:forEach var="date" items="${list }" varStatus="i">
							<li class="graph-bar" data-value="${date}"><span class="graph-legend"><fmt:formatDate value="${week[i.index]}" pattern="MM-dd"/></span></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<input type="hidden" value="${visitMax }" id="visitMax">
	</body>
</html>