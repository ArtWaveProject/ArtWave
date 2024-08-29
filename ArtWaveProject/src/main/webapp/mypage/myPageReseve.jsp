<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

body {
    font-family: Arial, sans-serif;
}

.listImg {
	width: 45px !important;
	height: 45px !important;
}

.iconImg {
	width: 20px !important;
	height: 20px !important;
}

.listBody {
	padding: 30px;
	width: 900px;
	background-color: aliceblue;
	border-radius: 30px;
}

.listChart {
	background: white;
	padding: 5px;
	vertical-align: middle !important;
	border-radius: 30px;
	border: 0.1px solid #ddd; 
}

.table {
    width: 100%;
    border-collapse: collapse;
    background-color: #fff;
    border-radius: 30px;
    overflow: hidden;
}

.table th, .table td {
    text-align: center;
    align-content: center;
}

.table th {
    font-weight: bold;
    background-color: #f9f9f9;
}

.table img {
    border-radius: 5px;
}

button {
    background-color: transparent; 
    color: #e74c3c;
    border: none;
    border-radius: 5px;
    padding: 10px 15px; 
    font-size: 14px;
    cursor: pointer;
    transition: color 0.3s, transform 0.3s;
    text-align: center;
}

button:hover {
    color: #c0392b;
    transform: scale(1.05);
}

.checkBtn {
    color: #3498db;
    cursor: pointer;
    font-weight: bold;
}

.checkBtn:hover {
    color: #2980b9;
}

.reserve-details {
    display: none;
    padding: 15px;
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.reserve-details img {
    width: 200px;
    border-radius: 5px;
}

.reserve-details table {
    width: 100%;
    border-collapse: collapse;
}

.reserve-details th {
    text-align: left;
    padding: 10px;
    background-color: #f9f9f9;
}

#middle {
    vertical-align: middle !important;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('.checkBtn').click(function() {
			let rno = $(this).attr('data-rno')
			let toggle = $(this).attr('data-movie')
			console.log(rno)
			console.log(toggle)
			if (toggle === '0') {
				$('#reserveTr' + rno).css('display', '')
				$(this).attr('data-movie', '1')
			} else {
				$('#reserveTr' + rno).css('display', 'none')
				$(this).attr('data-movie', '0')
			}
		})
	})
	function reserveDelete(rno) {
		$.ajax({
			type:'post',
			url:'../mypage/reserveDelete.do',
			data:{'rno':rno},
			success:function(){
				location.href="../mypage/my_reserve.do"
			}
		})
	}
</script>
</head>
<body>
	<div class="container" style="margin-top: 10px; font-weight: bold; font-size: 15px;">
		<div class=" listBody">
			<table class="table listChart" id="middle">
				<tr>
					<th width="10%" class="text-center">번호</th>
					<th width="15%" class="text-center"></th>
					<th width="45%" class="text-center">제목</th>
					<th width="30%" class="text-center">예약 상태</th>
				</tr>
				<c:forEach var="vo" items="${list}" varStatus="i">
					<tr style="vertical-align: middle; height: 50px;">
						<td width="10%" class="text-center">${i.index+1}</td>
						<td width="15%" class="text-center">
							<img src="https://www.kobis.or.kr${vo.poster }">
						</td>
						<td width="45%">${vo.mtitle }</td>
						<td width="30%">
							<c:if test="${vo.state==0}">
								<span>승인대기</span>
							</c:if>
							<c:if test="${vo.state==1}">
								<span class="checkBtn" data-rno="${vo.rno}" data-movie="0">승인완료</span>
							</c:if>
							<button onclick="reserveDelete(${vo.rno})">삭제</button>
						</td>
					</tr>
					<tr id="reserveTr${vo.rno}" style="display: none;">
						<td colspan="4">
							<table class="table">
								<tr>
									<td rowspan="5">
										<img style="width: 200px;" src="https://www.kobis.or.kr${vo.poster }" id="mPoster">
									</td>
									<th width="20%">제목</th>
									<td colspan="3" width="80%" id="mTitle">${vo.mtitle }</td>
								</tr>
								<tr>
									<th width="20%">상영관</th>
									<td colspan="3" width="80%" id="mName">${vo.tname }&nbsp;${vo.tdname }</td>
								</tr>
								<tr>
									<th width="20%">시간</th>
									<td colspan="3" width="80%" id="mTime">${vo.day }&nbsp;${vo.time }</td>
								</tr>
								<tr>
									<th width="20%">결제금액</th>
									<td colspan="3" width="80%" id="mPrice"><fmt:formatNumber value="${vo.price}" type="number" />원</td>
								</tr>
								<tr>
									<th width="20%">인원</th>
									<td width="30%" id="mMember">${vo.inwon }명</td>
									<th width="20%">좌석</th>
									<td width="30%" id="mSit"></td>
								</tr>
							</table>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>