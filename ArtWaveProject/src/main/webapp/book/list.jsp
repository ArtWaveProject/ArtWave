<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Most Popular Games</title>
<style type="text/css">
.item {
    display: flex;
    flex-direction: column;
    align-items: left;
}

.thumb {
    position: relative;
    overflow: hidden;
}

.thumb img {
    width: 100%; /* 이미지가 부모 요소의 너비에 맞게 조정되도록 */
    height: auto; /* 이미지의 비율을 유지하도록 설정 */
    border-radius: 23px;
}

.down-content {
    text-align: left;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    padding: 10px; /* 텍스트와 이미지 사이의 여백 설정 */
}

.down-content p {
    margin: 0; /* 문단의 기본 여백 제거 */
}

.live-stream .thumb {
    position: relative;
    overflow: hidden;
    margin-bottom: 0px;
}
.live-stream small {
  font-size: 12px;
  color: #757575;
  white-space: nowrap;
  overflow: hidden; 
  text-overflow: ellipsis;"
}
.search {
    position: relative;
    display: flex; /* flexbox를 사용하여 아이콘과 입력창을 정렬 */
    justify-content: flex-end; /* 오른쪽 정렬 */
    margin-top: -25px; /* 검색창을 더 위로 이동 (값을 조정하여 위치 조정) */
    margin-bottom: -25px;
}

.search-input {
    background-color: #f5f5f5; /* 배경색 설정 */
    width: 300px;
    height: 40px;
    border-radius: 20px;
    border: 1px solid #ccc; /* 연한 회색 테두리 추가 */
    color: #666;
    font-size: 14px;
    padding: 0 15px; /* 여백 설정 */
    box-shadow: 0 2px 4px rgba(0,0,0,0.1); /* 부드러운 그림자 추가 */
}

.search-input input {
    width: calc(100% - 30px); /* 입력창 크기 조정 */
    height: 100%;
    border: none;
    outline: none;
    background: transparent; /* 배경을 투명하게 설정 */
    color: #666;
    font-size: 14px;
}

