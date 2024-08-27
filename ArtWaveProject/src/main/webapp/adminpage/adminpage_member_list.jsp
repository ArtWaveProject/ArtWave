<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">

<!-- Tempus Dominus Bootstrap 4 CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.39.0/css/tempusdominus-bootstrap-4.min.css" />

<!-- jQuery first -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- Then Bootstrap -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Moment.js -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

<style type="text/css">
table{
	margin:	auto;
}
</style>


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
							<th scope="col" width="5%"></th>
							<th scope="col" width="10%" align="center">등급</th>
							<th scope="col" width="20%" class="text-center">id</th>
							<th scope="col" width="20%" class="text-center">이름</th>
							<th scope="col" width="20%" class="text-center">이메일</th>
							<th scope="col" width="30%" class="text-center">전화번호</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="vo" items="${memberList}" varStatus="status">
							<tr>
								<td width="5%" class="text-center">${status.count}</td>
								<td width="10%" class="text-center">${vo.grade}</td>
								<td width="20%" class="text-center">${vo.id}</td>
								<td width="20%" class="text-center">${vo.name}</td>
								<td width="10%" class="text-center">${vo.email}</td>
								<td width="30%" class="text-center">${vo.phone}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			

			<table class="text-center">
			 <tr class="text-center">
				 <td class="text-center"> 
					       <c:choose>
						    <c:when test="${curpage > 1}">
						        <a href="../adminpage/member_list.do?page=${curpage - 1}" class="btn btn-sm btn-success">이전</a>
						    </c:when>
						    <c:otherwise>
						        <a href="#" class="btn btn-sm btn-success disabled">이전</a>
						    </c:otherwise>
						</c:choose>
						
						<span class="mx-2">${curpage} page / ${totalpage} pages</span>
						
						<c:choose>
						    <c:when test="${curpage < totalpage}">
						        <a href="../adminpage/member_list.do?page=${curpage + 1}" class="btn btn-sm btn-info">다음</a>
						    </c:when>
						    <c:otherwise>
						        <a href="#" class="btn btn-sm btn-info disabled">다음</a>
						    </c:otherwise>
						</c:choose>
						
		     		</td>
		     	</tr>
		     </table>
		     <!-- 
		     			<nav aria-label="Page navigation">
				<ul class="pagination justify-content-center">
					<c:if test="${startPage > 1}">
						<li class="page-item"><a class="page-link"
							href="../adminpage/member_list.do?page=${startPage-1}">&laquo;
								이전</a></li>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<li class="page-item ${i == curpage ? 'active' : ''}"><a
							class="page-link" href="../adminpage/member_list.do?page=${i}">${i}</a>
						</li>
					</c:forEach>
					<c:if test="${endPage < totalpage}">
						<li class="page-item"><a class="page-link"
							href="../adminpage/member_list.do?page=${endPage+1}">다음
								&raquo;</a></li>
					</c:if>
				</ul>
			</nav>
		-->
	</div>

		</div>
	</main>
</body>
</html>