<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
   <div>
      <img alt="" width="4%" height="4%" align="right" src="${context}/resources/img/closeBtn.png" class="popupClose closeBtn cursor">
   </div>
   <div  >
      <br />
       <div style="font-size: 250%;text-align: center;">우성두의 포트폴리오</div> 
       <div style="font-size: 120%;text-align: center;color: red">Email : sdwoo90@gmail.com</div>
       <div align="center">
      <iframe style="text-align: center;" width="80%" height="350" src="https://www.youtube.com/embed/f7INaPABeao?rel=0&autoplay=1" frameborder="0" allowfullscreen></iframe>
      <div >테스트용 Id : rainbow pw :1 </div>
      <div  >관리자용 Id : admin pw :1 </div>
      <div ><a id="mobileURL" href="#">모바일 앱 용 웹페이지 URL</a></div>     
   <p>
     <button  id="ppt" type="button" class="btn btn-primary" style="width: 150px">프로젝트 PPT보기</button>
   </p>
   </div>
   </div>
</div>
<script>
 
   
   $('.popupClose').click(function(e) {
      e.preventDefault();
      $.magnificPopup.close();
   });
   
   $('#ppt').click(function(e) {
      e.preventDefault();
      location.href = "http://www.slideshare.net/bingoori/rainbow-project-web-app";
   });
   
   $('#mobileURL').click(function(e) {
      e.preventDefault();
      location.href = "http://bingoori.net/mobile";
   });
</script>