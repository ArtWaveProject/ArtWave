<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style type="text/css">
.btn-info {
    color: #fff;
    background-color: #ffa657;
    border-color: #ffa657;
}
</style>
</head>
<body>
	<div class="col-12">
		<div class="bg-light rounded h-100 p-4">
			<h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>묻고답하기</h3>
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col" width="10%" align="center">번호</th>
						<th scope="col" width="45%" align="center">제목</th>
						<th scope="col" width="20%" align="center">작성자</th>
						<th scope="col" width="15%" align="center">작성일</th>
						<th scope="col" width="10%" align="center">답변상태</th>
					</tr>
				</thead>
				<tbody>
				<c:set var="count" value="${count }"/>
				<c:forEach var="vo" items="${arList }">
					<tr>
						<td width="10%" align="center">${count}</td>
						<td width="45%">
							<c:if test="${vo.group_step>0 }">
							&nbsp;&nbsp;
							</c:if>
						${vo.subject }
						</td>
						<td width="20%" align="center">${vo.name }</td>
						<td width="15%" align="center">${vo.dbday }</td>
						<td width="10%" align="center">
							<c:if test="${vo.isreply==0 }">
								<a href="../adminpage/reply_insert.do?no=${vo.no }" class="btn btn-info rounded-pill m-2">답변대기</a>	
							</c:if>
							<c:if test="${vo.isreply!=0 }">
								<span style="color:#FF8F0B;">답변완료</span>
							</c:if>
						</td>
					</tr>
					<c:set var="count" value="${count-1 }"/>
					</c:forEach>
				</tbody>
			</table>
			
			
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item disabled"><a class="page-link">Previous</a>
					</li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</nav>
			
			
		</div>
	</div>
</body>
</html>