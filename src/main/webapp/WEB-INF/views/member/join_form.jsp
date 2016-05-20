<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- login content -->
<article class="container" style="margin-top: 30px">
	<div class="col-md-12 login">
		<p class="login__title">
			Join Member <br>
			<span class="login-edition">welcome to Rainbow Cinema</span>
		</p>
	
		<div class="social social--colored">
			<a href='#' class="social__variant fa fa-facebook"></a> 
			<a href='#' class="social__variant fa fa-twitter"></a> 
			<a href='#' class="social__variant fa fa-tumblr"></a>
		</div>
			
		<form class="form-horizontal" id="joinForm">
	        <div class="form-group" style="margin-top: 30px">
	        	<label class="col-sm-3 control-label" for="inputId">아이디</label>
	        	<div class="col-sm-6">
	        		<div class="input-group">
	                	<input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력해주세요" />
	                	<span class="input-group-btn">
	                    	<button class="btn btn-success">아이디 중복체크<i class="fa fa-mail-forward spaceLeft"></i></button>
	                	</span>
	                </div>
	            </div>
	        </div>
	        
	        <div class="form-group">
	        	<label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
		        <div class="col-sm-6">
		        	<input type="text" class="form-control" id="password" name="password" placeholder="비밀번호를 입력해주세요" />
		        </div>
	        </div>
	        
	        <div class="form-group">
	        	<label class="col-sm-3 control-label" for="inputName">이름</label>
	        	<div class="col-sm-6">
	            	<input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력해주세요" />
	        	</div>
	        </div>
	        
	        <div class="form-group">
	        	<label class="col-sm-3 control-label" for="inputBirth">생년월일</label>
	        	<div class="col-sm-6">
	                <input type="text" class="form-control" id="birth" name="birth" placeholder="생년월일을 입력해주세요" />
	            </div>
	        </div>
	        
	        <div class="form-group">
	        	<label class="col-sm-3 control-label" for="inputAddr">주소</label>
	        	<div class="col-sm-6">
	                <input type="text" class="form-control" id="addr" name="addr" placeholder="주소를 입력해주세요" />
	            </div>
	        </div>
	        
	        <div class="form-group">
	        	<label class="col-sm-3 control-label" for="inputEmail">이메일</label>
	        	<div class="col-sm-6">
	                <input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력해주세요" />
	            </div>
	        </div>
	        
	        <div class="form-group">
	        	<div class="col-sm-12 text-center">
	            	<button class="btn btn-primary" id="joinBtn">회원가입<i class="fa fa-check spaceLeft"></i></button>
	            	<button class="btn btn-danger" id="cancelBtn">가입취소<i class="fa fa-times spaceLeft"></i></button>
	        	</div>
	        </div>
		</form>
	</div>
</article>
<!-- login content End -->

<script type="text/javascript">
	$(function() {
		$('#joinBtn').click(function(e) { // 로그인 버튼 클릭 시 $() 로 form 태그를 찾아서 객체로 리턴받아 action을 걸고 post방식으로 보낸다.
			e.preventDefault();
			$('#joinForm').attr('action',"${context}/member/join").attr('method','post').submit();
		});
		$('#cancelBtn').click(function(e) {
			e.preventDefault();
			$('#joinForm').reset();
		});
	});
</script>