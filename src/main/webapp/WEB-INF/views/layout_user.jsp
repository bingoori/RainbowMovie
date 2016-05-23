<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!-- tiles 프레임워크를 이용하여 구현한 페이지로 관리자와 관련된 모든 내용은 이 layout_admin.jsp를 거치게 된다. -->
<!-- 이 페이지의 div -> id = content인 곳에 원하는 화면을 .html로 띄워서 마치 한 페이지 안에서 모든 것이 돌아가게끔 보이게 만드는게 주 목적이다. -->
<!doctype html>
<html lang="en">
<head>
   <!-- Basic Page Needs -->
   <meta charset="UTF-8" />
   <title>RainbowMovie</title>
   <meta name="description" content="A Template by Gozha.net">
   <meta name="keywords" content="HTML, CSS, JavaScript">
   <meta name="author" content="Gozha.net">
      
    <!-- Mobile Specific Metas-->
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta content="telephone=no" name="format-detection">
      
<!-- Fonts -->
	<!-- Font awesome - icon font -->
	<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
	<!-- Roboto -->
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,700' rel='stylesheet' type='text/css'>
	<!-- Open Sans -->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:800italic' rel='stylesheet' type='text/css'>

<!-- Stylesheets -->   
	<!-- jQuery UI --> 
	<link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="stylesheet">
	<!-- Mobile menu -->
	<link href="${context}/resources/rainbow/css/gozha-nav.css" rel="stylesheet" />
	<!-- Select -->
	<link href="${context}/resources/rainbow/css/external/jquery.selectbox.css" rel="stylesheet" />
	<!-- Swiper slider -->
	<link href="${context}/resources/rainbow/css/external/idangerous.swiper.css" rel="stylesheet" />
	<!-- Magnific-popup -->
    <link href="${context}/resources/rainbow/css/external/magnific-popup.css" rel="stylesheet" />
	<!-- REVOLUTION BANNER CSS SETTINGS -->
	<link rel="stylesheet" type="text/css" href="${context}/resources/rainbow/rs-plugin/css/settings.css" media="screen" />
	<!-- Custom -->
	<link href="${context}/resources/rainbow/css/style.css?v=1" rel="stylesheet" />
	<!-- Modernizr --> 
	<script src="${context}/resources/rainbow/js/external/modernizr.custom.js"></script>

	<!-- 로그인 때매 여기서 필요. -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>

	<!-- 부트스트랩 css & 제이쿼리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> <!-- 부트스트랩 홈페이지에서 CDN으로 가져온다. -->

	<!-- magnific popup -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css">
	
	<!--*** Google map  ***-->
	<script src="https://maps.google.com/maps/api/js?sensor=true"></script> 

	<style>
		.test {
			position: relative;
			background: #FFF;
			width: 100%;
			height: 100%;
		}
	</style>
</head>

<body>
   <div id="header">
      <!-- tilse.xml에 설정된 헤더페이지가 들어가게 된다. -->
      <tiles:insertAttribute name="header" />
   </div>
   
   <!-- ajax로 모든 페이지 구현 시 이 content 부분에서 화면이 계속 바뀌게 된다. (URL은 변하지 않는다!) -->
   <div id="content">
      <!-- 이 부분에는 tilse.xml에서 설정한 URL형태로 호출되는 페이지가 띄워지게 된다! tiles.xml과 연결됨! -->
      <tiles:insertAttribute name="content" /> 
   </div>
   
   <div id="footer">
      <!-- tilse.xml에 설정된 푸터페이지가 들어가게 된다. -->
      <tiles:insertAttribute name="footer" />
   </div>
   
   <div id="test" class="test white-popup-block mfp-hide auto bg-white">
   	<jsp:include page="popup.jsp"></jsp:include>
   </div>
   <a href="#test" class="popup">Open popup</a>
</body>

<script src="${context}/resources/js/Global.js"></script>
<script src="${context}/resources/js/Rainbow.js"></script>
<script src="${context}/resources/js/Purchase.js"></script>
<script src="${context}/resources/js/Movie.js"></script>
<script src="${context}/resources/js/Member.js"></script>
<script src="${context}/resources/js/Admin.js"></script>
<script src="${context}/resources/js/Cinema.js"></script>
<script>
	// 팝업을 띄워주기 위한 스크립트 코드
	$(function() {
		$('.popup').magnificPopup({
			type: 'inline',
			preloader: false,
			modal: true,
			closeContentPos: true,
			fixedContentPos: true,
			alignTop: false,
			showCloseBtn: true
		});
		$('.popup').click().css('display','none');
	});
</script>


