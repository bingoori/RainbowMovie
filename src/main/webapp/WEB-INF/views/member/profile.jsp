<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- profile content -->
<article class="container" style="margin-top: 30px">
	<div class="col-md-12 login">
		<p class="login__title">
			${sessionScope.user.name}님 환영합니다. <br>
			<span class="login-edition">회원님의 개인정보입니다.</span>
		</p>
		
		<div class="social social--colored">
			<a href='#' class="social__variant fa fa-facebook"></a> 
			<a href='#' class="social__variant fa fa-twitter"></a> 
			<a href='#' class="social__variant fa fa-tumblr"></a>
		</div>
		
		<form class="form-horizontal" id="detailform" style="margin-top: 30px">
			<div class="form-group">
	        	<label class="col-sm-3 control-label" for="id">아이디</label>
		        <div class="col-sm-6">
		        	<input type="text" value="${sessionScope.user.id}"  class="form-control" readonly="readonly"/> 
		        </div>
	        </div>
	        <div class="form-group">
	        	<label class="col-sm-3 control-label" for="password">비밀번호</label>
		        <div class="col-sm-6">
		        	<input type="text" value="${sessionScope.user.password}"  class="form-control" readonly="readonly"/> 
		        </div>
	        </div>
	        <div class="form-group">
	        	<label class="col-sm-3 control-label" for="name">이름</label>
		        <div class="col-sm-6">
		        	<input type="text" value="${sessionScope.user.name}"  class="form-control" readonly="readonly"/> 
		        </div>
	        </div>
	        <div class="form-group">
	        	<label class="col-sm-3 control-label" for="birth">생년월일</label>
		        <div class="col-sm-6">
		        	<input type="text" value="${sessionScope.user.birth}"  class="form-control" readonly="readonly"/> 
		        </div>
	        </div>
	        <div class="form-group">
	        	<label class="col-sm-3 control-label" for="addr">주소</label>
		        <div class="col-sm-6">
		        	<input type="text" value="${sessionScope.user.addr}"  class="form-control" readonly="readonly"/> 
		        </div>
	        </div>
	        <div class="form-group">
	        	<label class="col-sm-3 control-label" for="email">이메일</label>
		        <div class="col-sm-6">
		        	<input type="text" value="${sessionScope.user.email}"  class="form-control" readonly="readonly"/> 
		        </div>
	        </div>
	        <div class="form-group">
	        	<label class="col-sm-3 control-label" for="point">회원 포인트</label>
		        <div class="col-sm-6">
		        	<input type="text" value="${sessionScope.user.point}"  class="form-control" readonly="readonly"/> 
		        </div>
	        </div>
	        <div class="form-group">
	        	<label class="col-sm-3 control-label" for="grade">회원등급</label>
		        <div class="col-sm-6">
		        	<input type="text" value="${sessionScope.user.grade}"  class="form-control" readonly="readonly"/> 
		        </div>
	        </div>
			
			<div class="form-group">
	        	<div class="col-sm-12 text-center">
					<button class="btn btn-primary" id="purchaseListBtn" name="purchaseListBtn">영화구매내역</button>
	            	<button class="btn btn-primary" id="updateBtn" name="updateBtn">회원정보 수정<i class="fa fa-check spaceLeft"></i></button>
	            	<button class="btn btn-danger" id="cancelBtn" name="cancelBtn">취소<i class="fa fa-times spaceLeft"></i></button>
	        	</div>
	        </div>
		</form>
	</div>
</article>
<!-- profile content End -->

<script type="text/javascript">
	$(function() {
		$('#purchaseListBtn').click(function(e) { // 로그인 버튼 클릭 시 $() 로 form 태그를 찾아서 객체로 리턴받아 action을 걸고 post방식으로 보낸다.
			e.preventDefault();
			location.href = "${context}/purchase/purchase_list/0"
			//$('#detailform').attr('action',"${context}/member/update_form").attr('method','post').submit();
		});
		$('#updateBtn').click(function(e) { // 로그인 버튼 클릭 시 $() 로 form 태그를 찾아서 객체로 리턴받아 action을 걸고 post방식으로 보낸다.
			e.preventDefault();
			location.href = "${context}/member/update_form"
			//$('#detailform').attr('action',"${context}/member/update_form").attr('method','post').submit();
		});
		$('#cancelBtn').click(function(e) {
			e.preventDefault();
			location.href = "${context}/main";
		});
	});
</script>