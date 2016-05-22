/**
 * Vod JS
 */

var vodMain = {	
		vodDetailForm : function(context,vodName,cash) {  
			document.getElementById('indexFooter').style.display = '';
			$.ajax(context+'/vod/vodDetail/'+vodName,{
				data : {}, 
				dataType : 'json',
				async : true,
				success : function(data){  
				$('#content').empty(); 
				var detailForm = '<div class="row">\
					   <img class="col-xs-12" style="padding-left: 39%; padding-right: 30%; " src="'+context+'/resources/vod_image/advertising/ad.png">\
			         </div>\
					<hr />\
					<div class="row" >\
					<div class="col-xs-12 well" style="background: white;">\
					<p><img class="col-xs-12" src="'+context+'/resources/'+data.vodInfo.vodImage+'"></p><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>\
					<hr />\
					</div>\
					</div>\
					 <div>\
				      <p style="text-align: center; font-size:26px;">상세정보</p>\
				      <hr />\
			        <p style="text-align: left;"> 제목 : '+data.vodInfo.vodName+'</p>\
		               <p style="text-align: left;"> 장르 : '+data.vodInfo.vodCategory+'&nbsp;'+data.vodInfo.vodTime+' 분</p>\
		               <p style="text-align: left;">이용가: '+data.vodInfo.vodGrade+'</p>\
		               <p style="text-align: left;">감독/연출 : '+data.vodInfo.vodDirector+'</p>\
		               <p style="text-align: left;">배우/출연 : '+data.vodInfo.vodActor+'</p>\
					</div>\
					<div>\
					<h4>줄거리</h4>\
					<text >\
					</text >\
					</div>\
		               <br/>\
					<div id="demo">\
					<button id = "buyBtn" style="margin: auto;width: 95%"  class=" btn btn-lg btn-block purple-bg">구매하기</button>\
					</div>';
				$('#content').html(detailForm);
				$('text').append(data.vodInfo.vodContent);
				$('#buyBtn').click(function(e) {
					e.preventDefault(); 
					$.ajax(context+'/buy/buyIdCheck',{
						dataType : 'json',
						async : true,
						success : function(data) {  
							if(data.CheckId == null){
								alert("로그인 이후 구매 가능 합니다");
							}else{ 
								$.ajax(context+'/buy/vodBuy',{
									data : {
										vodTitle : vodName,
										vodPrice : cash, 
										memSeq : data.CheckId.memberSeq,
										memcash : data.CheckId.cash
									}, 
									dataType : 'json',
									async : true,
									success : function(info) { 
										if(info.success == 1){
											alert("구매 완료 되었습니다.");
											var r = confirm("구매 내역을 확인 하시겠습니까?");
											if (r == true) {
												vodMain.vodPurchase(context);
											} else {
												location.href=context+"/vod/vodMain";
											}
										}else{
											alert("금액이 부족 합니다.");
										}
									},
									error : function(xhr,status,msg) {
										alert('에러발생상태 :'+status+',내용 : '+msg);
									}
								});
							}
						},
						error : function(xhr,status,msg) {
							alert('에러발생상태 :'+status+',내용 : '+msg);
						}
						
					});
				})
				},
				error : function(xhr,status,msg) {
								alert('에러발생상태 :'+status+',내용 : '+msg);
							}
							
						});
		},
	vodMainForm : function(context) {
		$('#content').empty(); 
		var mainForm = '<div class="row"><br/>\
				<img class="col-xs-12" style="padding-left: 15%; padding-right: 15%; " src="'+context+'/resources/vod_image/advertising/ad.png">\
				</div>\
				<hr />\
			    <div class="col-xs-12">\
		         <h2>최신 영화</h2>\
		         <a href="'+context+'/vod_menu/new_form.do" class="ui-btn-right ui-link ui-btn ui-icon-carat-r ui-btn-icon-notext ui-shadow ui-corner-all"></a>\
		      </div>\
		      <div class="row" >';
	
		$.ajax(context+'/vod/vodLimit/',{
			data : {}, 
			dataType : 'json',
			async : true,
			success : function(data){ 
			
			
			$.each(data.atLeast,function(index,value){ 
				mainForm += '<div class="col-xs-4 well" style="background: white;">\
					<a class ="latestMovie" onclick="vodMain.vodDetailForm('+'\''+context+'\''+','+'\''+value.vodName+'\''+','+'\''+value.vodPrice+'\''+');"  href="#"><img class="col-xs-12" src="'+context+'/resources'+value.vodImage+'"></a>\
					</div>';
					});
			mainForm +=	 '</div>\
				<div class="col-xs-12">\
				<h2>일반 영화</h2>\
				<a href="'+context+'/vod_menu/normal_form.do" data-icon="bars" data-iconpos="notext" class="ui-btn-right ui-link ui-btn ui-icon-carat-r ui-btn-icon-notext ui-shadow ui-corner-all" data-role="button" role="button">Menu</a>\
				</div>\
				<div class="row">';
			$.each(data.common,function(index,value){
				mainForm +=	'<div class="col-xs-4 well" style="background: white;">\
					<a class ="latestMovie" onclick="vodMain.vodDetailForm('+'\''+context+'\''+','+'\''+value.vodName+'\''+','+'\''+value.vodPrice+'\''+');"  href="#"><img class="col-xs-12" src="'+context+'/resources'+value.vodImage+'"></a>\
					</div>';
			});
			mainForm += '</div>\
				<div class="col-xs-12">\
				<h2>무료 영화</h2>\
				<a href="${context}/vod_menu/free_form.do" data-icon="bars" data-iconpos="notext" class="ui-btn-right ui-link ui-btn ui-icon-carat-r ui-btn-icon-notext ui-shadow ui-corner-all"  data-role="button" role="button"></a></div>\
				<div class="row">';
			$.each(data.free,function(index,value){
				mainForm +=	'<div class="col-xs-4 well" style="background: white;">\
					<a class ="latestMovie" onclick="vodMain.vodDetailForm('+'\''+context+'\''+','+'\''+value.vodName+'\''+','+'\''+value.vodPrice+'\''+');"  href="#"><img class="col-xs-12" src="'+context+'/resources'+value.vodImage+'"></a>\
					</div>';
			});
			mainForm += '</div>';
			$('#content').html(mainForm);  	
			},
			error : function(xhr,status,msg) {
							alert('에러발생상태 :'+status+',내용 : '+msg);
						}
						
					});
		
		
	},
	vodSearchForm : function(context) {
		$('#content').empty();	 
		var searchView ='';
		var searchForm = '<div role="main" class="ui-content" id="content"><div class="container">\
		<div class="row"><br>\
		  <div class="col-sm-6 col-sm-offset-3">\
		<div class="input-group stylish-input-group">\
	      <form autocomplete="on">\
        <input  type="text" name="keywords" id="keywords" class="form-control"  placeholder="Search" value="" >\
        </form>\
        <span class="input-group-addon" style="background: white !important;">\
        <button id ="search" style="border:0;background:transparent;">\
		<span class="glyphicon glyphicon-search"></span></button>\
		</span>\
        </div></div></div><div class="col-xs-12 display-cell" id="result"><hr /></div>\
		</div></div>';
	$('#content').html(searchForm);
	$('#keywords').keyup(function(event) { 
  		$('#result').empty();
  		if($('#keywords').val != ""){
		$.ajax(context+'/vod/earlySearch',{
			data : {
				keyword : $('#keywords').val()	
			}, 
			dataType : 'json',
			async : true,
			success : function(data) {
			 $.each(data.serchList,function(index,value){
				 searchView += '<br /><div class="row">\
					 <div class="col-xs-4">\
					 <a class="searchMovie" href="#" onclick="vodMain.vodDetailForm('+'\''+context+'\''+','+'\''+value.vodName+'\''+','+'\''+value.vodPrice+'\''+');">\
					 <img style="width: 100%" src="'+context+'/resources/'+value.vodImage+'">\
					 </a>\
					 </div>\
					 <div class="col-xs-8" style="font-style:normal;">\
					 <div>'+value.vodName+'</div>\
					 <div>'+value.vodGrade+'</div>\
					 <div>'+value.vodActor+'</div>\
			         </div>\
			         </div>\
			         <hr />';
			 });
			$('#result').append(searchView);
			searchView = '';
			},
			error : function(xhr,status,msg) {
				alert('에러발생상태 :'+status+',내용 : '+msg);
			}
			
		});
  		}
	});  
	$('#search').click(function() { 
		var keywords =$('#keywords').val();
		if(keywords == "")
		{
		alert('영화제목을 입력하세요');
		}else if(keywords.length <= 1){
			alert('두글자 이상 입력 하세요');
		}else {  
			$('#result').empty();
			$.ajax(context+'/vod/earlySearch',{
				data : {
					keyword : $('#keywords').val()	
				}, 
				dataType : 'json',
				async : true,
				success : function(data) {
				 $.each(data.serchList,function(index,value){  
					 searchView += '<div class="row">\
						 <div class="col-xs-4">\
						 <a href="#" onclick="vodMain.vodDetailForm('+'\''+context+'\''+','+'\''+value.vodName+'\''+','+'\''+value.vodPrice+'\''+');">\
						 <img style="width: 100%" href="#" src="${context}/resources/'+value.vodImage+'">\
						 </a>\
						 </div>\
						 <div class="col-xs-8" style="font-style:normal;">\
						 <div>'+value.vodName+'</div>\
						 <div>'+value.vodGrade+'</div>\
						 <div>'+value.vodActor+'</div>\
				         </div>\
				         </div>\
				         <hr />';
				 });
				$('#result').append(searchView);
				searchView = '';
				},
				error : function(xhr,status,msg) {
					alert('에러발생상태 :'+status+',내용 : '+msg);
				}
				
			});
		}
	});
	
	},
	 vodPurchase : function(context,session) {
		 $('#content').empty(); 
		 var purchaseForm = '';
		 $.ajax(context+'/buy/vodPurchase',{
				data : {}, 
				dataType : 'json',
				type : 'post',
				async : true,
				success : function(data) {
					purchaseForm += '<div class="row"  style="text-align:center;">이용내역</div>';
				 $.each(data.purchase,function(index,value){ 
					 purchaseForm += '<hr/>\
							<div class="row">\
						 <div class="col-xs-2">\
						 <a href="'+value.vodUrl+'">\
						 <img style="width: 100%" src="'+context+'/resources/'+value.vodImage+'">\
						 </a>\
						 </div>\
						 <div class="col-xs-7" style="font-style:normal;font-size:95% 	">\
						 <div>'+value.vodName+'</div>\
						 <div>'+value.vodGrade+'</div>\
						 <div>'+value.vodActor+'</div>\
				         </div>\
				         <div class="col-xs-3" style="font-style:normal;font-size:95% 	">\
						 <div>'+value.vodPrice+'원</div>\
				         </div>\
				         </div>\
				         <hr />';
				 });
					$('#content').html(purchaseForm);
				},
				error : function(xhr,status,msg) {
					alert('에러발생상태 :'+status+',내용 : '+msg);
				}
				
			});
	
	},
	vodLoginForm : function(context) {
		//$('#outside').empty();
		$('body').empty();
		var loginFrom = '<div class="container">\
			<br/>\
			<div class="row">\
			<div class="col-md-3 col-md-offset-4 setwidth" >\
			<div class="account-box">\
	           <p class="serif" style="font-weight: bold;">로그인</p>\
	           <hr />\
	           <div class="logo" >\
			<img class="col-xs-12" src="'+context+'/resources/vod_image/advertising/ad.png">\
            </div>\
			<br />\
			<br />\
			<br />\
			<br />\
			<br />\
			<br />\
            <form>\
            <div class="form-group">\
                <input type="text" class="form-control" placeholder="ID" name="id" id ="loginId" required autofocus />\
            </div>\
            <div class="form-group">\
                <input type="password" class="form-control" placeholder="Password" id="loginPassword" name="password" required />\
            </div>\
		  </form>\
            <button id="loginBtn" class="btn btn-lg btn-block purple-bg">Sign Up</button>\
            <hr />\
            <button class="col-xs-4 btn btn-lg  purple-bg" >Find Id</button>\
             <button class="col-xs-4 btn btn-lg  purple-bg"  >Find Psw</button>\
             <button class="col-xs-4 btn btn-lg  purple-bg" >Join</button>\
			  </div>\
	        </div>\
			</div>\
			</div>';

		$('body').html(loginFrom);
		
		$('#loginBtn').click(function(e) {
			 e.preventDefault();
			$.ajax(context+'/member/vod_login',{
				data : {
					id : $('#loginId').val(),
					password : $('#loginPassword').val()
				},
				type : 'post',
				dataType : 'json',
				async : true,
				success : function(data) {
					if(data.member == null){
						alert('아이디 또는 패스워드가 틀렸습니다.')
					}else{
						alert(data.member.id+"님 환영합니다.");
						location.href = context+"/vod/vodMain";
					}
					
				},
				error : function(xhr,status,msg) {
					alert('에러발생상태 :'+status+',내용 : '+msg);
				}
				
				
			});
		});

	},
	vodJoinForm : function(context) {
		$('body').empty();
		var joinForm = '<div class="container">\
				<br/>\
				<div class="row">\
				<div class="col-xs-3 col-xs-offset-4" style="width : 100%; margin: auto;">\
				<div class="account-box">\
				<p class="serif" style="font-weight: bold;">회원가입</p>\
				 <hr />\
				 <div class="logo ">\
			<img class="col-xs-12"  src="'+context+'/resources/vod_image/advertising/ad.png">\
            </div>\
			<br />\
			<br />\
			<br />\
			<br />\
			<br />\
			<br />\
			<form>\
			  <div >\
            <input type="text" class="form-control"  name ="id" placeholder="ID" required autofocus />\
        </div><br/>\
        <div >\
            <input type="password" class="form-control" id = "password" name="password" placeholder="Password"  required />\
        </div><br/>\
         <div >\
            <input type="password" class="form-control" name ="password2" placeholder="Check Password" required />\
        </div><br/>\
          <div >\
            <input type="text"   name="name"  class="form-control" placeholder="Name" required autofocus />\
        </div><br/>\
        <div >\
            <input type="text" maxlength="50" name="email" pattern="^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{2,5}$" class="form-control" placeholder="Email" required autofocus />\
        </div><br/>\
          <div >\
            <input type="text" maxlength="200" name="addr" pattern="^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{2,5}$" class="form-control" placeholder="Addr" required autofocus />\
        </div>\
			<br/>\
         <div>\
			<input class="form-control" type="date" name="date" id="date" > </div>\
			<br/>\
       </form>\
			<button id ="joinBtn" class="btn btn-lg btn-block purple-bg">Sign Up</button>\
			<hr />\
  			<button class="col-xs-4 btn btn-lg"  >Find Id</button>\
            <button class="col-xs-4 btn btn-lg"  >Find Psw</button>\
            <button class="col-xs-4 btn btn-lg"  >Login</button>\
            </div>\
	        </div>\
	    </div>\
	    </div>';
		$('body').html(joinForm); 
		history.pushState(joinForm,"join",'');
		$('#joinBtn').click(function(e) {
			e.preventDefault();
			$.ajax(context + '/member/vod_join', {
				data : {
				 	id : $('input:text[name=id]').val(),
				 	password : $('#password').val(),
					name : $('input:text[name=name]').val(),
					email : $('input:text[name=email]').val(),
					addr : $('input:text[name=addr]').val(),
					year : $('#date').val()
				},
				type : 'post',
				dataType : 'json',
				async : true,
				success : function(data) {
					if(data.check == 1){
						alert('회원가입이 완료 되었습니다 .');
					}else{
						alert('회원가입에 실패하였습니다 .');
					}
			        location.href = context+"/mobile"
				},
				error : function(xhr, status, msg) {
					alert('에러발생상태 :' + status + ',내용 : ' + msg);
				}

			});
		});
	},
	vodAtLeastForm : function(context) {
		$('#content').empty(); 
		var atLeastForm = '<div class="row">\
			<img class="col-xs-12" style="padding-left: 30%; padding-right: 30%; " src="'+context+'/resources/vod_image/advertising/ad.png">\
			</div>\
			<hr />\
		    <div class="col-xs-12">\
	         <h2>최신 영화</h2>\
	         <a href="'+context+'/vod_menu/new_form.do" class="ui-btn-right ui-link ui-btn ui-icon-carat-r ui-btn-icon-notext ui-shadow ui-corner-all"></a>\
	      </div>';
		
	
		
		
		$.ajax(context+'/vod/vodAtLeastUn/',{
			data : {}, 
			dataType : 'json',
			async : true,
			success : function(data){ 
		atLeastForm += '<div class="row" >';
		$.each(data.atLeast,function(index,value){ 
			if(index < 3){
				atLeastForm += '<div class="col-xs-4 well" style="background: white;">\
					<a class ="latestMovie" onclick="vodMain.vodDetailForm('+'\''+context+'\''+','+'\''+value.vodName+'\''+','+'\''+value.vodPrice+'\''+');"  href="#"><img class="col-xs-12" src="'+context+'/resources'+value.vodImage+'"></a>\
					</div>';
				
			}
				});
		atLeastForm +=	 '</div>';
		atLeastForm += '<div class="row" >';
		$.each(data.atLeast,function(index,value){ 
			if(index >= 3 && index < 6){
				atLeastForm += '<div class="col-xs-4 well" style="background: white;">\
					<a class ="latestMovie" onclick="vodMain.vodDetailForm('+'\''+context+'\''+','+'\''+value.vodName+'\''+','+'\''+value.vodPrice+'\''+');"  href="#"><img class="col-xs-12" src="'+context+'/resources'+value.vodImage+'"></a>\
					</div>';
				
			}
				});
		atLeastForm +=	 '</div>';
		atLeastForm += '<div class="row" >';
		$.each(data.atLeast,function(index,value){ 
			if(index > 5 && index < 10){
				atLeastForm += '<div class="col-xs-4 well" style="background: white;">\
					<a class ="latestMovie" onclick="vodMain.vodDetailForm('+'\''+context+'\''+','+'\''+value.vodName+'\''+','+'\''+value.vodPrice+'\''+');"  href="#"><img class="col-xs-12" src="'+context+'/resources'+value.vodImage+'"></a>\
					</div>';
				
			}
				});
		atLeastForm +=	 '</div>';
		$('#content').html(atLeastForm); 
		
		
			},
			error : function(xhr,status,msg) {
							alert('에러발생상태 :'+status+',내용 : '+msg);
						}
						
					});
	
	
	
	
	},
	vodCommonForm : function(context) {
		$('#content').empty(); 
		var commonForm = '<div class="row">\
			<img class="col-xs-12" style="padding-left: 30%; padding-right: 30%; " src="'+context+'/resources/vod_image/advertising/ad.png">\
			</div>\
			<hr />\
		    <div class="col-xs-12">\
	         <h2>일반 영화</h2>\
	         <a href="'+context+'/vod_menu/new_form.do" class="ui-btn-right ui-link ui-btn ui-icon-carat-r ui-btn-icon-notext ui-shadow ui-corner-all"></a>\
	      </div>';
		

		
		
		$.ajax(context+'/vod/vodCommonUn/',{
			data : {}, 
			dataType : 'json',
			async : true,
			success : function(data){ 
		commonForm += '<div class="row" >';
		$.each(data.common,function(index,value){ 
			if(index < 3){
				commonForm += '<div class="col-xs-4 well" style="background: white;">\
					<a class ="latestMovie" onclick="vodMain.vodDetailForm('+'\''+context+'\''+','+'\''+value.vodName+'\''+','+'\''+value.vodPrice+'\''+');"  href="#"><img class="col-xs-12" src="'+context+'/resources'+value.vodImage+'"></a>\
					</div>';
				
			}
				});
		commonForm +=	 '</div>';
		commonForm += '<div class="row" >';
		$.each(data.common,function(index,value){ 
			if(index >= 3 && index < 6){
				commonForm += '<div class="col-xs-4 well" style="background: white;">\
					<a class ="latestMovie" onclick="vodMain.vodDetailForm('+'\''+context+'\''+','+'\''+value.vodName+'\''+','+'\''+value.vodPrice+'\''+');"  href="#"><img class="col-xs-12" src="'+context+'/resources'+value.vodImage+'"></a>\
					</div>';
				
			}
				});
		commonForm +=	 '</div>';
		commonForm += '<div class="row" >';
		$.each(data.common,function(index,value){ 
			if(index > 5 && index < 10){
				commonForm += '<div class="col-xs-4 well" style="background: white;">\
					<a class ="latestMovie" onclick="vodMain.vodDetailForm('+'\''+context+'\''+','+'\''+value.vodName+'\''+','+'\''+value.vodPrice+'\''+');"  href="#"><img class="col-xs-12" src="'+context+'/resources'+value.vodImage+'"></a>\
					</div>';
				
			}
				});
		commonForm +=	 '</div>';
		$('#content').html(commonForm); 
		
			},
			error : function(xhr,status,msg) {
							alert('에러발생상태 :'+status+',내용 : '+msg);
						}
						
					});
	
	
	
	
	},
	vodFreeForm : function(context) {
		$('#content').empty(); 
		var freeForm = '<div class="row">\
			<img class="col-xs-12" style="padding-left: 30%; padding-right: 30%; " src="'+context+'/resources/vod_image/advertising/ad.png">\
			</div>\
			<hr />\
		    <div class="col-xs-12">\
	         <h2>무료 영화</h2>\
	         <a href="'+context+'/vod_menu/new_form.do" class="ui-btn-right ui-link ui-btn ui-icon-carat-r ui-btn-icon-notext ui-shadow ui-corner-all"></a>\
	      </div>';
		
		 
		$.ajax(context+'/vod/vodFreeUn/',{
			data : {}, 
			dataType : 'json',
			async : true,
			success : function(data){ 
		freeForm += '<div class="row" >';
		$.each(data.free,function(index,value){ 
			if(index < 3){
				freeForm += '<div class="col-xs-4 well" style="background: white;">\
					<a class ="latestMovie" onclick="vodMain.vodDetailForm('+'\''+context+'\''+','+'\''+value.vodName+'\''+','+'\''+value.vodPrice+'\''+');"  href="#"><img class="col-xs-12" src="'+context+'/resources'+value.vodImage+'"></a>\
					</div>';
				
			}
				});
		freeForm +=	 '</div>';
		freeForm += '<div class="row" >';
		$.each(data.free,function(index,value){ 
			if(index >= 3 && index < 6){
				freeForm += '<div class="col-xs-4 well" style="background: white;">\
					<a class ="latestMovie" onclick="vodMain.vodDetailForm('+'\''+context+'\''+','+'\''+value.vodName+'\''+','+'\''+value.vodPrice+'\''+');"  href="#"><img class="col-xs-12" src="'+context+'/resources'+value.vodImage+'"></a>\
					</div>';
				
			}
				});
		freeForm +=	 '</div>';
		freeForm += '<div class="row" >';
		$.each(data.free,function(index,value){ 
			if(index > 5 && index < 10){
				freeForm += '<div class="col-xs-4 well" style="background: white;">\
					<a class ="latestMovie" onclick="vodMain.vodDetailForm('+'\''+context+'\''+','+'\''+value.vodName+'\''+','+'\''+value.vodPrice+'\''+');"  href="#"><img class="col-xs-12" src="'+context+'/resources'+value.vodImage+'"></a>\
					</div>';
				
			}
				});
		freeForm +=	 '</div>';
		$('#content').html(freeForm);
			},
			error : function(xhr,status,msg) {
							alert('에러발생상태 :'+status+',내용 : '+msg);
						}
						
					});
	
	
	}
}