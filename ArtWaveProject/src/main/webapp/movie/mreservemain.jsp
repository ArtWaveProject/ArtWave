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
  	<h2 class="text-center" style="margin-top: 20px; color:rgb(64,0,64); margin-bottom: -20px;">영화 예매</h2>
  	<div class="reserve">
   <table class="table"  id="totaltable" style="border-radius: 10px; border-top: 5px solid white !important; padding-top: 5px;">
    <tr>
      <td width=20%>
      <div class="tabletitle" align="center">영화</div>
   	  <table >
   	  <tbody>
      <tr>
      <td id="movielist" style="font-weight: 500">   
       </td>
        </tr>
        </tbody>
       </table>
      <td width=11%>
      <div class="tabletitle" align="center">지역</div>
       <table>
        <tbody >
         <tr>
          <td id="tloclist"></td>
         </tr>
        </tbody>
       </table>
      </td>
      <td width=9%>
      <div class="tabletitle" align="center">극장</div>
       <table class="table">
        <tbody>
         <tr>
          <td id="tnamelist"></td>
         </tr>
        </tbody>
       </table>
      </td>
       <td width=18% >
      <div class="tabletitle" align="center">관람일</div>
        <table>
        <tr>
          <td id="dateinfo"></td>
        </tr>
       </table>
      </td>
      <td width=18%>
     <div class="tabletitle" align="center">상영시간표</div>
       <table class="table">
        <tbody>
         <tr>
          <td id="rtimetable"></td>
         </tr>
        </tbody>
       </table>
      </td>
      <td width=8%>
      <div class="tabletitle" align="center">인원</div>
       <table class="table">
        <tr>
          <td id="inwoninfo" align="center"></td>
        </tr>
       </table>
      </td>
      <td width=26%>
      <div class="tabletitle" align="center">예매 정보</div>
       <table class="tabletotal">
        <tr>
         <td class="text-center" colspan="3">
          <img style="width:250px;height: 280px; border-radius: 6px; " id="movieposter">
         </td>
        </tr>
        <tr>
          <td width=100% id="movietitle" colspan="3" style="font-weight: bold;"></td>
        </tr>
        <tr>
          <td width=30%>극장&nbsp;:</td>
          <td width=70% id="moviertname" colspan="2"></td>
        </tr>
        <tr>
          <td width=30% >일시&nbsp;:</td>
          <td width=50% id="movierdate" style="font-size:15px;"></td>
          <td width= 20% id="moviertime" style="font-size:15px;" ></td>
        </tr>
		<tr>
          <td width=40% style="font-size:15px;">상영관:</td>
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
          <td width="100%" colspan="3" class="text-center">
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
            <button style="width:250px; height:60px; background-color:rgb(64,0,64); color:white; border-radius: 6px;">좌석 선택</button>
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