/**
 * app/Member.js
 */

function Member() {}
Member.prototype.loginForm = function(context) {
	
	var loginForm = 
			'<form class="login" style="margin-top: 30px;">\
				<p class="login__title">\
					sign in <br>\
					<span class="login-edition">welcome to Rainbow Cinema</span>\
				</p>\
				<div class="social social--colored">\
					<a href="#" class="social__variant fa fa-facebook"></a> \
					<a href="#" class="social__variant fa fa-twitter"></a> \
					<a href="#" class="social__variant fa fa-tumblr"></a>\
				</div>\
				<p class="login__tracker">or</p>\
				<div class="field-wrap">\
					<input type="text" placeholder="아이디를 입력하세요" id="inputId" name="id" class="login__input"/> \
					<input type="text" placeholder="비밀번호를 입력하세요" id="inputPw" name="password" class="login__input"/>\
				</div>\
				<div class="login__control">\
					<input type="button" id="loginBtn" name="loginBtn" class="btn btn-md btn--warning btn--wider" value="sign in" />\
					<a href="#" class="login__tracker form__tracker">Forgot password?</a>\
				</div>\
			</form>';
		
		$('#content').html(loginForm);
		
		$('#loginBtn').click(function(e) {
			
		  e.preventDefault();
		  alert("입력한id - "+$('#inputId').val());
	      $.ajax({
	            url : context + '/member/login',
	            data : {
	               id : $('#inputId').val(),
	               password : $('#inputPw').val()
	            },
	            dataType : 'json',
			    type : 'post',
			
	            success : function(data) {
	               if (data != null) {
	                  alert(data.member.name + ' 님로그인');
	                 location.href = context+"/main";
	              /*    $('#content').html(main);*/
	                  
	               } else {
	                  alert('로그인 실패');
	                  return null;
	               }
	            },
	          
	            error : function(xhr,status,msg) {
	                 alert("code:" + request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	                 member.loginForm(context); 
	            }
	      });

	});
	
}




Member.prototype.joinForm = function(context) {
	
	var joinForm = 
		'<form id="joinform" class="login" style="margin-top: 30px;">'
		+'	<p class="login__title">'
		+'		Join Member <br>'
		+'		<span class="login-edition">welcome to Rainbow Cinema</span>'
		+'	</p>'
		+'	<div class="social social--colored">'
		+'		<a href="#" class="social__variant fa fa-facebook"></a>'
		+'		<a href="#" class="social__variant fa fa-twitter"></a>'
		+'		<a href="#" class="social__variant fa fa-tumblr"></a>'
		+'	</div>'
		+'	<div class="field-wrap">'
		+'		<input type="text" placeholder="아이디를 입력하세요" id="id" name="id" class="login__input"/>' 
		+'		<input type="text" placeholder="비밀번호를 입력하세요" id="password" name="password" class="login__input"/>'
		+'		<input type="text" placeholder="이름을 입력하세요" id="name" name="name" class="login__input"/>'
		+'		<input type="text" placeholder="이메일을 입력하세요" id="email" name="email" class="login__input"/>'
		+'		<input type="text" placeholder="생일을 입력하세요" id="birth" name="birth" class="login__input"/>'
		+'		<input type="text" placeholder="주소를 입력하세요" id="addr" name="addr" class="login__input"/>'
		+'	</div>'
		+'	<div class="login__control">'
		+'		<button id="joinBtn" name="joinBtn" class="btn btn-md btn--warning btn--wider">가입완료</button>'
		+'		<button id="cancelBtn" name="cancelBtn" class="btn btn-md btn--warning btn--wider">취소</button>'
		+'	</div>'
		+'</form>';
	
	
		$('#content').html(joinForm);
		$('#joinBtn').click(function() {
			
			alert("회원가입폼 - 조인버튼클릭!");
			
			var member ={
				"id" : $('#id').val(),
				"password" : $('#password').val(),
			
			};
			$.ajax({
				url : context+'/member/join',
				data : JSON.stringify(member),
			    dataType : 'json',
			    type : 'post',
				contentType : 'application/json',
				mimeType : 'application/json',
				async : false,
				success : function(data) {
					if (data !=null) {
						alert(data.id+'님 회원가입되었습니다.');
						location.href=context+'/member/main.user';
					} else {
						alert('회원가입 중 오류가 발생하였습니다.');
						return false;
					}
				},
				error : function(xhr,status,msg) {
	                 alert("code:" + request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	              }
			});
		});
		
		$('#cancelBtn').click(function(e) { // 취소 버튼 클릭 시
			e.preventDefault();
			$('form').reset();
		});
}