<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>

<style type="text/css">
.gradeBtn {
	border: transparent;
	background: transparent;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
function memberGrade(type, id) {
	let url=''
	$.ajax({
		type:'post',
		url:'../admin/memberGrade.do',
		data:{
			'id':id,
			'type':type
		},
		success:function(result){
			json=JSON.parse(result)
			if(json.result=='OK'){
				$('#grade'+id).text(json.grade)
			}
			else{
				if(type==1){
					alert('더 이상 등급을 올릴 수 없습니다')
				}
				else{
					alert('더 이상 등급을 내릴 수 없습니다')
				}
			}
		}
	})
}
</script>

</head>
<body>
	<main class="container">
		<div class="col-12">
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col" width="4%"></th>
						<th scope="col" width="6%" class="text-center">등급</th>
						<th scope="col" width="17%" class="text-center">id</th>
						<th scope="col" width="15%" class="text-center">이름</th>
						<th scope="col" width="20%" class="text-center">이메일</th>
						<th scope="col" width="29%" class="text-center">전화번호</th>
						<th scope="col" width="9%" class="text-center"></th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="vo" items="${memberList}" varStatus="status">
						<tr>
							<td width="4%" class="text-center">${status.count}</td>
							<td width="6%" class="text-center" id="grade${vo.id}">${vo.grade}</td>
							<td width="17%" class="text-center">${vo.id}</td>
							<td width="15%" class="text-center">${vo.name}</td>
							<td width="20%" class="text-center">${vo.email}</td>
							<td width="29%" class="text-center">${vo.phone}</td>
							<td width="9%" class="text-center">
								<button class="gradeBtn" type="button" onclick="memberGrade(1, '${vo.id}')">
									<i class="fa-solid fa-angles-up"></i>
								</button>
								<button class="gradeBtn" type="button" onclick="memberGrade(2, '${vo.id}')">
									<i class="fa-solid fa-angles-down"></i>
								</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<table class="text-center" style="margin: auto;">
				<tr class="text-center">
					<td class="text-center">
						<a href="../adminpage/member_list.do?page=${curPage > 1?curPage - 1:curPage}" class="btn btn-sm btn-success">이전</a>
						<span class="mx-2">${curPage} page / ${totalPage} page</span>
						<a href="../adminpage/member_list.do?page=${curPage < totalPage?curPage + 1:curPage}" class="btn btn-sm btn-info">다음</a>
					</td>
				</tr>
			</table>
		</div>
	</main>
</body>
</html>