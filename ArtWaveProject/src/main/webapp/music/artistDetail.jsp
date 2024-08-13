<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.main-profile {
	margin-top: 150px;
}

.col-lg-12 {
	width: 900px;
	margin: 0px auto;
}
h1, h2, h3, h4, h5, h6{
color: black;
}
</style>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<div class="main-profile ">
				<div class="row">
					<div class="col-lg-4">
						<img src="${detail.poster }" style="border-radius: 23px; height: 80px; width: 80px;">
					</div>
					<div class="col-lg-4 align-self-center">
						<div class="main-info header-text">
							<h4>${detail.aname }</h4>
							<p>${detail.content }</p>
							<div class="main-border-button">
								<a href="#">Start Live Stream</a>
							</div>
						</div>
					</div>
					<div class="col-lg-4 align-self-center">
						<ul>
							<li>
								활동유형 <span>${detail.type}</span>
							</li>
							<li>
								데뷔 <span>${detail.debutyear}</span>
							</li>
							<li>
								데뷔곡 <span>${detail.debutsong}</span>
							</li>
							<li>
								국적 <span>${detail.nation }</span>
							</li>
							<li>
								좋아요 <span>${detail.likecount }</span>
							</li>
						</ul>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="clips">
							<div class="row">
								<div class="col-lg-12">
									<div class="heading-section">
										<h4>
											<em>${detail.aname}'s</em>Album
										</h4>
									</div>
								</div>
								<c:forEach var="avo" items="${aList }">
									<div class="col-sm-3">
										<div class="item">
											<div class="thumb">
												<img src="${avo.poster}" alt="" style="border-radius: 23px;">
											</div>
											<div class="down-content">
												<h4>${avo.atitle }</h4>
											</div>
										</div>
									</div>
								</c:forEach>
								<div class="col-lg-12">
									<div class="main-button">
										<a href="#">Load More Clips</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ***** Banner End ***** -->

	<!-- ***** Gaming Library Start ***** -->
	<div class="gaming-library profile-library">
		<div class="col-lg-12">
			<div class="heading-section">
				<h4>
					<em>${detail.aname}'s</em>Music
				</h4>
			</div>
			<c:forEach var="mvo" items="${mList}">
				<div class="item">
					<ul>
						<li style="width: 15%">
							<img src="${mvo.poster }" alt="" class="templatemo-item">
						</li>
						<li style="width: 25%">
							<h4>${mvo.title}</h4>
						</li>
						<li style="width: 25%">
							<h4>${mvo.altitle}</h4>
						</li>
						<li style="width: 5%">
							<h4>${mvo.likecount}</h4>
						</li>
						<li style="width: 30%">
							<div class="main-border-button border-no-active">
								<a href="#">Donwloaded</a>
							</div>
						</li>
					</ul>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>