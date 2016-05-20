<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Search bar -->
        <div class="search-wrapper" style="margin-top: 55px; padding-top: 17px;">
            <div class="container container--add">
                <form class="search" id='search_form' name="search_form">
                    <input type="text" class="search__field" id="keyWord" name="keyWord" placeholder="Search">
                    <select class="search__sort" id="keyField" name="keyField" tabindex="0">
                        <option value="title" selected='selected'>By title</option>
                        <option value="director">By director</option>
                    </select>
                    <button class="btn btn-md btn--danger search__button" id="searchBtn" name="searchBtn">search a movie</button>
                </form>
            </div>
        </div>
<!-- Search bar End -->    
    
        <!-- Main content -->
        <section id="wrapper" class="container">
            <div class="col-sm-12">
                <h2 class="page-heading">Movies</h2>
                
                 <div class="tags-area">
                    <div class="tags tags--unmarked">
                        <span class="tags__label">상영 영화 목록 리스트 : </span>
                            <ul>
                                <li class="item-wrap"><a href="#" class="tags__item item-active" data-filter='all'>평점순</a></li>
                                <li class="item-wrap"><a href="#" class="tags__item" data-filter='release'>개봉일순</a></li>
                            </ul>
                    </div>
                </div>
                
                <c:forEach var="list" items="${movieList}"> <!-- 컨트롤러에서 보내온 list를 member에 담는다 -->
                   <!-- Movie preview item -->
                   <div class="movie movie--preview movie--full release">
                        <div class="col-sm-4 col-md-3 col-lg-3">
                            <div class="movie__images">
                               <img alt='' src="${context}/resources/rainbow/images/main/${list.image}" height="283">
                            </div>
                       </div>
   
                       <div class="col-sm-8 col-md-9 col-lg-9 movie__about">
                            <a href="${context}/movie/movie_detail/${list.movieSeq}" class="movie__title link--huge">${list.title}</a>

                            <p class="movie__time">${list.runningtime}</p>

                            <p class="movie__option"><strong>장르: </strong>${list.genre}</p>
                            <p class="movie__option"><strong>개봉일: </strong>${list.openDate}</p>                            
                            <p class="movie__option"><strong>감독: </strong>${list.director}</p>
                            <p class="movie__option"><strong>배우: </strong>${list.actor}</p>
                            <p class="movie__option"><strong>등급: </strong>${list.grade}</p>

                            <div class="movie__btns">
                            	<button id="bookBtn2" class="btn btn-md btn--warning">book a ticket <span class="hidden-sm">for this movie</span></button>
                                <!-- <a href="#" class="btn btn-md btn--warning" id="bookBtn">book a ticket <span class="hidden-sm">for this movie</span></a> -->
                                <a href="#" class="watchlist">Add to watchlist</a>
                            </div>
                            
                            <div class="preview-footer">
                                  <div class="movie__rate">
                                  <div class="score" style="margin-left: -15px;"></div>
                                  <span class="movie__rating">${list.rating}</span></div>                          
                                  
                              </div>
                       </div>
   
                       <div class="clearfix"></div>
                   </div>
                   <!-- end movie preview item -->
                </c:forEach>
				
				<div class="booking-pagination booking-pagination--margin">
					<c:if test="${page.start - page.end >= 0}">
						<a href="${context}/movie/movie_list?startRow=${page.start - page.end}&keyField=${page.keyField}&keyWord=${page.keyWord}" class="booking-pagination__prev" id="pagePrev">
							<span class="arrow__text arrow--prev">prev</span>
							<span class="arrow__info">이전 페이지</span>
						</a>
					</c:if>
					<c:if test="${page.start + page.end < page.totalMovie}">
						<a href="${context}/movie/movie_list?startRow=${page.start + page.end}&keyField=${page.keyField}&keyWord=${page.keyWord}" class="booking-pagination__next" id="pageNext">
							<span class="arrow__text arrow--next">next</span>
							<span class="arrow__info">다음 페이지</span>
						</a>
					</c:if>
					<input type="hidden" id="total" name="total" value="${page.totalMovie}" />
				</div>
            </div>
        </section>
	<!-- Main Content End -->
	
<script type="text/javascript">
$(function() {
	var context = $.fn.global('${context}').getContext();
	init_MovieList(context);
	
	var id = $('#sessionVar').val();
	$('#bookBtn2').click(function(e) {
		e.preventDefault();
		if (id.length != 0) { // 회원일 경우 로그인 창 안띄워지게 하기!
			$('.overlay').removeClass('open').addClass('close');
		} else { // 비회원일 경우 로그인창 띄우기
			$('.overlay').removeClass('close').addClass('open');
		}
	});
	
	var keyField = $('select[id=keyField] option:selected').val();
	var keyWord = $('#keyWord').val();
	$('#searchBtn').click(function(e) {
		e.preventDefault();
		$('#search_form').attr('action',"${context}/movie/search").attr('method',"post").submit();
	});
});
</script>
