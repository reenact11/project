<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf"%>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- Main content -->
<style type="text/css">
.popup {
	position: absolute;
}

.back {
	background-color: gray;
	opacity: 0.5;
	width: 100%;
	height: 300%;
	overflow: hidden;
	z-index: 1101;
}

.front {
	z-index: 1110;
	opacity: 1;
	boarder: 1px;
	margin: auto;
}

/*
 * Page: Mailbox
 * -------------
 */
.mailbox-messages>.table {
	margin: 0;
}

.mailbox-controls {
	padding: 5px;
}

.mailbox-controls.with-border {
	border-bottom: 1px solid #f4f4f4;
}

.mailbox-read-info {
	border-bottom: 1px solid #f4f4f4;
	padding: 10px;
}

.mailbox-read-info h3 {
	font-size: 20px;
	margin: 0;
}

.mailbox-read-info h5 {
	margin: 0;
	padding: 5px 0 0 0;
}

.mailbox-read-time {
	color: #999;
	font-size: 13px;
}

.mailbox-read-message {
	padding: 10px;
}

.mailbox-attachments li {
	float: left;
	width: 200px;
	border: 1px solid #eee;
	margin-bottom: 10px;
	margin-right: 10px;
}

.mailbox-attachment-name {
	font-weight: bold;
	color: #666;
}

.mailbox-attachment-icon, .mailbox-attachment-info,
	.mailbox-attachment-size {
	display: block;
}

.mailbox-attachment-info {
	padding: 10px;
	background: #f4f4f4;
}

.mailbox-attachment-size {
	color: #999;
	font-size: 12px;
}

.mailbox-attachment-icon {
	text-align: center;
	font-size: 65px;
	color: #666;
	padding: 20px 10px;
}

.mailbox-attachment-icon.has-img {
	padding: 0;
}

.mailbox-attachment-icon.has-img>img {
	max-width: 100%;
	height: auto;
}
</style>

<div class='popup back' style="display: none;"></div>
<div id="popup_front" class='popup front' style="display: none;">
	<img id="popup_img">
</div>
<!--// SubHeader //-->
<div class="ritekhela-subheader">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>${boardname }</h1>
				<ul class="ritekhela-breadcrumb">
					<li><a href="/">홈페이지</a></li>
					<li>자유게시판</li>
					<li>${boardname }</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!--// SubHeader //-->
<style>
.wrap {
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
}

.buttons {
	width: 140px;
	height: 45px;
	font-size: 15px;
	text-transform: uppercase;
	letter-spacing: 2.5px;
	font-weight: 500;
	color: #000;
	background-color: #fff;
	border: none;
	border-radius: 45px;
	box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease 0s;
	cursor: pointer;
	outline: none;
}

.buttons:hover {
	background-color: #ffdc11;
	box-shadow: 0px 15px 20px rgba(255, 220, 17, 0.4);
	color: #000;
	transform: translateY(-7px);
}
</style>
<!--// Content //-->
<div class="ritekhela-main-content">

	<!--// Main Section //-->
	<div class="ritekhela-main-section ritekhela-fixture-list-full">
		<div class="container">
			<div class="row">

				<!--// Full Section //-->
				<div class="col-md-12">

					<div class="col-md-12">
						<!--// Gallery //-->
						<div>


							<c:if test="${login.userno == boardVO.userno}">
								<div class="wrap">
									<td><a
										href="/freeboard/modify?postno=${boardVO.postno}&boardname=${boardname}"><button
												class="buttons">수정</button></a></td>
									<td><a
										href="/freeboard/delete?postno=${boardVO.postno}&category=${boardVO.category}"><button
												class="buttons" onclick="return confirm('정말로 삭제 하시겠습니까?')">삭제</button></a></td>
							</c:if>
							<td><c:set var="pageNo"
									value="${empty param.pageNo ? '1' : param.pageNo}" /> <a
								href="/freeboard/listPage?pageNo=${pageNo}&category=${boardVO.category}"><button
										class="buttons">게시글목록</button></a></td>
						</div>
						<table border="1">
							<tr>
								<td style="width: 70px">제목</td>
								<td>${boardVO.posttitle}</td>
							</tr>
							<tr>
								<td style="width: 70px; height: 200px; padding-top: 80px;">내용</td>
								<td style="text-align: left; padding-left: 1%;">${boardVO.postcontent }</td>
							</tr>
							<tr>
								<td style="width: 70px">조회수</td>
								<td>${boardVO.readcnt }</td>
							</tr>
						</table>
						
						<div>
							<ul class="mailbox-attachments clearfix uploadedList">
							
