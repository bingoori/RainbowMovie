<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section id="wrapper" class="container"  style="margin-top:50px">
	<div class="col-sm-12">
    	<div class="order-container">
			<div class="order">
				<img class="order__images" alt='' src="${context}/resources/rainbow/images/tickets.png">
				<p class="order__title">Movie History<br></p>
			</div>
		</div>
    	<c:choose>
	    	<c:when test="${page.countById == 0}">
	    		<div class="movie movie--preview movie--full release">
	     			<div class="col-sm-4 col-md-3 col-lg-3">
	                    <h4 class="movie__title"><b>예매내역이 없습니다</b></h4>
					</div>
	    		</div>	
			</c:when>
			<c:otherwise>
		    	<c:forEach var="list" items="${purchaseList}">
		    		<div class="ticket">
			            <div class="ticket-position">
			               <div class="ticket__indecator indecator--pre"><div class="indecator-text pre--text">online ticket</div></div>
			               <div class="ticket__inner">
			                  <div class="ticket-secondary">
			                     <span class="ticket__item">Ticket number <strong class="ticket__number">A126BYM4</strong></span>
			                     <span class="ticket__item ticket__date">${list.date}</span>
			                     <span class="ticket__item ticket__time">${list.beginTime}</span>
			                     <span class="ticket__item">Cinema: <span class="ticket__cinema">Rainbow</span></span>
			                     <span class="ticket__item">Screen: <span class="ticket__hall">${list.screenNumber}</span></span>
			                     <span class="ticket__item ticket__price">price: <strong class="ticket__cost">${list.purchasePrice}원</strong></span>
			                  </div>
			                  <div class="ticket-primery">
			                     <span class="ticket__item ticket__item--primery ticket__film">Film<br>
			                     	<strong class="ticket__movie">${list.movieTitle}</strong>
			                     </span>
			                     <span class="ticket__item ticket__item--primery">Sits: <span class="ticket__place">${list.reserveSeat}</span></span>
			                  </div>
			               </div>
			               <div class="ticket__indecator indecator--post"><div class="indecator-text post--text">online ticket</div></div>
			            </div>
			         </div>
				</c:forEach>
				
				<div class="booking-pagination booking-pagination--margin">
					<c:if test="${page.start - page.end >= 0}">
						<a href="${context}/purchase/purchase_list/${page.start - page.end}" class="booking-pagination__prev" id="pagePrev">
							<span class="arrow__text arrow--prev">prev</span>
							<span class="arrow__info">이전 페이지</span>
						</a>
					</c:if>
					<c:if test="${page.start + page.end < page.countById}">
						<a href="${context}/purchase/purchase_list/${page.start + page.end}" class="booking-pagination__next" id="pageNext">
							<span class="arrow__text arrow--next">next</span>
							<span class="arrow__info">다음 페이지</span>
						</a>
					</c:if>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</section>