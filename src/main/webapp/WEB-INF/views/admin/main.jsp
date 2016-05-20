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
				<img alt='' src="${context}/resources/rainbow/images/main/Thor2.jpg">
			</li>
			<li data-transition="fade" data-slotamount="7" class="slide fading-slide" data-slide='Matrix4'>
				<img alt='' src="${context}/resources/rainbow/images/main/Matrix4.jpg">
			</li>
			<li data-transition="fade" data-slotamount="7" class="slide fading-slide" data-slide='Captain America2'>
				<img alt='' src="${context}/resources/rainbow/images/main/CaptainAmerica2.jpg">
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
           
        </section>
<!-- Main Content End -->
<script type="text/javascript">
	$(document).ready(function() {
		init_Home();
	});
</script>