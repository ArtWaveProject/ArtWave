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
	/* 	margin-left: 30px; 
 */
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
<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="container" style="margin-top: 10px;">
		<div class=" listBody">
			<table class="table listChart" id="middle">
				<tr>
					<th width="10%" class="text-center">번호</th>
					<th width="15%" class="text-center"></th>
					<th width="40%" class="text-center">제목</th>
					<th width="20%" class="text-center">분류</th>
					<th width="15%" class="text-center"></th>
				</tr>
				<c:forEach var="al" items="${allike}" varStatus="i">
					<tr style="vertical-align: middle; height: 50px;">
						<td width="10%" class="text-center">${(curPage-1)*50+i.index+1}</td>
						<td width="15%" class="text-center">
						</td>
						<td width="40%">
						</td>
						<td width="20%">
						</td>
						<td width="15%">
						</td>
					</tr>
					<tr>
					<td colspan="6">
					<table class="table">
					<tr>
					<th class="text-center">제목</th>
					<td class="text-center" id="title${i.index+1}"></td>
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