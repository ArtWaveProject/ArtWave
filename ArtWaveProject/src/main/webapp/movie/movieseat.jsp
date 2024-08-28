<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
 <link rel="stylesheet" href="../movie/seatstyle.css">
 <script  src="../movie/seatscript.js" defer></script>
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
                <div class="seat legend"></div>
                <small>선택 가능 좌석</small>
              </li>
              <li>
                <div class="seat legend selected"></div>
                <small>선택한 좌석</small>
              </li>
              <li>
                <div class="seat legend occupied"></div>
                <small>선택된 좌석</small>
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
                <p><span id="numberOfSeat"></span> 좌석</p>
              </div>
              <div class="priceCont">
                <p id="totalPrice">원</p>
              </div>
            </div>
            <!-- button Cont -->

            <div class="buttonCont">
              <div class="cancelBtn">
                <button id="cancelBtn">선택 취소하기</button>
              </div>
              <div class="proceedBtnEl">  
               <button id="proceedBtn">좌석 확인</button>
             <form method="post" action="../movie/reserveok.do">
            <input type="hidden" name="mno" value="${mno }" id="rmno">
            <input type="hidden" name="mtitle" value="${mtitle }" id="rmovietitle">
            <input type="hidden" name="tloc" value="${tloc }" id="rtloc">
            <input type="hidden" name="tname" value="${tname}" id="rtname">
            <input type="hidden" name="date" value="${date}" id="rdate">
            <input type="hidden" name="tdname" value="${tdname }" id="rtdname">
            <input type="hidden" name="time" value="${time }" id="rtime">
            <input type="hidden" name="inwon" value="${rinwon }" id="rinwon">
            <input type="hidden" name="price" value="" id="price">
            <input type="hidden" name="seats" value="" id="seats">
			 <button id="payBtn" disabled >결제하기</button>
			 </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</body>
</html>