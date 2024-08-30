<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../movie/mstyle.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style type="text/css">
.owl-item{
    margin: 0px -12px 0px -10px !important;
}
 #likeBtn{
	  background-color: transparent;
	  border: 2px solid rgb(64, 0, 64);
	  }
.star-rating {
	display: flex;
	font-size: 25px;
}

.star-rating input[type="radio"] {
	display: none;
}

.star-rating label {
	cursor: pointer;
	color: #ddd; /* 기본 색상: 선택되지 않은 상태 */
	transition: color 0.2s;
}

.star-rating label:before {
	content: '\f005'; /* Font Awesome star icon */
	font-family: 'Font Awesome 6 Free';
	font-weight: 900;
}

.star-rating input[type="radio"]:checked ~ label {
	color: #779BC9; /* 선택된 별점의 색상 */
}

.star-rating input[type="radio"]:checked ~ input[type="radio"] ~ label {
	color: #779BC9; /* 선택된 별점과 그 이전 별점의 색상 */
}

.review-form {
	margin-top: 20px;
	margin-left:-12px;
	padding: 20px;
	width:1300px;
	border: 1px solid #ddd;
	border-radius: 10px;
	background-color: #f9f9f9;
}

.review-form label {
	display: block;
	margin-bottom: 8px;
	font-weight: bold;
}

.review-form textarea {
	padding: 8px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
	width: 800px; 
	min-height: 68px;
	box-sizing: border-box; 
	vertical-align: middle; 
}

.review-form button {
	background-color: rgb(64,0,64);
	color: #fff;
	padding: 12px 20px; 
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
	height: 65px; 
	vertical-align: middle; 
	box-sizing: border-box;
	margin-bottom: 10px;
}

.review-form button:hover {
	background-color: purple;
}

.review-form .review-container {
	display: flex;
	align-items: center;
}

.review-form .review-container textarea {
	margin-right: 10px; 
}
.review-list {
    border: 1px solid #ddd;
    border-radius: 8px;
    background-color: #fff;
    padding: 15px;
    margin-bottom: 15px;
    width: 1022px;
}

.review-list .nick-rate {
    font-weight: bold;
    font-size: 16px;
    color: #333;
}

.review-list .date {
    font-size: 14px;
    color: #888;
}

.review-list .xBtn,
.review-list .rBtn {
    background: none;
    border: none;
    cursor: pointer;
    font-size: 14px;
    margin-left: 5px;
    padding: 0;
}

.review-list .xBtn{
    float: right;
}

.review-list .rBtn{
    color: #888;
}
.review-list .xBtn:hover,
.review-list .rBtn:hover {
    text-decoration: underline;
}

.review-list .rating {
    margin: 10px 0;
}

.review-list .r-content {
    font-size: 14px;
}

.r-content{
 margin-top: 10px;
}

.average-rating {
    display: flex;
    align-items: center;
}

#avgnumber {
    margin-left: 5px; 
}

#avgN{
    margin-left: 10px; 
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../movie/custom1.js"></script>
<script type="text/javascript">

