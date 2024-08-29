<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.inwons').click(function(){
		let inwonText = $(this).text().trim();
        let inwon = parseInt(inwonText);
        let price = inwon * 9000; // 가격 계산
        
		$('#movieinwondata').text(inwon)
		$('#sselectBtn').show()
		$('#rinwon').val(inwon)
		$('#movierprice').text(price)
		$('#rprice').text(price)
	})
})
</script>
<style type="text/css">
.inwons{
   align-content: center;
}
</style>
</head>
<body>
  <c:forEach var="i" begin="1" end="5">
  <h6 style="font-size: 7px;"><br></h6>
    <button class="inwons" style="margin-top: 5px; bottom:3px; size: 12px; color: rgb(64,0,64); background-color:white; border-radius: 6px">${i }명</button>

  </c:forEach>
</body>
</html>