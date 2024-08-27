<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">


    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
<title>Insert title here</title>
<style type="text/css">
.btn-info {
	color: #fff;
	background-color: #ffa657;
	border-color: #ffa657;
}

.bg-light{
	margin-top:150px;
}

.table td{
	height: 80px;	
}
.container {
  background-color: white;
  border-radius: 10px;
            }
body {
    background-color: white;
}

.text-primary {
  background: linear-gradient(
    113.07441835248278deg,
    rgba(255, 156, 156, 1) 7.897508384699059%,
    rgba(255, 156, 156, 1) 11.040067389186005%,
    rgba(255, 147, 5, 1) 89.43417444706309%
  );
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  color: transparent;
}
</style>
</head>
<body>
<div>
	<div>
	<div class="container">
		<div class="col-12">
			<div class="bg-light rounded h-100 p-4">
				<h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>1:1 문의하기
				</h3>

				<table class=table>
					<tr>
						<td><a href="../replyboard/insert.do"
							class="btn btn-info rounded-pill m-2">등록</a></td>
					</tr>
				</table>


				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col" width="10%">번호</th>
							<th scope="col" width="40%">제목</th>
							<th scope="col" width="10%">작성자</th>
							<th scope="col" width="15%">작성일</th>
							<th scope="col" width="25%">답변상태</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="count" value="${count }" />
						<c:forEach var="vo" items="${rbList }">
							<tr>
								<td width="10%" align="center">${vo.no}</td>
								<td width="40%"><c:if test="${vo.group_step>0 }">
							&nbsp;&nbsp;
							</c:if> ${vo.subject }</td>
								<td width="10%">${vo.name }</td>
								<td width="15%">${vo.dbday }</td>
								<td width="25%"><c:if test="${vo.isreply==0 }">
										<span class="btn btn-info rounded-pill m-2">답변대기</span>
									</c:if> <c:if test="${vo.isreply!=0 }">
										<span style="color: #FF8F0B;">답변완료</span>
									</c:if></td>
							</tr>
							<c:set var="count" value="${count-1 }" />
						</c:forEach>
					</tbody>
				</table>

				<table>
					<tr class="text-center">
						<td class="text-center"><c:choose>
								<c:when test="${curpage > 1}">
									<a href="../replyboard/list.do?page=${curpage - 1}"
										class="btn btn-sm btn-success">이전</a>
								</c:when>
								<c:otherwise>
									<a href="#" class="btn btn-sm btn-success disabled">이전</a>
								</c:otherwise>
							</c:choose> <span class="mx-2">${curpage} page / ${totalpage} pages</span> <c:choose>
								<c:when test="${curpage < totalpage}">
									<a href="../replyboard/list.do?page=${curpage + 1}"
										class="btn btn-sm btn-info">다음</a>
								</c:when>
								<c:otherwise>
									<a href="#" class="btn btn-sm btn-info disabled">다음</a>
								</c:otherwise>
							</c:choose></td>
					</tr>
				</table>
				<!--   
			<nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <c:if test="${startPage > 1}">
						    <li class="page-item">
						        <a class="page-link" href="../adminpage/reply_list.do?page=${startPage-1}">&laquo; 이전</a>
						    </li>
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
						    <li class="page-item ${i==curpage?'active':''}">
						        <a class="page-link" href="../adminpage/reply_list.do?page=${i}">${i}</a>
						    </li>
						</c:forEach>
						<c:if test="${endPage < totalpage}">
						    <li class="page-item">
						        <a class="page-link" href="../adminpage/reply_list.do?page=${endPage+1}">다음 &raquo;</a>
						    </li>
						</c:if>
                    </ul>
                </nav>
		-->

			</div>
		</div>
	</div>
	</div>
	</div>
	<!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/chart/chart.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>
</html>