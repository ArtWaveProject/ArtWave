<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../movie/mstyle.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>

</style>
<script type="text/javascript">
$(function() {
	$('input[type="date"]').on('change', function() {
        let rdate = $(this).val();
        let rtname = $('#rtname').val()
    	let rtloc = $('#rtloc').val()
    	let rmno = $('#rmno').val()
        $.ajax({
        	 type: 'post',
             url: '../movie/dateinfo.do',
             data: { "rdate": rdate},
             success: function(result) {
            	 $('#rdate').val(rdate)
             },
             error: function(request, status, error) {
                 console.log(error)
             }
        })
    	
    	$.ajax({
            type: 'post',
            url: '../movie/timetableinfo.do',
            data: { "tname": rtname, "tloc":rtloc, "rdate": rdate, "mno":rmno },
            success: function(result) {
                $('#rtimetable').html(result)
    			 $('#movierdate').text(rdate)
            },
            error: function(request, status, error) {
                console.log(error)
            }
        })
    })
})
</script>
<style type="text/css">
    .date-input {
            width: 500px; 
        }
</style>
</head>
<body>
 <div class="container">
  <input type="date" width = "200px" min="2024-09-02" max="2024-09-08">
  </div>
</body>
</html>
