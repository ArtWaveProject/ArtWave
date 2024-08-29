<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../movie/mstyle.css">
<script src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
	let selectedCell = null;
    $('.dataTname').click(function() {
    	if (selectedCell && selectedCell !== this) {
            $(selectedCell).removeClass('selected');
        }

        $(this).addClass('selected');

        selectedCell = this;
        
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
<style type="text/css">

.dataTname:hover , .dataTname.selected{
	background-color: white;
	cursor: pointer;
}

.table-wrapper {
	max-height: 550px; 
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
.table{
 border-top: 3px medium; 
 border-top-color: white;
}
</style>
</head>
<body>
<div class="table-wrapper">
<table class="table" id="mtnametable">
      <c:forEach var="tname" items="${tnList }">
			<tr  class="dataTname" data-tname="${tname }">
			<td class="Ttname">${tname }</td>
		</tr>
	</c:forEach>	
	</table>
	</div>
</body>
</html>