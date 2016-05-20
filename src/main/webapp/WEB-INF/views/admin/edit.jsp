<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> <!-- 부트스트랩 홈페이지에서 CDN으로 가져온다. -->

<!-- edit content -->
<article class="container" style="margin-top: 30px">
		<div class="editTop">
			<h1>　</h1>
			<h2 class="text-center"> ${movie.title} INFORMATION</h2>
		</div>
		
		<form class="form-horizontal" id="edit" style="margin-top: 30px">
			<div class="form-group">
	        	<label class="col-sm-3 control-label" for="title">TITLE</label>
		        <div class="col-sm-6">
		        	<input type="text" value="${movie.title}"  class="form-control" readonly="readonly"/> 
		        </div>
	        </div>
	        <div class="form-group">
	        	<label class="col-sm-3 control-label" for="rating">RATING</label>
		        <div class="col-sm-6">
		        	<input type="text" value="${movie.rating}"  class="form-control" readonly="readonly"/> 
		        </div>
	        </div>
	        <div class="form-group">
	        	<label class="col-sm-3 control-label" for="genre">GERNE</label>
		        <div class="col-sm-6">
		        	<input type="text" value="${movie.genre}"  class="form-control" readonly="readonly"/> 
		        </div>
	        </div>
	        <div class="form-group">
	        	<label class="col-sm-3 control-label" for="openDate">RELEASE DATE</label>
		        <div class="col-sm-6">
		        	<input type="text" value="${movie.openDate}"  class="form-control" readonly="readonly"/> 
		        </div>
	        </div>
	        <div class="form-group">
	        	<label class="col-sm-3 control-label" for="grade">AGE</label>
		        <div class="col-sm-6">
		        	<input type="text" value="${movie.grade}"  class="form-control" readonly="readonly"/> 
		        </div>
	        </div>
	        <div class="form-group">
	        	<label class="col-sm-3 control-label" for="runningtime">RUNNNIG TIME</label>
		        <div class="col-sm-6">
		        	<input type="text" value="${movie.runningtime}"  class="form-control" readonly="readonly"/> 
		        </div>
	        </div>
	        <div class="form-group">
	        	<label class="col-sm-3 control-label" for="director">DIRECTOR</label>
		        <div class="col-sm-6">
		        	<input type="text" value="${movie.director}"  class="form-control" readonly="readonly"/> 
		        </div>
	        </div>
	        <div class="form-group">
	        	<label class="col-sm-3 control-label" for="actor">MAIN ACTOR</label>
		        <div class="col-sm-6">
		        	<input type="text" value="${movie.actor}"  class="form-control" readonly="readonly"/> 
		        </div>
	        </div>
	        <div class="form-group">
	        	<label class="col-sm-3 control-label" for="content">SUMMARY</label>
		        <div class="col-sm-6" >
		        	<input type="text" value="${movie.content}"  class="form-control" readonly="readonly"/> 
		        </div>
	        </div>
	        <div class="form-group">
	        	<label class="col-sm-3 control-label" for="image">POSTER</label>
		        <div class="col-sm-6">
		        	<img src="${context}/resources/rainbow/images/main/${movie.image}" alt="" style="width:200px;height:230px"/>
		        </div>
	        </div>
			
			<div class="form-group">
	        	<div class="col-sm-12 text-center">
	            	<button class="btn btn-primary" id="updateBtn" name="updateBtn">UPDATE<i class="fa fa-check spaceLeft"></i></button>
	            	<button class="btn btn-warning" id="cancelBtn" name="cancelBtn">CANCEL<i class="fa fa-times spaceLeft"></i></button>
	            	<button class="btn btn-warning" id="deleteBtn" name="deleteBtn">DELETE<i class="fa fa-times spaceLeft"></i></button>
	        	</div>
	        </div>
		</form>
</article>
<!-- edit content End -->
 

<script type="text/javascript">
	$(function() {
			$('#updateBtn').click(function(e) { 
			e.preventDefault();
			location.href = "${context}/admin/update"
		});
			
		$('#cancelBtn').click(function(e) {
			e.preventDefault();
			location.href = "${context}/admin/content";
		});
		
		$('#deleteBtn').click(function(e) {
			e.preventDefault();
			location.href = '${context}/admin/delete?movieSeq=${movie.movieSeq}';
			alert('영화삭제 버튼 클릭 !!')    
		});
	});
	 
</script>
