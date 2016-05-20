/**
 * Purchase
 */

function Purchase() { var checkload = "";}

Purchase.prototype.step1Form = function(context) {
	$.getJSON(context+'/purchase/step1', function(data) {
		var step1Form = 
			'<div class="wrapper">\
				<section class="container">\
					<div class="order-container">\
						<div class="order">\
							<img class="order__images" alt="" src="'+context+'/resources/rainbow/images/tickets.png">\
							<p class="order__title">Book a ticket <br><span class="order__descript">and have fun movie time</span></p>\
						</div>\
					</div>\
					<div class="order-step-area">\
						<div class="order-step first--step">1. What &amp; When</div>\
					</div>\
					<h2 class="page-heading heading--outcontainer">Choose a movie</h2>\
				</section>\
				<div class="choose-film">\
					<div class="swiper-container">\
							<div class="swiper-wrapper">';
		
						$.each(data.list, function(index, movie) {
							step1Form += '<div class="swiper-slide" data-film="'+movie.title+'">\
								<div class="film-images"><img alt="" src="'+context+'/resources/rainbow/images/main/'+movie.image+'" height="300"></div>\
								<p class="choose-film__title">'+movie.title+'</p>\
							</div>';
						});
						
						// datePicker 시작 날짜 지정하기 (오늘로!)
						var d = new Date();
						if (d.getMonth() < 10) {
							var month = "0" + (d.getMonth()+1);
						}
						var date = month + "/" + d.getDate() + "/" + d.getFullYear(); 
							
								
	step1Form += '</div>\
					</div>\
				</div>\
				<section class="container">\
					<div class="col-sm-12">\
						<div class="choose-indector choose-indector--film">\
							<strong>Choosen: </strong><span class="choosen-area" id="movie"></span>\
						</div>\
						<h2 class="page-heading">Date</h2>\
						<div class="choose-container choose-container--short">\
							<div class="datepicker">\
								<span class="datepicker__marker"><i class="fa fa-calendar"></i>Date</span>\
								<input type="text" id="datepicker" value="'+date+'" class="datepicker__input">\
							</div>\
						</div>\
						<h2 class="page-heading">Pick time</h2>\
						<div class="time-select time-select--wide">\
							<div class="time-select__group group--first">\
								<ul class="col-sm-6 items-wrap">\
									<li class="time-select__item" data-time="09:40" value="09:40">09:40</li>\
									<li class="time-select__item" data-time="13:45" value="13:45">13:45</li>\
									<li class="time-select__item" data-time="15:45" value="15:45">15:45</li>\
									<li class="time-select__item" data-time="19:50" value="19:50">19:50</li>\
									<li class="time-select__item" data-time="21:50" value="21:50">21:50</li>\
								</ul>\
							</div>\
						</div>\
						<div class="choose-indector choose-indector--time">\
							<strong>Choosen: </strong><span class="choosen-area" id="time"></span>\
						</div>\
					</div>\
				</section>\
				<div class="clearfix"></div>\
				<form id="film-and-time" class="booking-form">\
			 		<input type="text" name="choosen-movie" class="choosen-movie" id="choosen-movie" value="${movie}">\
					<input type="text" name="choosen-date" class="choosen-date" id="choosen-date" value="${datepicker}">\
					<input type="text" name="choosen-time" class="choosen-time" id="choosen-time" value="${time}">\
					<div class="booking-pagination">\
						<button class="booking-pagination__next" id="nextBtn">\
							<span class="arrow__text arrow--next">next step</span>\
							<span class="arrow__info">choose a sit</span>\
						</button>\
					</div>\
				</form>\
			</div>';
		
		$('#content').html(step1Form);
		
		$('#nextBtn').click(function(e) {
			e.preventDefault();
			var movie =  $('#choosen-movie').val();
			var date = $('#choosen-date').val();
			var time = $('#choosen-time').val();

			if(movie =="${movie}" || time=="${time}") {
				alert("선택되지 않은 값이 있습니다.");
			} else{
				 $.ajax({
			            url : context + '/purchase/step2',
			            data : {
			            	movie : movie,
			    			date : date,
			    			time : time
			            },
			            dataType : 'json',
					    type : 'post',
			            success : function(data) {
		                if (data != null) {
			                  Purchase.prototype.step2Form(context, data.reserveList, data.purchasedSeat);
			               } else {
			                  console.log('step2 데이터 가져오기 실패');
			                  return null;
			               }
			            },
			            error : function(request,status,msg) {
			                 alert("code:" + request.status+"\n"+"message:"+request.responseText+"\n"+"msg:"+msg);
			            }
			      });
			}
		}); // nextBtn click End
    	
		$(document).ready(function() {
		    init_BookingOne();
		    
		    checkload = true;
		    jQuery(document).ready(function($) {
		    	
		    	$(window).on("beforeunload", function () {
		    		location.href = context+'/';
		            if (checkload == true) return "영화 예매를 취소하시겠습니까?";  // 페이지를 벗어나는 경우
		        });
		    });
		});
	});
} // step1Form End

