<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <jsp:include page="../include/importSource.jsp"></jsp:include>
        <link rel="stylesheet" href="/resources/css/weather/weather.css">
        <link rel="stylesheet" href="/resources/css/reset.css">
        <link rel="stylesheet" href="/resources/css/font.css">
        <title>산책 날씨 예보</title>
        <script src="http://code.jquery.com/jquery-1.7.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    </head>
    <body>
        <jsp:include page="../include/header.jsp"></jsp:include>

        <main class="main">
            <div class="contanier">
                <!-- 타이틀 -->
                <div class="main-title">
                    <h1>산책 날씨 예보</h1>
                </div>

                <div id="line"></div>

                <div class="choice-area">
                    <!-- 지역 선택 -->
                    <div class="region-selector">
                        <div id="region">
                            <button class="select-button">지역</button>
                            <p id="select-region"></p>
                        </div>
                            <ul class="region-list">
                                <li>
                                    <button class="button-item active" onclick="handleButtonClick('60', '127', 'Seoul')">
                                        서울
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('66', '103', 'Sejong')">
                                        세종
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('51', '67', 'Jeollanam-do')">
                                        전남
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('89', '91', 'Gyeongsangbuk-do')">
                                        경북
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('91', '77', 'Gyeongsangnam-do')">
                                        경남
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('60', '120', 'Gyeonggi-do')">
                                        경기
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('68', '100', 'Chungcheongnam-do')">
                                        충남
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('63', '89', 'Jeollabuk-do')">
                                        전북
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('98', '76', 'Busan')">
                                        부산
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('73', '134', 'Gangwon-do')">
                                        강원
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('55', '124', 'Incheon')">
                                        인천
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('69', '107', 'Chungcheongbuk-do')">
                                        충북
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('89', '90'. 'Daegu')">
                                        대구
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('102', '84', 'Ulsan')">
                                        울산
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('52', '38', 'Jeju')">
                                        제주
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('67', '100', 'Daejeon')">
                                        대전
                                    </button>
                                </li>
                                <li>
                                    <button class="button-item" onclick="handleButtonClick('58', '74', 'Gwangju')">
                                        광주
                                    </button>
                                </li>
                            </ul>
                    </div>
                </div>

                <!-- 오늘의 tmi -->
                <div class="today-tmi">
	                <div class="tmi-text">
						<img class="free-img" src="/resources/images/weather/jong.png">
						<div class="tmi" id="randomTmi"></div>
	                </div>
					<a class="free-board" href="/board/freeList.pet" style="text-decoration: none; color: white;">
					    <img class="board-logo" src="/resources/images/pet-white.png" alt="로고">
					    자유게시판
					</a>
                </div>

                <!-- 오늘의 날씨 -->
                <div class="today-weather">
                    <div class="today-left">
                        <!-- 오늘 날짜 -->
                        <div class="today-weather-date">
                            <div class="tDate"></div>
                        </div>
                        <!-- 기온 -->
                        <div class="today-weather-Temperature">
                        
                        	<!-- 날씨 아이콘 동적으로 수정 예정 -->
                        	<img id="weather-icon" src="" alt="날씨 아이콘">
							<div id="tIcon"></div>
                            <span class="tTemp"></span>
                        </div>
                        <div class="img-area">
                            <img class="dog-img" src="/resources/images/weather/dog.png">
                        </div>
                    </div>

                    <div class="today-rigth">
                        <!-- 강수 확률 -->
                        <div id="pro-rain" class="today-info">
                            강수 확률 <span class="pro-rain"></span>
                        </div>
                        <!-- 최고 기온 -->
                        <div id="temp-max" class="today-info">
                            최고 기온 <span class="temp-max"></span>
                        </div>
                        <!-- 최저 기온 -->
                        <div id="temp-min" class="today-info">
                            최저 기온 <span></span>
                            <span class="temp-min"></span>
                        </div>
                    </div>
                </div>

                <!-- 시간별 기온 -->
                <div class="time-weather">
                    <h2>시간별 기온</h2>
                    <div class="time-temp">
                    	<ul>
                    		<li>
                    			<div class="time" id="time-01"></div>
                    			<div class="time">^^</div>
                    			<span class="time">1시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-02"></div>
                    			<div class="time">^^</div>
                    			<span class="time">2시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-03"></div>
                    			<div class="time">^^</div>
                    			<span class="time">3시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-04"></div>
                    			<div class="time">^^</div>
                    			<span class="time">4시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-05"></div>
                    			<div class="time">^^</div>
                    			<span class="time">5시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-06"></div>
                    			<div class="time">^^</div>
                    			<span class="time">6시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-07"></div>
                    			<div class="time">^^</div>
                    			<span class="time">7시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-08"></div>
                    			<div class="time">^^</div>
                    			<span class="time">8시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-09"></div>
                    			<div class="time">^^</div>
                    			<span class="time">9시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-10"></div>
                    			<div class="time">^^</div>
                    			<span class="time">10시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-11"></div>
                    			<div class="time">^^</div>
                    			<span class="time">11시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-12"></div>
                    			<div class="time">^^</div>
                    			<span class="time">12시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-13"></div>
                    			<div class="time">^^</div>
                    			<span class="time">13시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-14"></div>
                    			<div class="time">^^</div>
                    			<span class="time">14시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-15"></div>
                    			<div class="time">^^</div>
                    			<span class="time">15시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-16"></div>
                    			<div class="time">^^</div>
                    			<span class="time">16시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-17"></div>
                    			<div class="time">^^</div>
                    			<span class="time">17시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-18"></div>
                    			<div class="time">^^</div>
                    			<span class="time">18시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-19"></div>
                    			<div class="time">^^</div>
                    			<span class="time">19시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-20"></div>
                    			<div class="time">^^</div>
                    			<span class="time">20시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-21"></div>
                    			<div class="time">^^</div>
                    			<span class="time">21시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-22"></div>
                    			<div class="time">^^</div>
                    			<span class="time">22시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-23"></div>
                    			<div class="time">^^</div>
                    			<span class="time">23시</span>
                    		</li>
                    		<li>
                    			<div class="time" id="time-24"></div>
                    			<div class="time">^^</div>
                    			<span class="time">0시</span>
                    		</li>
                    	</ul>
                    </div>
                </div>
				
                <!-- 일별 기온 -->
                <div class="date-weather">
                    <h2>일별 기온</h2>
                    <div class="date-temp">
	                    <ul>
	                    	<li>
			                    <div class="day-temp" id="day-temp-one">
			                    	<span id="today">오늘</span>
			                    	강수 확률 : 
			                    	<span class="day-text">오전</span> <span id="today-rain-am" class="today-rain"></span> 
			                    	<span class="day-text">오후</span> <span id="today-rain-pm" class="today-rain"></span><br>
			                    	최저 기온 : <span id="today-temp-min"></span> 최고 기온: <span id="today-temp-max"></span>
			                    </div>
	                    	</li>
	                    	<li>
			                    <div class="day-temp" id="day-temp-two">
			                    	<span id="tomorrow">내일</span>
			                    	강수 확률 : 
			                    	<span class="day-text">오전</span> <span id="tomorrow-rain-am" class="tomorrow-rain"></span> 
			                    	<span class="day-text">오후</span> <span id="tomorrow-rain-pm" class="tomorrow-rain"></span><br>
			                    	최저 기온 : <span id="tomorrow-temp-min"></span> 최고 기온: <span id="tomorrow-temp-max"></span>
			                    </div>
	                    	</li>
	                    	<li>
			                    <div class="day-temp" id="day-temp-three">
									<span id="aft-tomorrow"></span>
			                    	강수 확률 :
			                    	<span class="day-text">오전</span> <span id="aft-tomorrow-am" class="aft-tomorrow"></span> 
			                    	<span class="day-text">오후</span> <span id="aft-tomorrow-pm"  class="aft-tomorrow"></span><br>
			                    	최저 기온 : <span id="aft-tomorrow-temp-min"></span> 최고 기온: <span id="aft-tomorrow-temp-max"></span>
			                    </div>
	                    	</li>
	                    </ul>
                    </div>
                </div>
            </div>
        </main>

        <jsp:include page="../include/footer.jsp"></jsp:include>

        <script>        
            // 지역 선택
            document.addEventListener("DOMContentLoaded", function () {
                const selectRegion = document.getElementById("select-region");
                selectRegion.textContent = "서울"; // 기본값으로 서울 설정
            });
            
            const selectRegion = document.getElementById("select-region");
            const buttons = document.querySelectorAll(".button-item");

            buttons.forEach(button => {
                button.addEventListener("click", () => {
                    // 모든 버튼에서 active 클래스를 제거
                    buttons.forEach(btn => {
                        btn.classList.remove("active");
                    });

                    // 클릭한 버튼에만 active 클래스 추가
                    button.classList.add("active");

                    const buttonText = button.textContent;
                    selectRegion.textContent = buttonText;
                });
            });

			// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 날씨 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ //
			
			// 오늘 날짜 출력
            const $now = new Date($.now());
           	const $date = $now.getFullYear() + '년 ' + ($now.getMonth() + 1) +'월 ' + $now.getDate() +'일 ' +$now.getHours() + '시 ' + $now.getMinutes() + '분';
            $('.tDate').prepend($date);
            
			// API url 날짜 형식 변수화
	        let date = new Date();
	        let year = date.getFullYear();
	        let month = "0" + (date.getMonth() +1);
	        let month2 = month.substr(-2);
	        let day = "0" + date.getDate();
	        let day2 = day.substr(-2);
	        let initDate = year + month2 + day2;    // 오늘 날짜
	        
	        // 아이콘 출력을 위해 강수확률 값 저장할 변수 선언
	        let rainValue = "";
	        
	        // API url, serviceKey, parameter 기본값
	        let apiUrl = "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst";
            const serviceKey = "4pYTUL0IAyNldYcuL1CFGcJpGrgPllaY%2BkD8xcBEHAbaLSA8xraNMsfHFO%2BXhGJmos%2FBszyn6LH7HoSBORAAhQ%3D%3D";
            const pageNo = "1";
            const numOfRows = "1000";
            const dataType = "JSON";
            let base_date = initDate;
            let nx = "60";
            let ny = "127";
	        
			// base_time 형식 메소드화 ex. 0200
			function getFormattedTime() {
			    const now = new Date();										// 현재 시간
			    const hours = String(now.getHours()).padStart(2, '0');		// 왼쪽에 0을 채워넣어 2자리 문자열로 변환(시간)
			    const minutes = String(now.getMinutes()).padStart(2, '0');	// 왼쪽에 0을 채워넣어 2자리 문자열로 변환(분)
			    return hours + minutes;										// 현재 시간
			}
			
