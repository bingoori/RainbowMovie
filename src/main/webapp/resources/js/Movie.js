/**
 * Movie.js
 */

var movie = {
		movieList : function(context, url, id){
			
			$.getJSON(context + url, function(data) {
				var start = data.page.start;
				var end = data.page.end;
				var keyField =data.page.keyField;
				var keyWord = data.page.keyWord;
				var totalMovie = data.page.totalMovie;
				
				var movieList =
			        '<div class="search-wrapper" style="margin-top: 55px; padding-top: 17px;">\
			            <div class="container container--add">\
			                <form class="search" id="search_form" name="search_form">\
			                    <input type="text" class="search__field" id="SearchKeyWord" name="SearchKeyWord" placeholder="Search">\
			                    <select class="search__sort" id="SearchKeyField" name="SearchKeyField" tabindex="0">\
			                        <option value="title" selected="selected">By title</option>\
			                        <option value="director">By director</option>\
			                    </select>\
			                    <button class="btn btn-md btn--danger search__button" id="searchBtn" name="searchBtn">search a movie</button>\
			                </form>\
			            </div>\
			        </div>\
			        <!-- Main content -->\
			        <section id="wrapper" class="container">\
			            <div class="col-sm-12">\
			                <h2 class="page-heading">Movies</h2>\
			                 <div class="tags-area">\
			                    <div class="tags tags--unmarked">\
			                        <span class="tags__label">상영 영화 목록 리스트 : </span>\
			                            <ul>\
			                                <li class="item-wrap"><a href="#" class="tags__item item-active" data-filter="all">평점순</a></li>\
			                                <li class="item-wrap"><a href="#" class="tags__item" data-filter="release">개봉일순</a></li>\
			                            </ul>\
			                    </div>\
			                </div>';
				
							$.each(data.movieList, function(index, list) {
							movieList += 
								'<!-- Movie preview item -->\
				                   <div class="movie movie--preview movie--full release">\
				                        <div class="col-sm-4 col-md-3 col-lg-3">\
				                            <div class="movie__images">\
				                               <img alt="" src="'+context+'/resources/rainbow/images/main/'+list.image+'" height="283">\
				                            </div>\
				                       </div>\
				                       <div class="col-sm-8 col-md-9 col-lg-9 movie__about">\
				                            <a id="movieTitle" href="/movie/movie_detail/'+list.movieSeq+'" class="movie__title link--huge">'+list.title+'</a>\
				                            <p class="movie__time">'+list.runningtime+'</p>\
											<p class="movie__option"><strong>장르: </strong>'+list.genre+'</p>\
				                          	<p class="movie__option"><strong>개봉일: </strong>'+list.openDate+'</p>\
				                          	<p class="movie__option"><strong>감독: </strong>'+list.director+'</p>\
				                          	<p class="movie__option"><strong>배우: </strong>'+list.actor+'</p>\
				                            <p class="movie__option"><strong>등급: </strong>'+list.grade+'</p>\
				                            <div class="movie__btns">\
				                            	<button id="bookBtn2" class="btn btn-md btn--warning bookBtn2">book a ticket <span class="hidden-sm">for this movie</span></button>\
				                                <a href="#" class="watchlist">Add to watchlist</a>\
				                            </div>\
				                            <div class="preview-footer">\
				                                  <div class="movie__rate">\
				                                  <div class="score" style="margin-left: -15px;"></div>\
				                                  <span class="movie__rating">'+list.rating+'</span></div>\
				                              </div>\
				                       </div>\
				                       <div class="clearfix"></div>\
				                   </div>\
				                   <!-- end movie preview item -->';
								
							});
							movieList +=
							'<div class="booking-pagination booking-pagination--margin">';
								if((start-end)>=0){
									movieList +=
									'<a href="/movie/movie_list?startRow='+(start-end)+'&keyField='+keyField+'&keyWord='+keyWord+'"   class="otherPage booking-pagination__prev" id="pagePrev">\
										<span class="arrow__text arrow--prev">prev</span>\
										<span class="arrow__info">이전 페이지</span>\
									</a>';
									
								}
								if((start+end)<totalMovie){
									movieList+=
									'<a href="/movie/movie_list?startRow='+(start+end)+'&keyField='+keyField+'&keyWord='+keyWord+'" class="otherPage booking-pagination__next" id="pageNext">\
										<span class="arrow__text arrow--next">next</span>\
										<span class="arrow__info">다음 페이지</span>\
									</a>';
								}
						
								movieList+=
								'<input type="hidden" id="total" name="total" value="'+totalMovie+'" />\
							</div>\
			            </div>\
			        </section>';
				$('#content').html(movieList);
				
				$(document).ready(function() { // 이거 안쓰면 셀렉트박스 안먹힘
					$(".search__sort").selectbox(
					{ 
							onChange : function(val, inst) {
							$(inst.input[0]).children().each(function(item) {
								$(this).removeAttr('selected');
							})
							$(inst.input[0]).find('[value="' + val + '"]').attr('selected','selected');
						}
					});
				});
				
				$('.bookBtn2').click(function(e) { // each문으로 버튼 여러개 생성 시 아이디로 구분하면 하나만 먹힘, 클래스로 접근해야함
					e.preventDefault();
					if (id.length != 0) { // 회원일 경우 로그인 창 안띄워지게 하기!
						$.fn.purchase().step1Form(context);
						$('.overlay').removeClass('open').addClass('close');
					} else { // 비회원일 경우 로그인창 띄우기
						$('.overlay').removeClass('close').addClass('open');
					}
				});
			
				
				$('.search__button').click(function(e) {
					e.preventDefault();
					var keyField =  $('select[id=SearchKeyField] option:selected').val();
	    			var keyWord = $('#SearchKeyWord').val();
	    			alert(keyWord);
					var url = "/movie/movie_list?keyField="+keyField+"&keyWord="+keyWord;
					alert(url);
					movie.movieList(context, url, id); 
				});
				
				$('.movie__title').click(function(e) {
					e.preventDefault();
					var url = $(this).attr('href');
			        movie.movieDetail(context,url);
					
				});
				
				$('.otherPage').click(function(e) {
					e.preventDefault();
					var url = $(this).attr('href');
			        movie.movieList(context,url,id);
					
				});
		
			});	
		}, // movieList End
		
		
		movieDetail : function(context, url) {
			
			$.getJSON(context + url, function(data) {
				
				var image = data.movie.image;
				var rating = data.movie.rating;
				var runningtime =data.movie.runningtime;
				var title = data.movie.title;
				var genre = data.movie.genre;
				var openDate = data.movie.openDate;
				var grade = data.movie.grade;
				var director = data.movie.director;
				var actor = data.movie.actor;
				var content = data.movie.content;
				var replyCount = data.reply_count;
				var movieSeq = data.movie.movieSeq;

				
				var movieDetail = 
					'<!-- Main content -->\
			        <section class="container" style="margin-top: 20px;">\
			            <div class="col-sm-12">\
			                <div class="movie">\
			                    <h2 class="page-heading">Movie Introduce</h2>\
			                    <div class="movie__info">\
			                        <div class="col-sm-4 col-md-3 movie-mobile">\
			                            <div class="movie__images">\
			                                <img src="'+context+'/resources/rainbow/images/main/'+image+'" alt="" width="526" height="320"/>\
			                            </div>\
			                        </div>\
			                        <div class="col-sm-8 col-md-9">\
			                            <p class="movie__time">'+runningtime+'</p>\
										<p class="movie__option"><strong>Title : </strong>'+title+'</p>\
			                            <p class="movie__option"><strong>Genre : </strong>'+genre+'</p>\
			                            <p class="movie__option"><strong>OpenDate : </strong>'+openDate+'</p>\
			                            <p class="movie__option"><strong>Grade : </strong>'+grade+'</p>\
			                            <p class="movie__option"><strong>Director : </strong>'+director+'</p>\
			                            <p class="movie__option"><strong>Actors : </strong>'+actor+'</p>\
			                            <a href="#" class="comment-link">Comments : '+replyCount+'</a>\
			                            <div class="movie__btns movie__btns--full">\
			                            	<button id="bookBtn3" name="bookBtn3" class="btn btn-md btn--warning">book a ticket for this movie</button>\
			                                <!-- <a href="#" class="btn btn-md btn--warning">book a ticket for this movie</a> -->\
			                                <a href="#" class="watchlist">Add to watchlist</a>\
			                            </div>\
			                        </div>\
			                    </div>\
			                    <div class="clearfix"></div>\
			                    <h2 class="page-heading">Movie Summary</h2>\
			                    <p class="movie__describe">'+content+'</p>\
			                    <h2 class="page-heading">Movie Photos</h2>\
			                    <div class="movie__media">\
			                        <div class="movie__media-switch">\
			                            <a href="#" class="watchlist list--photo" data-filter="media-photo">8 photos</a>\
			                        </div>\
			                        <div class="swiper-container">\
			                          <div class="swiper-wrapper">\
			                              <!--First Slide-->\
			                              <div class="swiper-slide media-video">\
			                                <a href="https://www.youtube.com/watch?v=Y5AehBA3IsE" class="movie__media-item ">\
			                                     <img alt="" src="'+context+'/resources/rainbow/images/movie_detail/harry1.jpg">\
			                                </a>\
			                              </div>\
			                              <!--Second Slide-->\
			                              <div class="swiper-slide media-video">\
			                                <a href="https://www.youtube.com/watch?v=Kb3ykVYvT4U" class="movie__media-item">\
			                                    <img alt="" src="'+context+'/resources/rainbow/images/movie_detail/harry2.jpg">\
			                                </a>\
			                              </div>\
			                              <!--Third Slide-->\
			                              <div class="swiper-slide media-photo">\
			                                    <a href="http://placehold.it/2100x1250" class="movie__media-item">\
			                                        <img alt="" src="'+context+'/resources/rainbow/images/movie_detail/harry3.jpg">\
			                                     </a>\
			                              </div>\
			                              <!--Four Slide-->\
			                              <div class="swiper-slide media-photo">\
			                                    <a href="http://placehold.it/2100x1250" class="movie__media-item">\
			                                        <img alt="" src="'+context+'/resources/rainbow/images/movie_detail/harry4.jpg">\
			                                     </a>\
			                              </div>\
			                              <!--Slide-->\
			                              <div class="swiper-slide media-photo">\
			                                    <a href="http://placehold.it/2100x1250" class="movie__media-item">\
			                                        <img alt="" src="'+context+'/resources/rainbow/images/movie_detail/harry5.jpg">\
			                                     </a>\
			                              </div>\
			                              <!--Slide-->\
			                              <div class="swiper-slide media-photo">\
			                                    <a href="http://placehold.it/2100x1250" class="movie__media-item">\
			                                        <img alt="" src="'+context+'/resources/rainbow/images/movie_detail/harry6.jpg">\
			                                     </a>\
			                              </div>\
			                              <!--First Slide-->\
			                              <div class="swiper-slide media-video">\
			                                <a href="https://www.youtube.com/watch?v=Y5AehBA3IsE" class="movie__media-item ">\
			                                     <img alt="" src="'+context+'/resources/rainbow/images/movie_detail/harry7.jpg">\
			                                </a>\
			                              </div>\
			                              <!--Slide-->\
			                              <div class="swiper-slide media-photo">\
			                                    <a href="http://placehold.it/2100x1250" class="movie__media-item">\
			                                        <img alt="" src="'+context+'/resources/rainbow/images/movie_detail/harry8.jpg">\
			                                     </a>\
			                              </div>\
			                          </div>\
			                        </div>\
			                    </div>\
			                </div>\
			                <div class="choose-container">\
			                    <h2 class="page-heading">Movie Comments ('+replyCount+')</h2>\
			                    <div class="comment-wrapper">\
			                        <form id="comment_form" class="comment-form">\
			                        	<input type="hidden" id="movieSeq" name="movieSeq" value="'+movieSeq+'"/>\
			                            <textarea class="comment-form__text" id="replyContent" name="replyContent" placeholder="Add you comment here"></textarea>\
			                            <label class="comment-form__info">250 characters left</label>\
			                            <button class="btn btn-md btn--danger comment-form__btn" id="commentBtn" name="commentBtn">add comment</button>\
			                        </form>\
			                        <div class="comment-sets">';
			                        	
			                        	
			                        $.each(data.reply_list, function(index, list) {
			                        	var writerName =list.writerName;
			                        	var regTime =list.regTime;
			                        	var replyContent =list.replyContent;
			                        	movieDetail += 
			                        	'<div class="comment">\
					                            <div class="comment__images">\
					                                <img alt="" src="'+context+'/resources/rainbow/images/main/cholong.jpg">\
					                            </div>\
					                            <a href="#" class="comment__author"><span class="social-used fa fa-facebook"></span>'+list.writerName+'</a>\
					                            <p class="comment__date">'+list.regTime+'</p>\
					                            <p class="comment__message">'+list.replyContent+'</p>\
					                            <a href="#" class="comment__reply">Reply</a>\
				                        </div>';
											
										});
			                        	
			                        	
						movieDetail += '<!-- <div class="comment comment--answer">\
				                            <div class="comment__images">\
				                                <img alt="" src="http://placehold.it/50x50">\
				                            </div>\
				                            <a href="#" class="comment__author"><span class="social-used fa fa-vk"></span>Dmitriy Pustovalov</a>\
				                            <p class="comment__date">today | 10:19</p>\
				                            <p class="comment__message">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut vitae enim sollicitudin, euismod erat id, fringilla lacus. Cras ut rutrum lectus. Etiam ante justo, volutpat at viverra a, mattis in velit. Morbi molestie rhoncus enim, vitae sagittis dolor tristique et.</p>\
				                            <a href="#" class="comment__reply">Reply</a>\
				                        </div> -->\
				                        <div class="comment-more">\
				                            <a href="#" class="watchlist">Show more comments</a>\
				                        </div>\
			                    	</div>\
			                    </div>\
			                </div>\
			            </div>\
			        </section>';
						
				$('#content').html(movieDetail);
				
				
				var id = $('#sessionVar').val(); // 헤더에 미리 저장한 세션 값 가져오기
				$('#commentBtn').click(function(e) {
					e.preventDefault();
					if (id.length != 0) { // 회원일 경우 댓글 등록할 수 있도록 허용!
						
						 $.ajax({
					            url : context + '/reply/add',
					            data : {
					            	movieSeq : movieSeq,
					            	replyContent : $('#replyContent').val()
					            },
					            dataType : 'json',
							    type : 'post',
					            success : function(data) {
				                if (data != null) {
				                	movie.movieDetail(context,url);
					               } else {
					                  console.log('movieDetail 댓글입력 실패');
					                  return null;
					               }
					            },
					            error : function(request,status,msg) {
					                 alert("code:" + request.status+"\n"+"message:"+request.responseText+"\n"+"msg:"+msg);
					            }
					      });

					} else { // 댓글 등록 클릭 시 비회원일 경우 로그인화면으로 !
						alert("로그인이 필요합니다!");
						member.loginForm(context);
					}
				});
				
				$('#bookBtn3').click(function(e) {
					e.preventDefault();
					if (id.length != 0) { // 회원일 경우 로그인 창 안띄워지게 하기!
						$.fn.purchase().step1Form(context);
						$('.overlay').removeClass('open').addClass('close');
						
					} else { // 비회원일 경우 로그인창 띄우기
						$('.overlay').removeClass('close').addClass('open');
						//member.loginForm(context);
					}
				});
				
			});
			
		}//movieDetail End
}