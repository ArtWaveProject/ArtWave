<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="../seatstyle.css">
 <script  src="../seatscript.js"></script>
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
                  <div class="seat occupied"></div>
                  <div class="seat"></div>
                  <div class="seat"></div>
                  <div class="seat"></div>
                  <div class="seat"></div>
                  <div class="seat"></div>
                  <div class="seat"></div>
                </div>
                <div class="row">
                  <div class="seat"></div>
                  <div class="seat occupied"></div>
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
                  <div class="seat occupied"></div>
                  <div class="seat"></div>
                  <div class="seat"></div>
                  <div class="seat"></div>
                  <div class="seat"></div>
                  <div class="seat"></div>
                  <div class="seat"></div>
                </div>
                <div class="row">
                  <div class="seat"></div>
                  <div class="seat occupied"></div>
                  <div class="seat"></div>
                  <div class="seat"></div>
                  <div class="seat"></div>
                  <div class="seat"></div>
                  <div class="seat"></div>
                  <div class="seat"></div>
                </div>
                <div class="row">
                  <div class="seat"></div>
                  <div class="seat occupied"></div>
                  <div class="seat"></div>
                  <div class="seat"></div>
                  <div class="seat"></div>
                  <div class="seat"></div>
                  <div class="seat"></div>
                  <div class="seat"></div>
                </div>
                <div class="row">
                  <div class="seat"></div>
                  <div class="seat occupied"></div>
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
                  <div class="seat occupied"></div>
                  <div class="seat"></div>
                  <div class="seat"></div>
                  <div class="seat"></div>
                  <div class="seat"></div>
                  <div class="seat"></div>
                  <div class="seat"></div>
                </div>
                <div class="row">
                  <div class="seat"></div>
                  <div class="seat occupied"></div>
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
                <h1 id="rmovie">${mtitle }</h1>
              </div>
              <div class="moviePrice">
                <p>가격</p>
                <h1 id="moviePrice">9000원</h1>
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
              <p>SELECTED SEATS</p>
              <div class="selectedSeatsHolder" id="selectedSeatsHolder">
                <span class="noSelected">No Seat Selected</span>
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
                <button id="cancelBtn">취소하기</button>
              </div>
              <div class="proceedBtnEl">
                <button id="proceedBtn">결제하기</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</body>
</html>