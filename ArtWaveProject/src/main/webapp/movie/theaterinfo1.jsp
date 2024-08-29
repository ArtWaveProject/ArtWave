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
	let selectedCell = null;
	
	$('.dataTloc').click(function() {
		if (selectedCell && selectedCell !== this) {
            $(selectedCell).removeClass('selected');
        }

        $(this).addClass('selected');

        selectedCell = this;
        
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
<style type="text/css">
.dataTloc:hover , .dataTloc.selected{
	background-color: white;
	cursor: pointer;
}

.table-wrapper {
	max-height: 600px; 
    overflow-y: auto;
}

.table {
	border-collapse: collapse;
	width: 100%;
}

.table td, .table th {
	border: 1px solid #ddd;
	padding: 8px;
}

.table th {
	background-color: #f2f2f2;
	text-align: left;
}
.table-wrapper::-webkit-scrollbar {
    width: 5px; 
}

.table-wrapper::-webkit-scrollbar-thumb {
    background: rgb(64,0,64);
    border-radius: 10px; 
}

</style>
</head>
<body>
<div class="table-wrapper">
	<table class="table" id="mtloctable">
		<c:forEach var="tloc" items="${tlList }">
		<tr class="dataTloc" data-tloc="${tloc }">
			<td class="Ttloc">${tloc }</td>
			</tr>
	</c:forEach>
	</table>
	</div>
</body>
</html>