Purchase.prototype.step2Form = function(context, reserveList, purchasedSeat){
	var step2Form =
        '<div class="wrapper place-wrapper">\
        <div class="place-form-area">\
           <section class="container">\
              <div class="order-container">\
                 <div class="order">\
                    <img class="order__images" alt="" src="'+context+'/resources/rainbow/images/tickets.png">\
                    <p class="order__title">Book a ticket <br><span class="order__descript">and have fun movie time</span></p>\
                 </div>\
              </div>\
              <div class="order-step-area">\
                 <div class="order-step first--step order-step--disable ">1. What &amp; When</div>\
                 <div class="order-step second--step">2. Choose a sit</div>\
              </div>\
                  <div class="choose-sits">\
                 <div class="choose-sits__info choose-sits__info--first">\
                    <ul>\
                       <li class="sits-price marker--none"><strong>Price</strong></li>\
                       <li class="sits-price sits-price--cheap">8000원</li>\
                       <li class="sits-price sits-price--middle">9000원</li>\
                       <li class="sits-price sits-price--expensive">10000원</li>\
                    </ul>\
                 </div>\
                 <div class="choose-sits__info">\
                    <ul>\
                       <li class="sits-state sits-state--not">Not available</li>\
                       <li class="sits-state sits-state--your">Your choice</li>\
                    </ul>\
                 </div>\
                 <div class="col-sm-12 col-lg-10 col-lg-offset-1">\
                    <div class="sits-area hidden-xs">\
                       <div class="sits-anchor">screen</div>\
                       <div class="sits">\
                          <aside class="sits__line">\
                             <span class="sits__indecator">A</span>\
                             <span class="sits__indecator">B</span>\
                             <span class="sits__indecator">C</span>\
                             <span class="sits__indecator">D</span>\
                             <span class="sits__indecator">E</span>\
                             <span class="sits__indecator">F</span>\
                             <span class="sits__indecator">G</span>\
                             <span class="sits__indecator">I</span>\
                             <span class="sits__indecator additional-margin">J</span>\
                             <span class="sits__indecator">K</span>\
                             <span class="sits__indecator">L</span>\
                          </aside>\
                          <div class="sits__row">\
                             <span class="sits__place sits-price--cheap" id="A2" data-place="A2" data-price="8000">A2</span>\
                             <span class="sits__place sits-price--cheap" id="A3" data-place="A3" data-price="8000">A3</span>\
                             <span class="sits__place sits-price--cheap" id="A4" data-place="A4" data-price="8000">A4</span>\
                             <span class="sits__place sits-price--cheap" id="A5"  data-place="A5" data-price="8000">A5</span>\
                             <span class="sits__place sits-price--cheap" id="A6"  data-place="A6" data-price="8000">A6</span>\
                             <span class="sits__place sits-price--cheap" id="A7"  data-place="A7" data-price="8000">A7</span>\
                             <span class="sits__place sits-price--cheap" id="A8"  data-place="A8" data-price="8000">A8</span>\
                             <span class="sits__place sits-price--cheap" id="A9"  data-place="A9" data-price="8000">A9</span>\
                             <span class="sits__place sits-price--cheap" id="A10"  data-place="A10" data-price="8000">A10</span>\
                             <span class="sits__place sits-price--cheap" id="A11"  data-place="A11" data-price="8000">A11</span>\
                             <span class="sits__place sits-price--cheap" id="A12"  data-place="A12" data-price="8000">A12</span>\
                             <span class="sits__place sits-price--cheap" id="A13"  data-place="A13" data-price="8000">A13</span>\
                             <span class="sits__place sits-price--cheap" id="A14"  data-place="A14" data-price="8000">A14</span>\
                             <span class="sits__place sits-price--cheap" id="A15"  data-place="A15" data-price="8000">A15</span>\
                             <span class="sits__place sits-price--cheap" id="A16"  data-place="A16" data-price="8000">A16</span>\
                             <span class="sits__place sits-price--cheap" id="A17"  data-place="A17" data-price="8000">A17</span>\
                          </div>\
                          <div class="sits__row">\
                             <span class="sits__place sits-price--cheap" id="B1"  data-place="B1" data-price="8000">B1</span>\
                             <span class="sits__place sits-price--cheap" id="B2"  data-place="B2" data-price="8000">B2</span>\
                             <span class="sits__place sits-price--cheap" id="B3"  data-place="B3" data-price="8000">B3</span>\
                             <span class="sits__place sits-price--cheap"  id="B4" data-place="B4" data-price="8000">B4</span>\
                             <span class="sits__place sits-price--cheap" id="B5"  data-place="B5" data-price="8000">B5</span>\
                             <span class="sits__place sits-price--cheap" id="B6"  data-place="B6" data-price="8000">B6</span>\
                             <span class="sits__place sits-price--cheap" id="B7"  data-place="B7" data-price="8000">B7</span>\
                             <span class="sits__place sits-price--cheap" id="B8"  data-place="B8" data-price="8000">B8</span>\
                             <span class="sits__place sits-price--cheap" id="B9" data-place="B9" data-price="8000">B9</span>\
                             <span class="sits__place sits-price--cheap" id="B10"  data-place="B10" data-price="8000">B10</span>\
                             <span class="sits__place sits-price--cheap" id="B11"  data-place="B11" data-price="8000">B11</span>\
                             <span class="sits__place sits-price--cheap" id="B12"  data-place="B12" data-price="8000">B12</span>\
                             <span class="sits__place sits-price--cheap" id="B13"  data-place="B13" data-price="8000">B13</span>\
                             <span class="sits__place sits-price--cheap" id="B14"  data-place="B14" data-price="8000">B14</span>\
                             <span class="sits__place sits-price--cheap" id="B15" data-place="B15" data-price="8000">B15</span>\
                             <span class="sits__place sits-price--cheap" id="B16"  data-place="B16" data-price="8000">B16</span>\
                             <span class="sits__place sits-price--cheap" id="B17"  data-place="B17" data-price="8000">B17</span>\
                             <span class="sits__place sits-price--cheap" id="B18"  data-place="B18" data-price="8000">B18</span>\
                          </div>\
                          <div class="sits__row">\
                             <span class="sits__place sits-price--cheap" id="C1"  data-place="C1" data-price="8000">C1</span>\
                             <span class="sits__place sits-price--cheap" id="C2"  data-place="C2" data-price="8000">C2</span>\
                             <span class="sits__place sits-price--cheap" id="C3"  data-place="C3" data-price="8000">C3</span>\
                             <span class="sits__place sits-price--cheap" id="C4"  data-place="C4" data-price="8000">C4</span>\
                             <span class="sits__place sits-price--cheap" id="C5" data-place="C5" data-price="8000">C5</span>\
                             <span class="sits__place sits-price--cheap" id="C6" data-place="C6" data-price="8000">C6</span>\
                             <span class="sits__place sits-price--cheap" id="C7"  data-place="C7" data-price="8000">C7</span>\
                             <span class="sits__place sits-price--cheap" id="C8"  data-place="C8" data-price="8000">C8</span>\
                             <span class="sits__place sits-price--cheap" id="C9"  data-place="C9" data-price="8000">C9</span>\
                             <span class="sits__place sits-price--cheap" id="C10"  data-place="C10" data-price="8000">C10</span>\
                             <span class="sits__place sits-price--cheap" id="C11"  data-place="C11" data-price="8000">C11</span>\
                             <span class="sits__place sits-price--cheap" id="C12"  data-place="C12" data-price="8000">C12</span>\
                             <span class="sits__place sits-price--cheap" id="C13"  data-place="C13" data-price="8000">C13</span>\
                             <span class="sits__place sits-price--cheap" id="C14"  data-place="C14" data-price="8000">C14</span>\
                             <span class="sits__place sits-price--cheap" id="C15"  data-place="C15" data-price="8000">C15</span>\
                             <span class="sits__place sits-price--cheap" id="C16" data-place="C16" data-price="8000">C16</span>\
                             <span class="sits__place sits-price--cheap" id="C17"  data-place="C17" data-price="8000">C17</span>\
                             <span class="sits__place sits-price--cheap" id="C18"  data-place="C18" data-price="8000">C18</span>\
                          </div>\
                          <div class="sits__row">\
                             <span class="sits__place sits-price--cheap" id="D1"  data-place="D1" data-price="8000">D1</span>\
                             <span class="sits__place sits-price--cheap" id="D2"  data-place="D2" data-price="8000">D2</span>\
                             <span class="sits__place sits-price--cheap" id="D3" data-place="D3" data-price="8000">D3</span>\
                             <span class="sits__place sits-price--cheap" id="D4" data-place="D4" data-price="8000">D4</span>\
                             <span class="sits__place sits-price--cheap" id="D5" data-place="D5" data-price="8000">D5</span>\
                             <span class="sits__place sits-price--cheap" id="D6" data-place="D6" data-price="8000">D6</span>\
                             <span class="sits__place sits-price--cheap" id="D7" data-place="D7" data-price="8000">D7</span>\
                             <span class="sits__place sits-price--cheap" id="D8" data-place="D8" data-price="8000">D8</span>\
                             <span class="sits__place sits-price--cheap" id="D9" data-place="D9" data-price="8000">D9</span>\
                             <span class="sits__place sits-price--cheap" id="D10" data-place="D10" data-price="8000">D10</span>\
                             <span class="sits__place sits-price--cheap" id="D11" data-place="D11" data-price="8000">D11</span>\
                             <span class="sits__place sits-price--cheap" id="D12" data-place="D12" data-price="8000">D12</span>\
                             <span class="sits__place sits-price--cheap" id="D13" data-place="D13" data-price="8000">D13</span>\
                             <span class="sits__place sits-price--cheap" id="D14" data-place="D14" data-price="8000">D14</span>\
                             <span class="sits__place sits-price--cheap" id="D15" data-place="D15" data-price="8000">D15</span>\
                             <span class="sits__place sits-price--cheap" id="D16" data-place="D16" data-price="8000">D16</span>\
                             <span class="sits__place sits-price--cheap" id="D17" data-place="D17" data-price="8000">D17</span>\
                             <span class="sits__place sits-price--cheap" id="D18" data-place="D18" data-price="8000">D18</span>\
                          </div>\
                          <div class="sits__row">\
                             <span class="sits__place sits-price--middle" id="E1" data-place="E1" data-price="9000">E1</span>\
                             <span class="sits__place sits-price--middle" id="E2" data-place="E2" data-price="9000">E2</span>\
                             <span class="sits__place sits-price--middle" id="E3" data-place="E3" data-price="9000">E3</span>\
                             <span class="sits__place sits-price--middle" id="E4" data-place="E4" data-price="9000">E4</span>\
                             <span class="sits__place sits-price--middle" id="E5" data-place="E5" data-price="9000">E5</span>\
                             <span class="sits__place sits-price--middle" id="E6" data-place="E6" data-price="9000">E6</span>\
                             <span class="sits__place sits-price--middle" id="E7" data-place="E7" data-price="9000">E7</span>\
                             <span class="sits__place sits-price--middle" id="E8" data-place="E8" data-price="9000">E8</span>\
                             <span class="sits__place sits-price--middle" id="E9" data-place="E9" data-price="9000">E9</span>\
                             <span class="sits__place sits-price--middle" id="E10" data-place="E10" data-price="9000">E10</span>\
                             <span class="sits__place sits-price--middle" id="E11" data-place="E11" data-price="9000">E11</span>\
                             <span class="sits__place sits-price--middle" id="E12" data-place="E12" data-price="9000">E12</span>\
                             <span class="sits__place sits-price--middle" id="E13" data-place="E13" data-price="9000">E13</span>\
                             <span class="sits__place sits-price--middle" id="E14" data-place="E14" data-price="9000">E14</span>\
                             <span class="sits__place sits-price--middle" id="E15" data-place="E15" data-price="9000">E15</span>\
                             <span class="sits__place sits-price--middle" id="E16" data-place="E16" data-price="9000">E16</span>\
                             <span class="sits__place sits-price--middle" id="E17" data-place="E17" data-price="9000">E17</span>\
                             <span class="sits__place sits-price--middle" id="E18" data-place="E18" data-price="9000">E18</span>\
                          </div>\
                          <div class="sits__row">\
                             <span class="sits__place sits-price--middle" id="F1" data-place="F1" data-price="9000">F1</span>\
                             <span class="sits__place sits-price--middle" id="F2" data-place="F2" data-price="9000">F2</span>\
                             <span class="sits__place sits-price--middle" id="F3" data-place="F3" data-price="9000">F3</span>\
                             <span class="sits__place sits-price--middle" id="F4" data-place="F4" data-price="9000">F4</span>\
                             <span class="sits__place sits-price--middle" id="F5" data-place="F5" data-price="9000">F5</span>\
                             <span class="sits__place sits-price--middle" id="F6" data-place="F6" data-price="9000">F6</span>\
                             <span class="sits__place sits-price--middle" id="F7" data-place="F7" data-price="9000">F7</span>\
                             <span class="sits__place sits-price--middle" id="F8" data-place="F8" data-price="9000">F8</span>\
                             <span class="sits__place sits-price--middle" id="F9" data-place="F9" data-price="9000">F9</span>\
                             <span class="sits__place sits-price--middle" id="F10" data-place="F10" data-price="9000">F10</span>\
                             <span class="sits__place sits-price--middle" id="F11" data-place="F11" data-price="9000">F11</span>\
                             <span class="sits__place sits-price--middle" id="F12" data-place="F12" data-price="9000">F12</span>\
                             <span class="sits__place sits-price--middle" id="F13" data-place="F13" data-price="9000">F13</span>\
                             <span class="sits__place sits-price--middle" id="F14" data-place="F14" data-price="9000">F14</span>\
                             <span class="sits__place sits-price--middle" id="F15" data-place="F15" data-price="9000">F15</span>\
                             <span class="sits__place sits-price--middle" id="F16" data-place="F16" data-price="9000">F16</span>\
                             <span class="sits__place sits-price--middle" id="F17" data-place="F17" data-price="9000">F17</span>\
                             <span class="sits__place sits-price--middle" id="F18" data-place="F18" data-price="9000">F18</span>\
                          </div>\
                          <div class="sits__row">\
                          <span class="sits__place sits-price--middle" id="G1" data-place="G1" data-price="9000">G1</span>\
                          <span class="sits__place sits-price--middle" id="G2" data-place="G2" data-price="9000">G2</span>\
                          <span class="sits__place sits-price--middle" id="G3" data-place="G3" data-price="9000">G3</span>\
                          <span class="sits__place sits-price--middle" id="G4" data-place="G4" data-price="9000">G4</span>\
                          <span class="sits__place sits-price--middle" id="G5" data-place="G5" data-price="9000">G5</span>\
                          <span class="sits__place sits-price--middle" id="G6" data-place="G6" data-price="9000">G6</span>\
                          <span class="sits__place sits-price--middle" id="G7" data-place="G7" data-price="9000">G7</span>\
                          <span class="sits__place sits-price--middle" id="G8" data-place="G8" data-price="9000">G8</span>\
                          <span class="sits__place sits-price--middle" id="G9" data-place="G9" data-price="9000">G9</span>\
                          <span class="sits__place sits-price--middle" id="G10" data-place="G10" data-price="9000">G10</span>\
                          <span class="sits__place sits-price--middle" id="G11" data-place="G11" data-price="9000">G11</span>\
                          <span class="sits__place sits-price--middle" id="G12" data-place="G12" data-price="9000">G12</span>\
                          <span class="sits__place sits-price--middle" id="G13" data-place="G13" data-price="9000">G13</span>\
                          <span class="sits__place sits-price--middle" id="G14" data-place="G14" data-price="9000">G14</span>\
                          <span class="sits__place sits-price--middle" id="G15" data-place="G15" data-price="9000">G15</span>\
                          <span class="sits__place sits-price--middle" id="G16" data-place="G16" data-price="9000">G16</span>\
                          <span class="sits__place sits-price--middle" id="G17" data-place="G17" data-price="9000">G17</span>\
                          <span class="sits__place sits-price--middle" id="G18" data-place="G18" data-price="9000">G18</span>\
                       </div>\
                       <div class="sits__row">\
                       <span class="sits__place sits-price--middle" id="I1" data-place="I1" data-price="9000">I1</span>\
                       <span class="sits__place sits-price--middle" id="I2" data-place="I2" data-price="9000">I2</span>\
                       <span class="sits__place sits-price--middle" id="I3" data-place="I3" data-price="9000">I3</span>\
                       <span class="sits__place sits-price--middle" id="I4" data-place="I4" data-price="9000">I4</span>\
                       <span class="sits__place sits-price--middle" id="I5" data-place="I5" data-price="9000">I5</span>\
                       <span class="sits__place sits-price--middle" id="I6" data-place="I6" data-price="9000">I6</span>\
                       <span class="sits__place sits-price--middle" id="I7" data-place="I7" data-price="9000">I7</span>\
                       <span class="sits__place sits-price--middle" id="I8" data-place="I8" data-price="9000">I8</span>\
                       <span class="sits__place sits-price--middle" id="I9" data-place="I9" data-price="9000">I9</span>\
                       <span class="sits__place sits-price--middle" id="I10" data-place="I10" data-price="9000">I10</span>\
                       <span class="sits__place sits-price--middle" id="I11" data-place="I11" data-price="9000">I11</span>\
                       <span class="sits__place sits-price--middle" id="I12" data-place="I12" data-price="9000">I12</span>\
                       <span class="sits__place sits-price--middle" id="I13" data-place="I13" data-price="9000">I13</span>\
                       <span class="sits__place sits-price--middle" id="I14" data-place="I14" data-price="9000">I14</span>\
                       <span class="sits__place sits-price--middle" id="I15" data-place="I15" data-price="9000">I15</span>\
                       <span class="sits__place sits-price--middle" id="I16" data-place="I16" data-price="9000">I16</span>\
                    </div>\
                          <div class="sits__row additional-margin">\
                             <span class="sits__place sits-price--expensive" id="J5" data-place="J5" data-price="10000">J5</span>\
                             <span class="sits__place sits-price--expensive" id="J6" data-place="J6" data-price="10000">J6</span>\
                             <span class="sits__place sits-price--expensive" id="J7" data-place="J7" data-price="10000">J7</span>\
                             <span class="sits__place sits-price--expensive" id="J8" data-place="J8" data-price="10000">J8</span>\
                             <span class="sits__place sits-price--expensive" id="J9" data-place="J9" data-price="10000">J9</span>\
                             <span class="sits__place sits-price--expensive" id="J10" data-place="J10" data-price="10000">J10</span>\
                             <span class="sits__place sits-price--expensive" id="J11" data-place="J11" data-price="10000">J11</span>\
                             <span class="sits__place sits-price--expensive" id="J12" data-place="J12" data-price="10000">J12</span>\
                             <span class="sits__place sits-price--expensive" id="J13" data-place="J13" data-price="10000">J13</span>\
                             <span class="sits__place sits-price--expensive" id="J14" data-place="J14" data-price="10000">J14</span>\
                          </div>\
                          <div class="sits__row">\
                             <span class="sits__place sits-price--expensive" id="K5" data-place="K5" data-price="10000">K5</span>\
                             <span class="sits__place sits-price--expensive" id="K6" data-place="K6" data-price="10000">K6</span>\
                             <span class="sits__place sits-price--expensive" id="K7" data-place="K7" data-price="10000">K7</span>\
                             <span class="sits__place sits-price--expensive" id="K8" data-place="K8" data-price="10000">K8</span>\
                             <span class="sits__place sits-price--expensive" id="K9" data-place="K9" data-price="10000">K9</span>\
                             <span class="sits__place sits-price--expensive" id="K10" data-place="K10" data-price="10000">K10</span>\
                             <span class="sits__place sits-price--expensive" id="K11" data-place="K11" data-price="10000">K11</span>\
                             <span class="sits__place sits-price--expensive" id="K12" data-place="K12" data-price="10000">K12</span>\
                             <span class="sits__place sits-price--expensive" id="K13" data-place="K13" data-price="10000">K13</span>\
                             <span class="sits__place sits-price--expensive" id="K14" data-place="K14" data-price="10000">K14</span>\
                          </div>\
                          <div class="sits__row">\
                             <span class="sits__place sits-price--expensive" id="L6" data-place="L6" data-price="10000">L6</span>\
                             <span class="sits__place sits-price--expensive" id="L7" data-place="L7" data-price="10000">L7</span>\
                             <span class="sits__place sits-price--expensive" id="L8" data-place="L8" data-price="10000">L8</span>\
                             <span class="sits__place sits-price--expensive" id="L9" data-place="L9" data-price="10000">L9</span>\
                             <span class="sits__place sits-price--expensive" id="L10" data-place="L10" data-price="10000">L10</span>\
                             <span class="sits__place sits-price--expensive" id="L11" data-place="L11" data-price="10000">L11</span>\
                             <span class="sits__place sits-price--expensive" id="L12" data-place="L12" data-price="10000">L12</span>\
                             <span class="sits__place sits-price--expensive" id="L13" data-place="L13" data-price="10000">L13</span>\
                          </div>\
                          <aside class="sits__checked">\
                             <div class="checked-place"></div>\
                             <div class="checked-result">0원</div>\
                          </aside>\
                          <footer class="sits__number">\
                             <span class="sits__indecator">1</span>\
                             <span class="sits__indecator">2</span>\
                             <span class="sits__indecator">3</span>\
                             <span class="sits__indecator">4</span>\
                             <span class="sits__indecator">5</span>\
                             <span class="sits__indecator">6</span>\
                             <span class="sits__indecator">7</span>\
                             <span class="sits__indecator">8</span>\
                             <span class="sits__indecator">9</span>\
                             <span class="sits__indecator">10</span>\
                             <span class="sits__indecator">11</span>\
                             <span class="sits__indecator">12</span>\
                             <span class="sits__indecator">13</span>\
                             <span class="sits__indecator">14</span>\
                             <span class="sits__indecator">15</span>\
                             <span class="sits__indecator">16</span>\
                             <span class="sits__indecator">17</span>\
                             <span class="sits__indecator">18</span>\
                          </footer>\
                       </div>\
                         </div>\
                   </div>\
                 <div class="col-sm-12 visible-xs">\
                    <div class="sits-area--mobile">\
                       <div class="sits-area--mobile-wrap">\
                          <div class="sits-select">\
                             <select name="sorting_item" class="sits__sort sit-row" tabindex="0">\
                                <option value="1" selected="selected">A</option>\
                                <option value="2">B</option>\
                                <option value="3">C</option>\
                                <option value="4">D</option>\
                                <option value="5">E</option>\
                                <option value="6">F</option>\
                                <option value="7">G</option>\
                                <option value="8">I</option>\
                                <option value="9">J</option>\
                                <option value="10">K</option>\
                                <option value="11">L</option>\
                             </select>\
                             <select name="sorting_item" class="sits__sort sit-number" tabindex="1">\
                                <option value="1" selected="selected">1</option>\
                                <option value="2">2</option>\
                                <option value="3">3</option>\
                                <option value="4">4</option>\
                                <option value="5">5</option>\
                                <option value="6">6</option>\
                                <option value="7">7</option>\
                                <option value="8">8</option>\
                                <option value="9">9</option>\
                                <option value="10">10</option>\
                                <option value="11">11</option>\
                                <option value="12">12</option>\
                                <option value="13">13</option>\
                                <option value="14">14</option>\
                                <option value="15">15</option>\
                                <option value="16">16</option>\
                                <option value="17">17</option>\
                                <option value="18">18</option>\
                             </select>\
                             <a href="#" class="btn btn-md btn--warning toogle-sits">Choose sit</a>\
                          </div>\
                       </div>\
                       <a href="#" class="watchlist add-sits-line">Add new sit</a>\
                       <aside class="sits__checked">\
                          <div class="checked-place"><span class="choosen-place"></span></div>\
                          <div class="checked-result">0원</div>\
                       </aside>\
                    </div>\
                 </div>\
              </div>   \
           </section>\
        </div>\
        <div class="clearfix"></div>\
        <form id="film-and-time" class="booking-form" method="get" action="'+context+'/purchase/step3">\
           <input type="text" name="choosen-number" class="choosen-number">\
           <input type="text" name="choosen-number--cheap" class="choosen-number--cheap">\
           <input type="text" name="choosen-number--middle" class="choosen-number--middle">\
           <input type="text" name="choosen-number--expansive" class="choosen-number--expansive">\
           <input type="text" name="choosen-cost" class="choosen-cost">\
           <input type="text" name="choosen-sits" class="choosen-sits">\
           <div class="booking-pagination booking-pagination--margin">\
              <a href="#" class="booking-pagination__prev" id="prevBtn">\
                 <span class="arrow__text arrow--prev">prev step</span>\
                 <span class="arrow__info">What &amp; When</span>\
              </a>\
              <a href="#" class="booking-pagination__next" id="nextBtn">\
                 <span class="arrow__text arrow--next">next step</span>\
                 <span class="arrow__info">checkout</span>\
              </a>\
           </div>\
        </form>\
     </div>';
  $('#content').html(step2Form);
 
  var reservedStr='';
  $.each(purchasedSeat,function(index,purchasedSeat){
	  reservedStr += purchasedSeat.reserveSeat+"/";
  });
  
  var reservedArr = reservedStr.split("/");
  $.each(reservedArr,function(index,reservedArr){
	$("#"+reservedArr).addClass("sits-state--not");
  });
  
  var sum=0;
  $.each(reserveList,function(index,reserveList){
	  var myselect = reserveList.reserveSeat;
	  if (reserveList.reserveSeat!= null) {
		  $("#"+myselect).addClass("sits-state--your");
		  $('.checked-place').after('<span class="choosen-place '+myselect+'">'+ myselect +'</span>');
		  sum += reserveList.purchasePrice;
	  }
  }); // each End
	  
  $('.checked-result').text(sum+'원');
  
  $(document).ready(function() {
     init_BookingTwo(context, reserveList, purchasedSeat);
  });
  
	$('#nextBtn').click(function(e) {
		e.preventDefault();
		if(sum != 0){
			 Purchase.prototype.step3Form(context, reserveList);
		}else{
			alert("좌석을 선택해주세요.");
		}
		
	}); // nextBtn End
	
	$('#prevBtn').click(function(e) {
		e.preventDefault();
		 $.ajax({
	            url : context + '/purchase/step1',
	            data : {
	            	movie : reserveList[0].movieTitle,
	    			date : reserveList[0].date,
	    			time : reserveList[0].beginTime
	            },
	            dataType : 'json',
			    type : 'post',
			
	            success : function(data) {
	               if (data != null) {
	                  Purchase.prototype.step1Form(context);
	               } else {
	                  console.log('step2에서 step1으로 돌아가기 실패');
	                  return null;
	               }
	            },
	          
	            error : function(request,status,msg) {
	                 alert("code:" + request.status+"\n"+"message:"+request.responseText+"\n"+"msg:"+msg);
	            }
	      });
	}); // prevBtn End
} // step2Form End

