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
	let selectedTloc = $(this).attr("data-tloc")
    $('.Ttloc').click(function() {
        $.ajax({
            type: 'post',
            url: '../movie/theaterinfo2.do',
            data: { "tloc": selectedTloc },
            success: function(result) {
                $('#rtloct').text(selectedTloc)
            },
            error: function(request, status, error) {
                console.log(error)
            }
        });
    });


})
</script>
</head>
<body>
	<table class="table" id="mtloctable">
	<c:forEach var="tvo" items="${tlList }">
		<tr class="dataTloc" data-tloc="${tvo.tloc }">

			<td class="Ttloc">${tvo.tloc }</td>
			</tr>
			</c:forEach>
	</table>
</body>
</html>