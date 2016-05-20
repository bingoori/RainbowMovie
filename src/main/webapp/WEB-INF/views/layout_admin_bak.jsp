<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!-- tiles 프레임워크를 이용하여 구현한 페이지로 관리자와 관련된 모든 내용은 이 layout_admin.jsp를 거치게 된다. -->
<!-- 이 페이지의 div -> id = content인 곳에 원하는 화면을 .html로 띄워서 마치 한 페이지 안에서 모든 것이 돌아가게끔 보이게 만드는게 주 목적이다. -->
<!doctype html>
<html lang="en">
<head>
<!-- Basic Page Needs -->
<meta charset="UTF-8" />
<title>RainbowMovie</title>
<meta name="description" content="A Template by Gozha.net">
<meta name="keywords" content="HTML, CSS, JavaScript">
<meta name="author" content="Gozha.net">

<!-- Mobile Specific Metas-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="telephone=no" name="format-detection">

<!-- Fonts -->
<!-- Font awesome - icon font -->
<link 
	href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet">
<!-- Roboto -->
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,700'
	rel='stylesheet' type='text/css'>
<!-- Open Sans -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans:800italic'
	rel='stylesheet' type='text/css'>

<!-- 부트스트랩 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 부트스트랩 홈페이지에서 CDN으로 가져온다. -->

<!-- Stylesheets -->
<!-- jQuery UI -->
<link
	href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css"
	rel="stylesheet">
<!-- Mobile menu -->
<link href="${context}/resources/rainbow/css/gozha-nav.css"
	rel="stylesheet" />
<!-- Select -->
<link
	href="${context}/resources/rainbow/css/external/jquery.selectbox.css"
	rel="stylesheet" />
<!-- Swiper slider -->
<link
	href="${context}/resources/rainbow/css/external/idangerous.swiper.css"
	rel="stylesheet" />
<!-- REVOLUTION BANNER CSS SETTINGS -->
<link rel="stylesheet" type="text/css"
	href="${context}/resources/rainbow/rs-plugin/css/settings.css"
	media="screen" />
<!-- Custom -->
<link href="${context}/resources/rainbow/css/style.css?v=1"
	rel="stylesheet" />
<!-- Modernizr -->
<script
	src="${context}/resources/rainbow/js/external/modernizr.custom.js"></script>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
</head>

