<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>

<style>
	#content{border : 1px solid black}
	#content th {border : 1px solid black; text-align : center}
	#content tr td{border : 1px solid black; text-align : center}
	#content tr {border : 1px solid black}
</style>
<form id = "replyContentForm" class="form-horizontal" style="margin-top: 30px" enctype="multipart/form-data" class="table table-striped">
<input type="checkbox" name="vehicle1" value="Bike">I have a bike
<br>
<input type="checkbox" name="vehicle2" value="Car">I have a car 
<br><br>
<input type="submit">
<table id="content" style="width: 100%; margin-top: 30px">
	<tr style="background-color: gray;">
		<th style="width: 5%;">DELETE BUTTON</th>
		<th style="width: 5%;">replySeq</th>
		<th style="width: 6%;">writerName</th>
		<th style="width: 4%;">regTime</th>
		<th style="width: 5%;">movieSeq</th>
		<th style="width: 35%;">replyContent</th>
	</tr>
	<c:forEach items="${list}" var="reply" >
		<tr>
			<td>
			
			<%-- <input type="checkbox" name="replySeq" value="${reply.replySeq}"/> --%></td>
			<td>${reply.replySeq}</td>
			<td>${reply.writerName}</td>
			<td>${reply.regTime}</td>
			<td>${reply.movieSeq}</td>
			<td>${reply.replyContent}</td>
		</tr>
	</c:forEach>
</table>
	<div class="col-sm-12 text-center">
       	<div class="col-sm-12 text-center">
           	<button  type="submit" class="btn btn-primary" id="replyDeleteBtn">DELETE</button>
        </div>
	</div>
</form>
<script type="text/javascript">
	$(function() {
		 $('#replyDeleteBtn').click(function(e) {
			e.preventDefault();
			alert('영화삭제 버튼 클릭 !!')    
			$('#replyContentForm').attr('action','${context}/admin/Delete').attr('method' , 'post').submit();
			
		}); 
	    /* $('#replyDeleteBtn').click(function(e) {
			e.preventDefault();
			location.href = '${context}/admin/replyDelete?replySeq=${reply.replySeq}';
			alert('영화삭제 버튼 클릭 !!')    
		});   */
	});
</script>
