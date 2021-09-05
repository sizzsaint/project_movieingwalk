<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .seat {
            width: 30px;
            height: 30px;
        }
        
        .clicked {
            background-color: red;
            color: white;
        }
    * {
    font-size: 11px;
}
body {
    background-color: #FDFCF0;
}
/* header */
.header-nav-wrapper {
    background: url(../images/bg_header.gif) repeat-x 0 0;
    background-position: center;
    background-size: contain;
    height: 120px;
    padding-top: 4px;
}

.header-nav-container {
    position: fixed;
}

.header {
    display: flex;
    justify-content: space-between;
    padding-left: 40px;
    padding-right: 150px;
}

.header-inner {
    display: flex;
}

.header-inner>div {
    border-right: 1px solid #DDDDDD;
    margin-left: 8px;
    padding-right: 4px;
}

/* //header */
/* nav */
.nav-line {
    background-color: red;
    border-radius: 50px;
    height: 5px;
    /* background-image: linear-gradient(to right, white 33%, rgba(255, 255, 255, 0) 0%);
  background-position: bottom;
  background-size: 15px 1px;
  background-repeat: repeat-x; */
}
.nav-wrapper {
    /* background: url(../images/bg_header.gif) repeat-x 0 0; */
    /* width: 100%;*/
    height: 94px;
    display: flex;
    align-items: center;
    justify-content: space-between;
}
.nav-content {
    padding-top: 15px;
}
.movieLogo-wrapper {
    text-align: center;
}
.nav-inner {
    display: flex;
    /* margin-left: -250px; */
    margin-left: 150px;
    margin-right: auto;
    align-items: center;
    padding-bottom: 15px;
}
.nav-inner>div>button {
    padding-top: 5px;
    font-size: 14px;
    font-weight: bold;
    margin-left: 15px;
}
.search-wrapper {
    margin-left: 70px;
    height: 20px;
}
.search-wrapper>input {
    width: 100px;
    height: 20px;
}
.searchButton {
    margin: 0 !important;
    padding: 2px !important;
    background-color: red;
    color: white;
    width: 30px;
    height: 100%;
    font-size: 10px !important;
}
/* content */
.reserve-container {
    margin-top: 20px;
    display: flex;
    justify-content: center;
    height: 800px;
    /* border: 1px solid #dddddd; */
}
.reserve-container>div {
    border: 1px solid #dddddd;
}
.reserve-title {
    border-bottom: 1px solid #dddddd;
    background-color: #444444;
    text-align: center;
    color: #dddddd;
    padding: 5px;
    font-size: 13px;
    font-weight: bold;
}
.movie-part {
    width: 284px;
}
.theater-part {
    width: 264px;
}
.day-part {
    width: 91px;
}
.time-part {
    width: 384px;
}
.sort-wrapper {
    margin: 10px 6px 6px 10px;
    /* padding: 3px; */
    display: flex;
    border-bottom: 1px solid #dddddd;
    font-size: 12px;
}
.sort-wrapper>div {
    padding: 3px;
}
.sort-wrapper>div:hover {
    border-bottom: 1px solid #111111;
}
.sort-selected {
    font-weight: bold;
    border-bottom: 1px solid #111111;
}
.sort-korean {
    margin-left: 6px;
}
.reserve-date {
    padding-top: 5px;
    display: flex;
    flex-direction: column;
    align-items: center;
    height: 770px;
    overflow: scroll;
    overflow-x: hidden;
}
.movie-date-wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 5px 2px;
}
.movie-week-of-day {
    margin-left: 5px;
    font-size: 10px;
    width: 12px;
    height: 22px;
    line-height: 22px;
}
.movie-day {
    text-align: center;
    width: 34px;
    height: 22px;
    font-size: 17px;
    font-weight: bold;
}
.saturday {
    color: #31597E;
    font-weight: bold;
}
.sunday {
    color: #AF2D2D;
    font-weight: bold;
}
.movie-date-wrapper-active {
    background-color: #333333;
}
.movie-date-wrapper-active>* {
    color: white;
}
</style>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel='stylesheet'
	href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
<script
	src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
<link rel="stylesheet"
	href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
<link rel = 'stylesheet' href="./../../css/seat.css" type="text/css">
<link href="./../../css/ticket.css" rel="stylesheet" type="text/css">
</head>

