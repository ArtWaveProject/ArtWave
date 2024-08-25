<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../movie/mstyle.css">
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		type:'post',
		url:'../movie/movieinfo.do',
		success:function(result)
		{
			$('#movielist').html(result)
		},
		error:function(request,status,error)
		{
			console.log(error)
		}
	})
	
	$.ajax({
		type:'post',
		url:'../movie/theaterinfo1.do',
		data : {"mno" : rmno},
		success:function(result)
		{
			$('#tloclist').html(result)
			
		},
		error:function(request,status,error)
		{
			console.log(error)
		}
	})
	$.ajax({
		type:'post',
		url:'../movie/theaterinfo2.do',
		data : {"rtloc" : rtloc},
		success:function(result)
		{
			$('#tnamelist').html(result)
			
		},
		error:function(request,status,error)
		{
			console.log(error)
		}
	})
	$.ajax({
		type:'post',
		url:'../movie/dateinfo.do',
		success:function(result)
		{
			$('#rdate').html(result)
		},
		error:function(request,status,error)
		{
			console.log(error)
		}
	})
	$.ajax({
		type:'post',
		url:'../movie/timetableinfo.do',
		success:function(result)
		{
			$('#movietimedata').html(result)
		},
		error:function(request,status,error)
		{
			console.log(error)
		}
	})
	
})
</script>
<body>
  <div class="container">
  	<div class="reserve">
   <h2>영화 예매</h2>
   <table class="table" width="100%">
    <tr>
      <td width="25%" height="300" rowspan="2">
      <h4 class="text-center">영화</h4>
   	  <table class="table">
   	  <tbody>
      <tr>
      <td id="movielist" style="overflow-y:scroll">   
       </td>
        </tr>
        </tbody>
       </table>
      <td width="10%" height="200">
      <h4 class="text-center">지역</h4>
       <table class="table">
        <tbody>
         <tr>
          <td id="ttloclist"></td>
         </tr>
        </tbody>
       </table>
      </td>
      <td width="10%" height="200">
      <h4 class="text-center">극장</h4>
       <table class="table">
        <tbody>
         <tr>
          <td id="tnamelist"></td>
         </tr>
        </tbody>
       </table>
      </td>
      <td width="30%" height="200">
      <h4 class="text-center">상영시간표</h4>
       <table class="table">
        <tbody>
         <tr>
          <td id="movietimedata"></td>
         </tr>
        </tbody>
       </table>
      </td>
      <td width="25%" height="300">
       <table class="tabletotal">
        <tr>
         <td class="text-center" width="25%">
          <img style="width:200px;height: 250px" id="movieposter">
         </td>
        </tr>
        <tr>
          <td width="25%" id="movietitle"></td>
        </tr>
        <tr>
          <td width="10%">극장</td>
          <td width="15%" id="rtnamet"></td>
        </tr>
        <tr>
          <td width="5%" >일시</td>
          <td width="10%" id="rdate"></td>
          <td width="10%" id="rtime"></td>
        </tr>
        <tr>
          <td width="10%" >상영관</td>
          <td width="15%" id="movietdname"></td>
        </tr>
        <tr>
          <td width="10%" >인원</td>
          <td width="15%" id="movieinwondata"></td>
        </tr>
        <tr>
          <td width="10%" >가격</td>
          <td width="25%" id="rprice">원</td>
        </tr>
        <tr id="sselectBtn" style="display: none">
          <td width="25%" colspan="2" class="text-center">
           <form method="post" action="../movie/reserve_ok.do">
            <input type="hidden" name="mno" value="" id="rmno">
            <input type="hidden" name="date" value="" id="rdate">
            <input type="hidden" name="tdname" value="" id="rtdname">
            <input type="hidden" name="time" value="" id="rtime">
            <input type="hidden" name="inwon" value="" id="rinwon">
            <input type="hidden" name="price" value="" id="rprice">
            <button class="btn-lg btn-primary">좌석 선택</button>
           </form>
          </td>
        </tr>
       </table>
      </td>
    </tr>
    <tr>
      <td width=20% height=100>
      <h4 class="text-center">관람일 선택</h4>
        <table class="table">
        <tr>
          <td class="text-center" id="moviecalendar"></td>
        </tr>
       </table>
      </td>
      <td width=30% height=100>
      <h4 class="text-center">인원</h4>
       <table class="table">
        <tr>
          <td class="text-center" id="food_inwon_data"></td>
        </tr>
       </table>
      </td>
    </tr>
   </table>
   </div>
</div>
</body>
</html>