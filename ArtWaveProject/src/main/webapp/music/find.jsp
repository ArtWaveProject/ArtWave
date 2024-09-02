<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style type="text/css">
a {
	color: black;
}

.caret {
	display: none !important;
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
	padding: 0px !important;
	vertical-align: middle !important;
}

.row .row {
	padding: 30px;
	background: white;
}

.toggleMenu::hover {
	background: transparent !important;
}

.toggleMenu::after {
	content: none; /* 가상 요소 내용 제거 */
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
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let audio= new Audio()
$(function() {
	playListList()
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
			html+='<li><span style="height: 20px; display:block;" class="playlistBtn" data-toggle="modal" data-target="#myModal">플레이리스트 추가</span></li>'
			}
			else{
			html+='<li><span style="height: 20px; display:block;" class="playlistBtn" >로그인이 필요합니다</span></li>'
			}
			json.map(function(playlist) {
				html+='<li><span style="height:20px; display:block;" onclick="playListMusicInsert(this, '+playlist.plno+')">'+playlist.plname+'</span></li>'
			})
			$('.dropUl').html(html)
		}
	})
}
function playListMusicInsert(li, plno){
	let no=$(li).parent().parent().attr('data-mno')
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
function musicPlay(mno) {
	let id=$('#id').val()
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
						$.ajax({
							type:'post',
							url:'../music/playcountIncremnt.do',
							data:{
								'mno':mno
							}
				})
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
		<div class="row" style="background: aliceblue; padding: 30px;">
			<div class="rowColor" style="padding: 30px; background: white;">
				<h2>곡 검색결과 : ${musicCount }건</h2>
				<table class="table listChart">
					<tr>
						<th width="5%" class="text-center">번호</th>
						<th width="7%" class="text-center"></th>
						<th width="73%" class="text-center">곡정보</th>
						<th width="5%" class="text-center">듣기</th>
						<th width="5%" class="text-center">추가</th>
						<th width="5%" class="text-center">MV</th>
					</tr>
					<c:forEach var="mvo" items="${mList}" varStatus="i">
						<tr style="vertical-align: middle;">
							<td width="5%" class="text-center">${i.index+1}</td>
							<td width="7%" class="text-center">
								<img src="${mvo.poster}" class="listImg">
							</td>
							<td width="73%">
								<a href="../music/musicDetail.do?mno=${mvo.mno}">${mvo.title}</a>
								<br>
								<a href="../music/artistDetail.do?ano=${mvo.ano}">${mvo.aname}</a>
							</td>
							<td width="5%" class="text-center">
								<button type="button" style="background: transparent;border: none;" onclick="musicPlay(${mvo.mno})">
									<img class="iconImg" src="play.png">
								</button>
							</td>
							<td width="5%" class="text-center">
								<ul class="nav" style="display: inline; position: relative;">
									<li class="dropdown">
										<span class="toggleMenu"><i class="fas fa-list"></i></span>
										<ul class="dropmenu dropUl" data-mno="${mvo.mno}">
										</ul>
									</li>
								</ul>
							</td>
							<td width="5%" class="text-center">
							<c:if test="${mvo.titlecheck==1}">
								<a href="${mvo.urlmp4}" id="btn" target="_blank">
									<img class="iconImg" src="mv.png">
								</a>
							</c:if>
							<c:if test="${mvo.titlecheck==0}">
								<span id="btn">
									<img class="iconImg" src="mvOff.png">
								</span>
							</c:if>
							</td>
						</tr>
					</c:forEach>
				</table>
				<div style="text-align: right;">
				<a href="../music/musicList.do?ss=${ss}" style="text-align: right;">검색결과 더보기</a>
				</div>
			</div>
			<div style="height: 50px;"></div>
			<div class="row">
				<h2>앨범 검색결과 ${albumCount }건</h2>
				<div class="text-center">
					<div class="row" style="">
						<c:forEach var="alvo" items="${alList }">
							<div class="col-sm-3">
								<a href="../music/albumDetail.do?alno=${alvo.alno}">
									<img src="${alvo.poster }"> ${alvo.atitle }
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
				<a href="../music/albumList.do?ss=${ss }" style="text-align: right;">검색결과 더보기</a>
			</div>
			<div style="height: 50px;"></div>
			<div class="row">
				<h2>아티스트 검색결과 ${artistCount }건</h2>
				<div class="text-center">
					<div class="row" style="">
						<c:forEach var="avo" items="${aList }">
							<div class="col-sm-3">
								<a href="../music/artistDetail.do?ano=${avo.ano}">
									<img src="${avo.poster }"> ${avo.aname}
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
				<a href="../music/artistList.do?ss=${ss}" style="text-align: right;">검색결과 더보기</a>
			</div>
		</div>
	</div>
	<!-- Modal -->
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
	<input type="hidden" value="${sessionScope.id}" id="id">
</body>
</html>