<body>
	<div id="header">
		<!-- tilse.xml에 설정된 헤더페이지가 들어가게 된다. -->
		<tiles:insertAttribute name="header" />
	</div>

	<div id="content">
		<!-- 이 부분에는 tilse.xml에서 설정한 URL형태로 호출되는 페이지가 띄워지게 된다! tiles.xml과 연결됨! -->
		<tiles:insertAttribute name="content" />
	</div>

	<div id="footer">
		<!-- tilse.xml에 설정된 푸터페이지가 들어가게 된다. -->
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>
<script type="text/javascript">
	$(function() {
		readURL = function(input){
			if(input.files&& input.files[0]){
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#uploadedImg').attr('src',e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		};
		var user = '${sessionScope.user.id}';
		var logout_header = '<li><span class="sub-nav-toggle plus"></span>\
			<a href="${context}/admin/input_form" id="addVod" >ADD VOD</a>\
			</li>\
			<li><span class="sub-nav-toggle plus"></span>\
			<a href="#" id="addMovie">ADD MOVIE</a>\
			</li>\
			<li><span class="sub-nav-toggle plus"></span>\
			<a href="${context}/admin/content" id="movie">MOVIE</a>\
			</li>\
			<li>\
			<span class="sub-nav-toggle plus"></span>\
			<a href="${context}/member/logout" id="logout">LOGOUT</a>\
			</li>';
		$('#navigation').html(logout_header);

		$('#addVod').click(function(e) {
			e.preventDefault();
			alert("addVod!");
		});
		$('#addMovie').click(function(e) {
							e.preventDefault();
							alert("addMovie!");
							var addMovieForm = '<article class="container" style="margin-top: 30px">'
									+ '<div class="editTop"><h2 class="text-center"> THE MOIVE ADD PAGE</h2>'
									+ '</div>'
							        +'<form class="form-horizontal"  id="form" style="margin-top: 30px" enctype="multipart/form-data" action="/admin/input" method="post">'
									+ '<div class="form-group">'
									+ '<label class="col-sm-3 control-label" for="title">TITLE</label>'
									+ '<div class="col-sm-6">'
									+ '<input type="text" id="title" name="title"class="form-control" />'
									+ '</div>'
									+ '</div>'
									+ '<div class="form-group">'
									+ '<label class="col-sm-3 control-label" for="rating">RATING</label>'
									+ '<div class="col-sm-6">'
									+ '<input type="text" id="rating" name="rating" class="form-control"/>'
									+ '</div>'
									+ '</div>'
									+ '<div class="form-group">'
									+ '<label class="col-sm-3 control-label" for="genre">GENRE</label>'
									+ '<div class="col-sm-6">'
									+ '<input type="text"  id="genre" name="genre" class="form-control" /></div>'
									+ '</div>'
									+ '<div class="form-group">'
									+ '<label class="col-sm-3 control-label" for="openDate">RELEASE DATE</label>'
									+ '<div class="col-sm-6">'
									+ '<input type="text"  id="openDate" name="openDate" class="form-control" /></div>'
									+ '</div><div class="form-group"><label class="col-sm-3 control-label" for="grade">AGE</label>'
									+ '<div class="col-sm-6">'
									+ '<input type="text"  id="grade" name="grade" class="form-control" />'
									+ '</div>'
									+ '</div>'
									+ '<div class="form-group">'
									+ '<label class="col-sm-3 control-label" for="runningtime">RUNNING TIME</label>'
									+ '<div class="col-sm-6"><input type="text" id="runningtime" name="runningtime" class="form-control" /></div>'
									+ '</div>'
									+ '<div class="form-group">'
									+ '<label class="col-sm-3 control-label" for="director">DIRECTOR</label>'
									+ '<div class="col-sm-6"><input type="text"  id="director" name="director"  class="form-control" /></div>'
									+ '</div>'
									+ '<div class="form-group">'
									+ '<label class="col-sm-3 control-label" for="actor">ACTOR</label>'
									+ '<div class="col-sm-6"><input type="text" id="actor" name="actor"  class="form-control" /></div>'
									+ '</div>'
									+ '<div class="form-group">'
									+ '<label class="col-sm-3 control-label" for="content">SUMMARY</label>'
									+ '<div class="col-sm-6"><textarea class="form-control" rows="3"  id="content" name="content" ></textarea></div>'
									+ '</div>'
									+ '<div class="form-group">'
									+ '<label for="input_id" class="col-sm-4 control-label" for="Image">POSTER</label>'
									+ '<div class="col-sm-2">'
									+ '<img src="${context}/resources/rainbow/images/main" alt="" id="uploadedImg" style="width:180px;height:230px"/>'
									+ '</div>'
									+ '<div class="col-sm-2">'
									+ '<input type="file" onchange="readURL(this);"  id="image" name="image" />'
									+ '</div>'
									+ '</div>'
									+ '<div class="form-group">'
									+ '<div class="col-sm-12 text-center">'
									+ '<button class="btn btn-primary" id="inputBtn" name="inputBtn">ADD<i class="fa fa-check spaceLeft"></i></button>'
									+ '<button class="btn btn-danger" id="cancelBtn" name="cancelBtn">CANCEL<i class="fa fa-times spaceLeft"></i></button>'
									+ '</div>' + '</div>' + '</form>'
									+ '</article>';
							$('#content').empty();
							$('#content').html(addMovieForm);
							$('#inputBtn').click(function(e) {
								e.preventDefault();
								alert('영화등록 버튼클릭');
							      var $form = $('#form')[0];
						          var formData = new FormData(form);
						        $.ajax({
						               url: '${context}/admin/input',
						               mimeType: 'multipart/form-data',
						               contentType: false, 
						               processData : false,
						               data: formData,
						               type: 'POST',
						               success : function(result) {
						                    alert('영화 등록 완료 되었습니다 .');
						                     location.href = '${context}/admin/content'; 
						               },
						               error : function(xhr, status, msg) {
						                  alert('에러발생상태 :' + status + ',내용 : ' + msg);
						               }

						            });
							});
							$('#cancelBtn').click(function(e) {
								e.preventDefault();
								alert("취소버튼 클릭");
								location.href = '${context}/admin/content'; 
							});
							});
		$('#movie').click(function(e) {
			e.preventDefault();
			alert("movie!");
			location.href = '${context}/admin/content'; 
		});
		$('#logout').click(function(e) {
			e.preventDefault();
			location.href = '${context}/admin/logout';
		});
	});
</script>
