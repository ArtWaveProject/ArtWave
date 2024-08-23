<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('.theaters').click(function() {
			let tname = $(this).val()
			$.ajax({
				type : 'post',
				url : '../movie/movieinfo.do',
				data : {
					"theaters" : tname
				},
				success : function(result) {
					$('#theater_list').html(result)
				},
				error : function(request, status, error) {
					console.log(error)
				}
			})
		})
		$('.dataTr').click(function() {
			let mno = $(this).attr("data-mno")
			let mposter = $(this).attr("data-mposter")
			let mtitle = $(this).attr("data-mtitle")
			let mgrade = $(this).attr("data-mgrade")
			$.ajax({
				type : 'post',
				url : '../movie/dateinfo.do',
				data : {
					"mno" : mno
				},
				success : function(result) {
					$('#rdate').html(result)
					$('#movie_poster').attr("src", mposter)
					$('#movie_title').text(mtitle)
					$('#movie_grade').text(mgrade)

					$('#r_mno').val(mno)
				},
				error : function(request, status, error) {
					console.log(error)
				}
			})
		})
	})
</script>
<style type="text/css">
.dataTr:hover {
	background-color: white;
	cursor: pointer;
}
</style>
</head>
<body>
	<table class="table">
		<tr>
			<th class="text-center" colspan="2">영화</th>
		</tr>
		<c:forEach var="vo" items="${moList }">  <!--  영화 제목 리스트 --> 
			<tr class="dataTr" data-mno="${vo.mno }"
				data-mposter="https://www.kobis.or.kr${vo.mposter }"
				data-mtitle="${vo.mtitle }" data-mgrade="${vo.mgrade }">
				<td class="text-center inline">
				<c:choose>
						<c:when test="${vo.mgrade eq '전체관람가'}">
							<img
								src="https://img.megabox.co.kr/static/pc/images/common/txt/ALL_46x46.png"
								alt="" width="30px" height="30px">
						</c:when>
						<c:when test="${vo.mgrade eq '12세이상관람가'}">
							<img
								src="https://img.megabox.co.kr/static/pc/images/common/txt/12_46x46.png"
								alt="" width="30px" height="30px">
						</c:when>
						<c:when test="${vo.mgrade eq '15세이상관람가'}">
							<img
								src="https://img.megabox.co.kr/static/pc/images/common/txt/15_46x46.png"
								alt="" width="30px" height="30px">
						</c:when>
						<c:when test="${vo.mgrade eq '청소년관람불가'}">
							<img
								src="https://img.megabox.co.kr/static/pc/images/common/txt/19_46x46.png"
								alt="" width="30px" height="30px">
						</c:when>
					</c:choose>
					</td>
				<td>${vo.mtitle }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>