<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
        <!-- Main content -->
        <section class="container" style="margin-top: 20px;">
            <div class="col-sm-12">
                <div class="movie">
                    <h2 class="page-heading">Movie Introduce</h2>
                    
                    <div class="movie__info">
                        <div class="col-sm-4 col-md-3 movie-mobile">
                            <div class="movie__images">
                                <img src="${context}/resources/rainbow/images/main/${movie.image}" alt="" width="526" height="320"/>
                            </div>
                            <%-- <div class="movie__rate" style="text-align: center;"><span class="movie__rating">${movie.rating}</span><div id='score' class="score"></div></div> --%>
                        </div>

                        <div class="col-sm-8 col-md-9">
                            <p class="movie__time">${movie.runningtime}</p>
							
							<p class="movie__option"><strong>Title : </strong>${movie.title}</p>
                            <p class="movie__option"><strong>Genre : </strong>${movie.genre}</p>
                            <p class="movie__option"><strong>OpenDate : </strong>${movie.openDate}</p>
                            <p class="movie__option"><strong>Grade : </strong>${movie.grade}</p>
                            <p class="movie__option"><strong>Director : </strong>${movie.director}</p>
                            <p class="movie__option"><strong>Actors : </strong>${movie.actor}</p>

                            <a href="#" class="comment-link">Comments : ${reply_count}</a>

                            <div class="movie__btns movie__btns--full">
                            	<button id="bookBtn3" name="bookBtn3" class="btn btn-md btn--warning">book a ticket for this movie</button>
                                <!-- <a href="#" class="btn btn-md btn--warning">book a ticket for this movie</a> -->
                                <a href="#" class="watchlist">Add to watchlist</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="clearfix"></div>
                    
                    <h2 class="page-heading">Movie Summary</h2>

                    <p class="movie__describe">${movie.content}</p>

                    <h2 class="page-heading">Movie Photos</h2>
                    
                    <div class="movie__media">
                        <div class="movie__media-switch">
                            <a href="#" class="watchlist list--photo" data-filter='media-photo'>8 photos</a>
                        </div>

                        <div class="swiper-container">
                          <div class="swiper-wrapper">
                              <!--First Slide-->
                              <div class="swiper-slide media-video">
                                <a href='https://www.youtube.com/watch?v=Y5AehBA3IsE' class="movie__media-item ">
                                     <img alt='' src="${context}/resources/rainbow/images/movie_detail/harry1.jpg">
                                </a>
                              </div>
                              
                              <!--Second Slide-->
                              <div class="swiper-slide media-video">
                                <a href='https://www.youtube.com/watch?v=Kb3ykVYvT4U' class="movie__media-item">
                                    <img alt='' src="${context}/resources/rainbow/images/movie_detail/harry2.jpg">
                                </a>
                              </div>
                              
                              <!--Third Slide-->
                              <div class="swiper-slide media-photo"> 
                                    <a href='http://placehold.it/2100x1250' class="movie__media-item">
                                        <img alt='' src="${context}/resources/rainbow/images/movie_detail/harry3.jpg">
                                     </a>
                              </div>

                              <!--Four Slide-->
                              <div class="swiper-slide media-photo"> 
                                    <a href='http://placehold.it/2100x1250' class="movie__media-item">
                                        <img alt='' src="${context}/resources/rainbow/images/movie_detail/harry4.jpg">
                                     </a>
                              </div>

                              <!--Slide-->
                              <div class="swiper-slide media-photo"> 
                                    <a href='http://placehold.it/2100x1250' class="movie__media-item">
                                        <img alt='' src="${context}/resources/rainbow/images/movie_detail/harry5.jpg">
                                     </a>
                              </div>

                              <!--Slide-->
                              <div class="swiper-slide media-photo"> 
                                    <a href='http://placehold.it/2100x1250' class="movie__media-item">
                                        <img alt='' src="${context}/resources/rainbow/images/movie_detail/harry6.jpg">
                                     </a>
                              </div>

                              <!--First Slide-->
                              <div class="swiper-slide media-video">
                                <a href='https://www.youtube.com/watch?v=Y5AehBA3IsE' class="movie__media-item ">
                                     <img alt='' src="${context}/resources/rainbow/images/movie_detail/harry7.jpg">
                                </a>
                              </div>                           

                              <!--Slide-->
                              <div class="swiper-slide media-photo"> 
                                    <a href='http://placehold.it/2100x1250' class="movie__media-item">
                                        <img alt='' src="${context}/resources/rainbow/images/movie_detail/harry8.jpg">
                                     </a>
                              </div>                       
                          </div>
                        </div>

                    </div>

                </div>

                <div class="choose-container">
                    <h2 class="page-heading">Movie Comments (${reply_count})</h2>

                    <div class="comment-wrapper">
                        <form id="comment_form" class="comment-form">
                        	<input type="hidden" id="movieSeq" name="movieSeq" value="${movie.movieSeq}"/>
                            <textarea class="comment-form__text" id="replyContent" name="replyContent" placeholder='Add you comment here'></textarea>
                            <label class="comment-form__info">250 characters left</label>
                            <button class="btn btn-md btn--danger comment-form__btn" id="commentBtn" name="commentBtn">add comment</button>
                        </form>

                        <div class="comment-sets">
							<c:forEach var="list" items="${reply_list}">
		                        <div class="comment">
		                            <div class="comment__images">
		                                <img alt='' src="${context}/resources/rainbow/images/main/cholong.jpg">
		                            </div>
		                            <a href='#' class="comment__author"><span class="social-used fa fa-facebook"></span>${list.writerName}</a>
		                            <p class="comment__date">${list.regTime}</p>
		                            <p class="comment__message">${list.replyContent}</p>
		                            <a href='#' class="comment__reply">Reply</a>
		                        </div>
							</c:forEach>
	                        <!-- <div class="comment comment--answer">
	                            <div class="comment__images">
	                                <img alt='' src="http://placehold.it/50x50">
	                            </div>
	
	                            <a href='#' class="comment__author"><span class="social-used fa fa-vk"></span>Dmitriy Pustovalov</a>
	                            <p class="comment__date">today | 10:19</p>
	                            <p class="comment__message">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut vitae enim sollicitudin, euismod erat id, fringilla lacus. Cras ut rutrum lectus. Etiam ante justo, volutpat at viverra a, mattis in velit. Morbi molestie rhoncus enim, vitae sagittis dolor tristique et.</p>
	                            <a href='#' class="comment__reply">Reply</a>
	                        </div> -->
	
	                        <div class="comment-more">
	                            <a href="#" class="watchlist">Show more comments</a>
	                        </div>
                    	</div>
                    </div>
                </div>
            </div>
        </section>
        
<script type="text/javascript">
	$(function() {
		var id = $('#sessionVar').val();
		$('#commentBtn').click(function(e) {
			e.preventDefault();
			if (id.length != 0) { // 회원일 경우 댓글 등록할 수 있도록 허용!
				$('#comment_form').attr('action',"${context}/reply/add").attr('method',"post").submit();
			} else { // 비회원일 경우 로그인화면으로 !
				alert("로그인이 필요합니다!");
				location.href = "${context}/member/login_form";
			}
		});
		
		$('#bookBtn3').click(function(e) {
			e.preventDefault();
			if (id.length != 0) { // 회원일 경우 로그인 창 안띄워지게 하기!
				$('.overlay').removeClass('open').addClass('close');
			} else { // 비회원일 경우 로그인창 띄우기
				$('.overlay').removeClass('close').addClass('open');
			}
		});
		var context = $.fn.global('${context}').getContext();
		init_MoviePage(context);
	    init_MoviePageFull(context);
	});
</script>