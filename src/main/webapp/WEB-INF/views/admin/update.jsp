<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> <!-- 부트스트랩 홈페이지에서 CDN으로 가져온다. -->

<!-- edit content -->
<article class="container" style="margin-top: 30px">
		<div class="editTop">
			<h2>　</h2>
			<h2 class="text-center"> ${movie.title} UPADATE</h2>
		</div>
		
		<!-- enctype="multipart/form-data" -->
		<form class="form-horizontal" id="update" style="margin-top: 30px" enctype="multipart/form-data">
			<div class="form-group">
	        	<label class="col-sm-3 control-label" for="title">TITLE</label>
		        <div class="col-sm-6">
		        	<input type="text" value="${movie.title}"  id="title" name="title"class="form-control" /> 
		        </div>
	        </div>
	        <div class="form-group">
	        	<label class="col-sm-3 control-label" for="rating">RATING</label>
		        <div class="col-sm-6">
		        	<input type="text" value="${movie.rating}" id="rating" name="rating" class="form-control"/> 
		        </div>
	        </div>
	        <div class="form-group">
	        	<label class="col-sm-3 control-label" for="genre">GENRE</label>
		        <div class="col-sm-6">
		        	<input type="text" value="${movie.genre}" id="genre" name="genre" class="form-control" /> 
		        </div>
	        </div>
	        <div class="form-group">
	        	<label class="col-sm-3 control-label" for="openDate">RELEASE DATE</label>
		        <div class="col-sm-6">
		        	<input type="text" value="${movie.openDate}" id="openDate" name="openDate" class="form-control" /> 
		        </div>
	        </div>
	        <div class="form-group">
	        	<label class="col-sm-3 control-label" for="grade">AGE</label>
		        <div class="col-sm-6">
		        	<input type="text" value="${movie.grade}" id="grade" name="grade" class="form-control" /> 
		        </div>
	        </div>
	        <div class="form-group">
	        	<label class="col-sm-3 control-label" for="runningtime">RUNNING TIME</label>
		        <div class="col-sm-6">
		        	<input type="text" value="${movie.runningtime}" id="runningtime" name="runningtime" class="form-control" /> 
		        </div>
	        </div>
	        <div class="form-group">
	        	<label class="col-sm-3 control-label" for="director">DIRECTOR</label>
		        <div class="col-sm-6">
		        	<input type="text" value="${movie.director}" id="director" name="director"  class="form-control" /> 
		        </div>
	        </div>
	        <div class="form-group">
	        	<label class="col-sm-3 control-label" for="actor">MAIN ACTOR</label>
		        <div class="col-sm-6">
		        	<input type="text" id="actor" name="actor" value="${movie.actor}"  class="form-control" /> 
		        </div>
	        </div>
	        <div class="form-group">
	        	<label class="col-sm-3 control-label" for="content">SUMMARY</label>
		        <div class="col-sm-6">
		        	<textarea class="form-control" rows="3"  id="content" name="content" >
		        	${movie.content}
		        	</textarea>
		        </div>
	        </div>
	        <div class="form-group">
			 	<label for="input_id" class="col-sm-4 control-label" for="Image">POSTER</label>
			 	<div class="col-sm-2">
					<img src="${context}/resources/rainbow/images/main/${movie.image}" alt="" style="width:180px;height:230px"/>
				</div>
			 	<div class="col-sm-2">
					<input type="file" id="image" name="image" />
				</div> 
			</div>
			
		
      			<div class="form-group">
	        	<div class="col-sm-12 text-center">
	            	<button class="btn btn-success" id="updateOkBtn" name="updateOkBtn">UPADATE<i class="fa fa-check spaceLeft"></i></button>
	            	<button class="btn btn-warning" id="cancelBtn" name="cancelBtn">CANCEL<i class="fa fa-times spaceLeft"></i></button>
	           	</div>
	        </div>
		</form>
</article>
<script type="text/javascript">
	$(function() {
	/* 	$form.addClass('form-horizontal').attr('method','post')
		.attr('action','${context}/member/update.do'); */
		$('#updateOkBtn').click(function(e) { 
			e.preventDefault();
			$('#update').attr('action',"${context}/admin/update").attr('method','post').submit();
			alert('영화 업데이트가 완료되었습니다.')
		});
		$('#cancelBtn').click(function(e) {
			e.preventDefault();
			location.href = "${context}/admin/content";
			alert('영화 업데이트가 실패되었습니다. 다시 시도해주세요.')
		});
	});
</script>