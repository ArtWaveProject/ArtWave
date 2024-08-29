<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('#writeBtn').click(function() {
			let subject = $('#subject').val()
			let no=$('#no').val()
			if (subject.trim() === '') {
				alert('제목을 입력해주세요')
				$('#subject').focus()
				return
			}
			let content = $('#content').val()
			if (content.trim() === '') {
				alert('내용을 입력해주세요')
				$('#content').focus()
				return
			}
			$.ajax({
				type : 'post',
				url : '../adminpage/reply_insert_ok.do',
				data : {
					'no' : no,
					'subject' : subject,
					'content' : content
				},
				success : function(result) {
					location.href = "../adminpage/reply_list.do"
				}
			})
		})
	})
</script>
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
	color: #333;
}

.form-table {
	width: 100%;
	border-collapse: collapse;
}

.form-table td {
	padding: 10px;
	vertical-align: top;
}

.form-table select, .form-table input[type="text"], .form-table textarea
	{
	width: 100%;
	padding: 15px;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 16px;
	box-sizing: border-box;
}

.form-table textarea {
	resize: vertical;
	min-height: 300px;
}

.write-btn {
	background-color: #007bff;
	color: white;
	border: none;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	border-radius: 4px;
	transition: background 0.3s;
}

.write-btn:hover {
	background-color: #0056b3;
}

.cancel-btn {
	background-color: #ffc107;
	color: white;
	border: none;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	border-radius: 4px;
	transition: background 0.3s;
}

.cancel-btn:hover {
	background-color: #e0a800;
}
</style>
</head>
<body>
	<div class="container" style="max-width: 1000px; border-radius: 12px; border: 1px solid #ddd; margin:0px; padding: 40px;">
		<div class="header">
			<h4>답변등록</h4>
		</div>
		<form action="../adminpage/reply_insert_ok.do" method="post">
			<input type="hidden" name="no" id="no" value="${no}">
			<table class="form-table">
				<tr>
					<th width=20% class="text-center">제목</th>
					<td width=80%>${vo.subject }</td>
				</tr>
				<tr>
					<th width=20% class="text-center">내용</th>
					<td width=80%>${vo.content }</td>
				</tr>
				<tr>
					<td colspan="2"><input type="text" id="subject" name="subject" placeholder="제목을 입력해 주세요" required></td>
				</tr>
				<tr>
					<td colspan="2"><textarea id="content" style="resize: none;" name="content" placeholder="내용을 입력하세요" required></textarea></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: right;"><input type="button" value="작성" id="writeBtn" class="write-btn"> <input type="button" value="취소"
						class="cancel-btn" onclick="javascript:history.back()"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>