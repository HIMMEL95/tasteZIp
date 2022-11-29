<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<%-- <jsp:useBean id="CodeServiceImpl" class="com.spopia.infra.modules.code.CodeServiceImpl"/> --%>

<!doctype html> 
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
    <title>Chat</title>
    <link href="https://cdn-icons-png.flaticon.com/128/553/553416.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/order/mapBasic.css">
	<link rel="stylesheet" href="/resources/css/chat/chat.css">
	<link rel="stylesheet" href="/resources/css/story/story.css">
	<script defer type="text/javascript" src="/resources/js/order/mapBasic.js"></script>
</head>

<body>
    <!-- start -->
    
    <main class="clearfix">
		<div id="sidebar" class="sidebar">
			<div class="d-flex flex-column flex-shrink-0 bg-dark align-center" style="width: 4.5rem; height: 100vh;">
				<a href="/tasteMain" class="d-block p-3 link-dark text-decoration-none" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Icon-only">
					<img alt="" src="/resources/images/main/logo2.png" width="40" height="30">
					<span class="visually-hidden">Icon-only</span>
				</a>
				<ul class="nav nav-pills nav-flush flex-column mb-auto text-center">
					<li class="nav-item">
						<a href="/order" class="nav-link py-3 rounded-0 align-center" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right" aria-label="Home" data-bs-original-title="Home">
							<i class="fas fa-light fa-credit-card text-white" style="font-size: 22px;"></i>
						</a>
					</li>
					<li>
						<a href="/favorite" class="nav-link py-3 rounded-0 align-center" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right" aria-label="Home" data-bs-original-title="Home">
							<i class="fas fa-light fa-heart text-white" style="font-size: 22px;"></i>
						</a>
					</li>
					<li>
						<a href="/chat" class="nav-link py-3 rounded-0 align-center" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right" aria-label="Home" data-bs-original-title="Home">
							<i class="fas fa-light fa-comments text-white" style="font-size: 22px;"></i>
						</a>
					</li>
				<!-- 	<li>
						<a href="/story" class="nav-link py-3 rounded-0 align-center" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right" aria-label="Home" data-bs-original-title="Home">
							<i class="fas fa-light fa-pen-to-square text-white" style="font-size: 22px;"></i>
						</a>
					</li>
					<li>
						<a href="/comment" class="nav-link py-3 rounded-0 align-center" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right" aria-label="Home" data-bs-original-title="Home">
							<i class="fa-regular fa-thumbs-up text-white" style="font-size: 22px;"></i>
						</a>
					</li> -->
					<li>
						<a href="/findWay" class="nav-link py-3 rounded-0 align-center" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right" aria-label="Home" data-bs-original-title="Home">
							<i class="fa-solid fa-signs-post text-white" style="font-size: 22px;"></i>
						</a>
					</li>
				</ul>
				<div class="dropdown">
					<a href="#" class="d-flex align-items-center justify-content-center p-3 link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
						<img src="https://github.com/mdo.png" alt="mdo" width="30" height="30" class="rounded-circle">
					</a>
					<ul class="dropdown-menu text-small shadow" style="">
						<li><a class="dropdown-item" href="#">New project...</a></li>
						<li><a class="dropdown-item" href="#">Settings</a></li>
						<li><a class="dropdown-item" href="/mypage/mypageMain">My Page</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><button type="button" id="signOutBtn" class="dropdown-item">Sign out</button></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="map_container" id="container">
			<div class="sideInfo">
				<div class="handle">
					<input type="hidden" name="handle_value" id="handle_value" value="1">
					<button type="button" id="handle" class="btn_fold expand">접기</button>
				</div>
				<div class="panel">
					<div class="panel_top">
						<div class="ng-star-inserted">
							<!-- contents s -->
							<div class="contents">
								<div class="inbox_people">
						          <div class="headind_srch">
						            <div class="recent_heading">
						              <h4 style="text-shadow: 2px 5px lightgrey;">My Chatting List</h4>
						            </div>
						           <div class="container" style="margin-top: 2rem;">
									<div class="row justify-content-center">
										<div class="SearchBox">
											<input type="text" class="SearchBox-input" placeholder="Search">
											<button class="SearchBox-button">
												<i class="SearchBox-icon  material-icons"><i class="fa-solid fa-magnifying-glass"></i></i>
											</button>
										</div>
									</div>
								   </div>
						          </div>
						          <div class="inbox_chat friends">
						          	<p style="">친구 : 20</p>
						            <a href="/chatRoom">
							            <div class="chat_list active_chat">
							              <div class="chat_people">
							                <div class="chat_img"><img src=https://intermusicakorea.com/common/img/default_profile.png alt="sunil" class="chatImg"> </div>
							                <div class="chat_ib">
							                  <h5>가나다</h5>
							                  <p>Test, which is a new approach to have all solutions 
							                    astrology under one roof.</p>
							                </div>
							              </div>
							            </div>
						            </a>
						            <a href="/chatRoom" id="friendsList">
							            <div class="chat_list">
							              <div class="chat_people">
							                <div class="chat_img"><img src=https://intermusicakorea.com/common/img/default_profile.png alt="sunil" class="chatImg"> </div>
							                <div class="chat_ib">
							                  <h5>가나다</h5>
							                  <p>Test, which is a new approach to have all solutions 
							                    astrology under one roof.</p>
							                </div>
							              </div>
							            </div>
						            </a>
						            <div class="chat_list">
						              <div class="chat_people">
						                <div class="chat_img"><img src=https://intermusicakorea.com/common/img/default_profile.png alt="sunil" class="chatImg"></div>
						                <div class="chat_ib">
						                  <h5>Sunil Rajput2 <span class="chat_date">Dec 25</span></h5>
						                  <p>Test, which is a new approach to have all solutions 
						                    astrology under one roof.</p>
						                </div>
						              </div>
						            </div>
						            <div class="chat_list">
						              <div class="chat_people">
						                <div class="chat_img"><img src=https://intermusicakorea.com/common/img/default_profile.png alt="sunil" class="chatImg"></div>
						                <div class="chat_ib">
						                  <h5>Sunil Rajput3 <span class="chat_date">Dec 25</span></h5>
						                  <p>Test, which is a new approach to have all solutions 
						                    astrology under one roof.</p>
						                </div>
						              </div>
						            </div>
						            <div class="chat_list">
						              <div class="chat_people">
						                <div class="chat_img"><img src=https://intermusicakorea.com/common/img/default_profile.png alt="sunil" class="chatImg"></div>
						                <div class="chat_ib">
						                  <h5>Sunil Rajput4 <span class="chat_date">Dec 25</span></h5>
						                  <p>Test, which is a new approach to have all solutions 
						                    astrology under one roof.</p>
						                </div>
						              </div>
						            </div>
						            <div class="chat_list">
						              <div class="chat_people">
						                <div class="chat_img"><img src=https://intermusicakorea.com/common/img/default_profile.png alt="sunil" class="chatImg"></div>
						                <div class="chat_ib">
						                  <h5>Sunil Rajput5 <span class="chat_date">Dec 25</span></h5>
						                  <p>Test, which is a new approach to have all solutions 
						                    astrology under one roof.</p>
						                </div>
						              </div>
						            </div>
						            <div class="chat_list">
						              <div class="chat_people">
						                <div class="chat_img"><img src=https://intermusicakorea.com/common/img/default_profile.png alt="sunil" class="chatImg"></div>
						                <div class="chat_ib">
						                  <h5>Sunil Rajput6 <span class="chat_date">Dec 25</span></h5>
						                  <p>Test, which is a new approach to have all solutions 
						                    astrology under one roof.</p>
						                </div>
						              </div>
						            </div>
						            <div class="chat_list">
						              <div class="chat_people">
						                <div class="chat_img"><img src=https://intermusicakorea.com/common/img/default_profile.png alt="sunil" class="chatImg"></div>
						                <div class="chat_ib">
						                  <h5>Sunil Rajput7 <span class="chat_date">Dec 25</span></h5>
						                  <p>Test, which is a new approach to have all solutions 
						                    astrology under one roof.</p>
						                </div>
						              </div>
						            </div>
						            <div class="chat_list">
						              <div class="chat_people">
						                <div class="chat_img"><img src=https://intermusicakorea.com/common/img/default_profile.png alt="sunil" class="chatImg"></div>
						                <div class="chat_ib">
						                  <h5>Sunil Rajput8 <span class="chat_date">Dec 25</span></h5>
						                  <p>Test, which is a new approach to have all solutions 
						                    astrology under one roof.</p>
						                </div>
						              </div>
						            </div>
						            <div class="chat_list">
						              <div class="chat_people">
						                <div class="chat_img"><img src=https://intermusicakorea.com/common/img/default_profile.png alt="sunil" class="chatImg"></div>
						                <div class="chat_ib">
						                  <h5>Sunil Rajput9 <span class="chat_date">Dec 25</span></h5>
						                  <p>Test, which is a new approach to have all solutions 
						                    astrology under one roof.</p>
						                </div>
						              </div>
						            </div>
						            <div class="chat_list">
						              <div class="chat_people">
						                <div class="chat_img"><img src=https://intermusicakorea.com/common/img/default_profile.png alt="sunil" class="chatImg"></div>
						                <div class="chat_ib">
						                  <h5>하하하10 <span class="chat_date">Dec 25</span></h5>
						                  <p>Test, which is a new approach to have all solutions 
						                    astrology under one roof.</p>
						                </div>
						              </div>
						            </div>
						            <div class="chat_list">
						              <div class="chat_people">
						                <div class="chat_img"><img src=https://intermusicakorea.com/common/img/default_profile.png alt="sunil" class="chatImg"></div>
						                <div class="chat_ib">
						                  <h5>하하하11 <span class="chat_date">Dec 25</span></h5>
						                  <p>Test, which is a new approach to have all solutions 
						                    astrology under one roof.</p>
						                </div>
						              </div>
						            </div>
						            <div class="chat_list">
						              <div class="chat_people">
						                <div class="chat_img"><img src=https://intermusicakorea.com/common/img/default_profile.png alt="sunil" class="chatImg"></div>
						                <div class="chat_ib">
						                  <h5>하하하12 <span class="chat_date">Dec 25</span></h5>
						                  <p>Test, which is a new approach to have all solutions 
						                    astrology under one roof.</p>
						                </div>
						              </div>
						            </div>
						          </div>
						          <div class="inbox_chat chatList" style="display: none;">
						            <a href="/chatRoom">
							            <div class="chat_list active_chat">
							              <div class="chat_people">
							                <div class="chat_img"><img src=https://intermusicakorea.com/common/img/default_profile.png alt="sunil" class="chatImg"> </div>
							                <div class="chat_ib">
							                  <h5>가나다 <span class="chat_date">Dec 25</span></h5>
							                  <p>Test, which is a new approach to have all solutions 
							                    astrology under one roof.</p>
							                </div>
							              </div>
							            </div>
						            </a>
						            <div class="chat_list">
						              <div class="chat_people">
						                <div class="chat_img"><img src=https://intermusicakorea.com/common/img/default_profile.png alt="sunil" class="chatImg"></div>
						                <div class="chat_ib">
						                  <h5>Sunil Rajput2 <span class="chat_date">Dec 25</span></h5>
						                  <p>Test, which is a new approach to have all solutions 
						                    astrology under one roof.</p>
						                </div>
						              </div>
						            </div>
						            <div class="chat_list">
						              <div class="chat_people">
						                <div class="chat_img"><img src=https://intermusicakorea.com/common/img/default_profile.png alt="sunil" class="chatImg"></div>
						                <div class="chat_ib">
						                  <h5>Sunil Rajput3 <span class="chat_date">Dec 25</span></h5>
						                  <p>Test, which is a new approach to have all solutions 
						                    astrology under one roof.</p>
						                </div>
						              </div>
						            </div>
						            <div class="chat_list">
						              <div class="chat_people">
						                <div class="chat_img"><img src=https://intermusicakorea.com/common/img/default_profile.png alt="sunil" class="chatImg"></div>
						                <div class="chat_ib">
						                  <h5>Sunil Rajput4 <span class="chat_date">Dec 25</span></h5>
						                  <p>Test, which is a new approach to have all solutions 
						                    astrology under one roof.</p>
						                </div>
						              </div>
						            </div>
						            <div class="chat_list">
						              <div class="chat_people">
						                <div class="chat_img"><img src=https://intermusicakorea.com/common/img/default_profile.png alt="sunil" class="chatImg"></div>
						                <div class="chat_ib">
						                  <h5>Sunil Rajput5 <span class="chat_date">Dec 25</span></h5>
						                  <p>Test, which is a new approach to have all solutions 
						                    astrology under one roof.</p>
						                </div>
						              </div>
						            </div>
						            <div class="chat_list">
						              <div class="chat_people">
						                <div class="chat_img"><img src=https://intermusicakorea.com/common/img/default_profile.png alt="sunil" class="chatImg"></div>
						                <div class="chat_ib">
						                  <h5>Sunil Rajput6 <span class="chat_date">Dec 25</span></h5>
						                  <p>Test, which is a new approach to have all solutions 
						                    astrology under one roof.</p>
						                </div>
						              </div>
						            </div>
						            <div class="chat_list">
						              <div class="chat_people">
						                <div class="chat_img"><img src=https://intermusicakorea.com/common/img/default_profile.png alt="sunil" class="chatImg"></div>
						                <div class="chat_ib">
						                  <h5>Sunil Rajput7 <span class="chat_date">Dec 25</span></h5>
						                  <p>Test, which is a new approach to have all solutions 
						                    astrology under one roof.</p>
						                </div>
						              </div>
						            </div>
						            <div class="chat_list">
						              <div class="chat_people">
						                <div class="chat_img"><img src=https://intermusicakorea.com/common/img/default_profile.png alt="sunil" class="chatImg"></div>
						                <div class="chat_ib">
						                  <h5>Sunil Rajput8 <span class="chat_date">Dec 25</span></h5>
						                  <p>Test, which is a new approach to have all solutions 
						                    astrology under one roof.</p>
						                </div>
						              </div>
						            </div>
						            <div class="chat_list">
						              <div class="chat_people">
						                <div class="chat_img"><img src=https://intermusicakorea.com/common/img/default_profile.png alt="sunil" class="chatImg"></div>
						                <div class="chat_ib">
						                  <h5>Sunil Rajput9 <span class="chat_date">Dec 25</span></h5>
						                  <p>Test, which is a new approach to have all solutions 
						                    astrology under one roof.</p>
						                </div>
						              </div>
						            </div>
						            <div class="chat_list">
						              <div class="chat_people">
						                <div class="chat_img"><img src=https://intermusicakorea.com/common/img/default_profile.png alt="sunil" class="chatImg"></div>
						                <div class="chat_ib">
						                  <h5>하하하10 <span class="chat_date">Dec 25</span></h5>
						                  <p>Test, which is a new approach to have all solutions 
						                    astrology under one roof.</p>
						                </div>
						              </div>
						            </div>
						            <div class="chat_list">
						              <div class="chat_people">
						                <div class="chat_img"><img src=https://intermusicakorea.com/common/img/default_profile.png alt="sunil" class="chatImg"></div>
						                <div class="chat_ib">
						                  <h5>하하하11 <span class="chat_date">Dec 25</span></h5>
						                  <p>Test, which is a new approach to have all solutions 
						                    astrology under one roof.</p>
						                </div>
						              </div>
						            </div>
						            <div class="chat_list">
						              <div class="chat_people">
						                <div class="chat_img"><img src=https://intermusicakorea.com/common/img/default_profile.png alt="sunil" class="chatImg"></div>
						                <div class="chat_ib">
						                  <h5>하하하12 <span class="chat_date">Dec 25</span></h5>
						                  <p>Test, which is a new approach to have all solutions 
						                    astrology under one roof.</p>
						                </div>
						              </div>
						            </div>
						          </div>
						          <div style="width:100%; height: 50px; display: flex; justify-content: space-around;" >
						          	<button type="button" id="friendsBtn"><i class="fa-solid fa-user-group fa-2x"></i></button>
						          	<button type="button" id="chatList"><i class="fa-solid fa-comments fa-2x"></i></button>
						          </div>
						        </div>	 
							</div>
							<!-- contents e -->
						</div>
					</div>
				</div>
			</div>
			<div id="map" style="width:100%;height:100%;"></div>
		</div>
    </main>

    <!-- end -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1d32d56af5.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=77c9d237ea96142d7fda7576f0a0fc7e&libraries=services"></script>
	<script>
	
		// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.5021008334827, 127.024465815419), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
	
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
		var mapTypeControl = new kakao.maps.MapTypeControl();
	
		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
		// 지도에 교통정보를 표시하도록 지도타입을 추가합니다
		map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);    
		
	</script>
	<script type="text/javascript">
		Kakao.init('77c9d237ea96142d7fda7576f0a0fc7e'); //★ 수정 할 것 : SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
		console.log(Kakao.isInitialized()); // SDK 초기화 여부를 판단합니다.
		
		function talkFriendListWithKakao() {
		    Kakao.API.request({ 
		        url: '/v1/api/talk/friends',
		        success: function(response) {
		            console.log(response);
		            document.getElementById("friendsList").innerText = JSON.stringify(response);
		        },
		        fail: function(error) {
		            console.log(error);
		        }
		    });
		}
		
		$("freindsBtn").on("click", function() {
			talkFriendListWithKakao();
		})
	</script>
</body>

</html>