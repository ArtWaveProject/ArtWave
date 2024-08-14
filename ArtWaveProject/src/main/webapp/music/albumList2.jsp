<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="live-stream">
		<div class="col-lg-12">
			<div class="heading-section">
				<h4>
					<em>Most Popular</em> Live Stream
				</h4>
			</div>
		</div>
		<div class="row">
			<c:forEach var="vo" items="${list}">
				<div class="col-sm-3">
					<div class="item">
						<div class="thumb">
							<img src="${vo.poster}">
							<div class="hover-effect">
								<div class="content">
									<ul>
										<li>
											<a href="#">
												<i class="fa fa-eye"></i> 다운로드
											</a>
										</li>
										<li>
											<a href="#">
												<i class="fa fa-gamepad"></i> 북마크
											</a>
										</li>
									</ul>
								</div>
							</div>
							<div class="down-content">
								<span><i class="fa fa-check"></i> ${vo.atitle}</span>
								<h4>${vo.aname }</h4>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			<div class="col-lg-3 col-sm-6">
				<div class="item">
					<div class="thumb">
						<img src="assets/images/stream-05.jpg" alt="">
						<div class="hover-effect"></div>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>