<li data-src="/2021/01/22/s_29e32e8f-416a-4574-94f6-ccfdbabb7045_Chrysanthemum.jpg">
  <span class="mailbox-attachment-icon has-img"><img src="/displayFile?fileName=/2021/01/22/s_29e32e8f-416a-4574-94f6-ccfdbabb7045_Chrysanthemum.jpg" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="/displayFile?fileName=/2021/01/22/29e32e8f-416a-4574-94f6-ccfdbabb7045_Chrysanthemum.jpg" class="mailbox-attachment-name">Chrysanthemum.jpg</a>
	
  </div>
</li>                

<li data-src="/2021/01/22/s_d7862b30-7dab-41ca-8916-f92e3afaf8ce_Desert.jpg">
  <span class="mailbox-attachment-icon has-img"><img src="/displayFile?fileName=/2021/01/22/s_d7862b30-7dab-41ca-8916-f92e3afaf8ce_Desert.jpg" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="/displayFile?fileName=/2021/01/22/d7862b30-7dab-41ca-8916-f92e3afaf8ce_Desert.jpg" class="mailbox-attachment-name">Desert.jpg</a>
	
  </div>
</li>                

<!-- 
<li data-src="/2021/01/22/s_213949fd-d014-4a46-b456-6b535ead9371_Hydrangeas.jpg">
  <span class="mailbox-attachment-icon has-img"><img src="/displayFile?fileName=/2021/01/22/s_213949fd-d014-4a46-b456-6b535ead9371_Hydrangeas.jpg" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="/displayFile?fileName=/2021/01/22/213949fd-d014-4a46-b456-6b535ead9371_Hydrangeas.jpg" class="mailbox-attachment-name">Hydrangeas.jpg</a>
	
  </div>
</li>                

<li data-src="/2021/01/22/s_c1f859e1-11ff-4d5f-81dd-af6c9b1f0e01_111921_44194_3034.jpg">
  <span class="mailbox-attachment-icon has-img"><img src="/displayFile?fileName=/2021/01/22/s_c1f859e1-11ff-4d5f-81dd-af6c9b1f0e01_111921_44194_3034.jpg" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="/displayFile?fileName=/2021/01/22/c1f859e1-11ff-4d5f-81dd-af6c9b1f0e01_111921_44194_3034.jpg" class="mailbox-attachment-name">111921_44194_3034.jpg</a>
	 -->
  </div>
</li>                
</ul>
						</div>
						<!-- <div>
							<ul class="mailbox-attachments clearfix uploadedList">
							</ul>
						</div> -->



						<div class="row">
							<div class="col-md-12">

								<div class="box box-success">
									<div class="box-header">
										<h3 class="box-title">댓글보기(클릭)</h3>
									</div>
									<div class="box-body">
									<input type="hidden" name="postno" value="${boardVO.postno }" id="newReplyPostno">
									 <input type="hidden" name="userno" value="${login.userno}" id="newReplyWriter">
									  <input class="form-control" type="text" name="commcontent" placeholder="댓글을 입력 하세요" id="newReplyText">

									</div>
									<!-- /.box-body -->
									<div class="box-footer">
										<button style=margin:1%; type="button" class="buttons" id="replyAddBtn">댓글 등록</button>
									</div>
								</div>


								<!-- The time line -->
								<ul class="timeline" style=background-color:lightgray;>
									<!-- timeline time label -->
								</ul>

								<div class='ritekhela-pagination'>
									<ul id="pagination" class="pagination pagination-sm no-margin ">

									</ul>
								</div>

							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->




					</div>

				</div>

			</div>
			<!--// Full Section //-->

		</div>
	</div>
</div>
<!--// Main Section //-->

<!-- Modal -->
<div id="modifyModal" class="modal modal-primary fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title"></h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body" data-commno>
        <p><input type="text" id="commcontent" class="form-control"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
        <button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>  

</div>
<!--// Content //-->

<script id="templateAttach" type="text/x-handlebars-template">
<li data-src='{{fullName}}'>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	</span>
  </div>
</li>                
</script>

