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
				'mno':${detail.alno},
				'id':id,
				'type':2
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
	let length=$('#listBody tr').length
	console.log(length)
	if(length >5){
		$('#listBody tr:gt(4)').css('display', 'none')
	}
	else{
		$('#listBtn').css('display', 'none')
	}
	$('#listBtn').click(function(){
		if(listCheck===false){
			$('#listBody tr:gt(4)').css('display', '')
			listCheck=true
			$('#listBtn').val('접기')
		}
		else{
			$('#listBody tr:gt(4)').css('display', 'none')
			listCheck=false
			$('#listBtn').val('펼치기')
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
					<td rowspan="6"><img src="${detail.poster}" id="poster"></td>
					<th width="20%" class="text-center">앨범명</th>
					<td colspan="2" width="80%">${detail.atitle }</td>
				</tr>
				<tr>
					<th width="20%" class="text-center">아티스트</th>
					<td colspan="2" width="80%">${detail.aname }</td>
				</tr>
				<tr>
					<th width="20%" class="text-center">장르</th>
					<td colspan="2" width="80%">${detail.genre }</td>
				</tr>
				<tr>
					<th width="20%" class="text-center">발매일</th>
					<td colspan="2" width="80%">${detail.dbday }</td>
				</tr>
				<tr>
					<th width="20%" class="text-center">좋아요</th>
					<td width="40%">${detail.likecount}</td>
					<td><button id="likeBtn">
							<img src="" id="likeBtnIcon">
						</button></td>
				</tr>
			</table>
			<div>
				<input type="hidden" value="${sessionScope.id}" id="id">
				<h4>${detail.atitle}곡list</h4>
			</div>
			<table class="table">
				<tbody id="listBody">
					<c:forEach var="vo" items="${mList }">
						<tr style="vertical-align: middle; height: 70px; position:relative; z-index: 1">
							<td width="10%"><img src="${vo.poster}" id="musicPoster"></td>
							<td width="40%"><a href="../music/musicDetail.do?mno=${vo.mno}">${vo.title }</a></td>
							<td width="20%" style="text-align: center;"><a href="../music/artistDetail.do?ano=${vo.ano}">${vo.aname }</a></td>
							<td width="7%" style="text-align: center;">${vo.genre}</td>
							<td width="13%" style="text-align: center;">${vo.playcount }</td>
							<td width="10%" style="text-align: center;  padding: 0px;"><button class="playListBtn"
									style="border: none; background-color: transparent; font-size: 30px;">+</button>
								<ul class="menu" style="position: relative; z-index:2;">
									<li>1</li>
									<li>2</li>
									<li>3</li>
								</ul></td>
						</tr>
					</c:forEach>
				</tbody>
				<tr>
					<td colspan="5" style="text-align: center; border: none;"><input type="button" id="listBtn" value="펼치기"></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>