// 			// api 발표시간 오차로 60분 빼기
// 			function calculateBaseTime(formattedTime, subtractMinutes) {
// 			    let base_time = "0" + (formattedTime - subtractMinutes); // 구한 시간 앞에 0 추가
// // 			    console.log("bt : " +base_time.slice(-4));				 // 현재시간 - 1시간
// 			    return base_time.slice(-4);								 // 0을 포함한 시간을 뒤에서 부터 4자리 반환
// 			}

            
			// 지역 선택(버튼 클릭)
			function handleButtonClick (nxValue, nyValue, city) {
		        
		        nx = nxValue; // 버튼 누른 지역의 nx 값
		        ny = nyValue; // 버튼 누른 지역의 ny 값
		        city = city
		        
		        weatherTemp(nx, ny, city);	// 현재 온도
		        weatherRain(nx, ny);		// 오늘 강수량
		        weatherTempMinMax(nx, ny);	// 오늘 최저/최대 온도
		        weatherTime(nx, ny);		// 오늘 시간별 기온
		        weatherDay(nx, ny);			// 일별 강수량/최저, 최대 온도
			}

			// api 출력 메소드 위치 기본값 세팅(서울)
        	weatherTemp('60', '127', 'Seoul');
        	//weatherRain('60', '127');
        	//weatherTempMinMax('60', '127');
        	weatherTime('60', '127');
        	weatherDay('60', '127');
            
            // ************************************************ 초단기 실황(현재 온도) ************************************************//
            // openweathermap.api
            function weatherTemp(nx, ny, city) {
            	apiUrl = "https://api.openweathermap.org/data/2.5/weather";
            	const apiKey = "a5d1dc2dfcf28e0c9a351c9a21ef186f";
	            const url = apiUrl + "?q=" +  city + "&appid=" + apiKey + "&units=metric";

	            $.getJSON (url, function(data){
	            	const celsius = "℃";
	            	
	            	let iconUrl;
	            	formattedTime = getFormattedTime();
	            	
		            const $temp = data.main.temp; // 현재 온도 api 배열
		            const reounderTemp = Math.round($temp * 10) / 10;
		            
		            $('.tTemp').empty().append(reounderTemp).append(celsius); // 현재 온도
		        });
            }

			
			// ************************************************ 단기 예보(강수확률) ************************************************//
         	function weatherRain(nx, ny) {
				
//          		base_date = initDate;
				base_time="0200";
				
				// 0시 ~ 2시 비는 시간은 전날 23시 예보 출력
// 				let formattedTime = getFormattedTime(); // 현재 시간
				
// 				if(formattedTime >= "0000" && formattedTime < "0300") {
// 			        base_date = initDate - 1;
// 			        base_time = "2300";
// 				}
         		
	         	apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
				
				let fcstTime = getFormattedTime(); // 예보 시간(이걸로 배열 가져와야 함)
				fcstTime = fcstTime.substring(0, 2) + "00";
				
	         	url = apiUrl + "?serviceKey=" +  serviceKey + "&pageNo=" + pageNo + "&numOfRows=" + numOfRows + "&dataType=" + dataType + "&base_date=" + base_date + "&base_time=" + base_time + "&nx=" + nx + "&ny=" + ny;
	         	console.log("단기 예보(강수확률) : " + url);
				$.getJSON (url, function(data){
					const percentage = "%";
					let fcstValue = "";
					
					// 기상청 api 배열이 중간에 해당 시간대에만 출력되는 예보가 있어서 반복문 사용을 못했음.
// 					if(formattedTime >= "0000" && formattedTime < "0300") {

// 						switch(fcstTime) {
// 							case '0000': fcstValue = data.response.body.items.item[7].fcstValue; break;
// 							case '0100': fcstValue = data.response.body.items.item[19].fcstValue; break;
// 							case '0200': fcstValue = data.response.body.items.item[31].fcstValue; break;
// 						}
// 					} else if(formattedTime >= "0300" && formattedTime < "2400") {
						
						switch(fcstTime) {
							case '0300': fcstValue = data.response.body.items.item[7].fcstValue; break;
							case '0400': fcstValue = data.response.body.items.item[19].fcstValue; break;
							case '0500': fcstValue = data.response.body.items.item[31].fcstValue; break;
							case '0600': fcstValue = data.response.body.items.item[43].fcstValue; break;
							case '0700': fcstValue = data.response.body.items.item[56].fcstValue; break;
							case '0800': fcstValue = data.response.body.items.item[68].fcstValue; break;
							case '0900': fcstValue = data.response.body.items.item[80].fcstValue; break;
							case '1000': fcstValue = data.response.body.items.item[92].fcstValue; break;
							case '1100': fcstValue = data.response.body.items.item[104].fcstValue; break;
							case '1200': fcstValue = data.response.body.items.item[116].fcstValue; break;
							case '1300': fcstValue = data.response.body.items.item[128].fcstValue; break;
							case '1400': fcstValue = data.response.body.items.item[140].fcstValue; break;
							case '1500': fcstValue = data.response.body.items.item[152].fcstValue; break;
							case '1600': fcstValue = data.response.body.items.item[165].fcstValue; break;
							case '1700': fcstValue = data.response.body.items.item[177].fcstValue; break;
							case '1800': fcstValue = data.response.body.items.item[189].fcstValue; break;
							case '1900': fcstValue = data.response.body.items.item[201].fcstValue; break;
							case '2000': fcstValue = data.response.body.items.item[213].fcstValue; break;
							case '2100': fcstValue = data.response.body.items.item[225].fcstValue; break;
							case '2200': fcstValue = data.response.body.items.item[237].fcstValue; break;
							case '2300': fcstValue = data.response.body.items.item[249].fcstValue; break;
						}
// 					}
					rainValue = fcstValue; // 강수량 저장
					console.log(rainValue);
					$('.pro-rain').empty().append(fcstValue).append(percentage); // 강수 확률
					
					weatherIcon();
				});
         	}
			
			// ************************************************ 단기 예보(최고/최저 기온) ************************************************//
			function weatherTempMinMax(nx, ny) {
				
				base_date = initDate;
				base_time = "0200";
				
				// 0시 ~ 2시 비는 시간은 전날 23시 예보 출력
// 				formattedTime = getFormattedTime(); // 현재 시간
// 				if(formattedTime >= "0000" && formattedTime < "0300") {
// 			        base_date = initDate - 1;
// 			        base_time = "2300";
// 				}
				
				apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
				url = apiUrl + "?serviceKey=" +  serviceKey + "&pageNo=" + pageNo + "&numOfRows=" + numOfRows + "&dataType=" + dataType + "&base_date=" + base_date + "&base_time=" + base_time + "&nx=" + nx + "&ny=" + ny;
				
				$.getJSON (url, function(data){
					const celsius = "℃";
					let tempMax;
					let tempMin;
					let roundedTempMax;
					let roundedTempMin;
					
					//  0시 ~ 2시 일 경우
// 					if(formattedTime >= "0000" && formattedTime < "0200") {
// 						tempMax = data.response.body.items.item[193].fcstValue;
// 						tempMin = data.response.body.items.item[84].fcstValue;
// 						roundedTempMax = Math.round(tempMax);
// 						roundedTempMin = Math.round(tempMin);
// 					}
					
					tempMax = data.response.body.items.item[157].fcstValue;
					tempMin = data.response.body.items.item[48].fcstValue;
					roundedTempMax = Math.round(tempMax);
					roundedTempMin = Math.round(tempMin);
					
					$('.temp-max').empty().append(roundedTempMax).append(celsius); // 최고 기온
					$('.temp-min').empty().append(roundedTempMin).append(celsius); // 최저 기온
				});
			}
			
			// ************************************************ 초단기 예보(일 시간별 기온) ************************************************//
			
			function weatherTime(nx, ny) {
				
				base_time = "0030"
				base_date = initDate
				apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst";
				
				url = apiUrl + "?serviceKey=" +  serviceKey + "&pageNo=" + pageNo + "&numOfRows=" + numOfRows + "&dataType=" + dataType + "&base_date=" + base_date + "&base_time=" + base_time + "&nx=" + nx + "&ny=" + ny;
				
				$.getJSON (url, function(data){
					const celsius = "℃";
					
					const tempOne = data.response.body.items.item[24].fcstValue	 // 01:00
					const tempTwo = data.response.body.items.item[25].fcstValue	 // 02:00
					const tempThr = data.response.body.items.item[26].fcstValue	 // 03:00
					const tempFour = data.response.body.items.item[27].fcstValue // 04:00
					const tempFive = data.response.body.items.item[28].fcstValue // 05:00
					const tempSix = data.response.body.items.item[29].fcstValue	 // 06:00
					
					$('#time-01').empty().append(tempOne).append(celsius);
					$('#time-02').empty().append(tempTwo).append(celsius);
					$('#time-03').empty().append(tempThr).append(celsius);
					$('#time-04').empty().append(tempFour).append(celsius);
					$('#time-05').empty().append(tempFive).append(celsius);
					$('#time-06').empty().append(tempSix).append(celsius);
				});
				
				base_time = "0630"
				apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst";
				url = apiUrl + "?serviceKey=" +  serviceKey + "&pageNo=" + pageNo + "&numOfRows=" + numOfRows + "&dataType=" + dataType + "&base_date=" + base_date + "&base_time=" + base_time + "&nx=" + nx + "&ny=" + ny;
				
				$.getJSON (url, function(data){
					const celsius = "℃";
					const tempSev = data.response.body.items.item[24].fcstValue	 // 07:00
					const tempEig = data.response.body.items.item[25].fcstValue	 // 08:00
					const tempNine = data.response.body.items.item[25].fcstValue // 09:00
					const tempTen = data.response.body.items.item[26].fcstValue  // 10:00
					const tempEle = data.response.body.items.item[27].fcstValue	 // 11:00
					const tempTwe = data.response.body.items.item[28].fcstValue	 // 12:00
// 					console.log(data.response.body.items.item[28]);
					
					$('#time-07').empty().append(tempSev).append(celsius);
					$('#time-08').empty().append(tempEig).append(celsius);
					$('#time-09').empty().append(tempNine).append(celsius);
					$('#time-10').empty().append(tempTen).append(celsius);
					$('#time-11').empty().append(tempEle).append(celsius);
					$('#time-12').empty().append(tempTwe).append(celsius);
				});
				
				base_time = "1230"
				apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst";
				url = apiUrl + "?serviceKey=" +  serviceKey + "&pageNo=" + pageNo + "&numOfRows=" + numOfRows + "&dataType=" + dataType + "&base_date=" + base_date + "&base_time=" + base_time + "&nx=" + nx + "&ny=" + ny;
				
				$.getJSON (url, function(data){
					const celsius = "℃";
					const tempThi = data.response.body.items.item[24].fcstValue	 	 // 13:00
					const tempFou = data.response.body.items.item[25].fcstValue	 	 // 14:00
					const tempFif = data.response.body.items.item[25].fcstValue 	 // 15:00
					const tempSixteen = data.response.body.items.item[26].fcstValue  // 16:00
					const tempSeven = data.response.body.items.item[27].fcstValue	 // 17:00
					const tempEigh = data.response.body.items.item[28].fcstValue	 // 18:00
// 					console.log(data.response.body.items.item[28]);
					
					$('#time-13').empty().append(tempThi).append(celsius);
					$('#time-14').empty().append(tempFou).append(celsius);
					$('#time-15').empty().append(tempFif).append(celsius);
					$('#time-16').empty().append(tempSixteen).append(celsius);
					$('#time-17').empty().append(tempSeven).append(celsius);
					$('#time-18').empty().append(tempEigh).append(celsius);
				});
				
				base_time = "1830"
				apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst";
				url = apiUrl + "?serviceKey=" +  serviceKey + "&pageNo=" + pageNo + "&numOfRows=" + numOfRows + "&dataType=" + dataType + "&base_date=" + base_date + "&base_time=" + base_time + "&nx=" + nx + "&ny=" + ny;
				
				$.getJSON (url, function(data){
					const celsius = "℃";
					const tempNineteen = data.response.body.items.item[24].fcstValue	// 19:00
					const tempTwenty = data.response.body.items.item[25].fcstValue		// 20:00
					const tempTwentyOne = data.response.body.items.item[25].fcstValue	// 21:00
					const tempTwentyTwo = data.response.body.items.item[26].fcstValue	// 22:00
					const tempTwentyThr = data.response.body.items.item[27].fcstValue	// 23:00
					const tempTwentyFour = data.response.body.items.item[28].fcstValue	// 00:00
// 					console.log(data.response.body.items.item[28]);
					
					$('#time-19').empty().append(tempNineteen).append(celsius);
					$('#time-20').empty().append(tempTwenty).append(celsius);
					$('#time-21').empty().append(tempTwentyOne).append(celsius);
					$('#time-22').empty().append(tempTwentyTwo).append(celsius);
					$('#time-23').empty().append(tempTwentyThr).append(celsius);
					$('#time-24').empty().append(tempTwentyFour).append(celsius);
				});
			}
			
			// 시간대별 온도 추가해야함.
			
			// ************************************************ 단기 예보(일별 기온/강수량) ************************************************//
			function weatherDay(nx, ny) {
				
				// 오늘 날짜 출력
	            const $now = new Date($.now());
	           	const $aftTomorrow =($now.getMonth() + 1) +'월 ' + ($now.getDate()+2) +'일 ';
	            $('#aft-tomorrow').empty().append($aftTomorrow);
	            
	            base_time="0200";
	            apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
	            url = apiUrl + "?serviceKey=" +  serviceKey + "&pageNo=" + pageNo + "&numOfRows=" + numOfRows + "&dataType=" + dataType + "&base_date=" + base_date + "&base_time=" + base_time + "&nx=" + nx + "&ny=" + ny;
				
				$.getJSON (url, function(data){ // 오후 3시 기준	
					const percentage = "%";
					const celsius = "℃";
					
					const fcstTimeAm = "0900"; // 오전
					const fcstTimePm = "1800"; // 오후
					
// 					formattedTime = getFormattedTime(); // 현재 시간
// 					let fcstTime = formattedTime.slice(0, -2) + "00"; // 예보 시간
// 					console.log(fcstTime);
					
					// 오전/오후 강수량만 가져오는 배열
					let popData = new Array();
					let tmxData = new Array();
					let tmnData = new Array();
					data.response.body.items.item.map(function(weatherData) {
						if(weatherData.category === "POP") {
							popData.push(weatherData);
						}else if(weatherData.category === "TMX") {
							tmxData.push(weatherData);
						}else if(weatherData.category === "TMN") {
							tmnData.push(weatherData);
						}
					});
					
					// 최고 기온
					const nowTempMax = Math.round(tmxData[0].fcstValue);	// 오늘 최고 기온
					const tmoTempMax = Math.round(tmxData[1].fcstValue);	// 내일 최고 기온
					const aftTempMax = Math.round(tmxData[2].fcstValue);	// 모레 최고 기온
					
					$('.temp-max').empty().append(nowTempMax).append(celsius); 						// 오늘 최고 기온(지금 날씨)
					$('#today-temp-max').empty().append(nowTempMax).append(celsius);				// 오늘 최고 기온(일별)
					$('#tomorrow-temp-max').empty().append(tmoTempMax).append(celsius);				// 내일 최고 기온(일별)
					$('#aft-tomorrow-temp-max').empty().append(aftTempMax).append(celsius);			// 모레 최고 기온(일별)
					
					// 최저 기온
					const nowTempMin = Math.round(tmnData[0].fcstValue);
					const tmoTempMin = Math.round(tmnData[1].fcstValue);
					const aftTempMin = Math.round(tmnData[2].fcstValue);
					
					$('.temp-min').empty().append(nowTempMin).append(celsius); // 오늘 최저 기온
					
					
					
					
// 					const todayRainAm = weathers[0].fcstValue		// 오늘 오전 강수확률
// 					const todayRainPw = weathers[1].fcstValue		// 오늘 강수확률
// 					const tomorrowRainAm = weathers[2].fcstValue	// 내일 강수확률
// 					const tomorrowRainPm = weathers[3].fcstValue	// 모레 강수확률
// 					const aftTomorrowRainAm = weathers[4].fcstValue // 모레 강수확률
// 					const aftTomorrowRainPm = weathers[5].fcstValue // 모레 강수확률
					
// 					const todayTempN = data.response.body.items.item[48].fcstValue   		 
// 					const todayTempMin = Math.round(todayTempN);							 // 오늘 최저기온
// 					const todayTempM = data.response.body.items.item[157].fcstValue   		 
// 					const todayTempMax = Math.round(todayTempM);							 // 오늘 최고기온
// 					const tomorrowTempN = data.response.body.items.item[338].fcstValue   		 
// 					const tomorrowTempMin = Math.round(tomorrowTempN);						 // 내일 최저기온
// 					const tomorrowTempM = data.response.body.items.item[447].fcstValue   		 
// 					const tomorrowTempMax = Math.round(tomorrowTempM);						 // 내일 최고기온
// 					const aftTomorrowTempN = data.response.body.items.item[628].fcstValue   		 
// 					const aftTomorrowTempMin = Math.round(aftTomorrowTempN);				 // 모레 최저기온
// 					const aftTomorrowTempM = data.response.body.items.item[737].fcstValue   		 
// 					const aftTomorrowTempMax = Math.round(aftTomorrowTempM);				 // 모레 최고기온
					
// 					$('#today-rain-am').empty().append(todayRainAm).append(percentage);				// 오늘 오전 강수확률
// 					$('#today-rain-pm').empty().append(todayRainPw).append(percentage);				// 오늘 오전 강수확률
// 					$('#tomorrow-rain-am').empty().append(tomorrowRainAm).append(percentage);		// 내일 오전 강수확률
// 					$('#tomorrow-rain-pm').empty().append(tomorrowRainPm).append(percentage);		// 내일 오후 강수확률
// 					$('#aft-tomorrow-am').empty().append(aftTomorrowRainAm).append(percentage);		// 모레 오전 강수확률
// 					$('#aft-tomorrow-pm').empty().append(aftTomorrowRainPm).append(percentage); 	// 모레 오후 강수확률
					
// 					$('#today-temp-min').empty().append(todayTempMin).append(celsius);				// 오늘 최저기온
// 					$('#today-temp-max').empty().append(todayTempMax).append(celsius);				// 오늘 최고기온
// 					$('#tomorrow-temp-min').empty().append(tomorrowTempMin).append(celsius);		// 내일 최저기온
// 					$('#tomorrow-temp-max').empty().append(tomorrowTempMax).append(celsius);		// 내일 최고기온
// 					$('#aft-tomorrow-temp-min').empty().append(aftTomorrowTempMin).append(celsius); // 모레 최저기온
// 					$('#aft-tomorrow-temp-max').empty().append(aftTomorrowTempMax).append(celsius); // 모레 최고기온
				});
				
//             	let iconUrl;
//             	formattedTime = getFormattedTime();	// 현재 시간
			}
			// 아이콘 출력
			function weatherIcon() {
				console.log("rainValue : "+rainValue);
				
				let iconUrl;
				formattedTime = getFormattedTime(); // 현재 시간
				console.log("formattedTime : " + formattedTime);
				
				if (rainValue == "0") {
					// 오전 7시부터 오후 5시까지는 해 이미지
					if(formattedTime >= "0700" && formattedTime <"1800") {
						iconUrl = "https://bmcdn.nl/assets/weather-icons/v3.0/fill/svg/clear-day.svg";
					// 오후 6시부터 다음 날 아침 6시까지는 달 이미지
					} else {
						iconUrl = "https://bmcdn.nl/assets/weather-icons/v3.0/fill/svg/clear-night.svg";
					}
				} else if (rainValue > "0") {
					iconUrl = "https://bmcdn.nl/assets/weather-icons/v3.0/fill/svg/rain.svg";
				}
				
				const weatherIcon = document.getElementById("weather-icon");
				weatherIcon.src = iconUrl;
			}
			
        </script>
        <script type="text/javascript" src="../resources/js/weather/tmi.js"></script>
    </body>
</html>