.search-input i {
    position: absolute;
    right: 10px; /* 아이콘과 입력창 사이의 여백 설정 */
    top: 50%;
    transform: translateY(-50%);
    color: #999;
    cursor: pointer; /* 아이콘에 클릭 가능한 느낌 추가 */
}
.heading-section h3 {
  color: #FFFFFF;
  font-size: 34px;
  text-decoration: none;
  margin-top: -30px;
  margin-bottom: -45px;
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
</style>
</head>
<body>
	<div class="container">
	<div class="row">
            <div class="col-lg-8" style="margin-top: 150px;">
              <div class="featured-games header-text">
                <div class="heading-section">
                  <span>최신 도서</span>
                </div>
                <div class="owl-features owl-carousel">
                  <div class="item">
                    <div class="thumb">
                      <img src="../assets/images/featured-01.jpg" alt="">
                      <div class="hover-effect">
                        <h6>2.4K Streaming</h6>
                      </div>
                    </div>
                    <h4>CS-GO<br><span>249K Downloads</span></h4>
                    <ul>
                      <li><i class="fa fa-star"></i> 4.8</li>
                      <li><i class="fa fa-download"></i> 2.3M</li>
                    </ul>
                  </div>
                  <div class="item">
                    <div class="thumb">
                      <img src="../assets/images/featured-02.jpg" alt="">
                      <div class="hover-effect">
                        <h6>2.4K Streaming</h6>
                      </div>
                    </div>
                    <h4>Gamezer<br><span>249K Downloads</span></h4>
                    <ul>
                      <li><i class="fa fa-star"></i> 4.8</li>
                      <li><i class="fa fa-download"></i> 2.3M</li>
                    </ul>
                  </div>
                  <div class="item">
                    <div class="thumb">
                      <img src="../assets/images/featured-03.jpg" alt="">
                      <div class="hover-effect">
                        <h6>2.4K Streaming</h6>
                      </div>
                    </div>
                    <h4>Island Rusty<br><span>249K Downloads</span></h4>
                    <ul>
                      <li><i class="fa fa-star"></i> 4.8</li>
                      <li><i class="fa fa-download"></i> 2.3M</li>
                    </ul>
                  </div>
                  <div class="item">
                    <div class="thumb">
                      <img src="../assets/images/featured-01.jpg" alt="">
                      <div class="hover-effect">
                        <h6>2.4K Streaming</h6>
                      </div>
                    </div>
                    <h4>CS-GO<br><span>249K Downloads</span></h4>
                    <ul>
                      <li><i class="fa fa-star"></i> 4.8</li>
                      <li><i class="fa fa-download"></i> 2.3M</li>
                    </ul>
                  </div>
                  <div class="item">
                    <div class="thumb">
                      <img src="../assets/images/featured-02.jpg" alt="">
                      <div class="hover-effect">
                        <h6>2.4K Streaming</h6>
                      </div>
                    </div>
                    <h4>Gamezer<br><span>249K Downloads</span></h4>
                    <ul>
                      <li><i class="fa fa-star"></i> 4.8</li>
                      <li><i class="fa fa-download"></i> 2.3M</li>
                    </ul>
                  </div>
                  <div class="item">
                    <div class="thumb">
                      <img src="../assets/images/featured-03.jpg" alt="">
                      <div class="hover-effect">
                        <h6>2.4K Streaming</h6>
                      </div>
                    </div>
                    <h4>Island Rusty<br><span>249K Downloads</span></h4>
                    <ul>
                      <li><i class="fa fa-star"></i> 4.8</li>
                      <li><i class="fa fa-download"></i> 2.3M</li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          <!-- ***** Featured Games End ***** -->
		<div class="row">
			<div class="col-lg-12">
				<div class="page-content">
					<div class="heading-section">
						<h3>Book List</h3>
					</div>
					<div class="search">
						<div class="search-input">
							<i class="fa fa-search"></i> <input type="text"
								placeholder="Type Something" id="searchText"
								name="searchKeyword" onkeypress="handle" />
						</div>
					</div>
					<div class="live-stream">
						<div class="col-lg-12"></div>
						<div class="row">
							<c:forEach var="vo" items="${bList}" varStatus="i">
								<div class="col-lg-3 col-sm-6" style="text-align: center;">
									<div class="item">
										<div class="thumb">
											<a href="../book/detail.do?bno=${vo.bno }" class="thumb-link">
												<img src="${vo.cover }" alt="${vo.btitle }"
												style="width: 200px; height: 250px;">
											</a>
											<div class="hover-effect">
												<div class="content">
													<ul>
														<li><a href="#"><i class="fa fa-heart"
																style="margin-right: 8px;"></i> like</a></li>
														<li><a href="#"><i class="fa fa-cart-plus"
																style="margin-right: 8px;"></i> to cart</a></li>
													</ul>
												</div>
											</div>
										</div>
										<div class="down-content" style="margin-left: 18px;">
											<p>${vo.btitle }</p>
											<small>${vo.writer }${vo.writer != null ? ' 저 | ' : ''}${vo.publisher }</small><br>
											<p>${vo.price }원</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
		<nav>
			<ul class="page page-lg">
				<c:if test="${startPage > 1}">
					<li><a href="../book/list.do?page=${startPage-1}">&laquo;
							Previous</a></li>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<li ${i == curpage ? "class='current'" : ""}><a
						href="../book/list.do?page=${i}">${i}</a></li>
				</c:forEach>
				<c:if test="${endPage < totalpage}">
					<li><a href="../book/list.do?page=${endPage+1}">Next
							&raquo;</a></li>
				</c:if>
			</ul>
		</nav>
	</div>
 </div>	
	<!-- ***** Live Stream End ***** -->
</body>
</html>