<c:choose>
	<c:when test="${sessionScope.user.id == 'admin'}"> <!-- 관리자 로그인 성공 시 헤더 -->
		<script type="text/javascript">
			$(function() {
				$.magnificPopup.close();
				var logout_header = '<li><span class="sub-nav-toggle plus"></span>\
					<a href="${context}/admin/input_form" id="addVod">ADD VOD</a>\
					</li>\
					<li><span class="sub-nav-toggle plus"></span>\
					<a href="#" id="addMovie">ADD MOVIE</a>\
					</li>\
					<li><span class="sub-nav-toggle plus"></span>\
					<a href="#" id="movie">MOVIE</a>\
					</li>\
					<li><span class="sub-nav-toggle plus"></span>\
					<a href="#" id="vod">VOD</a>\
					</li>\
					<li>\
					<span class="sub-nav-toggle plus"></span>\
					<a href="${context}/member/logout" id="logout">LOGOUT</a>\
					</li>';
				$('#navigation').html(logout_header);
			});
		</script>
	</c:when>
	<c:when test="${sessionScope.user.id != null}"> <!-- 회원 로그인 성공 시 헤더 -->
	   <script type="text/javascript">
	      $(function() {
	    		$.magnificPopup.close();
	         var logout_header =
	            '<li id="movieList"><span class="sub-nav-toggle plus"></span>'
	            +      '<a href="${context}/movie/movie_list">Movies</a>'
	            +   '</li>'
	            +   '<li id="ticketing">'
	            +      '<span class="sub-nav-toggle plus"></span>' 
	            +      '<a href="#">Ticketing</a>'
	            +   '</li>'
	            +   '<li id="cinema">'
	            +      '<span class="sub-nav-toggle plus"></span>'
	            +      '<a href="${context}/member/cinema">Cinema</a>'
	            +   '</li>'
	            +   '<li>'
	            +      '<span class="sub-nav-toggle plus"></span>' 
	            +      '<a href="${context}/member/logout">로그아웃</a>'
	            +   '</li>'
	            +   '<li id="headerMypageBtn">'
	            +      '<span class="sub-nav-toggle plus"></span>' 
	            +      '<a href="${context}/member/profile">마이페이지</a>'
	            +   '</li>';
	            $('#navigation').html(logout_header);
	      });
	   </script>
	</c:when>
	<c:otherwise> <!-- 비회원 상태일 시 헤더 -->
	   <script type="text/javascript">
	      $(function() {      
	         var login_header =
	            '<li id="movieList"><span class="sub-nav-toggle plus"></span>'
	            +      '<a href="${context}/movie/movie_list/">Movies</a>'
	            +   '</li>'
	            +   '<li id="needLogin">'
	            +      '<span class="sub-nav-toggle plus"></span>' 
	            +      '<a href="${context}/member/login_form">Ticketing</a>'
	            +   '</li>'
	            +   '<li id="cinema">'
	            +      '<span class="sub-nav-toggle plus"></span>'
	            +      '<a href="${context}/member/cinema">Cinema</a>'
	            +   '</li>'
	            +   '<li id="headerLoginBtn">'
	            +      '<span class="suzb-nav-toggle plus"></span>' 
	            +      '<a href="#">로그인</a>'
	            +   '</li>'
	            +   '<li id="headerJoinBtn">'
	            +      '<span class="sub-nav-toggle plus"></span>' 
	            +      '<a href="${context}/member/join_form">회원가입</a>'
	            +   '</li>';
	            $('#navigation').html(login_header);
	      });
	   </script>
	</c:otherwise>
</c:choose>

