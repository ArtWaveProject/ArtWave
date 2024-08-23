<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.deleteBtn{
width: 15px;
height: 15px;
background: gray;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let state=-5
let id = '${id}'
	$(function() {
		replyList()
		$('#content').click(function() {
			if (id.length < 2) {
				alert('로그인이 필요합니다')
				$('#content').blur()
			}
		})
		$('#replyBtn').click(function() {
			let content = $('#content').val()
			if (content.trim() === '') {
				alert('내용을 입력하세요')
				return			}
			$.ajax({
				type:'post',
				url:'../board/replyInsert.do',
				data:{
					'fbno':${detail.fbno},
					'depth':1,
					'content':content
				},
				success:function(){
					$('#content').val('')
					replyList()
				}
			})
		})
	})
	function tableShow(frno) {
		if(frno===state){
			$('#table'+frno).css('display', 'none')
			state=-5
		}
		else{
			$('.reReplyTable').css('display', 'none')
			console.log(frno)
			$('#table'+frno).css('display', '')
			state=frno
		}
	}
	function replyList() {
		$.ajax({
			type:'post',
			url:'../board/replyList.do',
			data:{
				'fbno':${detail.fbno}
			},
			success:function(result){
				json=JSON.parse(result)
				let html=''
					html+='<table class="table">'
					json.map(function(reply) {
					html+='<tr>'
					if(reply.depth===1){
						html+='<td colspan="2" width="15%">'+reply.nick+'</td>'
					}
					else{
						html+='<td width="3%"></td>'
						html+='<td width="12%">'+reply.nick+'</td>'
					}
					if(reply.depth===1){
						html+='<td width="55%" style="cursor:pointer;" onclick="tableShow('+reply.frno+')"><pre>'+reply.content+'</pre>'
					}
					else{
						html+='<td width="55%"><pre style="margin-left:20px;">ㄴ'+reply.content+'</pre>'	
					}
					html+='</td>'
					if(reply.id===reply.sessionId){
						html+='<td width="25%" style="text-align:right;">'+reply.dbday+'</td>'
						html+='<td width="5%"><button type="button" class="deleteBtn" data-rno="'+reply.frno+'">x</button></td>'
					}
					else{
						html+='<td width="30%" style="text-align:right;">'+reply.dbday+'</td>'
					}
					html+='</tr>'
					if(reply.depth==1){
						html+='<tr>'
						html+='<td colspan="4" style="text-align:right; padding:0px; border:transparent;">'
						html+='<table class="table reReplyTable" id="table'+reply.frno+'" style="display:none;">'
						html+='<tr>'
						html+='<td width="85%" style="vertical-align: middle;">'
						html+='<textarea onclick="reReplyCheck('+reply.frno+')" id="content'+reply.frno+'" rows="3" cols="10" style="width: 85%; resize: none;"></textarea></td>'
						html+='<td width="15%" style="vertical-align: middle;">'
						html+='<input class="reReplyBtn" onclick="reReplyInsert('+reply.frno+')" type="button" style="width: 100%; height: 75px;" value="작성"></td>'
						html+='</tr>'
						html+='</table>'
						html+='</td>'
						html+='</tr>'
					}
				})
					html+='</table>'
				$('#reply').html(html)
			}
		})
	}
	function reReplyCheck(frno) {
		if (id.length < 2) {
			alert('로그인이 필요합니다')
			$('#content'+frno).blur()
			return
		}
	}
	function reReplyInsert(frno) {
		let content = $('#content'+frno).val()
		if (content.trim() === '') {
			alert('내용을 입력하세요')
			return
		}
		$.ajax({
			type:'post',
			url:'../board/replyInsert.do',
			data:{
				'fbno':${detail.fbno},
				'depth':2,
				'root':frno,
				'content':content
			},
			success:function(){
				$('#content'+frno).val('')
				tableShow(frno)
				replyList()
			}
		})
		function replyDelete() {
			
		}
	}
</script>
</head>
<body>
	<div class="container" style="margin-top: 150px;">
		<div class="row" style="width: 800px; margin: 0px auto;">
			<h4 class="text-center" style="margin-bottom: 25px;">글작성</h4>
			<table class="table">
				<tr>
					<td colspan="2">
						<span>[${type}]</span><span>${detail.fbsubject}</span>
					</td>
				</tr>
				<tr>
					<td width="80%">${detail.nick}&nbsp;&nbsp;|&nbsp;&nbsp;${detail.dbday}</td>
					<td width="20%" class="text-right">조회수 ${detail.fbhit}&nbsp;&nbsp; 댓글 ${count}개</td>
				</tr>
				<tr>
					<td colspan="2" style="height: 500px;">
						<pre>${detail.content}</pre>
					</td>
				</tr>
				<tr style="text-align: right;">
					<td colspan="2">
						<c:if test="${sessionScope.id==detail.id}">
							<input type="button" value="삭제" id="writeBtn">
							<input type="button" value="수정" id="writeBtn">
						</c:if>
						<input type="button" value="목록" onclick="javascript:history.back()">
					</td>
				</tr>
			</table>
			<table class="table">
				<thead>
					<tr>
						<td colspan="2">전체 댓글 ${count}개</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="2" id="reply" style="border: transparent; padding: 0px;"></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td width="85%" style="vertical-align: middle;">
							<textarea id="content" rows="3" cols="10" style="width: 100%; resize: none;"></textarea>
						</td>
						<td width="15%" style="vertical-align: middle;">
							<input id="replyBtn" type="button" style="width: 100%; height: 75px;" value="작성">
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</body>
</html>