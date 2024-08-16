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
			<h2>곡</h2>
			<table>
				<tr>
					<th width="5%" class="text-center">번호</th>
					<th width="15%" class="text-center"></th>
					<th width="50%" class="text-center">곡정보</th>
					<th width="10%" class="text-center">듣기</th>
					<th width="10%" class="text-center">추가</th>
					<th width="10%" class="text-center">MV</th>
				</tr>
				<c:forEach var="vo" items="${mList}">
				<tr>
					<td width="5%" class="text-center">번호</td>
					<td width="15%" class="text-center"></td>
					<td width="50%" class="text-center">곡정보</td>
					<td width="10%" class="text-center"><a><img src="play.png" width="100%"></a></td>
					<td width="10%" class="text-center"><a>+</a></td>
					<td width="10%" class="text-center"><a><img src="mv.png" width="100%"></a></td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>