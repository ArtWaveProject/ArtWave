<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</style>
</head>
<body>
	<div class="container" style="margin-top: 150px;">
		<div class="row">
			<div class="text-center">
				<form action="../music/find.do" method="post">
					<input type="text" name="ss" size="15" class="input input-sm">
					<input type="button" class="btn btn-sm btn-primary" value="검색">
				</form>
			</div>
		</div>
		<div class="row">
			<h3>최신 음악</h3>
			<div style="height: 30px;"></div>
			<div class="row">
				<c:forEach var="vo" items="${list}">
					<div class="col-sm-2" style="margin: 0px 0px 15px 0px;">
						<img src="${vo.poster}">
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8">
				<h3>실시간 차트</h3>
				<table class="table listChart">
					<c:forEach var="mvo" items="${mList}" varStatus="i">
						<tr style="vertical-align: middle;">
							<td width="5%" class="text-center">${i.index+1}</td>
							<td width="15%" class="text-center">
								<img src="${mvo.poster}" class="listImg">
							</td>
							<td width="51%">${mvo.title}</td>
							<td width="20%" class="text-center">${mvo.aname}</td>
							<td width="3%" class="text-center">
								<a>
									<img class="iconImg" src="play.png">
								</a>
							</td>
							<td width="3%" class="text-center">
								<a>+</a>
							</td>
							<td width="3%" class="text-center">
								<c:if test="${mvo.urlmp4!=null }">
									<a href="${mvo.urlmp4}" id="btn" target="_blank">
										<img class="iconImg" src="mv.png">
									</a>
								</c:if>
								<c:if test="${mvo.urlmp4==null }">
									<img class="iconImg" src="mvOff.png">
								</c:if>

							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="col-lg-8"></div>
		</div>
	</div>
</body>
</html>