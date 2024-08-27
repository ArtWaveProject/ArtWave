<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

.btn-info {
	color: #fff;
	background-color: #ffa657;
	border-color: #ffa657;
}

.bg-light{
	margin-top : 150px;
}

.container{
  background-color: white
  border-radius: 10px
  margin-top:150px
            }
body {
    background-color: white;
}
table table-hover{
	border: none;
}
</style>
</head>
<body>
<div>
<div>
		<div class="container">
		<div class="col-12">
		<div class="bg-light rounded h-100 p-4">
			<h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>1:1문의등록</h3>
				<form method=post action="../replyboard/insert_ok.do">
					<table class="table">
						<tr>
							<th width=20% class="text-center">제목</th>
							<td width=80%>
								<input class="form-control mb-3" name="subject" type="text" placeholder="제목을 입력해주세요" aria-label="default input example">					
								<input type="hidden" name="no" value="${no}">
							</td>
						</tr>
						<tr>
							<th width="20%" class="text-center">내용</th>
							<td width="80%">
								<textarea class="form-control" name="content" placeholder="문의내용을 입력해주세요" 
								id="floatingTextarea" style="height: 800px;"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="text-center inline">
								<button type="submit" class="btn btn-outline-success m-2">등록</button>
								<input type=button value="취소" class="btn btn-outline-secondary m-2" onclick="javascript:history.back()">
							</td>
						</tr>
					</table>
				</form>
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