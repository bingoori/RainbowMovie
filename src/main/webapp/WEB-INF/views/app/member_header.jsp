<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Banner -->
<div class="banner-top">
    <img alt='top banner' src="${context}/resources/rainbow/images/main/main_header.png">
</div>

<!-- Header section -->
<header class="header-wrapper header-wrapper--home">
    <div class="container">
        <!-- Logo link-->
     	<a href="${context}/main" class="logo">
        	<img alt='logo' src="${context}/resources/rainbow/images/main/logo.png">
     	</a>

		<!-- Main website navigation-->
		<nav id="navigation-box">
			<!-- Toggle for mobile menu mode -->
			<a href="#" id="navigation-toggle"> 
				<span class="menu-icon">
					<span class="icon-toggle" role="button" aria-label="Toggle Navigation">
						<span class="lines"></span>
					</span>
				</span>
			</a>

			<!-- Link navigation -->
			<ul id="navigation">
				<!-- 이 부분에 메뉴 헤더 내용이 들어간다(로그인했을 시와 로그인 안했을 시에 헤더가 다르다 (layout.user에서 구분한다) -->
			</ul>
		</nav>

		<!-- Additional header buttons / Auth and direct link to booking-->
		<div class="control-panel">
			<div class="auth auth--home">
				<div class="auth__show">
				<span class="auth__image"> <img alt="" src="http://placehold.it/31x31"></span>
				</div>
				<a href="#" class="btn btn--sign btn--singin">${sessionScope.user.name}</a>
			</div>
			<button class="btn btn-md btn--warning btn--book btn-control--home login-window" style="font-size: 11px;" id="bookBtn">Book a ticket</button>
			<input type="hidden" id="sessionVar" value="${sessionScope.user.id}">
			<!-- <a href="#" class="btn btn-md btn--warning btn--book btn-control--home login-window" style="font-size: 11px;">Book a ticket</a> -->
		</div>
	</div>
</header>

<script type="text/javascript">
	$(function() {
		var id = $('#sessionVar').val();
		$('#bookBtn').click(function(e) {
			e.preventDefault();
			if (id.length != 0) {
				location.href = "${context}/main";
			}
		});
	});
</script>

<!-- open/close -->
<div class="overlay overlay-hugeinc">
	<section class="container">
		<div class="col-sm-4 col-sm-offset-4">
			<button type="button" class="overlay-close">Close</button>
				<form class="login">
                        <p class="login__title">sign in <br>
                        	<span class="login-edition">welcome to Rainbow Cinema</span>
                        </p>
                        <div class="social social--colored">
                                <a href='#' class="social__variant fa fa-facebook"></a>
                                <a href='#' class="social__variant fa fa-twitter"></a>
                                <a href='#' class="social__variant fa fa-tumblr"></a>
                        </div>
                        <p class="login__tracker">or</p>
                        <div class="field-wrap">
	                        <input type='text' placeholder='아이디를 입력하세요' id="id" name="id" class="login__input">
	                        <input type='text' placeholder='비밀번호를 입력하세요' id="password" name='password' class="login__input">
                        </div>
                        <div class="login__control">
                            <button id="nav_loginBtn" name="nav_loginBtn" class="btn btn-md btn--warning btn--wider">sign in</button>
                            <a href="#" class="login__tracker form__tracker">Forgot password?</a>
                        </div>
				</form>
				<script type="text/javascript">
					$(function() {
						$('#nav_loginBtn').click(function(e) { // 로그인 버튼 클릭 시 $() 로 form 태그를 찾아서 객체로 리턴받아 action을 걸고 post방식으로 보낸다.
							e.preventDefault();
							$('form').attr('action',"${context}/member/login").attr('method',"post").submit();
						});
					});
				</script>
			</div>
	</section>
</div>