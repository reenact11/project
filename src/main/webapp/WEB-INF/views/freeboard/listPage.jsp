<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	padding: 0px 0px 0px 60%;
	justify-content: center;
	max-width: fit-content;
}

@media (min-width: 411px){
.search-bar {
	margin: auto;
	padding: 0px 0px 0px 3%;
	justify-content: center;
	max-width: fit-content;
}}


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
@media (max-width: 767px) {

.search-bar {
	margin: auto;
	padding: 0px 0px 0px 40%;
	justify-content: center;
	max-width: fit-content;
}

.search-bar, .search-bar input:focus, .search-bar input:valid {
	width: 65%;
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


	<!--// Main Section //-->
	<div class="ritekhela-main-section ritekhela-fixture-list-full">
		<div class="container">
			<div class="row">
				<form action="#">
					<input type="hidden" name="category" id="categoryInput"
						value="${cri.category}">
					<button class="ListButton all-list" id="all-list" type="submit"
						style="white-space: pre;">전체목록 보기</button>
				</form>

				<form action="#" class="search-bar">
					<input type="hidden" name="category" id="categoryInput"
						value="${cri.category}"> <input type="text" name="keyword"
						id="keywordInput" value="${cri.keyword }"
						placeholder="검색" required>
					<button class="search-btn" type="submit"></button>
				</form>


				<!--// Full Section //-->
				<div class="col-md-12">

					<div class="col-md-12">
						<!--// Gallery //-->
						<div>

							<ul class="row">
								<table>
									<tr style="width: 100%;">
										<th style="width: 15%;">글분류</th>
										<th>제목</th>
										<th style="width: 8%">조회수</th>
										<th style="width: 15%">작성일</th>
									</tr>
									<c:if test="${pageMaker.totalCount == 0}">
										<tr>
											<td colspan="4">게시글이 없습니다.</td>
										</tr>
									</c:if>
									<c:forEach items="${list}" var="BoardVO">

										<div>
											<tr>
												<td>${boardname}</td>
												<td><a
													href="/freeboard/read${pageMaker.makeQuery(pageMaker.cri.page)}&postno=${BoardVO.postno}&boardname=${boardname}">${BoardVO.posttitle}</a></td>
												<td>${BoardVO.readcnt}</td>
												<td><fmt:formatDate type="date"
														value="${BoardVO.postdate}" /></td>
											</tr>
										</div>
									</c:forEach>
								</table>
							</ul>
							<c:if
								test="${(pageMaker.cri.category eq 'Notice' && login.userrole eq '관리자') || pageMaker.cri.category ne 'Notice'}">
								<form
									action="/freeboard/write${pageMaker.makeQuery(pageMaker.cri.page)}"
									method="get">
									<input type="hidden" name="boardname" value="${boardname}">
									<input type="hidden" name="category"
										value="${pageMaker.cri.category}"> <input
										type="submit" value="글 작성" class="ListButton">
								</form>
							</c:if>


						</div>
						<!--// Gallery //-->
						<!--// Pagination //-->
						<div class="ritekhela-pagination">
							<ul>
								<c:if test="${pageMaker.prev}">
									<li><a
										href="/freeboard/listPage${pageMaker.makeQuery(pageMaker.startPage - 1)}">&laquo;</a></li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage}" var="idx">
									<li
										<c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
										<a href="/freeboard/listPage${pageMaker.makeQuery(idx)}">${idx}</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a
										href="/freeboard/listPage${pageMaker.makeQuery(pageMaker.endPage +1)}">&raquo;</a></li>
								</c:if>

							</ul>
						</div>
						<!-- 	// Pagination //
						
							<li><a href="#"><i class="fa fa-angle-left"></i></a></li> 
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#"><i class="fa fa-angle-right"></i></a></li> -->

					</div>

				</div>
				<!--// Full Section //-->

			</div>
		</div>
	</div>
	<!--// Main Section //-->

</div>

<script>
	$('.search-btn').on(
			"click",
			function(event) {
				event.preventDefault();
				self.location = "listPage" + '${pageMaker.makeQuery(1)}'
						+ "&keyword=" + $('#keywordInput').val();
				+"&category=" + $('#categoryInput').val();

			});

	$('.all-list').on(
			"click",
			function(event) {
				event.preventDefault();
				self.location = "listPage" + '${pageMaker.makeQuery(1)}'
						+ "&category=" + $('#categoryInput').val();

			});
</script>
<%-- <form id="Pageinfo">
	<input type='hidden' name="page" value="${pageMaker.cri.perPageNum}">
	<input type='hidden' name="perPageNum"
		value="${pageMaker.cri.perPageNum}">
</form>
<script>
	var result = '${msg}';

	if (result == 'WRITE SUCCESS') {
		alert("글이 작성되었습니다.");
	} else if (result == 'MODIFY SUCCESS') {
		alert("글이 수정되었습니다.");
	} else if (result == 'DELETE SUCCESS') {
		alert("글이 삭제되었습니다.");
	}
	$(".ritekhela-pagination li a").on("click", function(event) {

		event.preventDefault();

		var targetPage = $(this).attr("href");

		var Pageinfo = $("#jobForm");
		Pageinfo.find("[name='page']").val(targetPage);
		Pageinfo.attr("action", "/freeBoard/listPage").attr("method", "get");
		Pageinfo.submit();
	});
</script> --%>

<%@ include file="../include/footer.jspf"%>