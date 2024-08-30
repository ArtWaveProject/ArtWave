<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.table>tbody>tr>td {
	vertical-align: middle !important;
}

a {
	color: black !important;
}

.caret {
	display: none !important;
}

.toggleMenu::hover {
	background: transparent !important;
}

.toggleMenu::after {
	content: none; /* 가상 요소 내용 제거 */
}

.dropmenu {
	position: absolute; /* 위치를 절대값으로 지정 */
	z-index: 1000; /* 드랍메뉴가 맨 위로 올라오도록 z-index 설정 */
	display: none; /* 기본적으로 드랍메뉴를 숨김 */
	background-color: white; /* 드랍메뉴 배경색 지정 */
}

.dropUl {
	width: 190px;
	z-index: 999;
}

.dropUl li {
	padding: 0px 3px;
	height: 100%;
}

.dropUl li span {
	font-size: 15px;
	cursor: pointer;
	display: block;
	margin: 5px 0px;
}

h1, h2, h3, h4, h5, h6 {
	color: black;
}

#poster {
	width: 450px !important;
	height: 450px;
	border-radius: 30px;
}

.rowLylics {
	width: 54%;
}

.rowColor {
	padding: 30px;
	background: white;
	border-radius: 25px;
}

#musicPoster {
	width: 60px !important;
	height: 60px;
	border-radius: 5px;
}

#listBtn {
	border: none;
	background-color: transparent;
}

#likeBtn {
	width: 30px;
	height: 30px;
	padding: 0px;
	background-color: transparent;
	border: none;
	margin: 0px;
}

.btnIcon {
	padding: 0px;
	width: 60px;
	height: 30px;
	background-color: transparent;
	border: 1px solid #bbb;
	border-radius: 5px;
	margin: 0px;
	background-color: transparent;
}

