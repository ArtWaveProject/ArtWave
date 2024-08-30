<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>

<style type="text/css">
table {
	margin: auto;
}

.table tbody tr .table tr th {
	background: #f9f9f9;
	vertical-align: middle;
}

.table tbody tr .table tr td {
	vertical-align: middle;
}

.spanBtn {
	font-size: 15px;
	font-weight: bold;
}

.checkBtn {
	cursor: pointer;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('.checkBtn').click(function() {
			let rno = $(this).attr('data-rno')
			let btn = $(this)
			$.ajax({
				type : 'post',
				url : '../admin/reserveUpdate.do',
				data : {
					'rno' : rno
				},
				success : function() {
					alert('승인완료')
					btn.text('승인완료')
					btn.removeClass('checkBtn')
					btn.css('color', '#3498db')
				}
			})
		})
	})
</script>

</head>
<body>

	<main class="container">
		<h3 style="margin-bottom: 50px; margin-top: 0px !important;">
			<b>예약 관리</b>
		</h3>
		<div class="col-12">
			<table class="table">
				<tbody>
					<c:forEach var="vo" items="${list}" varStatus="i">
						<tr id="reserveTr${vo.rno}">
							<td colspan="4">
								<table class="table">
									<tr>
										<td rowspan="6">
											<img style="width: 200px;" src="https://www.kobis.or.kr${vo.poster }" id="mPoster">
										</td>
										<th style="text-align: center;" width="20%">제목</th>
										<td colspan="3" width="80%" id="mTitle">${vo.mtitle }</td>
									</tr>
									<tr>
										<th style="text-align: center;" width="20%">상영관</th>
										<td colspan="3" width="80%" id="mName">${vo.tname }&nbsp;${vo.tdname }</td>
									</tr>
									<tr>
										<th style="text-align: center;" width="20%">시간</th>
										<td colspan="3" width="80%" id="mTime">${vo.day }&nbsp;${vo.time }</td>
									</tr>
									<tr>
										<th style="text-align: center;" width="20%">결제금액</th>
										<td colspan="3" width="80%" id="mPrice">
											<fmt:formatNumber value="${vo.price}" type="number" />
											원
										</td>
									</tr>
									<tr>
										<th style="text-align: center;" width="20%">인원</th>
										<td width="30%" id="mMember">${vo.inwon }명</td>
										<th style="text-align: center;" width="20%">좌석</th>
										<td width="30%" id="mSit">${vo.sno}</td>
									</tr>
									<tr>
										<th style="text-align: center;" width="20%">상태</th>
										<td style="vertical-align: middle;" colspan="3" width="80%">
											<c:if test="${vo.state==0}">
												<span class="checkBtn spanBtn" data-rno="${vo.rno}">승인대기</span>
											</c:if>
											<c:if test="${vo.state==1}">
												<span class="spanBtn" style="color: #3498db;">승인완료</span>
											</c:if>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
	</main>
</body>
</html>