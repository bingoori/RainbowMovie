<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Slider -->
<div class="bannercontainer">
	<div class="banner">
		<ul>
			<li data-transition="fade" data-slotamount="7" class="slide" data-slide='IronMan3'>
				<img alt='' src="${context}/resources/rainbow/images/main/IronMan3.jpg">
			</li>
			<li data-transition="fade" data-slotamount="7" class="slide fading-slide" data-slide='HarryPotter5'>
				<img alt='' src="${context}/resources/rainbow/images/main/HarryPotter5.jpg">
			</li>
			<li data-transition="fade" data-slotamount="7" class="slide fading-slide" data-slide='Thor2'>
				<img alt='' src="${context}/resources/rainbow/images/main/thor2.jpg">
			</li>
			<li data-transition="fade" data-slotamount="7" class="slide fading-slide" data-slide='Matrix4'>
				<img alt='' src="${context}/resources/rainbow/images/main/matrix4.jpg">
			</li>
			<li data-transition="fade" data-slotamount="7" class="slide fading-slide" data-slide='Captain America2'>
				<img alt='' src="${context}/resources/rainbow/images/main/captain2.jpg">
			</li>
			<li data-transition="fade" data-slotamount="7" class="slide fading-slide" data-slide='Terminator3'>
				<img alt='' src="${context}/resources/rainbow/images/main/Terminator3.jpg">
			</li>
		</ul>
	</div>
</div>
<!--end slider -->