a {
	color: black;
}
</style>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
var IMP = window.IMP; 
IMP.init("imp68206770"); 
function requestPay(json,name,price) {
    IMP.request_pay({
        pg: "html5_inicis",
        pay_method: "card",
        merchant_uid: "ORD20180131-0000011",   // 주문번호
        name: name,
        amount: price,         // 숫자 타입
        buyer_email: json.email,
        buyer_name: json.name,
        buyer_tel: json.phone,
        buyer_addr: json.address,
        buyer_postcode: json.post
    }, function (rsp) { // callback
    	alert('구매완료')
    });
}
$(function() {
	let listCheck=false
	let likeCheck=false
	let id=$('#id').val()
	playListList()
	if(id.length>0){
		console.log(id)
		$.ajax({
			type:'post',
			url:'../like/likeCheck.do',
			data:{
				'tno':${detail.mno},
				'type':1
			},
			success:function(result){
				if(result==='OK'){
					likeCheck=true
					$('#likeBtnIcon').attr('src', 'like_on.png')
				}
				else{
					likeCheck=false
					$('#likeBtnIcon').attr('src', 'like_off.png')
				}
			}
		})
	}
	else{
		$('#likeBtn').css('display', 'none')
	}
	$('#likeBtn').click(function() {
		let mno=$('#mno').val()
		if(likeCheck===true){
			$.ajax({
				type:'post',
				url:'../like/likeOff.do',
				data:{
					'tno':mno,
					'type':1
				},
				success:function(result){
					if(result>=0){
						likeCheck=false
						$('#likeBtnIcon').attr('src', 'like_off.png')
						$('#likeCount').text(result)
					}
				}
			})
		}
		else{
			$.ajax({
				type:'post',
				url:'../like/likeOn.do',
				data:{
					'tno':mno,
					'type':1
				},
				success:function(result){
					if(result>=0){
						likeCheck=true
						$('#likeBtnIcon').attr('src', 'like_on.png')
						$('#likeCount').text(result)
					}
				}
			})
		}
	})
	$('#buy').click(function(){
		let gno=${detail.mno}
		let price=400
		let account=1
		let name='${detail.title}'
		let id=$('#id').val()
		if(id.length<2){
			alert('로그인이 필요합니다')
			return
		}
		$.ajax({
			type:'post',
			url:'../payment/paymentCheck.do',
			data:{
				'gno':gno,
				'type':1
			},
			success:function(result){
				if(result==='OK'){
					$.ajax({
						type:'post',
						url:'../payment/paymentInsert.do',
						data:{
							"gno":gno,
							"price":price,
							"account":account,
							'type':1,
							'title':name
							},
						success:function(result)
						{
							let json=JSON.parse(result)
						  console.log(json)
							requestPay(json,name,price)
						}
					})
				}
				else{
					alert('이미 구매한 음악입니다')
					return
				}
			}
		})
		
	})
})
function playListMake() {
	let plname=$('#playListName').val()
	if(plname.trim()===''){
		alert('이름을 입력해주세요')
		$('#playListName').focus()
		return 
	}
	$.ajax({
		type:'post',
		url:'../music/playListMake.do',
		data:{'plname':plname},
		success:function(){
			alert('플레이리스트를 생성했습니다')
			$('#playListName').val('')
			playListList()
		}
	})
}
function playListList() {
	let id=$('#id').val()
	$.ajax({
		type:'post',
		url:'../music/playListList.do',
		success:function(result){
			json=JSON.parse(result)
			console.log(json)
			html=''
			if(id.length>2){
			html+='<li style="width:190px;"><span style="height: 20px; cursor:pointer; display:block;" class="playlistBtn" data-toggle="modal" data-target="#myModal">플레이리스트 추가</span></li>'
			}
			else{
			html+='<li style="width:190px;"><span style="height: 20px; display:block;" class="playlistBtn" >로그인이 필요합니다</span></li>'
			}
			json.map(function(playlist) {
				html+='<li style="width:190px;"><span style="height:20px; cursor:pointer; display:block;" onclick="playListMusicInsert(this, '+playlist.plno+')">'+playlist.plname+'</span></li>'
			})
			$('.dropUl').html(html)
		}
	})
}
function playListMusicInsert(li, plno){
	let no=$(li).parent().parent().attr('data-mno')
	console.log(no)
	console.log(plno)
	$.ajax({
		type:'post',
		url:'../music/playListMusicInsert.do',
		data:{
			'mno':no,
			'plno':plno
		},
		success:function(result){
			if(result==='OK'){
				alert('플레이리스트에 추가했습니다')
			}
			else{
				alert('이미 플레이리스트에 존재하는 음악입니다')
			}
		}
	})
}
function musicPlay() {
	let id=$('#id').val()
	let mno=${detail.mno}
	if(id.length<2){
		alert('로그인이 필요합니다')
		return
	}
	$.ajax({
		type:'post',
		url:'../payment/paymentCheck.do',
		data:{
			'gno':mno,
			'type':1
		},
		success:function(result){
			if(result==='OK'){
				alert('구매후 재생 가능합니다')
				return
			}
			else{
				updatePlayCount(mno)
				let audio= new Audio('${detail.urlmp3}')
				audio.play()
			}
		}
	})
}
function updatePlayCount(mno) {
	$.ajax({
		type:'post',
		url:'../music/playcountIncremnt.do',
		data:{
			'mno':mno
		},
		success:function(result){
			$('#playcount').text(result)
		}
	})
}
</script>
</head>
<body>
	<div class="container">
		<div class="row" style="margin-top: 150px; padding: 40px; background: aliceblue; border-radius: 30px;">
			<div class="rowColor">
				<table class="table">
					<tr>
						<td rowspan="11">
							<img src="${detail.poster}" id="poster">
						</td>
						<th width="20%" class="text-center">제목</th>
						<td width="80%">${detail.title}</td>
					</tr>
					<tr>
						<th width="20%" class="text-center">앨범명</th>
						<td width="80%">
							<a href="../music/albumDetail.do?alno=${detail.alno}">${detail.altitle}</a>
						</td>
					</tr>
					<tr>
						<th width="20%" class="text-center">아티스트</th>
						<td width="80%">
							<a href="../music/artistDetail.do?ano=${detail.ano}">${detail.aname}</a>
						</td>
					</tr>
					<tr>
						<th width="20%" class="text-center">장르</th>
						<td width="80%">${detail.genre}</td>
					</tr>
					<tr>
						<th width="20%" class="text-center">작사가</th>
						<td width="80%">
							<c:forEach var="cvo" items="${cList}" varStatus="i">${i.index!=0?'|&nbsp;':''}<a href="../music/artistDetail.do?ano=${cnList[i.index]}" class="artistLink">${cvo}</a>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<th width="20%" class="text-center">작곡가</th>
						<td width="80%">
							<c:forEach var="lvo" items="${lList}" varStatus="i">${i.index!=0?'|&nbsp;':''}<a href="../music/artistDetail.do?ano=${lnList[i.index]}" class="artistLink">${lvo}</a>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<th width="20%" class="text-center">편곡자</th>
						<td width="80%">
							<c:forEach var="avo" items="${aList}" varStatus="i">${i.index!=0?'|&nbsp;':''}<a href="../music/artistDetail.do?ano=${anList[i.index]}" class="artistLink">${avo}</a>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<th width="20%" class="text-center">재생시간</th>
						<td width="80%">${detail.playtime }</td>
					</tr>
					<tr>
						<th width="20%" class="text-center">재생횟수</th>
						<td width="80%" id="playcount">${detail.playcount }</td>
					</tr>
					<tr>
						<th width="20%" class="text-center">좋아요</th>
						<td width="40%" id="likeCount">${detail.likecount}</td>
					</tr>
					<tr>
						<td colspan="2" class="inline">
							<button type="button" style="background: transparent;" class="btnIcon" onclick="musicPlay()">듣기</button>
							<button type="button" class="btnIcon" id="buy">구매</button>
							<ul class="nav" style="display: inline-block; position: relative;">
								<li class="dropdown">
									<button class="btnIcon">추가</button>
									<ul class="dropmenu dropUl" data-mno="${detail.mno}">
									</ul>
								</li>
							</ul>
							<button type="button" id="likeBtn">
								<img src="" id="likeBtnIcon">
							</button>
						</td>
					</tr>
				</table>
			</div>
			<div style="height: 20px;">
				<input type="hidden" value="${sessionScope.id}" id="id">
				<input type="hidden" value="${detail.mno}" id="mno">
			</div>
			<div class="rowLylics" style="margin: 20px 20px 20px 0px; background: white; padding: 20px; border-radius: 20px;">
				<h4 style="margin-bottom: 10px;">가사</h4>
				<pre style="background: white;">${detail.lylics}</pre>
			</div>
			<div class="col-lg-5" style="margin: 20px 0px 20px 20px; background: white; padding: 20px 20px 0px 20px; border-radius: 20px;">
				<h4 style="margin-bottom: 10px;">${detail.aname}곡list</h4>
				<table class="table">
					<tbody id="listBody">
						<c:forEach var="vo" items="${mList }">
							<tr style="vertical-align: middle; height: 70px; position: relative;">
								<td width="10%">
									<img src="${vo.poster}" id="musicPoster">
								</td>
								<td width="55%">
									<a href="../music/musicDetail.do?mno=${vo.mno}">${vo.title }</a>
								</td>
								<td width="25%" style="text-align: center;">
									<a href="../music/artistDetail.do?ano=${vo.ano}">${vo.aname}</a>
								</td>
								<td width="10%" style="text-align: center; padding: 0px; position: relative;">
									<ul class="nav" style="display: inline; position: relative;">
										<li class="dropdown">
											<span class="toggleMenu"><i class="fas fa-list"></i></span>
											<ul class="dropmenu dropUl" data-mno="${vo.mno}">
											</ul>
										</li>
									</ul>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<h2 class="text-center">플레이리스트 생성</h2>
				<div class="modal-body">
					<input type="text" id="playListName">
					<input type="button" value="생성" onclick="playListMake()">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>