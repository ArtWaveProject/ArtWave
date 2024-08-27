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
	$('.ttdata').click(function(){
		let time=$(this).attr("data-mstime");
		let tdname = $(this).attr("data-tdname");
		$.ajax({
			type:'post',
			url:'../movie/timetableinfo.do',
			data: { "time": time, "tdname": tdname },
			success:function(result)
			{
				$('#movietdname').text(tdname)
				$('#rtime').val(time)
				$('#moviertime').text(time)
				$('#rtdname').val(tdname)
				console.log(tdname)
			},
			error:function(request,status,error)
			{
				console.log(error)
			}
		})
		$.ajax({
			type:'post',
			url:'../movie/inwoninfo.do',
			success:function(result)
			{
				$('#inwoninfo').html(result)
			},
			error:function(request,status,error)
			{
				console.log(error)
			}
		})
	})
})

</script>
</head>
<body>
<table class="table">
<c:forEach var="msvo" items="${ttList }">
  <tr class="ttdata" data-tdname = ${msvo.tdvo.tdname } data-mstime = ${msvo.mstime }>
  <c:if test="${msvo.mstime == null}">
  		<td><h4>상영정보 없음</h4></td>
  </c:if>
  	<td class ="times">${msvo.tdvo.tdname }</td>
  	<td>
    <input type="button" class="times" style="margin-top: 5px;" value="${msvo.mstime}">
 	</td>
 	</tr>
  </c:forEach>
  </table>
</body>
</html>