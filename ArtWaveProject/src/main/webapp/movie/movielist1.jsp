<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="../movie/mstyle.css">
<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css">
<link rel="stylesheet" href="../assets/css/fontawesome.css">
<title>Insert title here</title>
<script type="text/javascript">
function handle(event) {
    if (event.key === 'Enter') {
        event.preventDefault();
        // 검색 처리
        console.log('검색어:', document.getElementById('searchText').value);
    }
}
</script>
</head>
<body>
<div class="container">
        <div class="page-content2">
            <!-- ***** 영화목록 메뉴 시작 ***** -->
            <!-- ***** 탭 메뉴 시작 ***** -->
            <ul class="nav nav-tabs2 mb-4" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="box-office-tab" href="../movie/movielist1.do" role="tab" aria-controls="box-office" aria-selected="true">박스오피스</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="independent-art-tab" href="../movie/movielist2.do" role="tab" aria-controls="independent-art" aria-selected="false">독립＆예술영화</a>
                </li>
                <li class="nav-item ml-auto">
                    <div class="search-input2">
                        <form id="search2" action="#">
                            <input type="text" placeholder="영화 제목" id='searchText' name="searchKeyword" onkeypress="handle(event)" />
                            <i class="fa fa-search"></i>
                        </form>
                    </div>
                </li>
            </ul>
            <!-- ***** 탭 메뉴 끝 ***** -->
           <!-- ***** 탭 내용 시작 ***** -->
         
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="box-office" role="tabpanel" aria-labelledby="box-office-tab">
                    <div class="row">
                        <c:forEach var="vo" items="${mlList1}" varStatus="s">
                            <div class="col-md-3">
                                <div class="item">
                                    <div class="thumb">
                                        <a href="#"><img src="https://www.kobis.or.kr${vo.mposter}" alt="${vo.mtitle}"></a>
                                    </div>
                                    <div class="hover-effect">
                                        <div class="content">
                                            <ul>
                                                <li><a href="#"><i class="fa fa-eye"></i> 상세보기</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="down-content">
                                        <div class="avatar2">
                                            <c:choose>
                                                <c:when test="${vo.mgrade eq '전체관람가'}">
                                                    <img src="https://img.megabox.co.kr/static/pc/images/common/txt/ALL_46x46.png" alt="" >
                                                </c:when>
                                                <c:when test="${vo.mgrade eq '12세이상관람가'}">
                                                    <img src="https://img.megabox.co.kr/static/pc/images/common/txt/12_46x46.png" alt="" >
                                                </c:when>
                                                <c:when test="${vo.mgrade eq '15세이상관람가'}">
                                                    <img src="https://img.megabox.co.kr/static/pc/images/common/txt/15_46x46.png" alt="" >
                                                </c:when>
                                                <c:when test="${vo.mgrade eq '청소년관람불가'}">
                                                    <img src="https://img.megabox.co.kr/static/pc/images/common/txt/19_46x46.png" alt="" >
                                                </c:when>
                                            </c:choose>
                                        </div>
                                        <h4>${vo.mtitle}</h4>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
        
                </div>
           
            <!-- ***** 탭 내용 끝 ***** -->
            <!-- ***** 페이지 나누기 시작*****-->
       
        <!-- ***** 페이지 나누기 끝*****-->
        </div>
    </div>
    </div>
         <nav class="pagination">
        <ul class="pagination">
          <c:if test="${startPage>1}">
           <li><a href="../movie/movielist1.do?page=${startPage-1 }">&laquo; 이전</a></li>
          </c:if>
           <c:forEach var="i" begin="${startPage }" end="${endPage }">
            <li ${i==curpage?"class=current":""}><a href="../movie/movielist1.do?page=${i }">${i }</a></li>
           </c:forEach>
           
          <c:if test="${endPage<totalpage }">
           <li><a href="../movie/movielist1.do?page=${endPage+1}">다음 &raquo;</a></li>
          </c:if>
        </ul>
      </nav>
  <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
  </body>
</html>
