<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	font-family: Arial, sans-serif;
}

.header {
	text-align: center;
	margin-bottom: 20px;
}

.header h4 {
	font-size: 30px;
	color: black;
}

.table {
	width: 100%;
	border-collapse: collapse;
}

.table td, .table th {
	padding: 12px;
	border: 1px solid #ddd;
	text-align: left;
}

.text-center {
	text-align: center;
}

.text-right {
	text-align: right;
}

.button {
	background-color: #007bff;
	color: white;
	border: none;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	border-radius: 4px;
	transition: background 0.3s;
}

.button:hover {
	background-color: #0056b3;
}

.button.cancel {
	background-color: #dc3545;
}

.button.cancel:hover {
	background-color: #c82333;
}

.button.edit {
	background-color: #28a745;
}

.button.edit:hover {
	background-color: #218838;
}

.deleteBtn {
	background: none;
	border: none;
	font-size: 15px;
	width: 0px;
	height: 0px;
	color: red;
	cursor: pointer;
	margin-left: -5px;
}

.reply-section textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	resize: vertical;
	font-size: 16px;
	margin-top:
}

.reply-section input[type="button"] {
	width: 80%;
	height: 60px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
	transition: background 0.3s, transform 0.3s;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	margin-top: -5px;
}

.reReplyBtn {
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
	transition: background 0.3s, transform 0.3;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.reReplyBtn:hover {
	background-color: #0056b3;
	transform: scale(1.02);
}

.reReplyBtn:active {
	background-color: #004494;
	transform: scale(0.98);
}

.reply-section input[type="button"]:hover {
	background-color: #0056b3;
	transform: scale(1.02);
}

.reply-section input[type="button"]:active {
	background-color: #004494;
	transform: scale(0.98);
}

#writeBtn {
	height: 44px;
	display: inline-block;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
		$('#deleteBtn').click(function() {
			$.ajax({
				type:'post',
				url:'../replyboard/boardDelete.do',
				data:{'no':${vo.no}},
				success:function(result){
					if(result==="OK"){
						alert('삭제완료')
					location.href="../replyboard/list.do"
					}
					else{
						alert('답변이 달린 게시글은 삭제 불가합니다')
					}
				}
			})
		})
	})
</script>
</head>
<body>
	<div class="container" style="margin-top: 150px; border: 1px solid #ddd; border-radius: 8px; padding: 40px;">
		<table class="table">
			<tr>
				<td colspan="2"><span style="font-weight: bold; font-size: 20px;">${vo.subject}</span></td>
			</tr>
			<tr>
				<td width="85%">${vo.name}&nbsp;&nbsp;|&nbsp;&nbsp;${vo.dbday}</td>
				<td width="15%" class="text-right" style="text-align: center;"><c:choose>
						<c:when test="${vo.group_step>0}">
							<span style="color: orange;">답변</span>
						</c:when>
						<c:when test="${vo.isreply == 0}">
							<span style="color: blue;">답변대기</span>
						</c:when>
						<c:when test="${vo.isreply != 0}">
							<span style="color: green;">답변완료</span>
						</c:when>
					</c:choose></td>
			</tr>
			<tr>
				<td colspan="2" style="height: 500px; font-size: 18px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"><pre
						style="overflow: auto; white-space: pre-wrap; word-wrap: break-word;">${vo.content}</pre></td>
			</tr>
			<tr class="text-right">
				<td colspan="2"><c:if test="${sessionScope.id == vo.id&&vo.group_step==0}">
						<input type="button" value="삭제" id="deleteBtn" class="button cancel">
						<a href="../replyboard/boardUpdate.do?no=${vo.no}" id="writeBtn" class="button edit">수정</a>
					</c:if> <input type="button" value="목록" onclick="javascript:history.back()" class="button"></td>
			</tr>
		</table>
	</div>
</body>
</html>