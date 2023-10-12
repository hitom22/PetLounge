<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <jsp:include page="../include/importSource.jsp"></jsp:include>
        <link rel="stylesheet" href="/resources/css/hospital/hospitalPage.css">
        <link rel="stylesheet" href="/resources/css/hospital/hosMap.css">        
        <!-- 카카오맵 API services와 clusterer 라이브러리 불러오기 -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9674da3ceea3cb3a1acdb7044a416e8&libraries=services,clusterer"></script>
        <title>동물병원 안내</title>
        <style>
            .bookmark-icon-fill, .call-icon, .location-icon, .home-icon, .search-icon {
                margin-right: 10px;
                font-size: 20px;
                font-variation-settings:
                'FILL' 1,
                'wght' 400,
                'GRAD' 0,
                'opsz' 24
            }

            .bookmark-icon-none {
                margin-right: 10px;
                font-size: 20px;
                font-variation-settings:
                'FILL' 0,
                'wght' 400,
                'GRAD' 0,
                'opsz' 24
            }
        </style>

    </head>
    <body>
        <jsp:include page="../include/header.jsp"></jsp:include>

        <main>
            <!-- 페이지 타이틀 -->
            <section id="title-section">
                <h1>동물병원 안내</h1>
                <div id="line"></div>
            </section>

            <!-- 지도 -->
            <section id="map-section">
                <!-- 검색창 -->
                <form action="/hospital/search.do" method="post" id="search-hospital-form">
                    <div id="search-div">
                    	<c:if test="${ hSearchKeyword ne null }">
	                        <input type="search" value="${ hSearchKeyword }" name="hSearchKeyword" id="h-search-keyword" class="search-input" placeholder="찾고자 하는 주소 또는 동물 병원의 이름을 입력하세요">                     	
                    	</c:if>
                    	<c:if test="${ hSearchKeyword eq null }">
	                        <input type="search" name="hSearchKeyword" id="h-search-keyword" class="search-input" placeholder="찾고자 하는 주소 또는 동물 병원의 이름을 입력하세요">                     	
                    	</c:if>
                        <span class="material-symbols-outlined search-icon" onclick="searchHospital();" style="font-size: 3em; color: #FFD370; cursor: pointer; margin-left: 10px;">
                            search
                        </span>
                    </div>
                </form>
                <div id="map-div">
                    <!-- 기본 주소로 돌아가기 -->
                    <div>
                        <span class="material-symbols-outlined home-icon" style="font-size: 3.5em; color: #FFD370; cursor: pointer;" onclick="defaultLatLng();">
                            home_pin
                        </span>
                        <p class="home-info-box">기본 주소로 이동</p>
                        <span class="material-symbols-outlined gps-icon" style="font-size: 2.5em; cursor: pointer;" onclick="myGps();">
							my_location
						</span>
<!-- 						<p class="home-info-box">현위치</p> -->
                    </div>
                    <!-- 지도 -->
                    <div id="map" style="position:relative;overflow:hidden;">
	                    <!-- 지도타입 컨트롤 div 입니다 -->
					    <div class="custom_typecontrol radius_border">
					        <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
					        <span id="btnSkyview" class="btn" onclick="setMapType('skyview')">스카이뷰</span>
					    </div>
					    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
					    <div class="custom_zoomcontrol radius_border"> 
					        <span onclick="zoomIn()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>  
					        <span onclick="zoomOut()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
					    </div> 
                    </div>
                </div>
            </section>

       		<!-- 동물병원 리스트 -->
