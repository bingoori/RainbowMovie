<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Slider -->
<div class="bannercontainer">
	<div class="banner">
		<ul>
			<c:forEach var="list" items="${mainList}">
				<li data-transition="fade" data-slotamount="7" class="slide" data-slide='${list.title}'>
					<img alt='' src="${context}/resources/rainbow/images/main/${list.image}">
				</li>
			</c:forEach> 
		</ul>
	</div>
</div>
<!--end slider -->

<!-- Main content -->
        <section class="container">
            <div class="movie-best">
                 <div class="col-sm-10 col-sm-offset-1 movie-best__rating">Today Best choice</div>
                 <div class="col-sm-12 change--col">
	                 <c:forEach var="list" items="${bestList}">
	                     <div class="movie-beta__item ">
	                        <img alt='' src="${context}/resources/rainbow/images/main/${list.image}" width="380" height="200">
	                         <!-- <span class="best-rate">5.0</span> -->
	
	                         <ul class="movie-beta__info">
	                             <li><span class="best-voted">감독 : ${list.director}</span></li>
	                             <li>
	                                <p class="movie__time">${list.runningtime}</p>
	                                <p>장르 : ${list.genre}</p>
	                                <p>주인공 : ${list.actor}</p>
	                             </li>
	                             <li class="last-block">
	                                 <%-- <a href="${context}/movie/movie_detail/${list.movieSeq}" class="slide__link moreBtn_detail">more</a> --%>
	                                 <a href="/movie/movie_detail/${list.movieSeq}" class="slide__link moreBtn_detail">more</a>
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
                    	<c:forEach var="list" items="${movieList}">
                        <!-- Movie variant with time -->
                            <div class="movie movie--test movie--test--dark movie--test--left">
                                <div class="movie__images">
                                    <%-- <a href="${context}/movie/movie_detail/${list.movieSeq}" class="movie-beta__link beta_imgDetail"> --%>
                                    <a href="/movie/movie_detail/${list.movieSeq}" class="movie-beta__link beta_imgDetail">
                                        <!-- <img alt='' src="http://placehold.it/424x424"> -->
                                        <img alt='' src="${context}/resources/rainbow/images/main/${list.image}" width="424" height="205">
                                    </a>
                                </div>

                                <div class="movie__info">
                                    <%-- <a href='${context}/movie/movie_detail/${list.movieSeq}' class="movie__title title_textDetail">${list.title}</a> --%>
                                    <a href="/movie/movie_detail/${list.movieSeq}" class="movie__title title_textDetail">${list.title}</a>

                                    <p class="movie__time">${list.runningtime}</p>

                                    <p class="movie__option">장르 : ${list.genre}</p>
                                    
                                    <p class="movie__option">감독 : ${list.director}</p>
                                    
                                    <div class="movie__rate">
                                        <div class="score"></div>
                                        <span class="movie__rating">${list.rating}</span>
                                    </div>               
                                </div>
                            </div>
                         <!-- Movie variant with time -->
                         </c:forEach>
                    </div>
                </div>
            </div>         
        </section>
<!-- Main Content End -->
<script type="text/javascript">
	$(document).ready(function() {
		var context = $.fn.global('${context}').getContext();
		init_Home(context);
	}); 	
</script>