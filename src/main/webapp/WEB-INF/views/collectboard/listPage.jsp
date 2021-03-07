<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<%@ include file="../include/header.jspf"%>

<!--// SubHeader //-->
<div class="ritekhela-subheader">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>${boardname}</h1>
				<ul class="ritekhela-breadcrumb">
					<li><a href="/">홈페이지</a></li>
					<li>팀원 모집</li>
					<li>${boardname}</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!--// SubHeader //-->

<style>

</style>

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
							<c:forEach var="collectDTO" items="${list}">
								<li class="col-md-4">
									<figure>
										<c:choose>

											<c:when
												test="${login.userno ne collectDTO.userno && collectDTO.recruitstate eq 'O' && login.userrole eq '무소속' }">
												<a data-fancybox-group="group" data-toggle="modal"
													data-target="#ritekhelamodalsearch" id="postno"
													data-pno="${collectDTO.postno}">
													<c:choose>
													<c:when test="${collectDTO.teamlogo == null }">
												<img src="/resources/bootstrap/extra-images/SochingLogo.png"alt="">
												</c:when>
												<c:otherwise>
												<img src="/displayFile?fileName=${collectDTO.teamlogo}"alt="">
												</c:otherwise>
												</c:choose>
												<i class="ritekhela-bgcolor"><i class="fas fa-edit"></i></i>
												</a>
											</c:when>
											<c:otherwise>
												<a data-fancybox-group="group" href="#"> 
												<c:choose>
												<c:when test="${collectDTO.teamlogo == null }">
												<img src="/resources/bootstrap/extra-images/SochingLogo.png"alt="">
												</c:when>
												<c:otherwise>
												<img src="/displayFile?fileName=${collectDTO.teamlogo}"alt="">
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
													value="${collectDTO.teamname}"></td>
											</form>
											<span style="float: right;" class="ritekhela-bgcolor-two">${collectDTO.postno}번
												글</span> <span class="ritekhela-bgcolor-two">제목 :
												${collectDTO.posttitle}</span>
											<c:if test="${login.userno == collectDTO.userno}">
												<a
													href="/collectboard/modify?postno=${collectDTO.postno}&boardname=${boardname}">
													<span class="ritekhela-bgcolor-two">수정</span>
												</a>
												<a
													href="/collectboard/delete?postno=${collectDTO.postno}&category=${collectDTO.category}">
													<span class="ritekhela-bgcolor-two"
													onclick="return confirm('정말로 삭제 하시겠습니까?')">삭제</span>
												</a>
											</c:if>
										</figcaption>
									</figure>
									<h2>${collectDTO.postcontent}<br> <br> <span
											class="ritekhela-bgcolor-two">< 신청자수 :
											${collectDTO.readcnt} 명 >< 모집상태 : ${collectDTO.recruitstate}
											></span>
									</h2>
								</li>
							</c:forEach>
						</ul>
						<c:if test="${login.userrole=='팀장'}">
							<form
								action="/collectboard/write${pageMaker.makemcQuery(pageMaker.mccri.page)}"
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
									href="/collectboard/listPage${pageMaker.makemcQuery(pageMaker.startPage - 1)}">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage}" var="idx">
								<li
									<c:out value="${pageMaker.mccri.page == idx?'class=active':''}"/>>
									<a href="/collectboard/listPage${pageMaker.makemcQuery(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="/collectboard/listPage${pageMaker.makemcQuery(pageMaker.endPage +1)}">&raquo;</a></li>
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
							url : '/collectboard/formsend',
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
							url : '/collectboard/formsend',
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
<!--// Content //-->

<%@ include file="../include/footer.jspf"%>