<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-commno={{commno}} style=outline:double;padding:0.5%>
 <div class="timeline-item" >
  <div class="timeline-header">{{usernname}} <span style=float:right; class="time">{{prettifyDate commdate}}</span> </div>
  <h3 class="timeline-body"><strong>{{commcontent}}</strong> </h3>
{{#dupltest usernname}}   
    <div class="timeline-footer">
     <a class="btn btn-primary btn-xs " style=display:grid;color:white;background-color:#313539;border-color:#313539;
	    data-toggle="modal" data-target="#modifyModal">Modify</a>
    </div>
 {{/dupltest}}   
  </div>			
</li>
{{/each}}
</script>

<script>
	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});
	
	   Handlebars.registerHelper("dupltest", function(usernname, option) {
		      var idCount = '';
		      if (usernname == '${login.usernname}') {
		         idCount += option.fn();
		      }
		      return idCount;
		      });  

	var printData = function(replyArr, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());

		var html = template(replyArr);
		$(".replyLi").remove();
		target.append(html);

	}

	var postno = $("#newReplyPostno").val();
	
	var page = 1;

	function getPage(pageInfo){
		
		$.getJSON(pageInfo,function(data){
			printData(data.list, $(".timeline") ,$('#template'));
			printPaging(data.pageMaker, $(".pagination"));
			
			$("#modifyModal").modal('hide');
			$(".box-title").html("댓글목록[ " + data.pageMaker.totalCount +" ]");
			
		});
	}



	var printPaging = function(pageMaker, target) {

		var str = "";

		if (pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1)
					+ "'>&laquo;</a></li>";
		}

		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'>&raquo;</a></li>";
		}

		target.html(str);
	};

	

	$(".pagination").on("click", "li a", function(event){
		
		event.preventDefault();
		
		page = $(this).attr("href");
		
		getPage("/comm/"+postno+"/"+page);
		
	});
	

	$("#replyAddBtn").on("click",function(){
		 
		 var userno = ${login.userno};//replyerObj.val();
		 var commcontent = $("#newReplyText").val();
		
		 
		 if($("#newReplyText").val() == ""){
			 alert("댓글을 입력하여 주세요");
			 return false;
		 }
		  
		  $.ajax({
				type:'post',
				url:'/comm/',
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "POST" },
				dataType:'text',
				data: JSON.stringify({postno:postno, userno:userno, commcontent:commcontent}),
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("등록 되었습니다.");
						replyPage = 1;
						getPage("/comm/"+postno+"/"+page );
						$("#newReplyText").val("");
					}
			}});
	});


	$(".timeline").on("click", ".replyLi", function(event){
		
		var reply = $(this);
		
		$("#commcontent").val(reply.find('.timeline-body').text());
		$(".modal-title").html(reply.attr("data-commno"));
		
	});
	
	

	$("#replyModBtn").on("click",function(){
		  
		  var commno = $(".modal-title").html();
		  var commcontent = $("#commcontent").val();
		  
		  if($("#commcontent").val()==""){
			  alert("댓글을 입력하여 주세요");
			  return false;
		  }
		  
		  
		  $.ajax({
				type:'put',
				url:'/comm/'+commno,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "PUT" },
				data:JSON.stringify({commcontent:commcontent}), 
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("수정 되었습니다.");
						getPage("/comm/"+postno+"/"+page );
					}
			}});
	});

	$("#replyDelBtn").on("click",function(){
		  
		  var commno = $(".modal-title").html();
		  var commcontent = $("#replytext").val();
		  
		  $.ajax({
				type:'delete',
				url:'/comm/'+commno,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "DELETE" },
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("삭제 되었습니다.");
						getPage("/comm/"+postno+"/"+page );
					}
			}});
	});
	
</script>


<script>
	$(document).ready(
			function() {
				
				/* var postno = ${boardVO.postno};
				var template = Handlebars.compile($("#templateAttach").html());
				
				$.getJSON("/freeboard/getAttach/" + postno, function(list) {
					$(list).each(function() {
						var fileInfo = getFileInfo(this);

						var html = template(fileInfo);

						$(".uploadedList").append(html);

					});
				}); */
				
				
				
				
				$(".uploadedList").on("click", ".mailbox-attachment-info a",
						function(event) {

							var fileLink = $(this).attr("href");

							if (checkImageType(fileLink)) {

								event.preventDefault();

								var imgTag = $("#popup_img");
								imgTag.attr("src", fileLink);

								console.log(imgTag.attr("src"));

								$(".popup").show('slow');
								imgTag.addClass("show");
							}
						});

				$("#popup_img").on("click", function() {

					$(".popup").hide('slow');

				});

			});
	
$(".box-title").on("click",function(){
	
	
	getPage("/comm/" + postno + "/1");

	function getPage(pageInfo){
		
		$.getJSON(pageInfo,function(data){
			printData(data.list, $(".timeline") ,$('#template'));
			printPaging(data.pageMaker, $(".pagination"));
			
			$("#modifyModal").modal('hide');
			$(".box-title").html("댓글목록[ " + data.pageMaker.totalCount +" ]");
			
		});
	}
	
	
	
});
	
</script>
 

<%@ include file="../include/footer.jspf"%>