<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>




<div class="wrapper">
      <!-- 실컨텐츠 시작 -->
      <div class="wrap-theater" style= "padding-top: 40px" align="center">
          <h3><img src="${context}/resources/rainbow/css/img/h3_theater.gif" alt="THEATER" /></h3>
          <div class="sect-theater " >
             
              <div class="wrap-theaterinfo" align="center">
                  <div class="box-image">
                      <div id="theater_img_container" class="contact">
                      <img src="${context}/resources/rainbow/css/img/cinema.jpg" alt="cinema" /></div>
                  </div>
                
                <!--   <div class="box-contents col-sm-10 col-sm-offset-3">
                      <div class="theater-info">
                          <strong class="title">서울특별시 강남구 역삼동 814-6 스타플렉스<br>서울특별시 강남구 강남대로 438  (역삼동)<a href="./?page=location&theaterCode=0056#menu">위치/주차 안내  &gt;</a></strong>
                          <span class="txt-info">
                              <em>1544-1122</em>
                              <em>6관 / 874석</em>
                              <span></span>
                          </span>
                         
                  </div>  -->
            </div>
              </div>
          </div>
          <!-- .sect-theater -->
         
      </div>
      <!-- 실컨텐츠 끝 --> 

   <!--      Main content -->
   <section class="container">
       <h2 class="page-heading heading--outcontainer">Contact</h2>
       <div class="contact">
           <p class="contact__title">You have any questions or need help, <br><span class="contact__describe">don’t be shy and contact us</span></p>
           <span class="contact__mail">propose0915@gmail.com</span>
           <span class="contact__tel">02)789-0000</span>
       </div>
   </section>
   
   <div class="contact-form-wrapper">
       <div class="container">
           <div class="col-sm-12 col-md-10 col-md-offset-1 col-lg-8 col-lg-offset-2">
               <form id='contactsform' class="form row">
                   <p class="form__title">Drop us a line</p>
                   <div class="col-sm-6">
                       <input type='text' placeholder='Your name' name="name" style="height: 35px;" value="${sessionScope.user.name}" class="form__name">
                   </div>
                   <div class="col-sm-6">
                       <input type='text' placeholder='Your email' name="email" style="height: 35px;" value="${sessionScope.user.email}" class="form__mail">
                   </div>
                   <div class="col-sm-12">
                       <textarea placeholder="Your message" name="contactsText" class="form__message"></textarea>
                   </div>
                   <button type="submit" id="sendBtn" class='btn btn-md btn--danger'>send message</button>
               </form>
           </div>
       </div>
   </div>

   <section class="container">
       <div class="contact">
           <p class="contact__title">Trying to find our location? <br> <span class="contact__describe">we are here</span></p>
       </div>
   </section>

       <div id="googlemap" class="map"></div>

 
<!-- </div> -->



<script type="text/javascript">
    
    
    $(document).ready(function() {
       // init_Contact ();
        initialize();    
    });
	$('#sendBtn').click(function() {
		alert('보내기');
		$('#contactsform').attr('action',"${context}/mail/send").attr('method','post').submit();
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
</script>




 <meta id="ctl00_og_image" property="og:image" content="http://img.cgv.co.kr/Theater/Theater/2014/1211/CGVgangnam.jpg"></meta>
    <link rel="alternate" href="http://m.cgv.co.kr" />
    <link rel="shortcut icon" href="http://img.cgv.co.kr/theater_img/favicon.ico" type="image/x-icon" />
    <title id="ctl00_headerTitle">[CGV강남]&lt;CGV극장 &lt; 극장 | 영화 그 이상의 감동. CGV</title>
    <link rel="shortcut icon" type="image/x-icon" href="http://img.cgv.co.kr/R2014/images/favicon.ico" />
    <link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/reset.css" />
    <link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/layout.css" />
    <link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/module.css" />
    <link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/common.css" />
    <link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/content.css" />
    <link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/eggupdate.css" />
    <link rel="stylesheet" media="print" type="text/css" href="http://img.cgv.co.kr/R2014/css/print.css" />
    
    <link rel="stylesheet" type="text/css" href="http://img.cgv.co.kr/R2014/js/jquery.ui/smoothness/jquery-ui-1.10.4.custom.min.css" />
    <script type="text/javascript" src="http://img.cgv.co.kr/R2014/js/app.config.js"></script>
    <script type="text/javascript" src="/common/js/extraTheaters.js"></script>
    <script type="text/javascript" src="http://img.cgv.co.kr/R2014/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="http://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.tmpl.min.js"></script>
    <script type="text/javascript" src="http://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.validate.js"></script>
    <script type="text/javascript" src="http://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.paging.min.js"></script>
    <script type="text/javascript" src="http://img.cgv.co.kr/R2014/js/jquery.ui/jquery-ui-1.10.4.custom.min.js"></script>
    <script type="text/javascript" src="http://img.cgv.co.kr/R2014/js/jquery.utils.js"></script>
    <script type="text/javascript" src="http://img.cgv.co.kr/R2014/js/app.utils.js"></script>
   <script type="text/javascript" src="http://img.cgv.co.kr/R2014/js/jquery.utils.pageing.js"></script>
    <script type="text/javascript" src="http://img.cgv.co.kr/R2014/js/app.init.js"></script>
