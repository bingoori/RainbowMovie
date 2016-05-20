<!-- 지우지마세요!!!!!!!!!!!!!!!!!! -->
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
	
	<!-- jQuery UI --> 
	<link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="stylesheet">
 
	<!-- Mobile menu -->
	<link href="${context}/resources/rainbow/css/gozha-nav.css" rel="stylesheet" />
	<!-- Select -->
	<link href="${context}/resources/rainbow/css/external/jquery.selectbox.css" rel="stylesheet" />
	
	<!-- REVOLUTION BANNER CSS SETTINGS -->
	<link rel="stylesheet" type="text/css" href="${context}/resources/rainbow/rs-plugin/css/settings.css" media="screen" />
	
	<!-- Custom -->
	<link href="${context}/resources/rainbow/css/style.css?v=1" rel="stylesheet" />
	
	<!-- Modernizr --> 
	<script src="${context}/resources/rainbow/js/external/modernizr.custom.js"></script>
	
	<!-- jQuery UI -->
    <link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="stylesheet">
	
	<!-- Swiper slider -->
    <link href="${context}/resources/rainbow/css/external/idangerous.swiper.css" rel="stylesheet" />
    
	<!-- 로그인 때매 여기서 필요. -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	
	<!-- 부트스트랩 & 제이쿼리 -->
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> --> <!-- 부트스트랩 홈페이지에서 CDN으로 가져온다. -->
</head>

<body>
	<div id="header">
		<!-- tilse.xml에 설정된 헤더페이지가 들어가게 된다. -->
		<tiles:insertAttribute name="header" />
	</div>
	
	<div id="content">
		<!-- 이 부분에는 tilse.xml에서 설정한 URL형태로 호출되는 페이지가 띄워지게 된다! tiles.xml과 연결됨! -->
		<tiles:insertAttribute name="content" /> 
	</div>
	
	<div id="footer">
		<!-- tilse.xml에 설정된 푸터페이지가 들어가게 된다. -->
		<tiles:insertAttribute name="footer" />
	</div>
</body>

<c:choose> 
<c:when test="${sessionScope.user.id != null}"> 
	<script type="text/javascript">
		$(function() {
			var logout_header =
				'<li><span class="sub-nav-toggle plus"></span>'
				+		'<a href="${context}/movie/movie_list">Movies</a>'
				+	'</li>'
				+	'<li>'
				+		'<span class="sub-nav-toggle plus"></span>' 
				+		'<a href="${context}/purchase/purchase_step1">Ticketing</a>'
				+	'</li>'
				+	'<li>'
				+		'<span class="sub-nav-toggle plus"></span>'
				+		'<a href="#">Cinema</a>'
				+	'</li>'
				+	'<li id="headerLogout">'
				+		'<span class="sub-nav-toggle plus"></span>' 
				+		'<a href="${context}/member/logout">로그아웃</a>'
				+	'</li>'
				+	'<li>'
				+		'<span class="sub-nav-toggle plus"></span>' 
				+		'<a href="${context}/member/profile">마이페이지</a>'
				+	'</li>';
				$('#navigation').html(logout_header);
		});
	</script>
</c:when>
<c:otherwise>
	<script type="text/javascript">
		$(function() {		
			var login_header =
				'<li><span class="sub-nav-toggle plus"></span>'
				+		'<a href="${context}/movie/movie_list">Movies</a>'
				+	'</li>'
				+	'<li>'
				+		'<span class="sub-nav-toggle plus"></span>' 
				+		'<a href="${context}/purchase/purchase_step1">Ticketing</a>'
				+	'</li>'
				+	'<li>'
				+		'<span class="sub-nav-toggle plus"></span>'
				+		'<a href="#">Cinema</a>'
				+	'</li>'
				+	'<li id="headerLogin">'
				+		'<span class="suzb-nav-toggle plus" ></span>' 
				+		'<a href="${context}/member/login">로그인</a>'
				+	'</li>'
				+	'<li id="headerJoin">'
				+		'<span class="sub-nav-toggle plus"></span>' 
				+		'<a href="${context}/member/join">회원가입</a>'
				+	'</li>';
				$('#navigation').html(login_header);
		});
	</script>
</c:otherwise>
</c:choose>
</html>
<%-- 
<script src="${context}/resources/app/js/Global.js"></script>
<script src="${context}/resources/app/js/Member.js"></script>
<script src="${context}/resources/app/js/Main.js"></script>
<script src="${context}/resources/app/js/Rainbow.js"></script>


<script type="text/javascript">
	$(function(){
		var context = $.fn.global('${context}').getContext();
		var member = $.fn.member(); 
		$('#headerLogin').click(function(e){
			e.preventDefault();
		 	member.loginForm(context); 
		});
		
		$('#headerJoin').click(function(e){
			e.preventDefault();
		 	member.joinForm(context); 
		});
	
	});


</script> --%>

