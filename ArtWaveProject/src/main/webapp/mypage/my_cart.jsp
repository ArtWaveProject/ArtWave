<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.page {
	padding: 0;
	margin: 20px 0;
	display: flex;
	justify-content: center;
	font-family: Arial, sans-serif;
}

.page {
	list-style: none;
	padding: 0;
	margin: 20px auto; /* 위와 아래 여백을 추가하고 자동으로 가운데 정렬 */
	display: flex;
	justify-content: center; /* 네비게이션 항목을 가운데로 정렬 */
	font-family: Arial, sans-serif;
}

.page li {
	margin: 0 3px; /* 네비게이션 항목 간의 여백 */
}

.page a {
	text-decoration: none;
	color: #0197A3; /* 링크 색상 */
	padding: 8px 12px;
	border: 1px solid #0197A3; /* 링크 테두리 색상 */
	border-radius: 4px; /* 둥근 모서리 */
	transition: background-color 0.3s, color 0.3s; /* 부드러운 색상 변화 */
}

.page a:hover {
	background-color: #0197A3; /* 호버 시 배경색 */
	color: #fff; /* 호버 시 텍스트 색상 */
}

.page .current a {
	background-color: #0197A3; /* 현재 페이지 배경색 */
	color: #fff; /* 현재 페이지 텍스트 색상 */
	border: 1px solid #0197A3; /* 현재 페이지 테두리 색상 */
	pointer-events: none; /* 현재 페이지 클릭 방지 */
}

.page .current a:hover {
	background-color: #0197A3; /* 현재 페이지 호버 시 배경색 */
	color: #fff; /* 현재 페이지 호버 시 텍스트 색상 */
}

.page li:first-child a {
	border-radius: 4px 0 0 4px; /* 왼쪽 끝 모서리 둥글게 */
}

.page li:last-child a {
	border-radius: 0 4px 4px 0; /* 오른쪽 끝 모서리 둥글게 */
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

.genreTable {
	border: transparent;
	margin-top: 15px;
	margin-bottom: -1px;
}

.genreTable td {
	padding: 0px;
	vertical-align: middle;
}

.genreTable td a {
	text-align: center;
	color: #aaa;
	display: block;
	width: 100%;
	border: 2px solid #aaa;
	border-bottom: 2px solid #777;
	border-right: none;
	border-radius: 7px 7px 0px 0px;
	height: 35px;
	vertical-align: middle;
	background: white;
	font-size: 13px;
	padding-top: 6px;
}

.genreTable td:first-child a {
	
}

.genreTable td:last-child a {
	width: 100%;
	border: 2px solid #aaa;
}

.genreTable .active a {
	border-left: 2px solid #777 !important;
	border-top: 2px solid #777 !important;
	border-right: 2px solid #777 !important;
	border-bottom: 2px solid #777 !important;
	background-color: white;
}

.genreTable .anext a {
	border-left: none !important;
}

.genreTable td {
	padding: 0px !important;
	border: none;
}

.bono {
	border: none !important;
}

#middle {
	vertical-align: middle !important;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function() {
    $('.xbtn').click(function() {
        let tno = $(this).attr('data-tno');

        $.ajax({
            type: 'POST',
            url: '../mypage/deleteItem.do',
            data: {
                'tno': tno
            },
            success: function(response) {
                if (response.trim() === 'ok') { // 서버 응답이 'ok'인 경우
                    alert('삭제 완료');
                    location.reload(); // 페이지 새로 고침
                } else {
                    alert('다시 시도해 주세요');
                }
            },
            error: function() {
                alert('서버 오류가 발생했습니다.');
            }
        });
    });
});


