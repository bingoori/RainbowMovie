
//관리자
var admin = {
   adminForm : function(context) {
      $('body').empty();
           var addMovieForm = '<article class="container" style="margin-top: 30px">'
               +'<div class="editTop"><h2 class="text-center"> THE MOIVE ADD PAGE</h2>'
               +'</div>'
               +'<form class="form-horizontal" id="input" style="margin-top: 30px" enctype="multipart/form-data">'
               +'<div class="form-group">'
                    +'<label class="col-sm-3 control-label" for="title">TITLE</label>'
                    +'<div class="col-sm-6">'
                       +'<input type="text" id="title" name="title"class="form-control" />'
                    +'</div>'
                 +'</div>'
                 +'<div class="form-group">'
                    +'<label class="col-sm-3 control-label" for="rating">RATING</label>'
                    +'<div class="col-sm-6">'
                       +'<input type="text" id="rating" name="rating" class="form-control"/>'
                    +'</div>'
                 +'</div>'
                 +'<div class="form-group">'
                    +'<label class="col-sm-3 control-label" for="genre">GENRE</label>'
                    +'<div class="col-sm-6">'
                       +'<input type="text"  id="genre" name="genre" class="form-control" /></div>'
                   +'</div>'
                   +'<div class="form-group">'
                    +'<label class="col-sm-3 control-label" for="openDate">RELEASE DATE</label>'
                    +'<div class="col-sm-6">'
                       +'<input type="text"  id="openDate" name="openDate" class="form-control" /></div>'
                 +'</div><div class="form-group"><label class="col-sm-3 control-label" for="grade">AGE</label>'
                   +'<div class="col-sm-6">'
                       +'<input type="text"  id="grade" name="grade" class="form-control" />'
                    +'</div>'
                 +'</div>'
                 +'<div class="form-group">'
                    +'<label class="col-sm-3 control-label" for="runningtime">RUNNING TIME</label>'
                    +'<div class="col-sm-6"><input type="text" id="runningtime" name="runningtime" class="form-control" /></div>'
                 +'</div>'
                 +'<div class="form-group">'
                    +'<label class="col-sm-3 control-label" for="director">DIRECTOR</label>'
                    +'<div class="col-sm-6"><input type="text"  id="director" name="director"  class="form-control" /></div>'
                 +'</div>'
                 +'<div class="form-group">'
                    +'<label class="col-sm-3 control-label" for="actor">ACTOR</label>'
                    +'<div class="col-sm-6"><input type="text" id="actor" name="actor"  class="form-control" /></div>'
                 +'</div>'
                 +'<div class="form-group">'
                    +'<label class="col-sm-3 control-label" for="content">SUMMARY</label>'
                    +'<div class="col-sm-6"><textarea class="form-control" rows="3"  id="content" name="content" ></textarea></div>'
                 +'</div>'
                 +'<div class="form-group">'
                   +'<label for="input_id" class="col-sm-4 control-label" for="Image">POSTER</label>'
                   +'<div class="col-sm-2">'
                     +'<img src="${context}/resources/rainbow/images/main" alt="" style="width:180px;height:230px"/>'
                  +'</div>'
                   +'<div class="col-sm-2">'
                     +'<input type="file" id="image" name="image" />'
                  +'</div>'
               +'</div>'
                     +'<div class="form-group">'
                    +'<div class="col-sm-12 text-center">'
                        +'<button class="btn btn-primary" id="inputBtn" name="inputBtn">ADD<i class="fa fa-check spaceLeft"></i></button>'
                        +'<button class="btn btn-danger" id="cancelBtn" name="cancelBtn">CANCEL<i class="fa fa-times spaceLeft"></i></button>'
                       +'</div>'
                 +'</div>'
            +'</form>'
      +'</article>';    
               $('#content').html(addMovieForm);
               $('#inputBtn').click(function(e) {
                  e.preventDefault();
                  alert('영화등록 버튼클릭');
                  $.ajax(context+'/admin/input', {
                     data : {
                        title : $('#title').val(),
                        rating : $('rating').val(),
                        genre : $('genre').val(),
                        openDate : $('openDate').val(),
                        grade : $('grade').val(),
                        runningtime : $('runningtime').val(),
                        actor : $('actor').val(),
                        content : $('content').val(),
                        Image : $('Image').val()
                     },
                     type : 'post',
                     dataType : 'json',
                     contentType : 'application/json',
                     mimeType : 'application/json',
                     async : true,
                     success : function(data) {
                          alert('영화 등록 완료 되었습니다 . ' + data.check.title);
                          location.href = context+'/admin/content';
                     },
                     error : function(xhr, status, msg) {
                        alert('에러발생상태 :' + status + ',내용 : ' + msg);
                     }

                  });
               }); 
               $('#cancelBtn').click(function(e) {
                  e.preventDefault();
                  alert('영화등록 취소 버튼클릭');
                  $.ajax(context+'/admin/input',{
                     data : {
                     success : function(data) {
                        alert(data.message);
                        location.href = article.getContext()+'/admin/conent';
                     },
                     error : function(xhr,status,msg) {
                        alert('에러발생상태 :'+status+',내용 : '+msg);
                     }
            },
            error : function(xhr,status,msg) {
               alert('에러발생상태 :'+status+',내용 : '+msg);
            }
               });
               });
   },
   addVodForm :  function(context) {
      var addVodForm = '<article class="container" style="margin-top: 30px">'
         + '<div class="editTop"><h2 class="text-center"> THE MOIVE ADD PAGE</h2>'
         + '</div>'
           +'<form class="form-horizontal"  id="form" style="margin-top: 30px" enctype="multipart/form-data" action="/admin/input" method="post">'
         + '<div class="form-group">'
         + '<label class="col-sm-3 control-label" for="title">VOD NAME</label>'
         + '<div class="col-sm-6">'
         + '<input type="text" id="vodName" name="vodName"class="form-control" />'
         + '</div>'
         + '</div>'
         + '<div class="row form-group">'
         + '<label class="col-sm-3 control-label" for="subTitle">VOD SUB TITLE</label>'
         + '<div class="col-sm-6">'
         + '<input type="text" id="vodSubTitle" name="vodSubTitle" class="form-control"/>'
         + '</div>'
         + '</div>'
         + '<div class="row form-group">'
         + '<label class="col-sm-3 control-label" for="content">VOD CONTENT</label>'
         + '<div class="col-sm-6"><textarea class="form-control" rows="3"  id="vodContent" name="vodContent" ></textarea>'
         + '</div>'
         + '</div>'
         + '<div class="form-group">'
         + '<label class="col-sm-3 control-label" for="price">VOD PRICE</label>'
         + '<div class="col-sm-6">'
         + '<input type="text" id="vodPrice" name="vodPrice" class="form-control"/>'
         + '</div>'
         + '</div>'
         + '<div class="form-group">'
         + '<label class="col-sm-3 control-label" for="cate">VOD CATEGORY</label>'
         + '<div class="col-sm-6" >'
         + '<select id ="vodCategory" name="vodCategory" class="form-control">'
          + '<option value="action">Action</option>'
          + '<option value="animation">Animation</option>'
          + '<option value="comedy">Comedy</option>'
          + '<option value="drama">Drama</option>'
          + '<option value="mellow">Mellow</option>'
          + '<option value="thriller">Thriller</option>'
          + '</select></div>'
         + '</div>'
         + '<div class="form-group">'
         + '<label class="col-sm-3 control-label" for="time">VOD TIME</label>'
         + '<div class="col-sm-6">'
         + '<input type="text"  id="vodTime" name="vodTime" class="form-control" /></div>'
         + '</div>'
         +'<div class="form-group">'
         +'<label class="col-sm-3 control-label" for="rating">VOD RATING</label>'
         + '<div class="col-sm-6">'
         + '<input type="text"  id="vodRating" name="vodRating" class="form-control" />'
         + '</div>'
         + '</div>'
         + '<div class="form-group">'
         + '<label class="col-sm-3 control-label" for="url">VOD URL</label>'
         + '<div class="col-sm-6"><input type="text" id="vodUrl" name="vodUrl" class="form-control" /></div>'
         + '</div>'
         + '<div class="form-group">'
         + '<label class="col-sm-3 control-label" for="date">VOD DATE</label>'
         + '<div class="col-sm-6"><input type="date"  id="vodDate" name="vodDate"  class="form-control" /></div>'
         + '</div>'
         + '<div class="form-group">'
         + '<label class="col-sm-3 control-label" for="free">VOD FREE</label>'
         + '<div class="col-sm-6">'
         + '<select id ="vodFree" name="vodFree" class="form-control">'
          + '<option value="y">non Free</option>'
          + '<option value="n">Free</option>'
          + '</select></div>'
         + '</div>' 
         + '<div class="form-group">'
         + '<label class="col-sm-3 control-label" for="grade">VOD GRADE</label>'
         + '<div class="col-sm-6">'
         + '<select id ="vodGrade" name="vodGrade" class="form-control">'
          + '<option value="[국내] 전체 관람가">[국내] 전체 관람가</option>'
          + '<option value="[국내] 12세 관람가">[국내] 12세 관람가</option>'
          + '<option value="[국내] 15세 관람가">[국내] 15세 관람가</option>'
          + '<option value="[국내] 18세 관람가">[국내] 18세 관람가</option>'
          + '<option value="[국내] 19세 관람가">[국내] 19세 관람가</option>'
          + '<option value="[해외] R">[해외] R</option>'
          + '</select></div>'
         + '</div>'
         + '<div class="form-group">'
         + '<label class="col-sm-3 control-label" for="actor">VOD ACTOR</label>'
         + '<div class="col-sm-6"><input type="text" id="vodActor" name="vodActor"  class="form-control" /></div>'
         + '</div>'
         + '<div class="form-group">'
         + '<label class="col-sm-3 control-label" for="actor">VOD DIRECTORY</label>'
         + '<div class="col-sm-6"><input type="text" id="vodDirector" name="vodDirector"  class="form-control" /></div>'
         + '</div>'
         + '<div class="form-group">'
         + '<label class="col-sm-3 control-label" for="actor">VOD COUNTRY</label>'
         + '<div class="col-sm-6">'
         + '<select id ="vodCounty" name="vodCounty" class="form-control">'
          + '<option value="한국">한국</option>'
          + '<option value="일본">일본</option>'
          + '<option value="미국">미국</option>'
          + '<option value="중국">중국</option>'
          + '<option value="프랑스">프랑스</option>'
          + '<option value="태국">태국</option>'
          + '<option value="러시아">러시아</option>'
          + '<option value="우즈베키스탄">우즈베키스탄</option>'
          + '<option value="필리핀">필리핀</option>'
          + '<option value="베트남">베트남</option>'
          + '<option value="캐나다">캐나다</option>'
          + '<option value="호주">호주</option>'
          + '<option value="노르웨이">노르웨이</option>'
          + '</select></div>'
         + '</div>'
         + '<div class="form-group">'
         + '<label for="input_id" class="col-sm-4 control-label" for="Image">VOD POSTER</label>'
         + '<div class="col-sm-2">'
         + '<img src="'+context+'/resources/rainbow/images/preview" alt="" id="uploadedImg" style="width:180px;height:230px"/>'
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
   $('#content').html(addVodForm);
   $('#inputBtn').click(function(e) {
      e.preventDefault();
 
      var $form = $('#form')[0];
          var formData = new FormData(form);
        $.ajax({
               url: context+'/admin/vodInput',
               mimeType: 'multipart/form-data',
               contentType: false, 
               processData : false,
               data: formData,
               type: 'POST',
               success : function(result) {
                    alert('VOD 등록 완료 되었습니다 .');
                     location.href = context+'/rainbow'; 
                    
               },
               error : function(xhr, status, msg) {
                  alert('에러발생상태 :' + status + ',내용 : ' + msg);
               }
            });
   });
   $('#cancelBtn').click(function(e) {
      e.preventDefault();
      alert("취소버튼 클릭");
      location.href = context+'/admin/content'; 
   });
   },
   addMovieForm :  function(context) {
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
                     url: context+'/admin/input',
                     mimeType: 'multipart/form-data',
                     contentType: false, 
                     processData : false,
                     data: formData,
                     type: 'POST',
                     success : function(result) {
                          alert('영화 등록 완료 되었습니다 .');
                           location.href = context+'/admin/content'; 
                     },
                     error : function(xhr, status, msg) {
                        alert('에러발생상태 :' + status + ',내용 : ' + msg);
                     }

                  });
         });
         $('#cancelBtn').click(function(e) {
            e.preventDefault();
            alert("취소버튼 클릭");
            location.href = context+'/admin/content'; 
         });
         
   },
   vodListForm : function(context){ 
        var vodListForm = '<style>'
        +'#content{border : 1px solid black}'
        +'#content th {border : 1px solid black; text-align : center}'
        +'#content tr td{border : 1px solid black; text-align : center}'
        +'#content tr {border : 1px solid black}'
        +'</style>'
        + '<h2>　</h2>'
        +'<th class="col-sm-12 text-center">'
        +'</th>'
        +'<table id="content" style="width:94%;margin-left:3%;margin-right:3%;" >'
        +'<tr style="background-color: #E39919;">'
        +'<th style="width: 5%;">VOD NAME</th>'
        +'<th style="width: 5%;">VOD CONTENT TITLE</th>'
        +'<th style="width: 30%;">VOD CONTENT</th>'
        +'<th style="width: 5%;">VOD PRICE</th>'
        +'<th style="width: 5%;">VOD CATEGORY</th>'
        +'<th style="width: 5%;">VOD RATING</th>'
        +'<th style="width: 5%;">VOD URL</th>'
        +'<th style="width: 5%;">VOD IMAGE</th>'
        +'<th style="width: 5%;">VOD DATE</th>'
        +'<th style="width: 5%;">VOD TIME</th>'
        +'<th style="width: 5%;">VOD GRADE</th>'
        +'<th style="width: 5%;">VOD ACTOR</th>'
        +'<th style="width: 5%;">VOD DIRECTOR</th>'
        +'<th style="width: 5%;">VOD COUNTRY</th>'
        +'<th style="width: 5%;">VOD PHOTO</th>'
        +'</tr>';
          $.ajax({
                 url: context+'/vod/vodListAll',
                 success : function(data) { 
                  $.each(data.vod, function(index, vod) {
               vodListForm += '<tr>'
                  
                 +'<td><a id="vodUpdate" href="#" onclick="admin.vodUpdate('+'\''+context+'\''+','+'\''+vod.vodName+'\''+')">'+vod.vodName+'</a></td>'
                 +'<td>'+vod.vodContentTitle+'</td>'
                 +'<td>'+vod.vodContent+'</td>'
                 +'<td>'+vod.vodPrice+'</td>'
                 +'<td>'+vod.vodCategory+'</td>'
                 +'<td>'+vod.vodRating+'</td>'
                 +'<td>'+vod.vodUrl+'</td>'
                 +'<td>'+vod.vodImage+'</td>'
                 +'<td>'+vod.vodDate+'</td>'
                 +'<td>'+vod.vodTime+'분</td>'
                 +'<td>'+vod.vodGrade+'</td>'
                 +'<td>'+vod.vodActor+'</td>'
                 +'<td>'+vod.vodDirector+'</td>'
                 +'<td>'+vod.vodCountry+'</td>'
                 +'<td><img src="'+context+'/resources/'+vod.vodImage+'" alt="" style="width:200px;height:230px"/></a></td>'
                 +'</tr>'; 
              });
                  vodListForm+='</table>';
               $('#content').html(vodListForm);
                 }
          });
   },
   vodUpdate : function(context,vodName) {
      $.ajax({
            url: context+'/vod/vodByName',
            data : { 
               vodTitle : vodName
            },
            success : function(data) { 
               var updateVodForm = '<article class="container" style="margin-top: 5%">'
                 + '<div class="editTop"><h2 class="text-center"> THE MOIVE UPDATE PAGE</h2>'
                 + '</div>'
                   +'<form class="form-horizontal"  id="form" style="margin-top: 3%" enctype="multipart/form-data" action="/admin/input" method="post">'
                 + '<div class="form-group">'
                 + '<label class="col-sm-3 control-label" for="title">VOD NAME</label>'
                 + '<div class="col-sm-6">'
                 + '<input type="text" id="vodName" name="vodName"class="form-control" value="'+data.vod.vodName+'" />'
                 + '</div>'
                 + '</div>'
                 + '<div class="row form-group">'
                 + '<label class="col-sm-3 control-label" for="subTitle">VOD SUB TITLE</label>'
                 + '<div class="col-sm-6">'
                 + '<input type="text" id="vodSubTitle" name="vodSubTitle" class="form-control" value="'+data.vod.vodContentTitle+'"/>'
                 + '</div>'
                 + '</div>'
                 + '<div class="row form-group">'
                 + '<label class="col-sm-3 control-label" for="content">VOD CONTENT</label>'
                 + '<div class="col-sm-6"><textarea class="form-control" rows="3"  id="vodContent" name="vodContent"></textarea>'
                 + '</div>'
                 + '</div>'
                 + '<div class="form-group">'
                 + '<label class="col-sm-3 control-label" for="price">VOD PRICE</label>'
                 + '<div class="col-sm-6">'
                 + '<input type="text" id="vodPrice" name="vodPrice" class="form-control" value="'+data.vod.vodPrice+'" />'
                 + '</div>'
                 + '</div>'
                 + '<div class="form-group">'
                 + '<label class="col-sm-3 control-label" for="cate">VOD CATEGORY</label>'
                 + '<div class="col-sm-6" >'
                 + '<select id ="vodCategory" name="vodCategory" class="form-control">'
                  + '<option value="action">Action</option>'
                  + '<option value="animation">Animation</option>'
                  + '<option value="comedy">Comedy</option>'
                  + '<option value="drama">Drama</option>'
                  + '<option value="mellow">Mellow</option>'
                  + '<option value="thriller">Thriller</option>'
                  + '</select></div>'
                 + '</div>'
                 + '<div class="form-group">'
                 + '<label class="col-sm-3 control-label" for="time">VOD TIME</label>'
                 + '<div class="col-sm-6">'
                 + '<input type="text"  id="vodTime" name="vodTime" class="form-control" value="'+data.vod.vodTime+'"S/></div>'
                 + '</div>'
                 +'<div class="form-group">'
                 +'<label class="col-sm-3 control-label" for="rating">VOD RATING</label>'
                 + '<div class="col-sm-6">'
                 + '<input type="text"  id="vodRating" name="vodRating" class="form-control" value="'+data.vod.vodRating+'" />'
                 + '</div>'
                 + '</div>'
                 + '<div class="form-group">'
                 + '<label class="col-sm-3 control-label" for="url">VOD URL</label>'
                 + '<div class="col-sm-6"><input type="text" id="vodUrl" name="vodUrl" class="form-control" value="'+data.vod.vodUrl+'" /></div>'
                 + '</div>'
                 + '<div class="form-group">'
                 + '<label class="col-sm-3 control-label" for="date">VOD DATE</label>'
                 + '<div class="col-sm-6"><input type="date"  id="vodDate" name="vodDate"  class="form-control" /></div>'
                 + '</div>'
                 + '<div class="form-group">'
                 + '<label class="col-sm-3 control-label" for="free">VOD FREE</label>'
                 + '<div class="col-sm-6">'
                 + '<select id ="vodFree" name="vodFree" class="form-control">'
                  + '<option value="y">Free</option>'
                  + '<option value="n">non Free</option>'
                  + '</select></div>'
                 + '</div>' 
                 + '<div class="form-group">'
                 + '<label class="col-sm-3 control-label" for="grade">VOD GRADE</label>'
                 + '<div class="col-sm-6">'
                 + '<select id ="vodGrade" name="vodGrade" class="form-control">'
                  + '<option value="[국내] 전체 관람가">[국내] 전체 관람가</option>'
                  + '<option value="[국내] 12세 관람가">[국내] 12세 관람가</option>'
                  + '<option value="[국내] 15세 관람가">[국내] 15세 관람가</option>'
                  + '<option value="[국내] 18세 관람가">[국내] 18세 관람가</option>'
                  + '<option value="[국내] 19세 관람가">[국내] 19세 관람가</option>'
                  + '<option value="[해외] R">[해외] R</option>'
                  + '</select></div>'
                 + '</div>'
                 + '<div class="form-group">'
                 + '<label class="col-sm-3 control-label" for="actor">VOD ACTOR</label>'
                 + '<div class="col-sm-6"><input type="text" id="vodActor" name="vodActor"  class="form-control" value="'+data.vod.vodActor+'"/></div>'
                 + '</div>'
                 + '<div class="form-group">'
                 + '<label class="col-sm-3 control-label" for="actor">VOD DIRECTORY</label>'
                 + '<div class="col-sm-6"><input type="text" id="vodDirector" name="vodDirector"  class="form-control" value="'+data.vod.vodDirector+'"/></div>'
                 + '</div>'
                 + '<div class="form-group">'
                 + '<label class="col-sm-3 control-label" for="actor">VOD COUNTRY</label>'
                 + '<div class="col-sm-6">'
                 + '<select id ="vodCounty" name="vodCounty" class="form-control">'
                  + '<option value="한국">한국</option>'
                  + '<option value="일본">일본</option>'
                  + '<option value="미국">미국</option>'
                  + '<option value="중국">중국</option>'
                  + '<option value="프랑스">프랑스</option>'
                  + '<option value="태국">태국</option>'
                  + '<option value="러시아">러시아</option>'
                  + '<option value="우즈베키스탄">우즈베키스탄</option>'
                  + '<option value="필리핀">필리핀</option>'
                  + '<option value="베트남">베트남</option>'
                  + '<option value="캐나다">캐나다</option>'
                  + '<option value="그리스">그리스</option>'
                  + '<option value="독일">독일</option>'
                  + '<option value="오스트리아">오스트리아</option>'
                  + '<option value="영국">영국</option>'
                  + '<option value="호주">호주</option>'
                  + '<option value="노르웨이">노르웨이</option>'
                  + '</select></div>'
                 + '</div>'
                 + '<div class="form-group">'
                 + '<label for="input_id" class="col-sm-4 control-label" for="Image">VOD POSTER</label>'
                 + '<div class="col-sm-2">'
                 + '<img src="'+context+'/resources/'+data.vod.vodImage+'" alt="" id="uploadedImg" style="width:180px;height:230px"/>'
                 + '</div>'
                 + '<div class="col-sm-2">'
                 + '<input type="file" onchange="readURL(this);"  id="image" name="image" />'
                 + '</div>'
                 + '</div>'
                 + '<div class="form-group">'
                 + '<div class="col-sm-12 text-center">'
                 + '<button class="btn btn-primary" id="updateBtn" name="inputBtn">Update<i class="fa fa-check spaceLeft"></i></button>'
                 + '<button class="btn btn-danger" id="cancelBtn" name="cancelBtn">CANCEL<i class="fa fa-times spaceLeft"></i></button>'
                 + '<button class="btn btn-warning" id="deleteBtn" name="cancelBtn">DELETE<i class="fa fa-times spaceLeft"></i></button>'
                 + '</div>' + '</div>' + '</form>'
                 + '</article>';
               
                  $('#content').empty();
                  $('#content').html(updateVodForm);
                  $('select[name="vodCategory"]').val(data.vod.vodCategory);
                  $('select[name="vodGrade"]').val(data.vod.vodGrade);
                  $('select[name="vodFree"]').val(data.vod.vodFree);
                  $('select[name="vodCounty"]').val(data.vod.vodCountry);
                  $('input[name="vodDate"]').val(data.vod.vodDate);
                  $("#vodContent").text(data.vod.vodContent);
                  $('#updateBtn').click(function(e) {
                  e.preventDefault();
                  var $form = $('#form')[0];
                    var formData = new FormData(form);
                    $.ajax({
                           url: context+'/admin/vodUpdate/'+data.vod.vodSeq,
                           mimeType: 'multipart/form-data',
                           contentType: false, 
                           processData : false,
                           data: formData,
                           type: 'POST',
                           success : function(result) {
                                alert('VOD 수정이 완료 되었습니다 .');
                               admin.vodListForm(context);
                                
                           },
                           error : function(xhr, status, msg) {
                              alert('에러발생상태 :' + status + ',내용 : ' + msg);
                           }
                        });
               });
                  $('#cancelBtn').click(function(e) {
                  e.preventDefault();
                  admin.vodListForm(context);
                   
               });
                  $('#deleteBtn').click(function(e) {
                  e.preventDefault(); 
                  $.ajax(context+'/admin/vodDelete',{
                     data : {
                         vodName : data.vod.vodName
                     }, 
                     dataType : 'json',
                     async : true,
                     success : function(data) {  
                      if(data.result == 1){
                        alert('삭제 성공');
                      }else{
                         alert('삭제 실패');
                      }
                     },
                     error : function(xhr,status,msg) {
                        alert('에러발생상태 :'+status+',내용 : '+msg);
                     }
                  });
               });
            }
     });
      
   }
   
}
   