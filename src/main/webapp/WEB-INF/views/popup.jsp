<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
   <div>
      <img alt="" width="4%" height="4%" align="right" src="${context}/resources/img/closeBtn.png" class="popupClose closeBtn cursor">
   </div>
   <div align="center" >
      <h3>우성두의 포트폴리오</h3>
      
      <iframe width="80%" height="350" src="https://www.youtube.com/embed/f7INaPABeao?rel=0&autoplay=1" frameborder="0" allowfullscreen></iframe>
      <p>테스트용 Id : rainbow pw :1 </p>
      <p>관리자용 Id : admin pw :1 </p>
      <p><a id="mobileURL" href="#">모바일 앱 용 웹페이지 URL</a></p>     
   <p>
     <button id="ppt" type="button" class="btn btn-primary" style="width: 150px">프로젝트 PPT보기</button>
   </p>
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
      location.href = "http://ec2-52-79-161-93.ap-northeast-2.compute.amazonaws.com/mobile";
   });
</script>