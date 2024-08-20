<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" style="margin-top: 150px;">
		<div class="row" style="width: 800px; margin: 0px auto;" >
			<h4 class="text-center" style="margin-bottom: 25px;">글작성</h4>
			<table class="table">
				<tr>
					<td colspan="2" style="padding: 2px 8px; border-radius: 9px;">
						<select name="type" class="input input-sm" id="type" style="width: 35%; height:33px;">
							<option value="0">카테고리 선택</option>
							<option value="1">자유</option>
							<option value="2">영화</option>
							<option value="3">책</option>
							<option value="4">음악</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="padding: 3px 8px;">
						<input type="text" style="border:none; border-radius:5px; height:33px; width: 100%; background:#ddd;"  placeholder="제목을 입력해 주세요" id="subject">
					</td>
				</tr>
				<tr>
					<td>
						<textarea rows="15" cols="50" id="content" style="width: 100%;resize: none; border-radius:9x;  border: 1px solid gray;" placeholder="내용을 입력하세요"></textarea>
					</td>
				</tr>
				<tr style="text-align: right;">
					<td>
						<input type="button" value="작성" id="writeBtn">
						<input type="button" value="취소">
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>