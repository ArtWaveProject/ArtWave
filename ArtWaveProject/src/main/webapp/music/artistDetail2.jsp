<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#poster {
	width: 300px !important;
	height: 300px;
}

#musicPoster {
	width: 60px !important;
	height: 60px;
}

.musicPoster {
	width: 200px !important;
	height: 200px;
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

a {
	color: black !important;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
	let listCheck=false
	let likeCheck=false
	let id=$('#id').val()
	if(id.length>0){
		console.log(id)
		$.ajax({
			type:'post',
			url:'../music/musicLikeCheck.do',
			data:{
				'mno':${detail.ano},
				'type':3
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
		let ano=$('#ano').val()
		if(likeCheck===true){
			$.ajax({
				type:'post',
				url:'../music/musicLikeOff.do',
				data:{
					'mno':ano,
					'type':3
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
				url:'../music/musicLikeOn.do',
				data:{
					'mno':ano,
					'type':3
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
})
</script>
</head>
<body>
	<div class="container">
		<div class="row" style="margin-top: 150px;">
			<table class="table">
				<tr>
					<td rowspan="7">
						<img src="${detail.poster}" id="poster">
					</td>
					<th width="20%" class="text-center">이름</th>
					<td width="80%" colspan="2">${detail.aname}</td>
				</tr>
				<tr>
					<th width="20%" class="text-center">활동유형</th>
					<td width="80%" colspan="2">${detail.type}</td>
				</tr>
				<tr>
					<th width="20%" class="text-center">데뷔</th>
					<td width="80%" colspan="2">${detail.debutyear}</td>
				</tr>
				<tr>
					<th width="20%" class="text-center">데뷔곡</th>
					<td width="80%" colspan="2">${detail.debutsong}</td>
				</tr>
				<tr>
					<th width="20%" class="text-center">국적</th>
					<td width="80%" colspan="2">${detail.nation}</td>
				</tr>
				<tr>
					<th width="20%" class="text-center">좋아요</th>
					<td width="40%" id="likeCount">${detail.likecount}</td>
					<td>
						<button id="likeBtn">
							<img src="" id="likeBtnIcon">
						</button>
					</td>
				</tr>
				<tr>
					<td colspan="3">${detail.content }</td>
				</tr>
			</table>
			<div style="height: 20px;"></div>
			<div class="row">
				<h4>${detail.aname}&nbsp;앨범 LIST</h4>
				<c:forEach var="avo" items="${aList }">
					<div class="col-sm-3">
						<div class="text-center">
							<a href="../music/albumDetail.do?alno=${avo.alno}">
								<img src="${avo.poster}" style="border-radius: 23px;" class="musicPoster">
								<p class="text-center">${avo.atitle }</p>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div style="height: 20px;"></div>
		<div class="row">
			<h4>${detail.aname}곡list</h4>
			<table class="table">
				<tbody id="listBody">
					<c:forEach var="vo" items="${mList }">
						<tr style="vertical-align: middle; height: 70px; position: relative; z-index: 1">
							<td width="10%">
								<img src="${vo.poster}" id="musicPoster">
							</td>
							<td width="57%">
								<a href="../music/musicDetail.do?mno=${vo.mno}">${vo.title }</a>
							</td>
							<td width="20%" style="text-align: center;">
								<a href="../music/artistDetail.do?ano=${vo.ano}">${vo.aname}</a>
							</td>
							<td width="13%" style="text-align: center;">${vo.playcount }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<input type="hidden" value="${sessionScope.id}" id="id">
	<input type="hidden" value="${detail.ano}" id="ano">
</body>
</html>