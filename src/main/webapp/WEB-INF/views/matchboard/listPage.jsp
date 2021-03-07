<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<%@ include file="../include/header.jspf"%>

<!--// SubHeader //-->
<style>
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

* {
	border: 0;
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

:root {
	font-size: calc(16px + ( 24 - 16)*(100vw- 320px)/(1920- 320));
}

.search-bar {
	display: flex;
}

.search-bar input, .search-btn, .search-btn:before, .search-btn:after {
	transition: all 0.25s ease-out;
}

.search-bar input, .search-btn {
	width: 3em;
	height: 3em;
}

.search-bar input:invalid:not(:focus), .search-btn {
	cursor: pointer;
}

.search-bar, .search-bar input:focus, .search-bar input:valid {
	width: 100%;
}

.search-bar input:focus, .search-bar input:not(:focus)+.search-btn:focus
	{
	outline: transparent;
}

.search-bar {
	margin: auto;
	padding: 0px 0px 0px 83%;
	justify-content: center;
	max-width: fit-content;
}

.search-bar input {
	background: transparent;
	border-radius: 1.5em;
	box-shadow: 0 0 0 0.4em #171717 inset;
	padding: 0.75em;
	transform: translate(0.5em, 0.5em) scale(0.5);
	transform-origin: 100% 0;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}

.search-bar input::-webkit-search-decoration {
	-webkit-appearance: none;
}

.search-bar input:focus, .search-bar input:valid {
	background: #fff;
	border-radius: 0.375em 0 0 0.375em;
	box-shadow: 0 0 0 0.1em #d9d9d9 inset;
	transform: scale(1);
}

.search-btn {
	background: #171717;
	border-radius: 0 0.75em 0.75em 0/0 1.5em 1.5em 0;
	padding: 0.75em;
	position: relative;
	transform: translate(0.25em, 0.25em) rotate(45deg) scale(0.25, 0.125);
	transform-origin: 0 50%;
}

.search-btn:before, .search-btn:after {
	content: "";
	display: block;
	opacity: 0;
	position: absolute;
}

.search-btn:before {
	border-radius: 50%;
	box-shadow: 0 0 0 0.2em #f1f1f1 inset;
	top: 0.75em;
	left: 0.75em;
	width: 1.2em;
	height: 1.2em;
}

.search-btn:after {
	background: #f1f1f1;
	border-radius: 0 0.25em 0.25em 0;
	top: 51%;
	left: 51%;
	width: 0.75em;
	height: 0.25em;
	transform: translate(0.2em, 0) rotate(45deg);
	transform-origin: 0 50%;
}

.search-btn span {
	display: inline-block;
	overflow: hidden;
	width: 1px;
	height: 1px;
}

/* Active state */
.search-bar input:focus+.search-btn, .search-bar input:valid+.search-btn
	{
	background: #3d3d3d;
	border-radius: 0 0.375em 0.375em 0;
	transform: scale(1);
}

.search-bar input:focus+.search-btn:before, .search-bar input:focus+.search-btn:after,
	.search-bar input:valid+.search-btn:before, .search-bar input:valid+.search-btn:after
	{
	opacity: 1;
}

.search-bar input:focus+.search-btn:hover, .search-bar input:valid+.search-btn:hover,
	.search-bar input:valid:not(:focus)+.search-btn:focus {
	background: #ffdc11;
}

.search-bar input:focus+.search-btn:active, .search-bar input:valid+.search-btn:active
	{
	transform: translateY(1px);
}

@media screen and (prefers-color-scheme: dark) {
	.search-bar input {
		box-shadow: 0 0 0 0.4em #f1f1f1 inset;
	}
	.search-bar input:focus, .search-bar input:valid {
		background: #3d3d3d;
		box-shadow: 0 0 0 0.1em #3d3d3d inset;
	}
	.search-btn {
		background: #f1f1f1;
	}
}
</style>
<div class="ritekhela-subheader">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>${boardname}</h1>
				<ul class="ritekhela-breadcrumb">
					<li><a href="/">홈페이지</a></li>
					<li>매치팀/용병 모집</li>
					<li>${boardname}</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!--// SubHeader //-->
<!--// Content //-->
<div class="ritekhela-main-content">

	<!--// Main Section //-->
	<div class="ritekhela-main-section ritekhela-fixture-list-full">

		<div class="container">

			<div class="row">

				<!--// Full Section //-->
				<div class="col-md-12">
					<!--// Gallery //-->
					<div
						class="ritekhela-gallery ritekhela-gallery-view1 ritekhela-gallery-view2">
						<ul class="row" id="formform">
							<c:if test="${pageMaker.totalCount eq 0}">
								<tr>
									<td colspan="4">게시글이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="matchDTO" items="${list}">
								<li class="col-md-4">
									<figure>
										<c:choose>

											<c:when
												test="${login.userno != matchDTO.userno && matchDTO.recruitstate eq 'O' }">
												<a data-fancybox-group="group" data-toggle="modal"
													data-target="#ritekhelamodalsearch" id="postno"
													data-pno="${matchDTO.postno}"> 
												<c:choose>
													<c:when test="${matchDTO.teamlogo == null }">
												<img src="/resources/bootstrap/extra-images/SochingLogo.png" alt="">
												</c:when>
												<c:otherwise>
												<img src="/displayFile?fileName=${matchDTO.teamlogo}"alt="">
												</c:otherwise>
												</c:choose>
												<i class="ritekhela-bgcolor"><i class="fas fa-edit"></i></i>
												</a>
											</c:when>
											<c:otherwise>
												<a data-fancybox-group="group" href="#"> 
												<c:choose>
													<c:when test="${matchDTO.teamlogo == null }">
												<img src="/resources/bootstrap/extra-images/SochingLogo.png" alt="">
												</c:when>
												<c:otherwise>
												<img src="/displayFile?fileName=${matchDTO.teamlogo}"alt="">
												</c:otherwise>
												</c:choose>
												<i class="ritekhela-bgcolor"><i class="fas fa-times"></i></i>
												</a>
											</c:otherwise>
										</c:choose>
										<br></br>
										<br></br>
										<figcaption>

											<form action="/team/teaminfo" method="post">
												<td><input type=submit name="teamname"
													value="${matchDTO.teamname }"></td>
											</form>
											<span style="float: right;" class="ritekhela-bgcolor-two">${matchDTO.postno}번
												글</span> <span class="ritekhela-bgcolor-two">제목 :
												${matchDTO.posttitle}</span>
											<c:if test="${login.userno == matchDTO.userno}">
												<a
													href="/matchboard/modify?postno=${matchDTO.postno}&boardname=${boardname}"><span
													class="ritekhela-bgcolor-two">수정</span></a>
												<a
													href="/matchboard/delete?postno=${matchDTO.postno}&category=${matchDTO.category}"><span
													class="ritekhela-bgcolor-two"
													onclick="return confirm('정말로 삭제 하시겠습니까?')">삭제</span></a>
											</c:if>
										</figcaption>
									</figure>
									<h2>${matchDTO.postcontent}<br> <br> <span
											class="ritekhela-bgcolor-two">< 신청자수 :
											${matchDTO.readcnt} 명 >< 모집상태 : ${matchDTO.recruitstate} ></span>
									</h2>
								</li>
							</c:forEach>
						</ul>
						<c:if test="${login.userrole=='팀장'}">
							<form
								action="/matchboard/write${pageMaker.makemcQuery(pageMaker.mccri.page)}"
								method="get">
								<input type="hidden" name="boardname" value="${boardname}">
								<input type="hidden" name="category"
									value="${pageMaker.mccri.category}">
								<button type="submit" class="ListButton">글 작성</button>
							</form>
						</c:if>
					</div>
					<!--// Gallery //-->
					<!--// Pagination //-->
					<div class="ritekhela-pagination">
						<ul>
							<c:if test="${pageMaker.prev}">
								<li><a
									href="/matchboard/listPage${pageMaker.makemcQuery(pageMaker.startPage - 1)}">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage}" var="idx">
								<li
									<c:out value="${pageMaker.mccri.page == idx?'class=active':''}"/>>
									<a href="/matchboard/listPage${pageMaker.makemcQuery(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="/matchboard/listPage${pageMaker.makemcQuery(pageMaker.endPage +1)}">&raquo;</a></li>
							</c:if>

						</ul>
					</div>
					<!--// Pagination //-->
					<!-- 
							<li><a href="#"><i class="fa fa-angle-left"></i></a></li> 
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
							-->
				</div>
				<!--// Full Section //-->
				<div class="loginmodalbox modal fade" id="ritekhelamodalsearch"
					tabindex="-1">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-body ritekhela-bgcolor-two">
								<h5 class="modal-title">신청서 작성</h5>
								<a href="#" class="close ritekhela-bgcolor-two"
									data-dismiss="modal" aria-label="Close"> <i
									class="fa fa-times"></i>
								</a> <input type="hidden" id="postnoVal"> <input
									type="hidden" id="fuserno" value="${login.userno}"> <input
									style="height: 200px; text-align: center;" type="text"
									name="formcontent" id="formcontent" placeholder="신청 내용 입력">
								<input type="submit" id="formsend" value="신청"
									class="ritekhela-bgcolor">
							</div>

						</div>
					</div>
				</div>
				<script>
					$("#formform").on("click", "#postno", function(event) {

						var postno = $(this).attr("data-pno");
						$("#postnoVal").val(postno);

					});

					/* $("#formsend").on("click", function(event) {
						if (($.trim($("#formcontent").val()) == "")) {
							alert("신청서를 작성하여 주세요");
							return false;
						}
						
						$.ajax({
							url : '/matchboard/formsend',
							data :  {
								'formcontent' : $('#formcontent').val(),
								'postno' : $('#postnoVal').val(),
								'userno' : $('#fuserno').val()
							}, 
							dataType : 'json',
							type : 'post',
							success : function(result) {
									alert(result);
								
							},
							error : function(err) {
								alert('err');
							}
							
						});
						}); */

					$("#formsend").on("click", function(event) {
						if (($.trim($("#formcontent").val()) == "")) {
							alert("신청서를 작성하여 주세요");
							return false;
						}

						$.ajax({
							url : '/matchboard/formsend',
							headers : {
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" : "POST"
							},
							data : JSON.stringify({
								formcontent : $('#formcontent').val(),
								postno : $('#postnoVal').val(),
								userno : $('#fuserno').val()
							}),
							dataType : 'text',
							type : 'post',
							success : function(result) {
								if (result == "OK") {
									alert("신청이 완료되었습니다");
									$("#ritekhelamodalsearch").modal('hide');
								}
							}

						});
					});
				</script>
			</div>
		</div>
	</div>
	<!--// Main Section //-->

