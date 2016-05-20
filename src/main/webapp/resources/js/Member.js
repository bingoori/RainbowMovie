/**
 * Member
 */
var member = {
	headerLogin : function(context, id, password) { // 헤더의 book a ticket로 로그인 시
		$.ajax({
			url : context+'/member/login',
			data : {
				id : id,
				password : password
			},
			dataType : 'json',
			type : 'post',
		    success : function(data) {
				alert(data.member.name+ '님 로그인 성공');
				location.href = context+'/';
				
				/*//nav 로그인 창에서 로그인 성공하면 화면 없어지고 바로 티켓팅 화면으로 넘어감
				location.href = context+'/';
				$('.overlay').removeClass('open').addClass('close');
				var purchase = $.fn.purchase();
				purchase.step1Form(context);*/
			},
			error : function(xhr, status, msg) {
				alert("정보를 잘못입력하셨습니다. 다시 로그인 해주세요");
			}
		});
	},
	
	loginForm : function(context) {
		var loginForm = 
			'<form class="login" id="login_form" style="margin-top: 30px;">\
				<p class="login__title">\
					sign in <br>\
					<span class="login-edition">welcome to Rainbow Cinema</span>\
				</p>\
				<div class="social social--colored">\
					<a href="#" class="social__variant fa fa-facebook"></a>\
					<a href="#" class="social__variant fa fa-twitter"></a>\
					<a href="#" class="social__variant fa fa-tumblr"></a>\
				</div>\
				<p class="login__tracker">or</p>\
				<div class="field-wrap">\
					<input type="text" placeholder="아이디를 입력하세요" id="id" name="id" class="login__input"/>\
					<input type="text" placeholder="비밀번호를 입력하세요" id="password" name="password" class="login__input"/>\
				</div>\
				<div class="login__control">\
					<input type="button" id="loginBtn" name="loginBtn" class="btn btn-md btn--warning btn--wider" value="sign in">\
					<a href="#" class="login__tracker form__tracker">Forgot password?</a>\
				</div>\
			</form>';
		$('#content').html(loginForm);
		
		$('#loginBtn').click(function(e) {
			e.preventDefault();
			$.ajax({
				url : context+'/member/login',
				data : {
					id : $('#id').val(),	
					password : $('#password').val()
				},
				dataType : 'json',
				type : 'post',
				success : function(data) {
					alert(data.member.name+ '님 로그인 성공'); 
					location.href = context+'/';
				},
				error : function(xhr, status, msg) {
					alert("정보를 잘못입력하셨습니다. 다시 로그인 해주세요");
					member.loginForm(context);
				}
			});
		}); // loginBtn End
	}, // loginForm() End
	
	joinForm : function(context) {
		var joinForm = 
			'<article class="container" style="margin-top: 30px">\
				<div class="col-md-12 login">\
					<p class="login__title">\
						Join Member <br>\
						<span class="login-edition">welcome to Rainbow Cinema</span>\
					</p>\
					<div class="social social--colored">\
						<a href="#" class="social__variant fa fa-facebook"></a> \
						<a href="#" class="social__variant fa fa-twitter"></a> \
						<a href="#" class="social__variant fa fa-tumblr"></a>\
					</div>\
					<form class="form-horizontal" id="join_form">\
		        		<div class="form-group" style="margin-top: 30px">\
		        			<label class="col-sm-3 control-label" for="inputId">아이디</label>\
		        			<div class="col-sm-6">\
		                			<input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력해주세요" />\
		            		</div>\
		        		</div>\
		        		<div class="form-group">\
		        			<label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>\
			        		<div class="col-sm-6">\
			        			<input type="text" class="form-control" id="password" name="password" placeholder="비밀번호를 입력해주세요" />\
			        		</div>\
		        		</div>\
		        		<div class="form-group">\
		        			<label class="col-sm-3 control-label" for="inputName">이름</label>\
		        			<div class="col-sm-6">\
		            			<input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력해주세요" />\
		        			</div>\
		        		</div>\
		        		<div class="form-group">\
		        			<label class="col-sm-3 control-label" for="inputBirth">생년월일</label>\
		        			<div class="col-sm-6">\
		                		<input type="text" class="form-control" id="birth" name="birth" placeholder="생년월일을 입력해주세요" />\
		            		</div>\
		        		</div>\
		        		<div class="form-group">\
		        			<label class="col-sm-3 control-label" for="inputAddr">주소</label>\
		        			<div class="col-sm-6">\
		                		<input type="text" class="form-control" id="addr" name="addr" placeholder="주소를 입력해주세요" />\
		            		</div>\
		        		</div>\
		        		<div class="form-group">\
		        			<label class="col-sm-3 control-label" for="inputEmail">이메일</label>\
		        			<div class="col-sm-6">\
		                		<input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력해주세요" />\
		            		</div>\
		        		</div>\
		        		<div class="form-group">\
		        			<div class="col-sm-12 text-center">\
		            			<button class="btn btn-primary" id="joinBtn">회원가입<i class="fa fa-check spaceLeft"></i></button>\
		            			<button class="btn btn-danger" id="cancelBtn">가입취소<i class="fa fa-times spaceLeft"></i></button>\
		        			</div>\
		        		</div>\
					</form>\
				</div>\
			</article>';
		
		$('#content').html(joinForm);
		
		$('#joinBtn').click(function(e) { 
			e.preventDefault();
			var $frm = $('#join_form');
			var postData = new FormData($('#join_form')[0]);
			$.ajax({
				url : context+'/member/join',
				data : postData,
				dataType : 'json',
				type : 'post',
				mimeType: 'multipart/form-data',
			    contentType: false, 
			    processData : false,
				success : function(data) {
					if(data.result == 0){
						alert('중복된 아이디 입니다.');
					}else{
						alert('회원가입에 성공하셨습니다. 로그인 화면으로 이동합니다.');
						member.loginForm(context);
					}
				},
				error : function(xhr, status, msg) {
					alert("회원가입 시 에러발생 : " + msg);
				}
			});
		}); // joinBtn() End
		
		$('#cancelBtn').click(function(e) {
			e.preventDefault();
			$('#joinForm').reset();
		});
	}, // joinForm() End
	
	profileForm : function(context) {
		$.getJSON(context+'/member/profile', function(data) {
			var profileForm = 
				'<article class="container" style="margin-top: 30px">\
					<div class="col-md-12 login">\
						<p class="login__title">\
							'+ data.member.name +'님 환영합니다. <br>\
							<span class="login-edition">회원님의 개인정보입니다.</span>\
						</p>\
						<div class="social social--colored">\
							<a href="#" class="social__variant fa fa-facebook"></a> \
							<a href="#" class="social__variant fa fa-twitter"></a> \
							<a href="#" class="social__variant fa fa-tumblr"></a>\
						</div>\
						<form class="form-horizontal" id="detailform" style="margin-top: 30px">\
							<div class="form-group">\
		        				<label class="col-sm-3 control-label" for="id">아이디</label>\
			        			<div class="col-sm-6">\
			        				<input type="text" value="'+ data.member.id +'"  class="form-control" readonly="readonly"/> \
			        			</div>\
		        			</div>\
		        			<div class="form-group">\
		        				<label class="col-sm-3 control-label" for="password">비밀번호</label>\
			        			<div class="col-sm-6">\
			        				<input type="text" value="'+ data.member.password +'"  class="form-control" readonly="readonly"/> \
			        			</div>\
		        			</div>\
		        			<div class="form-group">\
		        				<label class="col-sm-3 control-label" for="name">이름</label>\
			        			<div class="col-sm-6">\
			        				<input type="text" value="'+ data.member.name +'"  class="form-control" readonly="readonly"/> \
			        			</div>\
		        			</div>\
		        			<div class="form-group">\
		        				<label class="col-sm-3 control-label" for="birth">생년월일</label>\
			        			<div class="col-sm-6">\
			        				<input type="text" value="'+ data.member.birth +'"  class="form-control" readonly="readonly"/> \
			        			</div>\
		        			</div>\
		        			<div class="form-group">\
		        				<label class="col-sm-3 control-label" for="addr">주소</label>\
			        			<div class="col-sm-6">\
			        				<input type="text" value="'+ data.member.addr +'"  class="form-control" readonly="readonly"/> \
			        			</div>\
		        			</div>\
		        			<div class="form-group">\
		        				<label class="col-sm-3 control-label" for="email">이메일</label>\
			        			<div class="col-sm-6">\
			        				<input type="text" value="'+ data.member.email +'"  class="form-control" readonly="readonly"/> \
			        			</div>\
		        			</div>\
							<div class="form-group">\
		        				<label class="col-sm-3 control-label" for="point">회원 포인트</label>\
			        			<div class="col-sm-6">\
			        				<input type="text" value="'+ data.member.point +'"  class="form-control" readonly="readonly"/> \
			        			</div>\
		        			</div>\
		        			<div class="form-group">\
		        				<label class="col-sm-3 control-label" for="grade">회원등급</label>\
			        			<div class="col-sm-6">\
			        				<input type="text" value="'+ data.member.grade +'"  class="form-control" readonly="readonly"/> \
			        			</div>\
		        			</div>\
							<div class="form-group">\
		        				<div class="col-sm-12 text-center">\
									<button class="btn btn-primary" id="updateBtn" name="updateBtn">회원정보 수정<i class="fa fa-check spaceLeft"></i></button>\
		            				<button class="btn btn-danger" id="cancelBtn" name="cancelBtn">취소<i class="fa fa-times spaceLeft"></i></button>\
		        				</div>\
		        			</div>\
						</form>\
					</div>\
				</article>';
			
			$('#content').html(profileForm);
			
			$('#updateBtn').click(function(e) {
				e.preventDefault();
				member.updateForm(context,data);
			});
			$('#cancelBtn').click(function(e) {
				e.preventDefault();
				location.href = context + "/";
			});
		}); // getJson() End
	}, // profileForm() End
	
	updateForm : function(context,data) {
		var updateForm = 
			'<article class="container" style="margin-top: 30px">\
				<div class="col-md-12 login">\
					<p class="login__title">\
						'+ data.member.name +'님 환영합니다. <br>\
						<span class="login-edition">회원님의 정보 수정 페이지입니다.</span>\
					</p>\
					<div class="social social--colored">\
						<a href="#" class="social__variant fa fa-facebook"></a> \
						<a href="#" class="social__variant fa fa-twitter"></a> \
						<a href="#" class="social__variant fa fa-tumblr"></a>\
					</div>\
					<form class="form-horizontal" id="update_form" name="update_form" style="margin-top: 30px">\
						<div class="form-group">\
	        				<label class="col-sm-3 control-label" for="id">아이디</label>\
		        			<div class="col-sm-6">\
		        				<input type="text" class="form-control" id="id" name="id" value="'+ data.member.id +'" readonly="readonly"/> \
		        			</div>\
	        			</div>\
	        			<div class="form-group">\
	        				<label class="col-sm-3 control-label" for="password">비밀번호</label>\
		        			<div class="col-sm-6">\
		        				<input type="text" class="form-control" id="password" name="password" value="'+ data.member.password +'" /> \
		        			</div>\
	        			</div>\
	        			<div class="form-group">\
	        				<label class="col-sm-3 control-label" for="name">이름</label>\
							<div class="col-sm-6">\
		        				<input type="text" class="form-control" id="name" name="name" value="'+ data.member.name +'" readonly="readonly"/> \
		        			</div>\
	        			</div>\
	        			<div class="form-group">\
	        				<label class="col-sm-3 control-label" for="birth">생년월일</label>\
		        			<div class="col-sm-6">\
		        				<input type="text" class="form-control" id="birth" name="birth" value="'+ data.member.birth +'" readonly="readonly"/> \
		        			</div>\
	        			</div>\
	        			<div class="form-group">\
	        				<label class="col-sm-3 control-label" for="addr">주소</label>\
		        			<div class="col-sm-6">\
		        				<input type="text" class="form-control" id="addr" name="addr" value="'+ data.member.addr +'" /> \
		        			</div>\
	        			</div>\
	        			<div class="form-group">\
	        				<label class="col-sm-3 control-label" for="email">이메일</label>\
		        			<div class="col-sm-6">\
		        				<input type="text" class="form-control" id="email" name="email" value="'+ data.member.email +'" /> \
		        			</div>\
	        			</div>\
	        			<div class="form-group">\
	        				<label class="col-sm-3 control-label" for="point">회원 포인트</label>\
		        			<div class="col-sm-6">\
		        				<input type="text" value="'+ data.member.point +'" id="point" name="point" class="form-control" readonly="readonly"/> \
		        			</div>\
	        			</div>\
	        			<div class="form-group">\
	        				<label class="col-sm-3 control-label" for="grade">회원등급</label>\
		        			<div class="col-sm-6">\
								<input type="text" value="'+ data.member.grade +'" id="grade" name="grade" class="form-control" readonly="readonly"/> \
		        			</div>\
	        			</div>\
						<div class="form-group">\
				        	<div class="col-sm-12 text-center">\
				            	<button class="btn btn-primary" id="updateOkBtn" name="updateOkBtn">수정완료<i class="fa fa-check spaceLeft"></i></button>\
				            	<button class="btn btn-danger" id="cancelBtn" name="cancelBtn">취소<i class="fa fa-times spaceLeft"></i></button>\
				        	</div>\
				        </div>\
					</form>\
				</div>\
			</article>';
		
		$('#content').html(updateForm);
		
		$('#updateOkBtn').click(function(e) {
			e.preventDefault();
			var $frm = $('#update_form');
			var postData = new FormData($('#update_form')[0]);
			$.ajax({
				url : context+'/member/update',
				data : postData,
				dataType : 'json',
				type : 'post',
				mimeType: 'multipart/form-data',
			    contentType: false, 
			    processData : false,
				success : function() {
					alert('정보수정에 성공하셨습니다. 메인 화면으로 이동합니다.');
					location.href = context + '/';
				},
				error : function(xhr, status, msg) {
					alert("업데이트 시 에러발생 : " + msg);
				}
			});
		}); // updateOkBtn End
		
		$('#cancelBtn').click(function(e) {
			e.preventDefault();
			$('#updateForm').reset();
		});
	}, // updateForm() End
	
	memberLeave : function(context, id) {
		$.ajax({
			url : context+'/member/memberLeave',
			data : {
				id : id
			},
			dataType : 'json',
			type : 'post',
			success : function() {
				alert('회원탈퇴에 성공하셨습니다. 메인 화면으로 이동합니다.');
				location.href = context + "/";
			},
			error : function(xhr, status, msg) {
				alert("회원탈퇴 시 에러발생 : " + msg);
			}
		});
	}, // memberLeave() End
	
	purchaseList : function(context, url) {
		$.getJSON(context + url, function(data) {
			var start = data.page.start;
			var end = data.page.end;
			
			var purchaseList = 
				'<section id="wrapper" class="container"  style="margin-top:50px">\
					<div class="col-sm-12">\
				    	<div class="order-container">\
							<div class="order">\
								<img class="order__images" alt="" src="'+context+'/resources/rainbow/images/tickets.png">\
								<p class="order__title">Movie History<br></p>\
							</div>\
						</div>';
			
				if (data.page.countById == 0) {
					purchaseList += 
						'<div class="movie movie--preview movie--full release">\
	     					<div class="col-sm-4 col-md-3 col-lg-3">\
								<h4 class="movie__title"><b>예매내역이 없습니다</b></h4>\
							</div>\
						</div>';
				} else {
					$.each(data.purchaseList, function(index, list) {
						purchaseList += 
							'<div class="ticket">\
					            <div class="ticket-position">\
					               <div class="ticket__indecator indecator--pre"><div class="indecator-text pre--text">online ticket</div></div>\
					               <div class="ticket__inner">\
					                  <div class="ticket-secondary">\
					                     <span class="ticket__item">Ticket number <strong class="ticket__number">A126BYM4</strong></span>\
					                     <span class="ticket__item ticket__date">'+list.date+'</span>\
					                     <span class="ticket__item ticket__time">'+list.beginTime+'</span>\
					                     <span class="ticket__item">Cinema: <span class="ticket__cinema">Rainbow</span></span>\
					                     <span class="ticket__item">Screen: <span class="ticket__hall">'+list.screenNumber+'</span></span>\
					                     <span class="ticket__item ticket__price">price: <strong class="ticket__cost">'+list.purchasePrice+'원</strong></span>\
					                  </div>\
					                  <div class="ticket-primery">\
					                     <span class="ticket__item ticket__item--primery ticket__film">Film<br>\
					                     	<strong class="ticket__movie">'+list.movieTitle+'</strong>\
					                     </span>\
					                     <span class="ticket__item ticket__item--primery">Sits: <span class="ticket__place">'+list.reserveSeat+'</span></span>\
					                  </div>\
					               </div>\
					               <div class="ticket__indecator indecator--post"><div class="indecator-text post--text">online ticket</div></div>\
					            </div>\
					         </div>';
					});
				}
			
				purchaseList +=	'<div class="booking-pagination booking-pagination--margin">';
			
				if ((start - end) >= 0) {
					purchaseList += '<a href="/purchase/purchase_list/'+(start-end)+'" class="booking-pagination__prev otherPage" id="pagePrev">\
										<span class="arrow__text arrow--prev">prev</span>\
										<span class="arrow__info">이전 페이지</span>\
									</a>';
				} 
				
				if ((start + end) < data.page.countById) {
					purchaseList += '<a href="/purchase/purchase_list/'+(start+end)+'" class="booking-pagination__next otherPage" id="pageNext">\
										<span class="arrow__text arrow--next">next</span>\
										<span class="arrow__info">다음 페이지</span>\
									</a>';
				}
				purchaseList +=	'</div></div></section>';
			
			$('#content').html(purchaseList);
			
			$('.otherPage').click(function(e) {
				e.preventDefault();
				member.purchaseList(context, $(this).attr('href'));
			});
		});
	}
}