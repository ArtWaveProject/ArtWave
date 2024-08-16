<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div style="height: 30px;"></div>
			<div class="row">
				<c:forEach var="vo" items="${list}">
					<div class="col-sm-2">
					<img src="${vo.poster}">
					</div>
				</c:forEach>
			</div>
			<div class="col-lg-8">
				<h3>실시간 차트</h3>
				<table class="table">
					<c:forEach var="mvo" items="${mList}" varStatus="i">
						<tr>
							<td width="5%" class="text-center">${i.index+1}</td>
							<td width="15%" class="text-center">${mvo.poster}</td>
							<td width="39%">${mvo.title}</td>
							<td width="20%" class="text-center">${mvo.aname}</td>
							<td width="7%" class="text-center">
								<a>
									<img src="play.mng">
								</a>
							</td>
							<td width="7%" class="text-center">
								<a>+</a>
							</td>
							<td width="7%" class="text-center">
								<a>
									<img src="mv.mng">
								</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>