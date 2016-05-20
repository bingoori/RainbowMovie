<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- login content -->
<form class="login" id="login_form" style="margin-top: 30px;">
	<p class="login__title">
		sign in <br>
		<span class="login-edition">welcome to Rainbow Cinema</span>
	</p>

	<div class="social social--colored">
		<a href='#' class="social__variant fa fa-facebook"></a> 
		<a href='#' class="social__variant fa fa-twitter"></a> 
		<a href='#' class="social__variant fa fa-tumblr"></a>
	</div>

	<p class="login__tracker">or</p>

	<div class="field-wrap">
		<input type="text" placeholder='아이디를 입력하세요' id="id" name='id' class="login__input"/> 
		<input type='text' placeholder='비밀번호를 입력하세요' id="password" name='password' class="login__input"/>
	</div>

	<div class="login__control">
		<button id="loginBtn" name="loginBtn" class="btn btn-md btn--warning btn--wider">sign in</button>
		<a href="#" class="login__tracker form__tracker">Forgot password?</a>
	</div>
</form>
<!-- login content End -->
<script type="text/javascript">
	$(function() {
		$('#loginBtn').click(function(e) { // 로그인 버튼 클릭 시 $() 로 form 태그를 찾아서 객체로 리턴받아 action을 걸고 post방식으로 보낸다.
			e.preventDefault();
			$('#login_form').attr('action',"${context}/member/login").attr('method',"post").submit();
		});
	});
</script>
