<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>DASHMIN - Bootstrap Admin Template</title>
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
</head>
<body>
<div class="container-xxl position-relative bg-white d-flex p-0">
	<div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-light navbar-light">
                <a href="index.html" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>ArtWave</h3>
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                        <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </div>
                    <div class="ms-3">
                        <h6 class="mb-0"> 관리자 아이디 </h6>
                        <span>Admin등급</span>
                    </div>
                </div>
                <div class="navbar-nav w-100">
               
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">회원관리</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="button.html" class="dropdown-item">회원 리스트</a>
                            <a href="#" class="dropdown-item">빈페이지</a>
                            <a href="#" class="dropdown-item">빈페이지</a>
                        </div>
                    </div>
                    
          					<div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">결제관리</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="#" class="dropdown-item">결제 목록</a>
                            <a href="#" class="dropdown-item">빈페이지</a>
                        </div>
                    </div>
                    
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">신고 게시판</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="#" class="dropdown-item">빈페이지</a>
                            <a href="#" class="dropdown-item">빈페이지</a>
                        </div>
                    </div>
                    
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">고객센터</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="#" class="dropdown-item">1:1문의</a>
                            <a href="#" class="dropdown-item">공지사항</a>
                            <a href="#" class="dropdown-item">사전 질문 게시판</a>
                            <a href="#" class="dropdown-item">실시간 상담</a>
                        </div>
                    </div>
                </div>
            </nav>
 			  </div>
        <!-- 사이드바 영역 -->
        
        <!-- 테이블 영역 -->
        <div class="content">
        	<div class="container-fluid pt-4 px-4">
             <div class="col-sm-12">
                        <div class="bg-light rounded h-100 p-4">
                            <h6 class="mb-4">회원 목록</h6>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col">회원 번호</th>
                                        <th scope="col">회원 등급</th>
                                        <th scope="col">회원 id</th>
                                        <th scope="col">이름</th>
                                        <th scope="col">전화번호</th>
                                        <th scope="col">Email</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>black</td>
                                        <td>hr</td>
                                        <td>John</td>
                                        <td>010-1234-5678</td>
                                        <td>jhon@email.com</td>
                                    </tr>
                                    
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Mark</td>
                                        <td>happy</td>
                                        <td>Otto</td>
                                        <td>010-1111-1111</td>
                                        <td>mark@email.com</td>
                                    </tr>
                                    
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>Mark</td>
                                        <td>happy</td>
                                        <td>Otto</td>
                                        <td>010-1111-1111</td>
                                        <td>mark@email.com</td>
                                    </tr>
                                    
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Mark</td>
                                        <td>happy</td>
                                        <td>Otto</td>
                                        <td>010-1111-1111</td>
                                        <td>mark@email.com</td>
                                    </tr>
                                    
                                    <tr>
                                        <th scope="row">5</th>
                                        <td>Mark</td>
                                        <td>happy</td>
                                        <td>Otto</td>
                                        <td>010-1111-1111</td>
                                        <td>mark@email.com</td>
                                    </tr>
                                    
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Mark</td>
                                        <td>happy</td>
                                        <td>Otto</td>
                                        <td>010-1111-1111</td>
                                        <td>mark@email.com</td>
                                    </tr>
                                    
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Mark</td>
                                        <td>happy</td>
                                        <td>Otto</td>
                                        <td>010-1111-1111</td>
                                        <td>mark@email.com</td>
                                    </tr>
                                    
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Mark</td>
                                        <td>happy</td>
                                        <td>Otto</td>
                                        <td>010-1111-1111</td>
                                        <td>mark@email.com</td>
                                    </tr>
                                    
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Mark</td>
                                        <td>happy</td>
                                        <td>Otto</td>
                                        <td>010-1111-1111</td>
                                        <td>mark@email.com</td>
                                    </tr>
                                    
                                    <tr>
                                        <th scope="row">10</th>
                                        <td>Mark</td>
                                        <td>happy</td>
                                        <td>Otto</td>
                                        <td>010-1111-1111</td>
                                        <td>mark@email.com</td>
                                    </tr>
                                    
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Mark</td>
                                        <td>happy</td>
                                        <td>Otto</td>
                                        <td>010-1111-1111</td>
                                        <td>mark@email.com</td>
                                    </tr>
                                    
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Mark</td>
                                        <td>happy</td>
                                        <td>Otto</td>
                                        <td>010-1111-1111</td>
                                        <td>mark@email.com</td>
                                    </tr>
                                    
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Mark</td>
                                        <td>happy</td>
                                        <td>Otto</td>
                                        <td>010-1111-1111</td>
                                        <td>mark@email.com</td>
                                    </tr>
                                    
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Mark</td>
                                        <td>happy</td>
                                        <td>Otto</td>
                                        <td>010-1111-1111</td>
                                        <td>mark@email.com</td>
                                    </tr>
                                    
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Mark</td>
                                        <td>happy</td>
                                        <td>Otto</td>
                                        <td>010-1111-1111</td>
                                        <td>mark@email.com</td>
                                    </tr>
                                </tbody>
                                
                            </table>
														<nav aria-label="Page navigation example">
															<ul class="pagination justify-content-center">
																<li class="page-item disabled"><a class="page-link">Previous</a>
																</li>
																<li class="page-item"><a class="page-link" href="#">1</a></li>
																<li class="page-item"><a class="page-link" href="#">2</a></li>
																<li class="page-item"><a class="page-link" href="#">3</a></li>
																<li class="page-item"><a class="page-link" href="#">Next</a>
																</li>
															</ul>
														</nav>
								
													</div>
                    </div>
                 </div>
               </div>
         <!-- 테이블 끝 -->

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