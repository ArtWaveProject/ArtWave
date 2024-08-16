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

        <div class="page-content2">
            <!-- ***** 영화목록 메뉴 시작 ***** -->
        <div class="btn2-category-container">
            <a id="listbtn" href="../movie/movielist1.do" class="btn2-category ${activeCategory == 'box-office' ? 'active' : ''}">박스오피스</a>
            <a id="listbtn"href="../movie/movielist2.do" class="btn2-category ${activeCategory == 'independent-art' ? 'active' : ''}">독립＆예술영화</a>
        </div>
        <div class="search-input2">
            <form id="search2" action="#">
                <input type="text" placeholder="영화 제목" id='searchText' name="searchKeyword" onkeypress="handle(event)" />
                <i class="fa fa-search"></i>
            </form>
        </div>
        <!-- ***** 영화목록 메뉴 끝 ***** -->
           <!-- ***** 영화목록 시작 ***** -->
           <div class="container">
                   <div class="row">
                        <c:forEach var="vo" items="${mlList1 }" varStatus="s">
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
                            <p>${mlList1 }</p>
                        </c:forEach>
                    </div>
           
            <!-- ***** 버튼 내용 끝 ***** -->
            <!-- ***** 페이지 나누기 시작*****-->
         <nav>
            <ul class="pagination">
                <c:if test="${curpage > 1}">
                    <li class="page-item"><a class="page-link" href="../movie/movielist1.do?page=${curpage - 1}">&laquo; 이전</a></li>
                </c:if>
                <c:forEach var="i" begin="${startPage}" end="${endPage}">
                    <li class="page-item ${i == curpage ? 'active' : ''}">
                        <a class="page-link" href="../movie/movielist1.do?page=${i}">${i}</a>
                    </li>
                </c:forEach>
                <c:if test="${curpage < totalpage}">
                    <li class="page-item"><a class="page-link" href="../movie/movielist1.do?page=${curpage + 1}">다음 &raquo;</a></li>
                </c:if>
            </ul>
        </nav>
      <!-- ***** 페이지 나누기 끝*****-->
      </div>
      </div>
  <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
  </body>
</html>
