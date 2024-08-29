<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('#btn').click(function() {
			console.log($('#btn').attr('src'))
		})
	})
</script>
<style type="text/css">
h3 {
	color: black;
}

a {
	color: black;
}

.listImg {
	width: 45px !important;
	height: 45px !important;
}

.iconImg {
	width: 20px !important;
	height: 20px !important;
}

.listChart tr td {
	padding: 0px;
}

.btnhe {
	margin-bottom: 515px;
}
.sidebtn{
	height: 395px;
	margin-top: 49px;
}

.search-input input {
	width: 300px;
	height: 40px;
	border-radius: 20px;
	border: 1px solid #ccc;
	outline: none;
	background: #fff;
	color: #666;
	font-size: 14px;
	position: absolute;
	right: 332px;
	top: 204px;
	z-index: 0;
	padding-left: 15px;
}

.search-input button {
	border: none;
	background: transparent;
	position: absolute;
	right: 340px;
	top: 213px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let audio= new Audio()
function musicPlay(mno) {
	let id='${id}'
	if(id.length<1){
		alert('로그인이 필요합니다')
		return
	}
	$.ajax({
		type:'post',
		url:'../payment/paymentCheck.do',
		data:{
			'type':1,
			'gno':mno
		},
		success:function(result){
			if(result==='OK'){
				alert('구매후 재생 가능합니다')
				return
			}
			else{
				$.ajax({
					type:'post',
					url:'../music/musicUrl.do',
					data:{
						'mno':mno
					},
					success:function(result){
						audio.src=result
						audio.play()
					}
				})
			}
		}
	})
}
</script>
</head>
<body>
	<div class="container" style="margin-top: 150px;">
		<div class="row">
			<div style="height: 30px;"></div>
			<div class="row" style="padding: 30px; background: aliceblue; border-radius: 30px;">
				<div class="search-input" style="display: flex; align-items: center; justify-content: space-between; width: 100%;">
					<h3>최신 음악</h3>
					<form action="../music/find.do" method="post">
						<input type="text" placeholder="Type Something" id="searchText" name="ss" />
						<button type="submit" class="fa fa-search" style="border: none; background: transparent"></button>
					</form>
				</div>
				<div style="height: 30px;"></div>
				<c:forEach var="vo" items="${list}" varStatus="i">
					<div class="col-sm-2" style="margin: 0px 0px ${i.index>=6?'15px':'0px'} 0px; padding-top: 15px; background: white; border-radius:${i.index==0?'15px 0px 0px 0px;':i.index==5?'0px 15px 0px 0px;':i.index==11?'0px 0px 15px 0px;':i.index==6?'0px 0px 0px 15px;':''}">
						<img src="${vo.poster}" style="border-radius: 15px;">
						<a href="../music/musicDetail.do?mno=${vo.mno}">
							<span>${vo.title}</span><br>
						</a>
					</div>
				</c:forEach>
				<div class="col-lg-8">
					<h3>실시간 차트</h3>
					<div style="height: 15px;"></div>
					<div style="padding: 30px; background: white; border-radius: 20px;">
						<table class="table listChart">
							<c:forEach var="mvo" items="${mList}" varStatus="i">
								<tr style="vertical-align: middle;">
									<td width="5%" class="text-center">${i.index+1}</td>
									<td width="15%" class="text-center">
										<img src="${mvo.poster}" class="listImg">
									</td>
									<td width="50%">
										<a href="../music/musicDetail.do?mno=${mvo.mno}">${mvo.title}</a>
									</td>
									<td width="20%" class="text-center">
										<a href="../music/artistDetail.do?ano=${mvo.ano}">${mvo.aname}</a>
									</td>
									<td width="5%" class="text-center">
										<button type="button" style="border: none; background: transparent;" onclick="musicPlay(${mvo.mno})">
											<img class="iconImg" src="play.png">
										</button>
									</td>
									<td width="5%" class="text-center">
										<a href="${mvo.urlmp4}" id="btn" target="_blank">
											<img class="iconImg" src="mv.png">
										</a>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div id="carouselExampleIndicators" class="carousel slide col-lg-4" data-bs-ride="carousel">
					<h4 style="color: black"><a href="../music/alstoreList.do">Goods ></a></h4>
					<div class="carousel-indicators btnhe">
						<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
					</div>
					<div class="carousel-inner" style="margin-top:20px; border-radius: 20px;">
						<div class="carousel-item active">
							<img src="../music/img/083622.png" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="../music/img/083650.png" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="../music/img/083708.png" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="../music/img/083736.png" class="d-block w-100" alt="...">
						</div>
					</div>
					<button class="carousel-control-prev btncolor sidebtn" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next btncolor sidebtn" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>