<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.list-group li {
    height: 50px; /* 원하는 높이로 설정 */
    line-height: 50px; /* 수직 정렬을 위해 라인 높이 설정 (텍스트가 중앙에 오도록) */
    font-size: 18px
  }
  
.list-group li:hover {
      background-color: #f0ad4e; /* 마우스를 올렸을 때 배경색 변경 */
      color: white; /* 텍스트 색상 변경 */
  }
  
.list-group li a {
      color: inherit; /* 링크 색상을 상속받도록 설정 */
      text-decoration: none; /* 기본 밑줄 제거 */
      display: block; /* a 요소를 block으로 만들어 li 전체를 클릭 영역으로 설정 */
  }
</style>

</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<body>
	<div class="container2">
		<div class="row" style="margin-top:150px;">
		
		
			<div class="col-lg-2">
			
			
			<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">${sessionScope.id}님 로그인</h3>
					</div>		
			</div>
			
				<div class="panel panel-primary">				
					<div class="panel-heading">
						<h3 class="panel-title">회원 정보</h3>
					</div>
					
						<ul class="list-group">
							<li><a href="../adminpage/member_list.do">회원 리스트</a></li>
	
						</ul>
				</div>
				
				
				<div class="panel panel-warning">
					<div class="panel-heading">
						<h3 class="panel-title sinav ">결제관리</h3>
					</div>
					
						<ul class="list-group">
							<li><a href="">결제목록</a></li>
							<li><a href="../admin/adminReserve.do">예약관리</a></li>
						</ul>		
				</div>
				
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title sinav">고객센터</h3>
					</div>
					
						<ul class="list-group">
							<li><a href="../adminpage/reply_list.do">1:1문의</a></li>
							<li><a href="../adminpage/notice_list.do">공지사항</a></li>
							<li><a href=""></a></li>
						</ul>		
				</div>
			</div>
			
			<div>
				<jsp:include page="${admin_jsp}"></jsp:include>
			</div>
			
			
		</div>
	</div>
</body>
</html>