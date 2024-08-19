<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#poster {
	width: 450px !important;
	height: 450px;
}

#musicPoster {
	width: 60px !important;
	height: 60px;
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
a{
color: black;
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
				'mno':${detail.mno},
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
				url:'../music/musicLikeOff.do',
				data:{
					'mno':mno,
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
				url:'../music/musicLikeOn.do',
				data:{
					'mno':mno,
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
})
</script>
</head>
<body>
	<div class="container">
		<div class="row" style="margin-top: 150px; padding: 25px;">
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
					<td width="80%">${detail.altitle}</td>
				</tr>
				<tr>
					<th width="20%" class="text-center">아티스트</th>
					<td width="80%">${detail.aname}</td>
				</tr>
				<tr>
					<th width="20%" class="text-center">장르</th>
					<td width="80%">${detail.genre}</td>
				</tr>
				<tr>
					<th width="20%" class="text-center">작사가</th>
					<td width="80%">
						<c:forEach var="cvo" items="${cList}" varStatus="i">${i.index!=0?'|':''}<a href="#" class="artistLink">${cvo}</a>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th width="20%" class="text-center">작곡가</th>
					<td width="80%">
						<c:forEach var="lvo" items="${lList}" varStatus="i">${i.index!=0?'|':''}<a href="#" class="artistLink">${lvo}</a>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th width="20%" class="text-center">편곡자</th>
					<td width="80%">
						<c:forEach var="avo" items="${aList}" varStatus="i">${i.index!=0?'|':''}<a href="#" class="artistLink">${avo}</a>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th width="20%" class="text-center">재생시간</th>
					<td width="80%">${detail.playtime }</td>
				</tr>
				<tr>
					<th width="20%" class="text-center">재생횟수</th>
					<td width="80%">${detail.playcount }</td>
				</tr>
				<tr>
					<th width="20%" class="text-center">좋아요</th>
					<td width="40%" id="likeCount">${detail.likecount}</td>
				</tr>
				<tr>
					<td colspan="2" class="text-right">
						<input type="button" value="듣기">
						<input type="button" value="구매">
						<button id="likeBtn">
							<img src="" id="likeBtnIcon">
						</button>
					</td>
				</tr>
			</table>
			<div>
				<input type="hidden" value="${sessionScope.id}" id="id">
				<input type="hidden" value="${detail.mno}" id="mno">
			</div>
			<div class="col-lg-7">
				<pre>${detail.lylics}</pre>
			</div>
			<div class="col-lg-5">
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
	</div>
</body>
</html>