<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
    $('.dataTname').click(function() {
    	let rtname = $(this).attr("data-tname");
        $.ajax({
            type: 'post',
            url: '../movie/dateinfo.do',
            data: { "tname": rtname },
            success: function(result) {
                $('#rtname').val(rtname)
                $('#dateinfo').html(result)
                console.log(rtname)
            },
            error: function(request, status, error) {
                console.log(error)
            }
        })
        $.ajax({
            type: 'post',
            url: '../movie/mreservemain.do',
            data: { "tname": rtname },
            success: function(result) {
            	$('#moviertname').text(rtname)
        },
        error: function(request, status, error) {
            console.log(error)
        }
        })
    })
})
</script>
</head>
<body>
<table class="table" id="mtnametable">
      <c:forEach var="tname" items="${tnList }">
			<tr  class="dataTname" data-tname="${tname }">
			<td class="Ttname">${tname }</td>
		</tr>
	</c:forEach>	
	</table>
</body>
</html>