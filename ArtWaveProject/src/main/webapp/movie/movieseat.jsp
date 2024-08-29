<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../movie/seatstyle.css">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript" src="../movie/seatscript.js"></script>
<script>
var IMP = window.IMP; 
IMP.init("imp68206770"); 
function requestPay(json,name,price) {
	console.log(json)
    IMP.request_pay({
        pg: "html5_inicis",
        pay_method: "card",
        merchant_uid: "ORD20180131-0000011",   // 주문번호
        name: name,
        amount: price,         // 숫자 타입
        buyer_email: json.email,
        buyer_name: json.name,
        buyer_tel: json.phone,
        buyer_addr: json.address,
        buyer_postcode: json.post
    }, function (rsp) { // callback
    	alert('예매완료')
    	location.href="../movie/moviemain.do"
    });
}
$(function () {
	$('#payBtn').click(function(){
		let gno=${mno}
		let price=$("#price").val()
		let name='${mtitle}'
		let id=$('#id').val()
		if(id.length<2){
			alert('로그인이 필요합니다')
			return
		}
		

		let mno=$('#rmno').val()
		let mtitle=$('#rmovietitle').val()
		let tloc=$('#rtloc').val()
		let tname=$('#rtname').val()
		let date=$('#date').val()
		let tdname=$('#rtdname').val()
		let time=$('#rtime').val()
		let inwon=$('.inwonOn').text().trim()
		let seats=$('#seats').val()
		console.log(date)
		console.log(inwon)
					$.ajax({
						type:'post',
						url:'../movie/reserveok.do',
						data:{
							"mno":mno,
							"mtitle":mtitle,
							'tname':tname,
							'day':date,
							'time':time,
							'tdname':tdname,
							'seats':seats,
							'price':price,
							'inwon':inwon
							},
						success:function(result)
						{
							let json=JSON.parse(result)
						  console.log(json)
							requestPay(json,name,price)
						}
					})
		})
})

</script>
</head>
<body>
	<section id="section">
		<div class="container">
			<!-- leftCont -->
			<div class="leftCont">
				<div class="leftMainCont">
					<div class="legendContainer">
						<ul>
							<li>
								<div class="seat legend"></div> <small>선택 가능 좌석</small>
							</li>
							<li>
								<div class="seat legend selected"></div> <small>선택한 좌석</small>
							</li>
							<li>
								<div class="seat legend occupied"></div> <small>선택된 좌석</small>
							</li>
						</ul>
					</div>
					<!-- seat Container -->
					<div class="mainSeatCont">
						<div class="screen">
							<small>SCREEN</small>
						</div>
						<div class="seatCont" id="seatCont">
							<div class="seatRowCont1 seatRowCont">
								<div class="row">
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
								</div>
								<div class="row">
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
								</div>
							</div>
							<div class="seatRowCont2 seatRowCont">
								<div class="row">
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
								</div>
								<div class="row">
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
								</div>
								<div class="row">
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
								</div>
								<div class="row">
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
								</div>
							</div>
							<div class="seatRowCont3 seatRowCont">
								<div class="row">
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
								</div>
								<div class="row">
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
									<div class="seat"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Right Cont -->
			<div class="rightCont">
				<div class="confirmCont">
					<div class="rightTopCont">
						<!-- moviename -->
						<div class="movieInfo">
							<div class="movieName">
								<h3 id="rmovie">${mtitle }</h3>
							</div>
							<div class="moviePrice">
								<p>가격</p>
								<h5 id="moviePrice">9000원</h5>
							</div>
							<div class="dateCont">
								<p>일시</p>
								<p class="dateOn" id="rdate">${date }</p>
							</div>
							<div class="inwonCont">
								<p>인원수</p>
								<p class="inwonOn" id="rinwon">${rinwon }</p>
							</div>
						</div>
					</div>
					<div class="rightBottomCont">
						<div class="selectedSeatCont">
							<p>선택한 좌석</p>
							<div class="selectedSeatsHolder" id="selectedSeatsHolder">
								<span class="noSelected">선택한 좌석이 없습니다</span>
							</div>
						</div>
						<!-- Seat number and price -->

						<div class="numberOfSeatsCont">
							<div class="numberOfSeatEl">
								<p>
									<span id="numberOfSeat"></span> 좌석
								</p>
							</div>
							<div class="priceCont">
								<p id="totalPrice">원</p>
							</div>
						</div>
						<!-- button Cont -->
						<input type="hidden" value="${sessionScope.id}" id="id">
						<div class="buttonCont">
							<div class="cancelBtn">
								<button id="cancelBtn">선택 취소하기</button>
							</div>
							<div class="proceedBtnEl">
								<button id="proceedBtn">좌석 확인</button>
								<!-- <form method="post" action="../movie/reserveok.do"> -->
								<input type="hidden" name="mno" value="${mno }" id="rmno"> <input type="hidden" name="mtitle" value="${mtitle }" id="rmovietitle">
								<input type="hidden" name="tloc" value="${tloc }" id="rtloc"> <input type="hidden" name="tname" value="${tname}" id="rtname">
								<input type="hidden" name="date" value="${date}" id="date"> <input type="hidden" name="tdname" value="${tdname }" id="rtdname">
								<input type="hidden" name="time" value="${time }" id="rtime"> <input type="hidden" name="inwon" value="${rinwon }" id="inwon">
								<input type="hidden" name="price" value="" id="price"> <input type="hidden" name="seats" value="" id="seats">
								<button type="button" id="payBtn">확정하기</button>
								<!-- </form> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>