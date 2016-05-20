<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row"><br/>\
<img class="col-xs-12" style="padding-left: 30%; padding-right: 30%; " src="'+context+'/resources/vod_image/advertising/ad.png">\
</div>\
<hr />\
<div class="row" >\
<div class="col-xs-12 well" style="background: white;">\
<p><img class="col-xs-12" src="'+context+'/resources/'+data.vodInfo.vodImage+'"></p><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>\
<hr />\ 
					<div id="demo">\
					<button id = "buyBtn" style="margin: auto;width: 99%"  class=" btn btn-lg btn-block purple-bg">구매하기</button>\
					 </div>\
				      <hr />\
</div>\
</div>\
					 <div>\
				      <p style="text-align: center; font-size:26px;">상세정보</p>\
				      <hr />\
			        <p style="text-align: left;">영화 제목 : '+data.vodInfo.vodName+'</p>\
		               <p style="text-align: left;">영화 장르 : '+data.vodInfo.vodCategory+'&nbsp;'+data.vodInfo.vodTime+' 분</p>\
		               <p style="text-align: left;">이용가 : '+data.vodInfo.vodFree+'</p>\
		               <p style="text-align: left;">감독/연출 : '+data.vodInfo.vodDirector+'</p>\
		               <p style="text-align: left; ">배우/출연 : '+data.vodInfo.vodActor+'</p>\
					</div>\
					<div>\
					<h4>줄거리</h4>\
					<text >\
					</text >\
					</div>\
					<p style="text-align: left;"> '+data.vodInfo.vodGrade+'</p></div>';
</body>
</html>