<body>
<center>
  		<div class="seat-wrapper">
						<div class="screen-view-wrapper">
						<div class="screen-view">SCREEN</div>
					</div>
		</div>
	<div class="select-container">
		<div class="select-wrapper">
			<div class="select-title">인원/좌석</div>
			<div class="select-seat-container">
				<div class="select-seat-number-container">
					<div class="select-seat-number-wrapper">
						<div class="select-seat">
							<div class="select-seat-age">일반</div>
							<div class="select-seat-number">
								<ul class="select-seat-ul select-seat-ul-normal">
									<li class="select-number-normal">0</li>
									<li class="select-number-normal">1</li>
									<li class="select-number-normal">2</li>
									<li class="select-number-normal">3</li>
									<li class="select-number-normal">4</li>
									<li class="select-number-normal">5</li>
									<!--  <li class="select-number-normal">6</li>
                                    <li class="select-number-normal">7</li>
                                    <li class="select-number-normal">8</li> -->
								</ul>
							</div>
						</div>
						
					</div>
					<div class="reserve-number-wrapper">
						<div class="reserve-number-title">선택된 좌석 수</div>
						<div class="reserve-number">0</div>
					</div>
				</div>
				</div>
				</div>
				</div>
					<div class="select-seat-information" align="center">
						<div class="select-seat-information-wrapper" align="center">
						<div class="select-theater-place selected-theater-place-info" align="center">CGV강남</div>
						<div class="select-theater-place selected-theater-place-info" align="center">3관
							8층</div>
						<div class="select-theater-place" align="center">
							<span>남은좌석</span><span class="remain-seats">152</span>/<span
								class="all-seats">172</span>
						</div>

					</div>
					<div class="select-theater-date">
						<div class="theater-date"></div>
						<div class="theater-time"></div>
					</div>
					<div class="selected-seats-wrapper">
						<span class="selected-seats-title">좌석번호</span> <span
							class="selected-seats">선택한 좌석이 없습니다.</span>
					</div>					
					<form action="moveKakao.do" class="seatForm" method="post">
						<input type="hidden" class="title" name="title"> <input
							type="hidden" class="selectedTheater" name="selectedTheater">
						<input type="hidden" class="reserveDate" name="movieDate">
						<input type="hidden" class="runningTime" name="runningTime">
						<input type="hidden" class="movieAge" name="movieAge">
						<!-- 티켓의수(선택한 좌석) -->
						<input type="hidden" class="ticketNumber" name="ticketNumber">
						<input type="hidden" class="selectedSeat" name="selectedSeat">
						<!-- 결제 정보 -->
						<input type="hidden" class="payMoney" name="payMoney">
						<button type="button" class="reserve-button">
							선택하기
						</button>
					</form>
				</div>

<script>
    let test = [];
    let selectedSeats = new Array();
    let selectedSeatsMap = [];
    const seatWrapper = document.querySelector(".seat-wrapper");
    let clicked = "";
    let div = "";

    for (let i = 0; i < 7; i++) {
        div = document.createElement("div");
        seatWrapper.append(div);
        for (let j = 0; j < 7; j++) {
            const input = document.createElement('input');
            input.type = "button";
            input.name = "seats"
            input.classList = "seat";
            //3중포문을 사용하지 않기위해 
            mapping(input, i, j);
            div.append(input);
            input.addEventListener('click', function(e) {
                console.log(e.target.value);
                //중복방지 함수
                selectedSeats = selectedSeats.filter((element, index) => selectedSeats.indexOf(element) != index);

                //click class가 존재할때(제거해주는 toggle)
                if (input.classList.contains("clicked")) {
                    input.classList.remove("clicked");
                    clicked = document.querySelectorAll(".clicked");
                    selectedSeats.splice(selectedSeats.indexOf(e.target.value), 1);
                    clicked.forEach((data) => {
                        selectedSeats.push(data.value);
                    });
                    //click class가 존재하지 않을때 (추가해주는 toggle)
                } else {
                    input.classList.add("clicked");
                    clicked = document.querySelectorAll(".clicked");
                    clicked.forEach((data) => {
                        selectedSeats.push(data.value);
                    })
                }
                console.log(selectedSeats);
            })
        }
    }
  // 좌석만들기
    function mapping(input, i, j) {
        if (i === 0) {
            input.value = "A" + j;
        } else if (i === 1) {
            input.value = "B" + j;
        } else if (i === 2) {
            input.value = "C" + j;
        } else if (i === 3) {
            input.value = "D" + j;
        } else if (i === 4) {
            input.value = "E" + j;
        } else if (i === 5) {
            input.value = "F" + j;
        } else if (i === 6) {
            input.value = "G" + j;
        }
    }    
</script>
 <!-- 날짜 -->
  <div class="day-part">
         <div class="time-part">
            <div class="reserve-title">시간</div>
            <div>09:30~11:00</div>
            <div>11:30~13:00</div>
            <div>14:30~15:00</div>
            <div>17:30~19:00</div>
            <div>21:00~22:40</div>
            <div class="reserve-title">날짜</div>
            <div class="reserve-date"></div>
   </div>   
   </div>        

  <script>
        const date = new Date();
        // console.log(date.getFullYear());
        const lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
        const reserveDate = document.querySelector(".reserve-date");

      
            const weekOfDay = ["일", "월", "화", "수", "목", "금", "토"]
            const year = date.getFullYear();
            const month = date.getMonth();
            for (i = date.getDate(); i <= lastDay.getDate(); i++) {

                const button = document.createElement("button");
                const spanWeekOfDay = document.createElement("span");
                const spanDay = document.createElement("span");

                //class넣기
                button.classList = "movie-date-wrapper"
                spanWeekOfDay.classList = "movie-week-of-day";
                spanDay.classList = "movie-day";

                //weekOfDay[new Date(2020-03-날짜)]
                const dayOfWeek = weekOfDay[new Date(year + "-" + month + "-" + i).getDay()];

                //요일 넣기
                if (dayOfWeek === "토") {
                    spanWeekOfDay.classList.add("saturday");
                    spanDay.classList.add("saturday");
                } else if (dayOfWeek === "일") {
                    spanWeekOfDay.classList.add("sunday");
                    spanDay.classList.add("sunday");
                }
                spanWeekOfDay.innerHTML = dayOfWeek;
                button.append(spanWeekOfDay);
                //날짜 넣기
                spanDay.innerHTML = i;
                button.append(spanDay);
                //button.append(i);
                reserveDate.append(button);

                dayClickEvent(button);
            }
            
        function dayClickEvent(button) {
            button.addEventListener("click", function() {
                const movieDateWrapperActive = document.querySelectorAll(".movie-date-wrapper-active");
                movieDateWrapperActive.forEach((list) => {
                    list.classList.remove("movie-date-wrapper-active");
                })
                button.classList.add("movie-date-wrapper-active");
            })
        }
    </script>
</center>
<script src="js/seat.js"></script>
</body>
</html>