<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../movie/mstyle.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function() {

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
})
</script>
</head>
<body>
  <div class="page-content3">
  	<div class="reserve">
   <h2 class="text-center">영화 예매</h2>
   <table class="table">
    <tr>
      <td width=20% height="400px" >
      <div class="tabletitle"><h5>영화</h5></div>
   	  <table class="movielisttable">
   	  <tbody >
      <tr >
      <th></th>
      <td id="movielist" style="overflow-y:scroll">   
       </td>
        </tr>
        </tbody>
       </table>
      <td width=10% height="400px">
      <div class="tabletitle"><h5>지역</h5></div>
       <table class="tloclisttable" >
        <tbody >
         <tr>
          <td id="tloclist" style="overflow-y:scroll"></td>
         </tr>
        </tbody>
       </table>
      </td>
      <td width=10% height="400px">
      <div class="tabletitle"><h5>극장</h5></div>
       <table class="table">
        <tbody>
         <tr>
          <td id="tnamelist" style="overflow-y:scroll"></td>
         </tr>
        </tbody>
       </table>
      </td>
       <td width=20% height="400px">
      <div class="tabletitle"><h5>관람일 선택</h5></div>
        <table>
        <tr>
          <td id="dateinfo"></td>
        </tr>
       </table>
      </td>
      <td width=20% height="400px">
     <div class="tabletitle"><h5>상영시간표</h5></div>
       <table class="table">
        <tbody>
         <tr>
          <td id="rtimetable"></td>
         </tr>
        </tbody>
       </table>
      </td>
      <td width=10% height="400px">
      <div class="tabletitle"><h5>인원</h5></div>
       <table class="table">
        <tr>
          <td class="text-center" id="inwoninfo"></td>
        </tr>
       </table>
      </td>
      <td width=20% height="400px" >
      <div class="tabletitle"><h5>예약 정보</h5></div>
       <table class="tabletotal">
        <tr>
         <td class="text-center" colspan="3">
          <img style="width:200px;height: 250px" id="movieposter">
         </td>
        </tr>
        <tr>
          <td width=100% id="movietitle" colspan="3"></td>
        </tr>
        <tr>
          <td width=40%>극장&nbsp;:&nbsp;</td>
          <td width=60% id="moviertname" colspan="2"></td>
        </tr>
        <tr>
          <td width=30% >일시&nbsp;:&nbsp;</td>
          <td width=50% id="movierdate"></td>
          <td width= 20% id="moviertime"></td>
        </tr>
		<tr>
          <td width=40% >상영관&nbsp;:&nbsp;</td>
          <td width=60% id="movietdname" colspan="2"></td>
        </tr>
        <tr>
          <td width= 30% >인원&nbsp;:&nbsp;</td>
          <td width= 60% id="movieinwondata"></td>
          <td width= 10%>명</td>
        </tr>
        <tr>
          <td width= 30% >가격&nbsp;:&nbsp;</td>
          <td width= 60% id="movierprice"></td>
          <td>원</td>
        </tr>
        <tr id="sselectBtn" style="display: none">
          <td width="50%" colspan="2" class="text-center">
           <form method="post" action="../movie/movieseat.do">
            <input type="hidden" name="mno" value="" id="rmno">
            <input type="hidden" name="movietitle" value="" id="rmovietitle">
            <input type="hidden" name="tloc" value="" id="rtloc">
            <input type="hidden" name="tname" value="" id="rtname">
            <input type="hidden" name="date" value="" id="rdate">
            <input type="hidden" name="tdname" value="" id="rtdname">
            <input type="hidden" name="time" value="" id="rtime">
            <input type="hidden" name="inwon" value="" id="rinwon">
            <input type="hidden" name="price" value="" id="rprice">
            <button>좌석 선택</button>
           </form>
          </td>
        </tr>
       </table>
      </td>
    </tr>
   </table>
   </div>
</div>
</body>
</html>