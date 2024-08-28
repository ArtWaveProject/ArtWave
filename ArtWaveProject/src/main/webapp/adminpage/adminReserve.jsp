<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">

<!-- Tempus Dominus Bootstrap 4 CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.39.0/css/tempusdominus-bootstrap-4.min.css" />

<!-- jQuery first -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- Then Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Moment.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

<style type="text/css">
table {
	margin: auto;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
	$('.checkBtn').click(function() {
		let rno=$(this).attr('data-rno')
		let btn=$(this)
		$.ajax({
			type:'post',
			url:'../admin/reserveUpdate.do',
			data:{
				'rno':rno
			},
			success:function(){
				btn.text('승인완료')
				btn.removeClass('checkBtn')
			}
		})
	})
})
</script>

</head>
<body>

	<main class="container">
		<div class="col-12">
			<div class="bg-light rounded h-100 p-4">
				<h3 class="text-primary">
					<i class="fa fa-hashtag me-2"></i>회원목록
				</h3>

				<table class="table table-hover">
					<thead>
						<tr>
							<th width="10%" class="text-center">번호</th>
							<th width="15%" class="text-center"></th>
							<th width="45%" class="text-center">제목</th>
							<th width="30%" class="text-center"></th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="vo" items="${list}" varStatus="i">
							<tr>
								<td width="10%" class="text-center">${i.index+1}</td>
								<td width="15%" class="text-center">
									<img src="https://www.kobis.or.kr${vo.poster }">
								</td>
								<td width="45%">${vo.mtitle }</td>
								<td width="30%">
									<c:if test="${vo.state==0}">
										<span class="checkBtn" data-rno="${vo.rno}">승인</span>
									</c:if>
									<c:if test="${vo.state==1}">
										<span>승인완료</span>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
	</main>
</body>
</html>