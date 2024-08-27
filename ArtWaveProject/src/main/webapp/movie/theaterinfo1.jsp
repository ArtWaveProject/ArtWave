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
	$('.dataTloc').click(function() {
		let rtloc = $(this).attr("data-tloc")
        $.ajax({
            type: 'post',
            url: '../movie/theaterinfo2.do',
            data: { "tloc": rtloc },
            success: function(result) {
            	$('#tnamelist').html(result)
            },
            error: function(request, status, error) {
                console.log(error)
            }
        })
        $.ajax({
            type: 'post',
            url: '../movie/dateinfo.do',
            data: { "tloc": rtloc },
            success: function(result) {
            	$('#rtloc').val(rtloc)
            	$('#moviertloc').val(rtloc)
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
	<table class="table" id="mtloctable">
		<c:forEach var="tloc" items="${tlList }">
		<tr class="dataTloc" data-tloc="${tloc }">
			<td class="Ttloc">${tloc }</td>
			</tr>
	</c:forEach>
	</table>
</body>
</html>