<!-- Main content -->
        <section class="container">
            <div class="movie-best">
                 <div class="col-sm-10 col-sm-offset-1 movie-best__rating">Today Best choice</div>
                 <div class="col-sm-12 change--col">
	                 <c:forEach var="list" items="${list}">
	                     <div class="movie-beta__item ">
	                        <img alt='' src="${context}/resources/rainbow/images${list.image}">
	                         <span class="best-rate">5.0</span>
	
	                         <ul class="movie-beta__info">
	                             <li><span class="best-voted">감독 : ${list.director}</span></li>
	                             <li>
	                                <p class="movie__time">${list.runningtime}</p>
	                                <p>장르 : ${list.genre}</p>
	                                <p>주인공 : ${list.cast}</p>
	                             </li>
	                             <li class="last-block">
	                                 <a href="movie-page-left.html" class="slide__link">more</a>
	                             </li>
	                         </ul>
	                     </div>
	                 </c:forEach>   
                 </div>
                <div class="col-sm-10 col-sm-offset-1 movie-best__check">check all movies now playing</div>
            </div>
            
            <div class="clearfix"></div>
            <div class="col-sm-12">
                <div class="row">
                	<div class="col-sm-1" style="padding-left: 110px;"></div>
                    <div class="col-sm-8 col-md-9">
                        <!-- Movie variant with time -->
                            <div class="movie movie--test movie--test--dark movie--test--left">
                                <div class="movie__images">
                                    <a href="movie-page-left.html" class="movie-beta__link">
                                        <img alt='' src="http://placehold.it/424x424">
                                    </a>
                                </div>

                                <div class="movie__info">
                                    <a href='movie-page-left.html' class="movie__title">Gravity (2013)  </a>

                                    <p class="movie__time">91 min</p>

                                    <p class="movie__option"><a href="#">Sci-Fi</a> | <a href="#">Thriller</a> | <a href="#">Drama</a></p>
                                    
                                    <div class="movie__rate">
                                        <div class="score"></div>
                                        <span class="movie__rating">4.1</span>
                                    </div>               
                                </div>
                            </div>
                         <!-- Movie variant with time -->

                         <!-- Movie variant with time -->
                            <div class="movie movie--test movie--test--light movie--test--left">
                                <div class="movie__images">
                                    <a href="movie-page-left.html" class="movie-beta__link">
                                    <img alt='' src="http://placehold.it/424x424">
                                    </a>
                                </div>

                                <div class="movie__info">
                                    <a href='movie-page-left.html' class="movie__title">The Hobbit: The Desolation of Smaug (2013)  </a>

                                    <p class="movie__time">169 min</p>

                                    <p class="movie__option"><a href="#">Adventure</a> | <a href="#">Fantasy</a> | <a href="#">Drama</a></p>
                                    
                                    <div class="movie__rate">
                                        <div class="score"></div>
                                        <span class="movie__rating">5.0</span>
                                    </div>               
                                </div>
                            </div>
                         <!-- Movie variant with time -->

                         <!-- Movie variant with time -->
                            <div class="movie movie--test movie--test--light movie--test--right">
                                <div class="movie__images">
                                    <a href="movie-page-left.html" class="movie-beta__link">
                                    <img alt='' src="http://placehold.it/424x424">
                                    </a>
                                </div>

                                <div class="movie__info">
                                    <a href='movie-page-left.html' class="movie__title">The Hunger Games: Catching Fire (2013)   </a>

                                    <p class="movie__time">146 min</p>

                                    <p class="movie__option"><a href="#">Action</a> | <a href="#">Adventure</a> | <a href="#">Sci-Fi</a></p>
                                    
                                    <div class="movie__rate">
                                        <div class="score"></div>
                                        <span class="movie__rating">4.9</span>
                                    </div>               
                                </div>
                            </div>
                         <!-- Movie variant with time -->

                         <!-- Movie variant with time -->
                            <div class="movie movie--test movie--test--dark movie--test--right">
                                <div class="movie__images">
                                    <a href="movie-page-left.html" class="movie-beta__link">
                                    <img alt='' src="http://placehold.it/424x424">
                                    </a>
                                </div>

                                <div class="movie__info">
                                    <a href='movie-page-left.html' class="movie__title">Thor: The Dark World (2013) </a>

                                    <p class="movie__time">112 min</p>

                                    <p class="movie__option"><a href="#">Action</a> | <a href="#">Adventure</a> | <a href="#">Fantasy</a></p>
                                    
                                    <div class="movie__rate">
                                        <div class="score"></div>
                                        <span class="movie__rating">5.0</span>
                                    </div>               
                                </div>
                            </div>
                         <!-- Movie variant with time -->

                         <!-- Movie variant with time -->
                            <div class="movie movie--test movie--test--dark movie--test--left">
                                <div class="movie__images">
                                    <a href="movie-page-left.html" class="movie-beta__link">
                                    <img alt='' src="http://placehold.it/424x424">
                                    </a>
                                </div>

                                <div class="movie__info">
                                    <a href='movie-page-left.html' class="movie__title">World War Z (2013)  </a>

                                    <p class="movie__time">116 min</p>

                                    <p class="movie__option"><a href="#">Action</a> | <a href="#">Adventure</a> | <a href="#">Horror</a></p>
                                    
                                    <div class="movie__rate">
                                        <div class="score"></div>
                                        <span class="movie__rating">4.1</span>
                                    </div>               
                                </div>
                            </div>
                         <!-- Movie variant with time -->

                         <!-- Movie variant with time -->
                            <div class="movie movie--test movie--test--light movie--test--left">
                                <div class="movie__images">
                                    <a href="movie-page-left.html" class="movie-beta__link">
                                    <img alt='' src="http://placehold.it/424x424">
                                    </a>
                                </div>

                                <div class="movie__info">
                                    <a href='movie-page-left.html' class="movie__title">Prisoners (2013) </a>

                                    <p class="movie__time">153 min</p>

                                    <p class="movie__option"><a href="#">Crime</a> | <a href="#">Thriller</a> | <a href="#">Drama</a></p>
                                    
                                    <div class="movie__rate">
                                        <div class="score"></div>
                                        <span class="movie__rating">5.0</span>
                                    </div>               
                                </div>
                            </div>
                         <!-- Movie variant with time -->

                         <!-- Movie variant with time -->
                            <div class="movie movie--test movie--test--light movie--test--right">
                                <div class="movie__images">
                                    <a href="movie-page-left.html" class="movie-beta__link">
                                    <img alt='' src="http://placehold.it/424x424">
                                    </a>
                                </div>

                                <div class="movie__info">
                                    <a href='movie-page-left.html' class="movie__title">This Is the End (2013)   </a>

                                    <p class="movie__time">107 min</p>

                                    <p class="movie__option"><a href="#">Comedy</a> | <a href="#">Fantasy</a></p>
                                    
                                    <div class="movie__rate">
                                        <div class="score"></div>
                                        <span class="movie__rating">4.9</span>
                                    </div>               
                                </div>
                            </div>
                         <!-- Movie variant with time -->

                         <!-- Movie variant with time -->
                            <div class="movie movie--test movie--test--dark movie--test--right">
                                <div class="movie__images">
                                    <a href="movie-page-left.html" class="movie-beta__link">
                                    <img alt='' src="http://placehold.it/424x424">
                                    </a>
                                </div>

                                <div class="movie__info">
                                    <a href='movie-page-left.html' class="movie__title">The Internship (2013)  </a>

                                    <p class="movie__time">112 min</p>

                                    <p class="movie__option"><a href="#">Comedy</a></p>
                                    
                                    <div class="movie__rate">
                                        <div class="score"></div>
                                        <span class="movie__rating">5.0</span>
                                    </div>               
                                </div>
                            </div>
                         <!-- Movie variant with time -->
                    </div>
                </div>
            </div>         
        </section>
<!-- Main Content End -->
<script type="text/javascript">
	$(document).ready(function() {
		init_Home();
	});
</script>