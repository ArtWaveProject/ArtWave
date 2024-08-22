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
		let id = $
		{
			id
		}
		$('#content').click(function() {
			if (id.length < 2) {
				alert('로그인이 필요합니다')
				$('#content').blur()
			} else {
				alert('확인')
			}
		})
		$('#replyBtn').click(function() {
			let content = $('#content').val()
			if (contnet.trim() === '') {
				alert('내용을 입력하세요')
				return			}
			$.ajax({
				
			})
		})
	})
	function replyList() {

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
				<tbody id="reply">
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