$(function() {
 	
  let ratingCheck = false
  let likeCheck = false
  let id=$('#id').val()
  let mno = $('#mno').val()
  
  reviewlist()

  if (id.length > 0) {
      $.ajax({
          type: 'post',
          url: '../like/likeCheck.do',
          data: {
              'tno': mno,
              'type': 4
          },
          success: function(result) {
              if (result === 'OK') {
                  likeCheck = true
                  $('#likeBtnIcon').attr('src', 'fullheart.png')
              } else {
                  likeCheck = false
                  $('#likeBtnIcon').attr('src', 'heart.png')
              }
          }
      })
  } else {
      $('#likeBtn').css('display', 'none')
  }

  $('#likeBtn').click(function() {
		if(likeCheck===true){
			$.ajax({
				type:'post',
				url:'../like/likeOff.do',
				data:{
					'tno':mno,
					'type':4
				},
				success:function(result){
					if(result>=0){
						likeCheck=false
						$('#likeBtnIcon').attr('src', 'heart.png')
						$('#likeCount').text(result)
					}
				}
			})
		}
		else{
			$.ajax({
				type:'post',
				url:'../like/likeOn.do',
				data:{
					'tno':mno,
					'type':4
				},
				success:function(result){
					if(result>=0){
						likeCheck=true
						$('#likeBtnIcon').attr('src', 'fullheart.png')
						$('#likeCount').text(result)
					}
				}
			})
		}
	})
  $('.rating').change(function() {
  ratingCheck=true	
		let rating=$('input[name="rating"]:checked').val()
		rating=6-rating

	})
	$(document).ready(function() {
  let avgRating=parseFloat('${avg}')

  let star= ''
  for (let i=1;i<=5;i++) {
      if (i<=avgRating) {
          star+='<img src="star.png" style="width:23px;height:23px;">'
      } else {
          star+='<img src="nostar.png" style="width:23px;height:23px;">'
      }
  }
  $('.avgstar').html(star)
  
})

	$('#reviewBtn').click(function(){
		let rating=0
		if (id.length === 0) {
			alert('해당 기능은 로그인 시 이용하실 수 있습니다')
			return
		}
		if(ratingCheck){
		rating=$('input[name="rating"]:checked').val()
		rating=6-rating
 	console.log(rating)
			
		}
		else{
			alert('평점을 선택해주세요')
			return
		}
		let content=$('#content').val()
		if(content.trim()===''){
			alert('관람평을 입력해주세요')
			$('#content').focus()
			return
		}
      $.ajax({
          type: 'post',
          url: '../review/checkedReview.do',
          data: {
              'tno': mno,
              'userId': id
          },
          success: function(result) {
              if (result==='NO_REVIEW') {
                  $.ajax({
                      type: 'post',
                      url: '../review/insert.do',
                      data: {
                          'tno': mno,
                          'trating': rating,
                          'tcontent': content,
                          'type': 1
                      },
                      success: function() {
                          let count = $('#rcount').text()
                          count = parseInt(count)
                          $('#content').val('')
                          $('input[name="rating"]').prop('checked', false)
                          reviewlist()
                          $('.rcount').text('')
                          $('.rcount').text(count+1)
                      }
                  })
              } else {
                  alert('이미 작성하신 리뷰가 있습니다.')
              }
          }
      })
  })
})
function reviewlist(){
	$.ajax({
		type:'post',
		url:'../review/list.do',
		data:{
			'tno':${vo.mno},
			'type':1
		},
		success:function(result){
			let json=JSON.parse(result)
			html=''
				json.map(function(reply) {
					let stars=''
					for(let i=1;i<=reply.trating;i++){
						stars+='<img src="star.png" style="width:15px;height:15px;">'
					}
					for(let i=1;i<=5-reply.trating;i++){
						stars+='<img src="nostar.png" style="width:15px;height:15px;">'
					}
			html+='<tr>'
			html+='<td>'
			html+='<div class="review-list">'
			html+='<div>'
			html+='<span class="nick-rate">'+reply.nickname+'</span>'
			if(reply.id===reply.sessionId){
				html+='<input type="button" class="xBtn" value="X" onclick="reviewdelete('+reply.trno+')">'
				}
			html+='<br>'
		  html+=stars+'<br>'
			html+='<span class="date">'+reply.dbday+'&nbsp;</span>'
			html+='<div>'
			html+='<div class="r-content"><pre>'+reply.tcontent+'</pre></div>'
			html+='</div>'
			html+='</div>'
			html+='</td>'
			html+='</tr>'
				})
				$('#review').html(html)
		}
	})
}
function reviewdelete(trno){
	$.ajax({
		type:'post',
		url:'../review/delete.do',
		data:{
			'trno':trno,
		},
		success:function(result){
			reviewlist()
			let count=$('#rcount').text()
			count=parseInt(count)
			$('.rcount').text(count-1)
			}
		})
}
document.addEventListener('DOMContentLoaded', function() {
  const stars = document.querySelectorAll('.star-rating input[type="radio"]')
  stars.forEach(star => {
      star.addEventListener('change', function() {
          updateStars(this)
      })
  })

  function updateStars(selectedStar) {
      const allStars = document.querySelectorAll('.star-rating label')
      allStars.forEach(star => {
          star.style.color = '#ddd'
      })

      const selectedValue = selectedStar.value
      allStars.forEach(star => {
          const starValue = star.getAttribute('for').replace('star', '')
          if (parseInt(starValue) >= parseInt(selectedValue)) {
              star.style.color = '#D1B810'
          }
      })
  }
  
})
</script>
</head>
<body>
	<div class="page-content3">
	<div class="mlbefore">
	   	<i class="fa fa-chevron-circle-left"></i>
		  <input type="button" id='backbtn' name="이전 페이지로 이동" value="뒤로 가기" onclick="javascript:history.back()"> 
	</div>
	<div class="container">
	 <input type="hidden" value="${sessionScope.id}" id="id">
     <input type="hidden" value="${vo.mno}" id="mno">
	<table class="mdtable">
       <tr>
        <td width="40%" class="text-center" rowspan="14">
          <img src="https://www.kobis.or.kr${vo.mposter }" id="detailposter">
        </td>
        </tr>
        <tr>
        <td>
          <h2 id="motitle" class="text-left">${vo.mtitle}&nbsp;&emsp;</h2>        
        </td>
        </tr>
        <tr>
          <td>
          <h4 id="moinfo1">${vo.mrday}&nbsp;개봉&nbsp;|&nbsp;${vo.mtime}&nbsp;|&nbsp;${vo.mgrade}&nbsp;<br>
          누적관객수&nbsp;:&nbsp; <fmt:formatNumber value="${vo.mcount }" type="number" ></fmt:formatNumber>명&nbsp;|&nbsp;${vo.mnation }&nbsp;</h4>
       </td>
       <tr>
        <td class="text-left" id="moinfo2"></td>
        </tr>
        <tr>
        <td id="moinfo3"> ${vo.msynop } </td>
       </tr>
       <tr>
        <td id="moinfo4">장르 &nbsp;:&nbsp; ${vo.mgenre} </td>
       </tr>
       <tr>
        <td id="moinfo5">감독 &nbsp;:&nbsp; ${vo.mdirector} </td>
       </tr>
       <c:if test="${vo.mactor!=null }">
       <tr>
        <td id="moinfo6">출연 &nbsp;:&nbsp; ${vo.mactor} </td>
       </tr>
       </c:if>
       <tr>
       <td>
       
       <button id="likeBtn">
				<img src="../movie/heart.png" id="likeBtnIcon"><span id="likeCount">&nbsp;&nbsp;&nbsp;${vo.likecount }</span></button> 		
           
              <c:choose>
                                                <c:when test="${vo.mstate == '1'}">
                                                	<c:if test="${sessionScope.id!=null }">
                                                 <a href="../movie/mreservemain.do" title="영화 예매하기"><input type="button" id="dbokdBtn1" value="예매"></a>
                                                     </c:if>
                                                      <c:if test="${sessionScope.id==null }">
                                                      <a href="../member/login.do" onclick="alert('로그인이 필요한 메뉴입니다!')" title="영화 예매하기"><input type="button" id="dbokdBtn1" value="예매"></a>
                                                      </c:if>
                                                </c:when>
                                                <c:when test="${vo.mstate == '2'}">
                                                  <a href="#" title="영화 상영예정"><input type="button" id="dbokdBtn2" value="상영예정" disabled></a>
                                                </c:when>
                                                <c:when test="${vo.mstate == '3'}">
                                                   <a href="#" title="영화 상영종료"><input type="button" id="dbokdBtn3" value="상영종료" disabled></a>
                                                </c:when>
                                            </c:choose>
                                       
       </td>
       </tr>
       </table>
        <div class="row">
        <div class="featured-games3" style="width:560px; height:300px; padding-left:11px !important; padding-right:10px !important; margin-left:10px;">           
            <div class="mbook">
        <h4>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
        			# &nbsp; 관련&nbsp;도서&nbsp;추천</h4>
            <h3>  <br></h3>
                <div class="owl-features owl-carousel" id="moviebookc" style="width:504px; height:200px; margin-left:3px; margin-right:20px; left:10px;">
                <c:forEach var="mbvo" items="${mbList }">
                  <input type="hidden" value="${vo.mno}" id="mno">
				 <div class="item2" >
				 <div class="thumb" id="mbookimg">
                <img src="${mbvo.cover }"  alt="" >
                 <div class="hover-effect">
                      <h6><a href="../book/detail.do?bno=${mbvo.bno }"  title="상세정보 확인">상세정보</a></h6>
                      </div>
                <h5><span id=btitlel>${mbvo.btitle }</span></h5> <h5><span id=bsalep>&emsp;${mbvo.sale_price }원</span></h5>
            </div>
        </div>
         </c:forEach>
        </div>
         </div>
         </div>
         <div class="featured-games3" style="width:300px; height:300px; padding-left:11px !important; padding-right:10px !important; margin-left:20px; margin-right: 10px;">           
        <div class="heading-section" style="padding: 0px 5px 15px 0;">
        <span style="font-size: 25px; font-weight: bold;">&emsp;&emsp; #&nbsp;평균별점</span>
        </div>
        <p><br></p>
				<span class="avgstar" style="font-size:20px; font-weight: bold; margin-left:70px;"></span>
						<p><br></p>
							<p id="avgnumber" style="font-size: 25px; font-weight: bold;margin-left:50px;">&emsp;${avg}&nbsp;/ 5.0</p>
	</div>
         <div class="featured-games3" style="width:400px; height:300px; padding-left:11px !important; padding-right:10px !important; margin-left:10px; margin-right: 10px;">           
            <div class="mbook">
        <h4>&emsp;&emsp;&emsp;&emsp;&emsp;
        			&nbsp; # &nbsp;OST&nbsp;&emsp;&emsp;</h4>
            <h3>  <br></h3>
                <c:forEach var="mmvo" items="${mmList }">
                  <input type="hidden" value="${vo.mno}" id="mno">
                <div class="item3" >
				 <div class="thumb" style="margin-left: 100px; width:250px; margin-bottom:5px;">
                <img src="${mmvo.poster}" style="width: 180px; height:180px;" alt="" >
                 <div class="hover-effect">
                      <h6><a href="../music/albumDetail.do?alno=${mmvo.muno}"  title="상세정보 확인">상세정보</a></h6>
                      </div>
                <p>&emsp;&emsp;&nbsp;${mmvo.atitle }</p>
         		</div>
         		</div>
         </c:forEach>
        </div>
         </div>
    </div>
 <div class="container">
				 <div id="review-form" class="review-form" style="margin-top: 10px; margin-bottom:10px;">			
						<div class="heading-section" style="padding: 0 0 5px 0;">
							<span style="font-size: 20px; font-weight: bold;">영화 관람평(<span id="rcount">${rcount}</span>)</span>
										</div>
											<input type="hidden" id="mno" name="mno" value="${vo.mno}" /> 
											<div>
											<div class="star-rating">
												<input class="rating" type="radio" id="star5" name="rating"
													value="5" required />
												<label for="star5"></label>
												<input class="rating" type="radio" id="star4" name="rating"
													value="4" />
												<label for="star4"></label>
												<input class="rating" type="radio" id="star3" name="rating" value="3" />
												<label for="star3"></label>
												<input class="rating" type="radio" id="star2" name="rating" value="2" />
												<label for="star2"></label>
												<input class="rating" type="radio" id="star1" name="rating" value="1" />
												<label for="star1"></label>
											</div>
										</div>
											<table>
												<tr>
													<td>
														<div class="review-container">
															<textarea id="content" style="resize: none;"
																name="content" required placeholder="관람평을 작성해 주세요!"></textarea>
															<button type="button" id="reviewBtn">관람평 작성</button>
														</div>
													</td>
												</tr>
											</table>
											<table>
										 <tbody id="review">
										 </tbody>
						</table>
				</div>
		</div>
	</div>
</body>
</html>