Purchase.prototype.step3Form = function(context, reserveList){
	var seatArr ="";
	var sum=0;
	var count = 0;
	 $.each(reserveList,function(index,reserveList){
		 if(reserveList.reserveSeat != null) {
			 seatArr += reserveList.reserveSeat+"/";
			 sum += reserveList.purchasePrice;
			 count++;
		 }
	  });
	  seatArr = seatArr.substring(0, seatArr.length-1);

	var step3Form = 
		'<div class="wrapper">\
			<section class="container">\
	        	<div class="order-container">\
	            	<div class="order">\
	               		<img class="order__images" alt="" src="'+context+'/resources/rainbow/images/tickets.png">\
	               		<p class="order__title">Book a ticket <br><span class="order__descript">and have fun movie time</span></p>\
	            	</div>\
	         	</div>\
	         	<div class="order-step-area">\
	            	<div class="order-step first--step order-step--disable ">1. What &amp; When</div>\
	            	<div class="order-step second--step order-step--disable">2. Choose a sit</div>\
	            	<div class="order-step third--step">3. Check out</div>\
	         	</div>\
	         	<div class="col-sm-12">\
	            	<div class="checkout-wrapper">\
	               		<h2 class="page-heading">price</h2>\
						<ul class="book-result">\
							<li class="book-result__item">총 인원: <span class="book-result__count booking-ticket">'+count+'</span></li>\
							<li class="book-result__item">선택좌석: <span class="book-result__count booking-price">'+seatArr+'</span></li>\
							<li class="book-result__item">총 금액: <span class="book-result__count booking-cost">'+sum+'원</span></li>\
						</ul>\
	               		<h2 class="page-heading">Choose payment method</h2>\
						<div class="payment">\
							<a href="#" class="payment__item"><img alt="" src="'+context+'/resources/rainbow/images/payment/pay7.png"></a>\
	               		</div>\
	            	</div>\
	            	<div class="order"><a href="#" class="btn btn-md btn--warning btn--wide" id="purchaseBtn">purchase</a></div>\
	         	</div>\
	      	</section>\
	      	<div class="clearfix"></div>\
	      	<div class="booking-pagination">\
	         	<a href="#" class="booking-pagination__prev" id="prevBtn">\
	            	<p class="arrow__text arrow--prev">prev step</p>\
	            	<span class="arrow__info">choose a sit</span>\
	         	</a>\
	      	</div>\
		</div>';
	
	 $('#content').html(step3Form);
	 
	 $('#purchaseBtn').click(function(e) {
		e.preventDefault();
		
		$.ajax({
        url : context + '/purchase/step4',
        data : { 
        	movie : reserveList[0].movieTitle,
        	date : reserveList[0].date,
        	time : reserveList[0].beginTime,
        	seat : seatArr,
        	price : sum
        },
        dataType : 'json',
	    type : 'post',
	
        success : function(data) {
           if (data != null) {
        	   if (data.overlapCheck) {
        		   Purchase.prototype.step4Form(context, data.purchaseData);
        		   checkload = false; // 페이지 벗어나기 가능
			} else {
				Purchase.prototype.step2Form(context, data.reserveList, data.purchasedSeat);
			}
           } else {
              console.log('step4 데이터 가져오기 실패');
              return null;
           }
        },
      
        error : function(request,status,msg) {
             alert("code:" + request.status+"\n"+"message:"+request.responseText+"\n"+"msg:"+msg);
        }
		});
	}) // purchaseBtn End
	
	$('#prevBtn').click(function(e) {
		e.preventDefault();
		$.ajax({
            url : context + '/purchase/step2',
            data : {
            	movie : reserveList[0].movieTitle,
            	date : reserveList[0].date,
            	time : reserveList[0].beginTime,
            },
            dataType : 'json',
		    type : 'post',
            success : function(data) {
               if (data != null) {
                  Purchase.prototype.step2Form(context, data.reserveList, data.purchasedSeat);
               } else {
                  console.log('step3에서 stpe2로 돌아가기 실패');
                  return null;
               }
            },
          
            error : function(request,status,msg) {
                 alert("code:" + request.status+"\n"+"message:"+request.responseText+"\n"+"msg:"+msg);
            }
      });
	}) // prevBtn End
} // step3Form End