</script>
</head>
<body>
	<div class="container" style="margin-top: 10px;">
		<div class="listBody">
			<table class="table genreTable">
				<tr>
					<td width="11%" class="tcartBtn ${tcart==1?'active':''}"><a
						href="../mypage/my_cart.do?tcart=1">전체</a><input type="hidden"
						value="${sessionScope.id}" id="id"></td>
					<td width="11%"
						class="tcartBtn ${tcart==2?'active':tcart==1?'anext':''}"><a
						href="../mypage/my_cart.do?tcart=2">도서</a></td>
					<td width="11%"
						class="tcartBtn ${tcart==3?'active':tcart==2?'anext':''}"><a
						href="../mypage/my_cart.do?tcart=3">음악</a></td>
				</tr>
			</table>
			<table class="table listChart" id="middle">
				<tr>
					<c:if test="${tcart == 1}">
						<th width="10%" class="text-center">번호</th>
						<th width="15%" class="text-center"></th>
						<th width="40%" class="text-center">제목</th>
						<th width="20%" class="text-center">분류</th>
						<th width="15%" class="text-center">금액</th>
					</c:if>

					<c:if test="${tcart == 2}">
						<th width="10%" class="text-center">번호</th>
						<th width="15%" class="text-center"></th>
						<th width="40%" class="text-center">제목</th>
						<th width="20%" class="text-center">작가</th>
						<th width="15%" class="text-center">금액</th>
					</c:if>
					<c:if test="${tcart == 3}">
						<th width="10%" class="text-center">번호</th>
						<th width="15%" class="text-center"></th>
						<th width="40%" class="text-center">제목</th>
						<th width="20%" class="text-center">가수</th>
						<th width="15%" class="text-center">금액</th>
					</c:if>
				</tr>

				<c:if test="${tcart == 1}">
					<c:forEach var="all" items="${allcart}" varStatus="i">
						<tr style="vertical-align: middle; height: 50px;">
							<td width="10%" class="text-center">${(curPage-1)*50+i.index+1}</td>

							<c:choose>
								<c:when test="${all.bovo.cover != null}">
									<td width="13%" class="text-center"><a
										href="../book/detail.do?bno=${all.bovo.bno}"> <img
											src="${all.bovo.cover}" class="listImg">
									</a></td>
								</c:when>
								<c:when test="${all.alvo.aphoto != null}">
									<td width="13%" class="text-center"><a
										href="../music/alstoreDetail.do?alno=${all.alvo.ano}"> <img
											src="${all.alvo.aphoto}" class="listImg">
									</a></td>
								</c:when>
							</c:choose>

							<c:choose>
								<c:when test="${all.bovo.btitle != null}">
									<td width="38%" class="text-center"><span
										class="listTitle"> <a
											href="../book/detail.do?bno=${all.tno }">${all.bovo.btitle}</a></span>
									</td>
								</c:when>
								<c:when test="${all.alvo.aname != null}">
									<td width="38%" class="text-center"><span
										class="listTitle"> <a
											href="../music/alstoreDetail.do?alno=${all.alvo.ano}">${all.alvo.aname}</a></span>
									</td>
								</c:when>
							</c:choose>

							<c:choose>
								<c:when test="${all.bovo.btitle != null }">
									<td width="18%"><span class="listArtist">도서</span></td>
								</c:when>
								<c:when test="${all.alvo.aname != null }">
									<td width="18%"><span class="listArtist">음악</span></td>
								</c:when>
							</c:choose>

							<c:choose>
								<c:when test="${all.bovo.btitle != null }">
									<td width="13%"><span class="listArtist">${all.bovo.sale_price}
											원</span></td>
								</c:when>
								<c:when test="${all.bovo.btitle != null }">
									<td width="13%"><span class="listArtist">${all.alvo.aprice}
											원</span></td>
								</c:when>
							</c:choose>
							<td width="8%">
							<input type="button" data-tno="${all.tno}"
							class="xbtn" src="../mypage/xBtn.png">
							</td>
						</tr>
					</c:forEach>
				</c:if>

				<c:if test="${tcart == 2}">
					<c:forEach var="bl" items="${bocart}" varStatus="i">
						<tr style="vertical-align: middle; height: 50px;">
							<td width="10%" class="text-center">${(curPage-1)*50+i.index+1}</td>

							<td width="13%" class="text-center"><a
								href="../book/detail.do?bno=${all.bovo.bno}"> <img
									src="${bl.bovo.cover}" class="listImg">
							</a></td>

							<td width="38%" class="text-center"><span class="listTitle">
									<a href="../book/detail.do?bno=${bl.bovo.bno }">${bl.bovo.btitle}</a>
							</span></td>

							<td width="18%"><span class="listArtist">${bl.bovo.writer}</span>
							</td>

							<td width="13%"><span class="listArtist">${bl.bovo.sale_price}
									원</span></td>
							<td width="8%">
							<input type="button" data-tno="${bl.bovo.bno }"
							class="xbtn" src="../mypage/xBtn.png"></td>
						</tr>
					</c:forEach>
				</c:if>

				<c:if test="${tcart == 3}">
					<c:forEach var="mul" items="${ascart}" varStatus="i">
						<tr style="vertical-align: middle; height: 50px;">
							<td width="10%" class="text-center">${(curPage-1)*50+i.index+1}</td>

							<td width="13%" class="text-center"><a
								href="../music/alstoreDetail.do?mno=${mul.alvo.ano}"> <img
									src="${mul.alvo.aphoto}" class="listImg">
							</a></td>

							<td width="38%"><span class="listTitle"><a
									href="../music/alstoreDetail.do?mno=${mul.alvo.ano}">${mul.alvo.aname}</a></span>
							</td>

							<td width="18%"><span class="listArtist"><a
									href="../music/alstoreDetail.do?ano=${mul.alvo.ano}">${mul.alvo.aartist}</a></span>
							</td>
							<td width="13%"><span class="listArtist">${mul.alvo.aprice}
									원</span></td>
							<td width="8%">
							<input type="button" data-tno="${mul.alvo.ano}"
								class="xbtn" src="../mypage/xBtn.png">
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
	</div>
</body>
</html>