<!-- 			<section id="hospital-list-section"> -->
<!-- 				<table> -->
<%-- 					<colgroup> --%>
<%-- 						<col style="width: 5%;"> --%>
<%-- 						<col style="width: 23%;"> --%>
<%-- 						<col style="width: 22%;"> --%>
<%-- 						<col style="width: 50%;"> --%>
<%-- 					</colgroup> --%>
<!-- 					<thead> -->
<!-- 						<th colspan="4">내 주변 동물병원</th> -->
<!-- 					</thead> -->
<!-- 					<tbody> -->
<!-- 						검색 결과 없음 -->
<%-- 						<c:if test="${ empty hList }"> --%>
<!-- 							<tr> -->
<!-- 								<td colspan="4"> -->
<!-- 									검색 결과 없음 -->
<!-- 								</td> -->
<!-- 							</tr> -->
<%-- 						</c:if> --%>
<%-- 						<c:if test="${ !empty hList }"> --%>
<!-- 							기본 주소 리스트 -->
<%-- 							<c:forEach var="hosList" items="${ hList }" end="5" varStatus="status"> --%>
<%-- 								<tr onclick="changeCenter(${ hosList.hLat }, ${ hosList.hLng }, ${ status.index });"> --%>
<!-- 									<td class=""> -->
<!-- 										<span class="material-symbols-outlined bookmark-icon-fill" style="color: #FFD370;">
<!-- 			                                    bookmark -->
<!-- 			                                </span> -->  
<!-- 		                                <span class="material-symbols-outlined bookmark-icon-none" -->
<!-- 										style="color: #FFD370;"> bookmark </span> -->
<!-- 									</td> -->
<!-- 									<td class=""> -->
<!-- 										동물병원 이름  -->
<%-- 										${ hosList.hName } --%>
<!-- 									</td> -->
<!-- 									<td class=""> -->
<!-- 										<div> -->
<!-- 											<span class="material-symbols-outlined call-icon" -->
<!-- 												style="color: #56b983;"> call </span> -->
<!-- 											전화번호 -->
<%-- 											<c:if test="${ hosList.hPhone eq null }"> --%>
<!-- 												- -->
<%-- 											</c:if> --%>
<%-- 											<c:if test="${ hosList.hPhone ne null }"> --%>
<%-- 												${ hosList.hPhone } --%>
<%-- 											</c:if> --%>
<!-- 										</div> -->
<!-- 									</td> -->
<!-- 									<td class=""> -->
<!-- 										<div> -->
<!-- 											<span class="material-symbols-outlined location-icon" -->
<!-- 												style="color: #e54242;"> location_on </span> -->
<!-- 											주소 -->
<%-- 											${ hosList.hRoadAddr } --%>
<!-- 										</div> -->
<!-- 									</td> -->
<!-- 								</tr> -->
<%-- 							</c:forEach> --%>
<%-- 						</c:if> --%>
<!-- 					</tbody> -->
<!-- 				</table> -->
<!-- 			</section> -->


			<section id="hospital-list-section">
			    <table>
			        <colgroup>
			            <col style="width: 5%;">
			            <col style="width: 23%;">
			            <col style="width: 22%;">
			            <col style="width: 50%;">
			        </colgroup>
			        <thead>
			            <th colspan="4">내 주변 동물병원</th>
			        </thead>
			        <tbody id="hospital-list-body">
			        </tbody>
			    </table>
			</section>

        </main>
        
		<jsp:include page="../include/footer.jsp"></jsp:include>
		
		<!-- 카카오맵 API 지도 스크립트 -->
		<script>
			var overlay;
			
			if(${sessionScope.uId eq null}) {
				// ************************* 비회원 기본 주소 *****************************			
				var lat = 37.5679212;
				var lng = 126.9830358;
				createMap(lat, lng);
			} else {
				// ************************* 회원가입 시 받은 주소로 기본 주소 *****************************
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				
				// 주소로 좌표를 검색합니다
				const userAddr = '${ user.uAddr }'; // 회원의 주소
				geocoder.addressSearch(userAddr, function(result, status) {
				
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
				    	var lat = result[0].y;
				    	var lng = result[0].x;
				    	 
				        createMap(lat, lng);
				
// 				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
// 				        map.setCenter(coords);
				    } 
				});  
				
			}			
			
			// 지도를 생성하는 함수
			function createMap(lat, lng) {
				var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
				var options = { //지도를 생성할 때 필요한 기본 옵션
					center: new kakao.maps.LatLng(lat, lng), //지도의 중심좌표 (기본주소)
					level: 6 //지도의 레벨(확대, 축소 정도)
				};
		
				map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
				findList(map, lat, lng);
			}
			
			// 리스트를 불러오는 ajax
			function findList(map, lat, lng) {
				var positions = [];
		    	 $.ajax ({
		    		 url: "/hospital/findList.do",
		    		 data: {
		    			latitude: lat,
			            longitude: lng
		    		 },
		    		 type: "GET",
		    		 dataType: "json",
		    		 success: function(hList) {
		    			console.log(hList);
//		    			// 마커를 표시할 위치와 name 객체 배열입니다 		    			
						for(let i = 0; i < hList.length; i++){
							var position = {
								no: hList[i].hNo,
								name: hList[i].hName,
								roadAddr: hList[i].hRoadAddr,
								phone: hList[i].hPhone,
								latlng: new kakao.maps.LatLng(hList[i].hLat, hList[i].hLng)
							};
							positions.push(position);
						}
						console.log(positions);
						makeMarkerAndOverlay(map, positions); // 마커 표시
		    		 },
		    		 error: function(data){
		    			 
		    		 }
		    	 });
			}
			
			// 마커와 커스텀 오버레이 생성
			function makeMarkerAndOverlay(map, positions) {
//     			// 마커를 표시할 위치와 name 객체 배열입니다 
// 			    var positions = [
// 			        <c:forEach items="${ hList }" var="hos" varStatus="loop">
// 			            {
// 			            	no: '${ hos.hNo }',
// 			            	name: '${ hos.hName }',
// 			            	roadAddr: '${ hos.hRoadAddr }',
// 			            	phone: '${ hos.hPhone }',
// 					        latlng: new kakao.maps.LatLng('${ hos.hLat }', '${ hos.hLng }')
// 			            }<c:if test="${!loop.last}">,</c:if>
// 			        </c:forEach>
// 				];
				
				var markers = [];
				var overlays = [];
				
				for (var i = 0; i < positions.length; i ++) {			    
				    // 마커를 생성합니다
				    var marker = new kakao.maps.Marker({
				        map: map, // 마커를 표시할 지도
				        title : positions[i].name, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				        position: positions[i].latlng // 마커를 표시할 위치
				    });
				    
				    markers.push(marker);
				    
				    var nameToShow = positions[i].name.length > 14 ? positions[i].name.substring(0, 13) + '...' : positions[i].name; // 이름이 13자가 넘어가면 ... 처리
				    
					// 커스텀 오버레이 컨텐츠를 DOM 방식으로 생성
					var content = document.createElement('div');
					content.className = 'wrap';
					
					var infoDiv = document.createElement('div');
					infoDiv.className = 'info';
					
					var titleDiv = document.createElement('div');
					titleDiv.className = 'title';
					
					// 이름 요소
					var nameElement = document.createTextNode(nameToShow);
					titleDiv.appendChild(nameElement);
					
					var closeBtn = document.createElement('div');
					closeBtn.className = 'close';
					closeBtn.title = '닫기';
					
					// 닫기 버튼 클릭 이벤트 핸들러
// 					closeBtn.addEventListener('click', function () {
// 					    overlay.setMap(null);
// 					});
					
					titleDiv.appendChild(closeBtn);
					infoDiv.appendChild(titleDiv);
					
					var bodyDiv = document.createElement('div');
					bodyDiv.className = 'body';
					
					var descDiv = document.createElement('div');
					descDiv.className = 'desc';
					
					// 도로 주소 요소
					var roadAddrElement = document.createElement('div');
					roadAddrElement.className = 'ellipsis';
					roadAddrElement.appendChild(document.createTextNode(positions[i].roadAddr));
					descDiv.appendChild(roadAddrElement);
					
					var subInfoDiv = document.createElement('div');
					subInfoDiv.className = 'sub-info';
					
					// 전화번호 링크
					var telLink = document.createElement('a');
					telLink.href = 'tel:' + positions[i].phone;
					telLink.className = 'h-tel';
					telLink.appendChild(document.createTextNode(positions[i].phone));
					
					// 상세보기 링크
					var detailLink = document.createElement('a');
					detailLink.href = '/hospital/detail.do?hNo=' + positions[i].no;
					detailLink.className = 'h-detail';
					detailLink.appendChild(document.createTextNode('상세보기'));
					
					subInfoDiv.appendChild(telLink);
					subInfoDiv.appendChild(detailLink);
					
					descDiv.appendChild(subInfoDiv);
					bodyDiv.appendChild(descDiv);
					infoDiv.appendChild(bodyDiv);
					content.appendChild(infoDiv);
					            
					// 마커 위에 커스텀오버레이를 표시합니다
					// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
					var overlay = new kakao.maps.CustomOverlay({
					    content: content,
					    map: null,      
// 					    map: map,      
					    position: positions[i].latlng     
					});
					
					overlays.push(overlay);
					
					var searchKeyword = document.getElementById('h-search-keyword').value;
				    if (searchKeyword.trim() !== '') {
						map.setCenter(positions[0].latlng); // 첫 검색 결과의 좌표로 중앙 좌표 이동			
				    }
				    					
					markers[i].setMap(map); // 지도 위에 마커 표시
					overlays[0].setMap(map); // 첫번째 결과만 우선 표시
					
			 		// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
					(function (marker, overlay) {
				        kakao.maps.event.addListener(marker, 'click', function () {
				            if (overlay.getMap()) {
				                overlay.setMap(null); // 열려있으면 닫아라
				            } else {
				                overlay.setMap(map); // 닫혀있으면 열어라
				            }
				        });
				        
				        var closeBtn = overlay.getContent().querySelector('.close');
			            closeBtn.addEventListener('click', function () {
			                overlay.setMap(null); // 클릭 시 overlay를 닫음
			            });
				    })(marker, overlay);
				}
				
			}
			
			// 지도가 이동, 확대, 축소로 인해 중심좌표가 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록
			// 이동이 끝났을 때의 좌표를 가지고 넘어옴 (idle)
			// 실시간 변화값은 center_changed 사용함
			kakao.maps.event.addListener(map, 'idle', function() {
			
			    // 지도의 중심좌표를 얻어옵니다 
			    var latlng = map.getCenter(); 
			
			    $.ajax({
			        url: '/hospital/moveLocation.do', 
			        type: 'GET',
			        data: {
			            latitude: latlng.getLat(), // 업데이트된 위도 값
			            longitude: latlng.getLng() // 업데이트된 경도 값
			        },
			        success: function(data) {
			        },
			        error: function(error) {
			        	
			        }
			    });
			});
			
			// 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수
			function setMapType(maptype) { 
			    var roadmapControl = document.getElementById('btnRoadmap');
			    var skyviewControl = document.getElementById('btnSkyview'); 
			    if (maptype === 'roadmap') {
			        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
			        roadmapControl.className = 'selected_btn';
			        skyviewControl.className = 'btn';
			    } else {
			        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
			        skyviewControl.className = 'selected_btn';
			        roadmapControl.className = 'btn';
			    }
			}

			// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수
			function zoomIn() {
			    map.setLevel(map.getLevel() - 1);
			}

			// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수
			function zoomOut() {
			    map.setLevel(map.getLevel() + 1);
			}
			
			// 지도 중심좌표 부드럽게 이동시키기
			function defaultLatLng() {
			    var moveLatLng = new kakao.maps.LatLng(37.5679212, 126.9830358); // KH 종로
			    map.panTo(moveLatLng);            
			}        
			
			// 리스트 클릭 시 중심좌표 부드럽게 이동
			function changeCenter(lat, lng, count) {
			    var moveLatLon = new kakao.maps.LatLng(lat, lng);
			    map.panTo(moveLatLon);
			}
			
			// 현위치로 중심좌표 이동
			function myGps() {
				// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
				if (navigator.geolocation) {
				    
				    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
				    navigator.geolocation.getCurrentPosition(function(position) {
				        
				        var lat = position.coords.latitude, // 위도
				            lon = position.coords.longitude; // 경도
						map.panTo(new kakao.maps.LatLng(lat, lon));
				            
				      });
				    
				} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
				    
// 				    var locPosition = new kakao.maps.LatLng(37.5679212, 126.9830358),    // ============================ 로그인 시 기본 주소 설정 필요 ========================
				    alert('현위치를 가져올 수 없습니다...');
				    map.panTo(new kakao.maps.LatLng(37.5679212, 126.9830358)); // ============================ 로그인 시 기본 주소 설정 필요 ========================
				}
				        
			}
		</script>
		<!-- 동물병원 검색 -->
		<script>
            function searchHospital() {
                var form = document.getElementById('search-hospital-form');
                form.submit();
            }
        </script>
    </body>
</html>