Purchase.prototype.step4Form = function(context,purchaseData){
	   var step4Form = 
	      '<div class="wrapper place-wrapper">\
	   <section class="container">\
	      <div class="order-container">\
	         <div class="order">\
	            <img class="order__images" alt="" src="'+context+'/resources/rainbow/images/tickets.png">\
	            <p class="order__title">Thank you <br><span class="order__descript">you have successfully purchased tickets</span></p>\
	         </div>\
	         <div class="ticket">\
	            <div class="ticket-position">\
	               <div class="ticket__indecator indecator--pre"><div class="indecator-text pre--text">online ticket</div></div>\
	               <div class="ticket__inner">\
	                  <div class="ticket-secondary">\
	                     <span class="ticket__item">Ticket number <strong class="ticket__number">A126BYM4</strong></span>\
	                     <span class="ticket__item ticket__date">'+purchaseData.date+'</span>\
	                     <span class="ticket__item ticket__time">'+purchaseData.beginTime+'</span>\
	                     <span class="ticket__item">Cinema: <span class="ticket__cinema">Rainbow</span></span>\
	                     <span class="ticket__item">Screen: <span class="ticket__hall">'+purchaseData.screenNumber+'</span></span>\
	                     <span class="ticket__item ticket__price">price: <strong class="ticket__cost">'+purchaseData.purchasePrice+'원</strong></span>\
	                  </div>\
	                  <div class="ticket-primery">\
	                     <span class="ticket__item ticket__item--primery ticket__film">Film<br><strong class="ticket__movie">'+purchaseData.movieTitle+'</strong></span>\
	                     <span class="ticket__item ticket__item--primery">Sits: <span class="ticket__place">'+purchaseData.reserveSeat+'</span></span>\
	                  </div>\
	               </div>\
	               <div class="ticket__indecator indecator--post"><div class="indecator-text post--text">online ticket</div></div>\
	            </div>\
	         </div>\
	         <div class="ticket-control">\
	            <a href="#" class="watchlist list--download">Download</a>\
	             <a href="#" class="watchlist list--print">Print</a>\
	         </div>\
	      </div>\
	   </section>\
	</div>';
	   
	$('#content').html(step4Form);
} // step4Form End