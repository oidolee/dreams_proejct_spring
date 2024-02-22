//경기일정 구현 담당자 : 이민진
// Date 객체 생성
let date = new Date();

const renderCalendar = () => {
	const viewYear = date.getFullYear();
	const viewMonth = date.getMonth();

	// year-month 채우기
	document.querySelector('.year-month').textContent = `${viewYear}년 ${viewMonth + 1}월`;

	// 지난 달 마지막 Date, 이번 달 마지막 Date
	const prevLast = new Date(viewYear, viewMonth, 0);
	const thisLast = new Date(viewYear, viewMonth + 1, 0);

	//이전 달 마지막 일
	const PLDate = prevLast.getDate();
	//이전 달 마지막 요일
	const PLDay = prevLast.getDay();

	//이번달 마지막 일
	const TLDate = thisLast.getDate();
	//이번달 마지막 요일
	const TLDay = thisLast.getDay();

	// Dates 기본 배열들
	const prevDates = [];
	// Array(TLDate + 1).keys() => TLDate + 1인덱스 값 배열 만듬
	const thisDates = [...Array(TLDate + 1).keys()].slice(1);
	const nextDates = [];

	// prevDates 계산(이전달 일수)
	if (PLDay !== 6) {
		for (let i = 0; i < PLDay + 1; i++) {
			// prevDates.unshift(PLDate - i);
			prevDates.unshift("");
		}
	}

	// nextDates 계산(다음달 계산)
	for (let i = 1; i < 7 - TLDay; i++) {
		// nextDates.push(i)
		nextDates.push("")
	}

	// Dates 합치기
	const dates = prevDates.concat(thisDates, nextDates);

	// Dates 정리
	const firstDateIndex = dates.indexOf(1);
	const lastDateIndex = dates.lastIndexOf(TLDate);

	//데이터 추가 
	let location = {
		"드림즈": "고척",
		"키움": "고척",
		"LG": "잠실",
		"두산": "잠실",
		"한화": "대전",
		"Kia": "광주",
	}


	let selectMonth = "month_" + (viewMonth + 1);

	let homeAndAwayTag = '';
	dates.forEach((date, i) => {
		const dayIndex = i - firstDateIndex + 1; // 날짜에 대한 인덱스 조정

		const condition = dayIndex >= 1 && dayIndex <= lastDateIndex - firstDateIndex + 1
			? 'this'
			: 'other';
		if (games[selectMonth] && games[selectMonth][dayIndex]) {
			let deleteButton = "";
			let updateButton= "";
			let reserveButton = "";
			
		
			//admin 기준 예약 버튼
			if (idCheck == "admin") {
				deleteButton = ` <svg onclick="deleteGames(${games[selectMonth][dayIndex]['DG_No']})" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"/>
                                        <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"/>
                                    </svg>`;
                                    
	            updateButton = `<svg onclick="location.href='./update.gc?DG_No=${games[selectMonth][dayIndex]['DG_No']}'" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-wrench" viewBox="0 0 16 16">
								  <path d="M.102 2.223A3.004 3.004 0 0 0 3.78 5.897l6.341 6.252A3.003 3.003 0 0 0 13 16a3 3 0 1 0-.851-5.878L5.897 3.781A3.004 3.004 0 0 0 2.223.1l2.141 2.142L4 4l-1.757.364zm13.37 9.019.528.026.287.445.445.287.026.529L15 13l-.242.471-.026.529-.445.287-.287.445-.529.026L13 15l-.471-.242-.529-.026-.287-.445-.445-.287-.026-.529L11 13l.242-.471.026-.529.445-.287.287-.445.529-.026L13 11z"/>
								</svg>`;       
			}
			
			//로그인 기준 경기예약버튼
			if(idCheck){
				//admin 일떄만 경기예약 등록 버튼 출력
				reserveButton = `<button onclick="purchaseTicket(${viewYear}, ${viewMonth+1}, ${date}, 
				'${games[selectMonth][dayIndex]['time']}')" type="button" class="btn btn-success">경기예약</button>`
			}else{
				reserveButton = `<button onclick="location.href='./login.cc'" type="button" class="btn btn-primary">로그인</button>`
			}
			if (games[selectMonth][dayIndex]['checkHome'] == 'T') {
				homeAndAwayTag = '<strong style="color:#bb1b39 !important; ">HOME</strong>';
			} else {
				homeAndAwayTag = '<strong style="color:#369dd9 !important; ">AWAY</strong>';
			}
			dates[i] = `<div class="date">
                            <div class="contents">
                                <span class="${games[selectMonth][dayIndex]['checkHome']}">
                                    <span class="${condition}">${date}</span>
                                    ${homeAndAwayTag}
                                </span>
                                <div>
                                    <div>${games[selectMonth][dayIndex]['home']} : </div>
                                    <div>${games[selectMonth][dayIndex]['away']}</div>
                                </div>
                                <p>
                                    ${location[games[selectMonth][dayIndex]['home']]}
                                    ${games[selectMonth][dayIndex]['time']}
                                </p>
                                <div>
                                	${reserveButton}
                                	${updateButton}
                                   	${deleteButton}
                                </div>
                            </div>
                        </div>`;
		} else {
			let plustButton = '';
			if (date != '' && idCheck == "admin") {
				plustButton = `<svg onclick="addGames(${viewYear},${viewMonth+1},${date})" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard2-plus" viewBox="0 0 16 16">` +
                                `<path d="M9.5 0a.5.5 0 0 1 .5.5.5.5 0 0 0 .5.5.5.5 0 0 1 .5.5V2a.5.5 0 0 1-.5.5h-5A.5.5 0 0 1 5 2v-.5a.5.5 0 0 1 .5-.5.5.5 0 0 0 .5-.5.5.5 0 0 1 .5-.5z"/>` +
                                `<path d="M3 2.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 0 0-1h-.5A1.5 1.5 0 0 0 2 2.5v12A1.5 1.5 0 0 0 3.5 16h9a1.5 1.5 0 0 0 1.5-1.5v-12A1.5 1.5 0 0 0 12.5 1H12a.5.5 0 0 0 0 1h.5a.5.5 0 0 1 .5.5v12a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5z"/>` +
                                `<path d="M8.5 6.5a.5.5 0 0 0-1 0V8H6a.5.5 0 0 0 0 1h1.5v1.5a.5.5 0 0 0 1 0V9H10a.5.5 0 0 0 0-1H8.5z"/>` +
                              `</svg>`;
			}

			

			dates[i] = `<div class="date">
                            <div class="contents">
                                <span class="${condition}">${date}</span>
                                ${plustButton}
                            </div>                            
                        </div>`;
		}
	})
	// Dates 그리기
	document.querySelector('.dates').innerHTML = dates.join('');

	// 오늘 날짜 그리기
	const today = new Date();
	if (viewMonth === today.getMonth() && viewYear === today.getFullYear()) {
		for (let date of document.querySelectorAll('.this')) {
			if (+date.innerText === today.getDate()) {
				date.classList.add('today');

				break;
			}
		}
	}
}

renderCalendar();

const prevMonth = () => {
	date.setDate(1);
	date.setMonth(date.getMonth() - 1);
	renderCalendar();
}

const nextMonth = () => {
	date.setDate(1);
	date.setMonth(date.getMonth() + 1);
	renderCalendar();
}

const goToday = () => {
	date = new Date();
	renderCalendar();
}

//삭제 
const deleteGames = (DG_No) => {
	if (confirm("삭제하시겠습니까?")) {
		location.href = "./deleteGames.gc?DG_No=" + DG_No;
	}
}

//추가 
const addGames = (year,month,day) =>{
    location.href = "./gamesInsert.gc?year="+year+"&month="+month+"&day="+day;
}

//예약 기능 
const purchaseTicket = (year, month, day, time) => {
    const p_month = month < 10 ? "0" + month : month;
    const p_day = day < 10 ? "0" + day : day;
    const p_time = time; // 시간 변수 추가
    
    const purchaseDate = year + "-" + p_month + "-" + p_day + " " + p_time; // 변수명 수정
    
    // 예약 페이지로 이동할 때 구성된 날짜 정보를 전달합니다.
    let url = "./purchaseTicket.tc?game_date=" + purchaseDate;
    window.open(url, "_blank", "width=900, height=600");
}

