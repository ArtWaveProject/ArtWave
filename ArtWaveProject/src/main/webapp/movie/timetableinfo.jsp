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
	let lastClickedButton = null;
	$('.ttdata').click(function(){
		let time=$(this).attr("data-mstime")
		let tdname = $(this).attr("data-tdname")
		
		 let $currentButton = $(this).find('input[type="button"]')
		 
		 if (lastClickedButton && lastClickedButton[0] !== $currentButton[0]) {
	            lastClickedButton.css({
	                'background-color': 'white',
	                'color': 'rgb(64,0,64)'
	            })
	        }
		 $currentButton.css({
	            'background-color': 'rgb(64,0,64)',
	            'color': 'white'
	        })
	      lastClickedButton = $currentButton
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
<style>
.times{
   text-align: center;
   cursor: pointer;
}
</style>
</head>
<body>
<table class="table">
<c:forEach var="msvo" items="${ttList }">
  <tr class="ttdata" data-tdname = ${msvo.tdvo.tdname } data-mstime = ${msvo.mstime }> 
     <td class ="times" style="font-weight: 500; padding-top: 15px;" align="right">	${msvo.tdvo.tdname }</td>
  	<td>
    <input type="button" class="times" style="margin-top: 5px; bottom:3px; size: 14px; border-radius: 6px; background-color: white;" value="${msvo.mstime}">
 	</td>
 	</tr>
  </c:forEach>
  </table>
</body>
</html>