</div>
<!--
				// Content //-->
<%@ include file="../include/footer.jspf"%>

<%-- <figure>
									<c:if test="${article.recruitcheck }">
									<c:if test="${authUser.userno != article.userno}">
										<a data-fancybox-group="group" class="fancybox" href="${pageContext.request.contextPath}/matchboard/Match.do?no=${article.postno}">
											<img src="${pageContext.request.contextPath}/bootstrap/extra-images/gallery-view1-1.jpg" alt=""><i class="ritekhela-bgcolor">신청</i>
										</a>
										</c:if>
										</c:if>
											<h1>${article.postcontent}</h1><br></br> <br></br>
										<figcaption>
											<form action="${pageContext.request.contextPath }/infopage/Teaminfo.do" method="post">
                            				<td><input type=submit name="name" value="${article.teamname }" ></td>
                            				</form>
											<span class="ritekhela-bgcolor-two">제목 : ${article.posttitle}</span>
											<c:if test="${authUser.userno == article.userno}">
											<a href="${pageContext.request.contextPath}/article/modify.do?no=${article.postno}"><span class="ritekhela-bgcolor-two">수정</span></a>
											<a href="${pageContext.request.contextPath}/article/delete.do?no=${article.postno}"><span class="ritekhela-bgcolor-two">삭제</span></a>
											</c:if>
											<span class="ritekhela-bgcolor-two">모집상태 : ${article.recruitstate}</span>
											<span class="ritekhela-bgcolor-two">신청자수 : ${article.readcnt}</span>
										</figcaption>
									</figure> --%>