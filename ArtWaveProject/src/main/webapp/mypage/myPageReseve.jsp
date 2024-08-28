<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
}

.listChart tr td {
	padding: 0px;
	height: 50px;
	margin: 0px;
}

.row .row {
	width: 800px;
}

.listTitle {
	font-size: 13px;
}

.listTitle a {
	color: black;
}

.listArtist {
	font-size: 11px;
}

.bono {
	border: none !important;
}

#likeBtn {
	border: transparent;
	background: none;
	width: 40px;
	height: 35px;
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
	<div class="container" style="margin-top: 10px;">
		<div class=" listBody">
			<table class="table listChart" id="middle">
				<tr>
					<th width="10%" class="text-center">번호</th>
					<th width="15%" class="text-center"></th>
					<th width="45%" class="text-center">제목</th>
					<th width="30%" class="text-center"></th>
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
									<td colspan="3" width="80%" id="mPrice">${vo.price }</td>
								</tr>
								<tr>
									<th width="20%">인원</th>
									<td width="30%" id="mMember">${vo.inwon }</td>
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