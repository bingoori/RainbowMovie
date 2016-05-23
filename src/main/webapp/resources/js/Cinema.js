/**
 * cinema.js
 */

/*function Cinema() {}
Cinema.prototype.cinema = function(context) {*/
var cinema = {
	init : function(context) {
	$.getJSON(context+'/member/cinema', function(data) {
		function init() {
            // Basic options for a simple Google Map
            // For more options see: https://developers.google.com/maps/documentation/javascript/reference#MapOptions
            var mapOptions = {
                    // How zoomed in you want the map to start at (always required)
                    zoom: 11, 

                    // The latitude and longitude to center the map (always required)
                    center: new google.maps.LatLng(40.6700, -73.9400), // New York

                    // How you would like to style the map. 
                    // This is where you would paste any style found on Snazzy Maps.
                    styles: [   {       featureType:'water',        stylers:[{color:'#46bcec'},{visibility:'on'}]   },{     featureType:'landscape',        stylers:[{color:'#f2f2f2'}] },{     featureType:'road',     stylers:[{saturation:-100},{lightness:45}]  },{     featureType:'road.highway',     stylers:[{visibility:'simplified'}] },{     featureType:'road.arterial',        elementType:'labels.icon',      stylers:[{visibility:'off'}]    },{     featureType:'administrative',       elementType:'labels.text.fill',     stylers:[{color:'#444444'}] },{     featureType:'transit',      stylers:[{visibility:'off'}]    },{     featureType:'poi',      stylers:[{visibility:'off'}]    }]
                };

                // Get the HTML DOM element that will contain your map 
                // We are using a div with id="map" seen below in the <body>
                var mapElement = document.getElementById('googlemap');

                // Create the Google Map using out element and options defined above
                var map = new google.maps.Map(mapElement, mapOptions);
            }
		
	var cinemaForm = '<div class="wrapper">\
					    <!-- 실컨텐츠 시작 -->\
					    <div class="wrap-theater" style= "padding-top: 40px" align="center">\
					        <h3><img src="'+context+'/resources/rainbow/css/img/h3_theater.gif" alt="THEATER" /></h3>\
					        <div class="sect-theater " >\
					            <div class="wrap-theaterinfo" align="center">\
					                <div class="box-image">\
					                    <div id="theater_img_container" class="contact">\
					                    <img src="'+context+'/resources/rainbow/css/img/cinema.jpg" alt="cinema" /></div>\
					                </div>\
					          </div>\
					            </div>\
					        </div>\
					       \
					    </div>\
					    <!-- 실컨텐츠 끝 --> \
					 <!-- Main content -->\
					 <section class="container">\
					     <h2 class="page-heading heading--outcontainer">Contact</h2>\
					     <div class="contact">\
					         <p class="contact__title">You have any questions or need help, <br><span class="contact__describe">don’t be shy and contact us</span></p>\
					         <span class="contact__mail">sdwoo90@gmail.com</span>\
					         <span class="contact__tel">010-000-0000</span>\
					     </div>\
					 </section>\
					 <div class="contact-form-wrapper">\
					     <div class="container">\
					         <div class="col-sm-12 col-md-10 col-md-offset-1 col-lg-8 col-lg-offset-2">\
					             <form id="contactsform" class="form row">\
					                 <p class="form__title">Please Send Your Questions</p>\
					                 <div class="col-sm-6">\
					                     <input type="text" placeholder="Your name" name="name" id="name" style="height: 35px;" value="'+data.member.name+'" class="form__name">\
					                 </div>\
					                 <div class="col-sm-6">\
					                     <input type="text" placeholder="Your email" name="email" id="email" style="height: 35px;" value="'+data.member.email+'" class="form__mail">\
					                 </div>\
					                 <div class="col-sm-12" id="reSet">\
					                     <textarea placeholder="Your message" id="contactsText" name="contactsText" class="form__message"></textarea>\
					                 </div>\
					                 <button type="submit" id="sendBtn" class="btn btn-md btn--danger">send message</button>\
					             </form>\
					         </div>\
					     </div>\
					 </div>\
					 <section class="container">\
					     <div class="contact">\
					         <p class="contact__title">Trying to find our location? <br> <span class="contact__describe">we are here</span></p>\
					     </div>\
					 </section>\
					 <div id="location-map" class="map">';					   
		$('#content').html(cinemaForm);
		
		$(document).ready(function() {
		       // init_Contact ();
		        initialize();    
		});
		 function initialize() {
	         /*
	         http://openapi.map.naver.com/api/geocode.php?key=f32441ebcd3cc9de474f8081df1e54e3&encoding=euc-kr&coord=LatLng&query=서울특별시 강남구 강남대로 456
	                위의 링크에서 뒤에 주소를 적으면 x,y 값을 구할수 있습니다.
	         */
	         var Y_point         = 37.552376;   // Y 좌표
	         var X_point         = 126.937764;      // X 좌표

	         var zoomLevel      = 16;                  // 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
	         var markerTitle      = "Rainbow Ciname";         // 현재 위치 마커에 마우스를 오버을때 나타나는 정보
	         var markerMaxWidth   = 300;                  // 마커를 클릭했을때 나타나는 말풍선의 최대 크기

	         // 말풍선 내용
	         var contentString   = '<div>' +
	         '<h2>Rainbow Ciname</h2>'+
	         '<p>서대문구 신수동에 위치한 Rainbow Ciname 입니다.</p>' +
	         //'<a href="http://www.daegu.go.kr" target="_blank">http://www.daegu.go.kr</a>'+ //링크도 넣을 수 있음
	         '</div>';
	         var myLatlng = new google.maps.LatLng(Y_point, X_point);
	         var mapOptions = {zoom: zoomLevel,center: myLatlng,mapTypeId: google.maps.MapTypeId.ROADMAP}
	         var map = new google.maps.Map(document.getElementById("location-map"), mapOptions);
	         var marker = new google.maps.Marker({position: myLatlng,map: map,title: markerTitle});
	         var infowindow = new google.maps.InfoWindow({content: contentString,maxWidth: markerMaxWidth});

	         google.maps.event.addListener(marker, 'click', function() {
	            infowindow.open(map, marker);
	         });
	      }
		 
		 var id = $('#sessionVar').val();
		$('#sendBtn').click(function(e) {
			e.preventDefault();
			if (id.length == 0) { // 회원일 경우 로그인 창 안띄워지게 하기!
				alert("로그인이 필요합니다.");
				member.loginForm(context);
			} else { // 비회원일 경우 로그인창 띄우기
				alert('보내기 버튼 클릭');
		        $.ajax({	        	
		            url: context +'/mail/send',
		            data : {					
						name : $('#name').val(),
						email : $('#email').val(),
						contactsText : $('#contactsText').val()
		            },
					type : 'post',
					dataType : 'json',
		            success: function(){
		            	alert('관리자에게 메일이 전송되었습니다.');
		            	cinema.init(context);
		            },// end
		            error : function(xhr, status, msg) { // 실패하면 이곳으로, 왼쪽 매개변수는 정해져 있다.
		    			alert('에러 발생 상태 : '+status+' 내용 : '+msg);
		    		},
		        });// end ajax
			}
	    });
	});
	}
}