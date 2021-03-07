<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 경로설정하기 -->
<%@ include file="../include/header.jspf"%>


<div class="ritekhela-subheader">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>${boardname}</h1>
				<ul class="ritekhela-breadcrumb">
					<li><a href="/">홈페이지</a></li>
					<li>자유게시판</li>
					<li>${boardname}</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!--// SubHeader //-->

<!--// Content //-->
<div class="ritekhela-main-content">
	<style>
#title {
	float: left;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.20);
	color: rgba(120, 120, 120, 1); /* #999999; */
	padding: 22px 22px;
	border: none;
	height: 30px;
	margin-bottom: 12px;
	vertical-align: middle !important;
}

#content {
	float: left;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.20);
	color: rgba(120, 120, 120, 1); /* #999999; */
	padding: 10px 20px 5px 20px;
	border: none;
	height: 140px;
	margin-bottom: 12px;
	vertical-align: middle !important;
}

.ListButton {
	background: linear-gradient(to bottom, #000000 5%, #80818a 100%);
	background-color: #000000;
	border-radius: 41px;
	display: inline-block;
	cursor: pointer;
	color: #fafafa;
	font-family: Arial;
	font-size: 18px;
	font-weight: bold;
	padding: 10px 13px;
	text-decoration: none;
}

.ListButton:hover {
	background: linear-gradient(to bottom, #80818a 5%, #000000 100%);
	background-color: #80818a;
}

.ListButton:active {
	position: relative;
	top: 1px;
}

.fileDrop {
	width: 100%;
	height: 100px;
	border: 1px dotted gray;
	background-color: #3e454c;
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
iframe {
	width: 0px;
	height: 0px;
	border: 0px
}

</style>
	<!--// Main Section //-->
	<div class="ritekhela-main-section ritekhela-fixture-list-full">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
				
				<form id='form1' action="${pageContext.request.contextPath}/uploadForm" method="post" enctype="multipart/form-data" target="zeroFrame">
						<input type='file' name='file'> 
						<button type='submit' class="ListButton">파일등록</button>
						</form>
						<iframe name="zeroFrame"></iframe>
						<br></br>
						
					<form role="form" id="write" method="post">
						<input type="text" id="title" name="posttitle"
							placeholder="게시글 제목">
						<textarea id="content" name="postcontent"
							placeholder="내용을 자세히 적어 주세요"></textarea>
						<div id="fileDrop">
							첨부 파일
							<div class="fileDrop"></div>
						
						
						</div>

						<div>
							<hr>
						</div>
						<ul class="mailbox-attachments clearfix uploadedList">
						</ul>
						<input type="submit" value="게시글 작성" class="ListButton">
					</form>
					
				</div>
				<!--// Full Section //-->

			</div>
		</div>
	</div>
	<!--// Main Section //-->

</div>
<!--// Content //-->
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fas fa-times"></i></a>
	</span>
  </div>
</li>                
</script>
			<script>
				$("#write").submit(function(event) {
					event.preventDefault();				
					
					if (($.trim($("#title").val()) == "")) {
						alert("제목을 입력하여 주세요");
						return false;
					}
					if (($.trim($("#content").val()) == "")) {
						alert("내용을 입력하여 주세요");
						return false;
					}
					
					var that = $(this);

					var str = "";
					
					$(".uploadedList .delbtn").each(
							function(index) {
								str += "<input type='hidden' name='files[" + index
										+ "]' value='" + $(this).attr("href")
										+ "'> ";
							});

					that.append(str);

					that.get(0).submit();
				});

	
	var template = Handlebars.compile($("#template").html());
	
	$(".fileDrop").on("dragenter dragover", function(event) {
		event.preventDefault();
	});

	$(".fileDrop").on("drop", function(event) {
		event.preventDefault();
		
		
		var files = event.originalEvent.dataTransfer.files;
		
		var file = files[0];

		var formData = new FormData();
		
		formData.append("file", file);

		$.ajax({
			url : '/uploadAjax',
			data : formData,
			dataType : 'text',
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {

				var fileInfo = getFileInfo(data);

				var html = template(fileInfo);

				$(".uploadedList").append(html);
			}
		});
	});
	
	function addFilePath(msg) {
		
		var fileInfo = getFileInfo(msg);

		var html = template(fileInfo);

		$(".uploadedList").append(html);
		
		document.getElementById("form1").reset();
	}
	
	$(".uploadedList").on("click", ".delbtn", function(event){
		
		event.preventDefault();
		
		var that = $(this);
		 
		$.ajax({
		   url:"/deleteFile",
		   type:"post",
		   data: {fileName:$(this).attr("href")},
		   dataType:"text",
		   success:function(result){
			   if(result == 'deleted'){
				   that.closest("li").remove();
			   }
		   }
	   });
	});
</script>
<%@ include file="../include/footer.jspf"%>