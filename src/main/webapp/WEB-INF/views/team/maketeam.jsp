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
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>

<!--// SubHeader //-->
<div class="ritekhela-subheader">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>팀 생성</h1>
				<ul class="ritekhela-breadcrumb">
					<li><a href="/">홈페이지</a></li>
					<li>팀 생성</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!--// SubHeader //-->

<!--// Content //-->
<div class="ritekhela-main-content">
	<style>
#teamname, #teamloc {
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

#teamintro {
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

					<form id='form1'
						action="${pageContext.request.contextPath}/uploadFormLogo"
						method="post" enctype="multipart/form-data" target="zeroFrame">
						<input type='file' name='file'> <input type='submit'
							value="파일 등록" class="ListButton">
					</form>
					<iframe name="zeroFrame"></iframe>
					<br></br>

					<form role="form" id="teammake" method="post">
						<input type="text" name="teamname" id="teamname" placeholder="팀명">
						<input type="text" name="teamloc" id="teamloc"
							placeholder="팀 활동지역(도 , 시 까지 입력하여 주세요)">
						<textarea name="teamintro" id="teamintro" placeholder="팀소개 입력"></textarea>
						<div id="fileDrop">
							팀 로고 (없을경우 공백)
							<div class="fileDrop"></div>
						</div>
						<div>
							<hr>
						</div>
						<ul class="mailbox-attachments clearfix uploadedList">
						</ul>
						<input type="submit" value="팀 생성" class="ListButton">
					</form>
				</div>
				<!--// Full Section //-->

				<script>
					
				</script>
			</div>
		</div>
	</div>
	<!--// Main Section //-->

</div>
<!--// Content //-->

<script type="text/javascript" src="/resources/js/upload.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">{{fileName}}
	<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn"><i class="fas fa-times"></i></a>
	</span>
  </div>
</li>                
</script>

<script>
	$("#teammake")
			.submit(
					function(e) {

						e.preventDefault();

						var that = $(this);

						var str = "";

						if (($.trim($("#teamname").val()) == "")) {
							alert("팀명을 입력하여 주세요");
							return false;
						}
						if (($.trim($("#teamloc").val()) == "")) {
							alert("팀활동지역을 입력하여 주세요");
							return false;
						}
						if (($.trim($("#teamintro").val()) == "")) {
							alert("팀소개를 입력하여 주세요");
							return false;
						}

						$(".uploadedList .delbtn")
								.each(
										function(index) {
											str += "<input type='hidden' name='teamlogo' value='"
													+ $(this).attr("href")
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
		$(".uploadedList .delbtn").closest("li").remove();
		event.preventDefault();

		var files = event.originalEvent.dataTransfer.files;

		if (files[1] != null) {
			alert("로고는 한장만 저장 가능합니다");
			return false;
		}

		var file = files[0];

		var formData = new FormData();

		formData.append("file", file);

		$.ajax({
			url : '/uploadLogo',
			data : formData,
			dataType : 'text',
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {

				var fileInfo = getFileInfo(data);

				if (fileInfo.imgsrc == "/resources/bootstrap/images/file.png") {
					alert("로고는 이미지파일만 업로드 가능합니다");
					return false;
				}

				var html = template(fileInfo);

				$(".uploadedList").append(html);
			}
		});
	});

	function addFilePath(msg) {

		$(".uploadedList .delbtn").closest("li").remove();

		var fileInfo = getFileInfo(msg);

		var html = template(fileInfo);

		$(".uploadedList").append(html);

		document.getElementById("form1").reset();
	}

	$(".uploadedList").on("click", ".delbtn", function(event) {

		event.preventDefault();

		var that = $(this);

		$.ajax({
			url : "/deleteFile",
			type : "post",
			data : {
				fileName : $(this).attr("href")
			},
			dataType : "text",
			success : function(result) {
				if (result == 'deleted') {
					that.closest("li").remove();
				}
			}
		});
	});
</script>
<%@ include file="../include/footer.jspf"%>