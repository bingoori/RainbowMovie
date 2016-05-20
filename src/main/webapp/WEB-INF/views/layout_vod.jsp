<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<!-- 모바일 사용을 위한 선언 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- JQuery Mobile -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<script>
	$(document).on("pagecreate", function() {
		$("body > [data-role='panel']").panel();
		$("body > [data-role='panel'] [data-role='listview']").listview();
	});
	$(document).one("pageshow", function() {
		$("body > [data-role='header']").toolbar();
		$("body > [data-role='header'] [data-role='navbar']").navbar();
	});
</script>
<!-- BootStrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<!-- /header -->
<body>
		<div data-role="panel" id="outside" data-display="push" data-theme="b">
			<ul data-role="listview">
				<li id='logintab' style="display: '';"><div>
						<p style="margin-left: 31%;">로그인이필요합니다</p>
						<button class="col-xs-offset-1 col-xs-5" id="loginForm"
							value="로그인">로그인</button>
						<button class="col-xs-5" id="joinForm" value="회원가입">회원가입</button>
					</div></li>
				<li id='logouttab' style="display: none;">
					<div>
						<p style="margin-left: 31%;">${user.id}님 환영합니다.</p>
						<button class="col-xs-offset-1 col-xs-5" id="updateForm"
							value="정보수정">정보수정</button>
						<button class="col-xs-5" id="logoutBtn" value="logout">로그아웃</button>
					</div>
				</li>

				<li id='purchasetab' style="display: none;"><a href="#"
					data-ajax="false">Purchase history</a></li>
				<li><a href="#" data-ajax="false" id="info">Info</a></li>
				<li><a href="#" data-ajax="false" id="qna">Q/A</a></li>
				<li><a href="#" data-ajax="false" id="setting">Setting</a></li>
				<li><a href="#" data-ajax="false" id="developer">Developer</a></li>

			</ul>
		</div> 
		<div data-role="header" data-position="fixed" data-theme="a" id ="headerSide">
			<h1 style="font-size: 16px; font-weight: 15px;">
				Rainbow Movie <span><button id="search" class="jqm-search-link ui-btn ui-btn-icon-notext ui-corner-all ui-icon-search ui-nodisc-icon ui-alt-icon ui-btn-right">search</button></span>
			</h1>
			<a href="#outside" data-icon="bars" data-iconpos="notext">Menu</a>
			<div data-role="navbar">
				<ul>
					<li id="home"><a href="#" class="ui-link ui-btn">홈</a></li>
					<li id="new"><a href="#" class="ui-link ui-btn">최신</a></li>
					<li id="normal"><a href="#" class="ui-link ui-btn">일반</a></li>
					<li id="free"><a href="#" class="ui-link ui-btn">무료</a></li>
				</ul>
			</div>
		</div> 
		<div data-role="page" id="c">
			<div role="main" class="ui-content" id="content"> 
			</div> 
			</body>
			<footer id = 'indexFooter'>
                <div class="navbar navbar-default navbar-static-bottom">
                    <p class="navbar-text pull-left">
                        Built by <a href="https://github.com/bingoori" target="_blank"> Bingoori
                    </p>
                </div>
            </footer>
		</html>
<script src="${js}/vod_js/vodMain.js"></script>
<script>
   $(function() {
	   var context  = '${context}';
	   	vodMain.vodMainForm(context);
 	 var user = '${user.id}';
 	 if(user == null || user == ''){ 
 		 }else{
		document.getElementById('logintab').style.display = 'none';
		document.getElementById('logouttab').style.display = '';
		document.getElementById('purchasetab').style.display = '';
 		}
   });
   $('#purchasetab').click(function(e) {
	   e.preventDefault(); 
	   vodMain.vodPurchase('${context}');  
   });
   $('#new').click(function(e) {
	   e.preventDefault(); 
	   vodMain.vodAtLeastForm('${context}'); 
   });
   $('#normal').click(function(e) {
	   e.preventDefault();
	   vodMain.vodCommonForm('${context}');     
   });
   $('#free').click(function(e) {
	   e.preventDefault();
	   vodMain.vodFreeForm('${context}');      
   });
  	 $('#logoutBtn').click(function(e) {
  	   e.preventDefault();
       location.href = "${context}/member/vod_logout";     
 	   }); 
   $('#loginForm').click(function(e) {
	   e.preventDefault(); 
	   vodMain.vodLoginForm('${context}');
	   
   });
   $('#joinForm').click(function(e) {
	   e.preventDefault();
	   vodMain.vodJoinForm('${context}');   
   });
   $('#home').click(function(e) {
	   e.preventDefault();
	   vodMain.vodMainForm('${context}');   
   });
   $('#search').click(function(e) {
	   e.preventDefault(); 
	   document.getElementById('indexFooter').style.display = 'none';
	   vodMain.vodSearchForm('${context}');
   });
   $('#info').click(function(e) {
  	   e.preventDefault();
  	   alert("info");     
 	   }); 
   $('#qna').click(function(e) {
	   e.preventDefault();
	   alert("qna");   
   });
   $('#setting').click(function(e) {
	   e.preventDefault();
	   alert("setting");   
   });
   $('#developer').click(function(e) {
	   e.preventDefault();
	   alert("developer");    
   });
 	
   $(windows).on("popstate", function(event) {
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
	    	location.href = "http://localhost:8080/web/mobile/";
	    }
   });
</script>
		</div> 
	 