<script type="text/javascript">
	$(function(){
		// Admin , Vod , Movie 처리 부분  .. 하
		//파일 업로드 처리 함수 
		readURL = function(input){
			if(input.files&& input.files[0]){
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#uploadedImg').attr('src',e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		};
		$('#addVod').click(function(e) {
				e.preventDefault(); 
				admin.addVodForm('${context}');
		});
		$('#vod').click(function(e) {
			e.preventDefault(); 
			admin.vodListForm('${context}',0);
		});
		$('#addMovie').click(function(e) {
			e.preventDefault(); 
			admin.addMovieForm('${context}');
		});
		$('#movie').click(function(e) {
			e.preventDefault(); 
			admin.movieList('${context}');
		});
		// Admin , Vod , Movie 처리 부분  .. 상
		
		// header.jsp 부분과 관련된 내용 시작
		var id = $('#sessionVar').val();
		if (id.length != 0) {
			$('#dropBoxBtn').addClass('auth__function');
			document.getElementById('dropBoxBtn').style.display = '';
		} else {
			$('#dropBoxBtn').removeClass('auth__function');
			document.getElementById('dropBoxBtn').style.display = 'none';
		}
		
		var context = $.fn.global('${context}').getContext(); // controller 호출을 위한 /web 경로를 js 파일에 보내기 위함!
		var purchase = $.fn.purchase(); // 예매 페이지인 purchase 부분은 함수 표현식으로 구현했다.
		
		// 헤더의 book a ticket 버튼 클릭 시
		$('#bookBtn').click(function(e) {
			e.preventDefault();
			if (id.length != 0) { // 회원일 경우 nav_로그인 창 안띄워지게 하고 ticketing 페이지로 넘어가게 하기
				$('.overlay').removeClass('open').addClass('close');
				purchase.step1Form(context);
			} else { // 비회원일 경우 nav_로그인창 띄우기
				$('.overlay').removeClass('close').addClass('open');
			}
		});
		
		$('#nav_loginBtn').click(function(e) { // 로그인 버튼 클릭 시 $() 로 form 태그를 찾아서 객체로 리턴받아 action을 걸고 post방식으로 보낸다.
			e.preventDefault();
			var id = $('#nav_id').val();
			var password = $('#nav_password').val();
			member.headerLogin(context, id, password);
		});
		// header.jsp 부분과 관련된 내용 끝
		
		// main.jsp와 관련된 내용 시작
		$('.slide__link').click(function(e) {
			e.preventDefault();
			var url = $(this).attr('href');
	        movie.movieDetail(context,url);
		});
		
		$('.beta_imgDetail').click(function(e) {
			e.preventDefault();
			var url = $(this).attr('href');
	        movie.movieDetail(context,url);
		});  
		
		$('.title_textDetail').click(function(e) {
			e.preventDefault();
			var url = $(this).attr('href');
	        movie.movieDetail(context,url);
		});  
		// main.jsp와 관련된 내용 끝
		
		
		$('#ticketing').click(function(e){ // 로그인 한 상태에서 헤더의 티켓팅을 눌렀을 시
			e.preventDefault();
		 	purchase.step1Form(context); 
		});	
		
		$('#movieList').click(function(e){ // 영화목록
			e.preventDefault();
		 	movie.movieList(context,'/movie/movie_list' , id); 
		});	
		
		$('#needLogin').click(function(e) { // 로그인 안한 상태에서 헤더의 티켓팅을 눌렀을 시
			e.preventDefault();
			alert("로그인이 필요합니다.");
			member.loginForm(context);
		});
		
		$('#headerLoginBtn').click(function(e) { // 헤더의 로그인 버튼을 눌렀을 시
			e.preventDefault();
			member.loginForm(context);
		});
		
		$('#headerJoinBtn').click(function(e) { // 헤더의 회원가입 버튼을 눌렀을 시
			e.preventDefault();
			member.joinForm(context);
		});
		
		$('#headerMypageBtn').click(function(e) { // 헤더의 마이페이지 버튼을 눌렀을 시
			e.preventDefault();
			member.profileForm(context);
		});
		
		$('#memberLeaveBtn').click(function(e) { // 이름 클릭 시 나오는 li의 회원탈퇴를 눌렀을 시
			e.preventDefault();
			var id = '${user.id}';
			member.memberLeave(context, id);
		});
		
	 	$('#purchaseListBtn').click(function(e) { // 이름 클릭 시 나오는 li의 예매내역을 눌렀을 시
			e.preventDefault();
			member.purchaseList(context, '/purchase/purchase_list/0');
		});
	 	
	 	$('#cinema').click(function(e) { // 로그인 안한 상태에서 헤더의 티켓팅을 눌렀을 시
			e.preventDefault();
			cinema.init(context);
		});
	});
	
	/* $(window).on("popstate", function(event) {
    var data = event.originalEvent.state;  // 이부분으로 뒤로가기 할때마다 아까 저장한 히스토리 스택에 쌓인 URL을 불러 온다
    alert(data.data);
    alert(data.url);
    if(data){ 
    	location.href = data.url;
    	// 데이터가 있으면 해당 데이터를 ajax로 다시 요청해 화면에 뿌려준다!!!!
		// 아래 코드는 필자가 켄도UI의 스플리터기능으로 화면을 뿌려주기에  작성한 것이다
		// 다른 사람들은 각자 화면을 요청하는 AJAX펑션을 넣으면 되겠다.
    } else{
    	// 히스토리에 정보가 없을경우 메인화면으로 보내준다. 
    	location.href = "${context}/";
    }
});*/

 
</script>
</html>