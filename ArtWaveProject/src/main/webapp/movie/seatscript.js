document.addEventListener("DOMContentLoaded", () => {
  const inwonEI = document.getElementById("rinwon");
  const watchdateEI = document.getElementById("rdate");
  const tdnameEI = document.getElementById("rtdname");
  const selectMovieEl = document.getElementById("rmovie");
  const allSeatCont = document.querySelectorAll("#seatCont .seat");

  const selectedSeatsHolderEl = document.getElementById("selectedSeatsHolder");
  const moviePriceEl = document.getElementById("moviePrice");

  const cancelBtnEL = document.getElementById("cancelBtn");
  const proceedBtnEl = document.getElementById("proceedBtn");
  const payBtnEl = document.getElementById("payBtn");

  let currentMovieName = selectMovieEl.textContent.trim();
  let moviePrice = parseInt(moviePriceEl.textContent.replace("원", "").trim(), 10);

  let initialSeatValue = 0;
  allSeatCont.forEach((seat) => {
    const attr = document.createAttribute("data-seatid");
    attr.value = ++initialSeatValue;
    seat.setAttributeNode(attr)
  })

  const seatContEl = document.querySelectorAll("#seatCont .seat:not(.occupied)");

  let takenSeats = [];

  seatContEl.forEach((seat) => {
    seat.addEventListener("click", (e) => {
      let isSelected = seat.classList.contains("selected");
      let seatId = JSON.parse(seat.dataset.seatid);

      if (!isSelected) {
        seat.classList.add("selected");
        takenSeats.push(seatId);
        takenSeats = [...new Set(takenSeats)];
      } else {
        seat.classList.remove("selected");
        takenSeats = takenSeats.filter((seat) => seat !== seatId);
      }
      updateSeats();
      updatePrice(moviePrice, takenSeats.length);
    });
  });

  function updateSeats() {
    selectedSeatsHolderEl.innerHTML = ``;

    takenSeats.forEach((seat) => {
      const seatHolder = document.createElement("div");
      seatHolder.classList.add("selectedSeat");
      selectedSeatsHolderEl.appendChild(seatHolder);
      seatHolder.innerHTML = seat;
    });

    if (!takenSeats.length) {
      const spanEl = document.createElement("span");
      spanEl.classList.add("noSelected");
      spanEl.innerHTML = `선택된 좌석이 없습니다`;
      selectedSeatsHolderEl.appendChild(spanEl);
    }

    seatCount();
  }
  
  function seatCount() {
    const numberOfSeatEl = document.getElementById("numberOfSeat");
    numberOfSeatEl.innerHTML = takenSeats.length;
  }

  function updatePrice(price, seats) {
    const totalPriceEl = document.getElementById("totalPrice");
    let total = seats * price;
    totalPriceEl.innerHTML = `${total} 원`;
  }

  cancelBtnEL.addEventListener("click", () => {
    cancelSeats();
  });

  function cancelSeats() {
    takenSeats = [];
    seatContEl.forEach((seat) => {
      seat.classList.remove("selected");
    });
    updatePrice(0, 0);
    updateSeats();
  }

  function successModal(movieNameIn, totalPrice) {
     
    const bodyEl = document.querySelector("body");

    const sectionEl = document.getElementById("section");

    const overlay = document.createElement("div");
    overlay.classList.add("overlay");
    sectionEl.appendChild(overlay);

    const successModal = document.createElement("div");
    successModal.classList.add("successModal");

    const modalTop = document.createElement("div");
    modalTop.classList.add("modalTop");
    const popImg = document.createElement("img");
    popImg.src = "https://github.com/Dinesh1042/Vanilla-JavaScript-Projects/blob/main/Movie%20Booking/asset/pop.png?raw=true";
    modalTop.appendChild(popImg);
    successModal.appendChild(modalTop);

    const modalCenter = document.createElement("div");
    modalCenter.classList.add("modalCenter");
    const modalHeading = document.createElement("h1");
    modalHeading.innerHTML = `좌석 선택 성공`;
    modalCenter.appendChild(modalHeading);
    const modalPara = document.createElement("p");
    modalPara.innerHTML = `${movieNameIn} 영화의 좌석 선택이 완료되었습니다. 결제를 위해 결제하기 버튼을 눌러주세요 :) `;
    modalCenter.appendChild(modalPara);
    successModal.appendChild(modalCenter);

    const modalBottom = document.createElement("div");
    modalBottom.classList.add("modalBottom");
    const successBtn = document.createElement("button");
    successBtn.innerHTML = `좌석 선택 완료`;
    modalBottom.appendChild(successBtn);
    successModal.appendChild(modalBottom);
    
   successBtn.addEventListener("click", () => {
      removeModal();
    });

    window.addEventListener("click", (e) => {
      if (e.target.classList.contains("overlay")) {
        removeModal();
      }
    });

    function removeModal() {
      overlay.remove();
      successModal.remove();
      bodyEl.classList.remove("modal-active");
    }

    sectionEl.appendChild(successModal);
  }

   proceedBtnEl.addEventListener("click", () => {
    const inwonCount = parseInt(inwonEI.textContent.trim(), 10);

    if (takenSeats.length === inwonCount) {
	  let selectedSeats = JSON.stringify(takenSeats);
	  let seats = (selectedSeats.toString()).slice(1, -1); 
      let totalPrice = (moviePrice * takenSeats.length).toString();
         $.ajax({
        	 type: 'post',
             url: '../movie/movieseat.do',
             data: { "seats": seats, "totalPrice":totalPrice},
             success: function(result) {
            	 $('#seats').val(seats)
            	 $('#price').val(totalPrice)
            	 payBtnEl.disabled = false;
             },
             error: function(request, status, error) {
                 console.log(error)
             }
        })
      const bodyEl = document.querySelector("body");
      bodyEl.classList.add("modal-active");
      successModal(currentMovieName, moviePrice * takenSeats.length);
    } else if (takenSeats.length > inwonCount) {
      alert("인원수보다 많은 좌석을 선택하셨습니다");
    } else {
      alert("인원수보다 적은 좌석을 선택하셨거나 좌석을 선택하지 않으셨습니다");
    }
  });
});

