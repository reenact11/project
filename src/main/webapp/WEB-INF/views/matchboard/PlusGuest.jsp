%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jspf"%>

<!--// SubHeader //-->
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
						<ul class="row">
							<c:if test="${articlePage.hasNoArticles()}">
								<tr>
									<td colspan="4">게시글이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach items="${list}" var = "ArticleDTO">
								<li class="col-md-4">
									<figure>
									<c:choose>
									<c:when test="${ArticleDTO.recruitcheck && (login.userno != ArticleDTO.userno)}">
										<a data-fancybox-group="group" href="${pageContext.request.contextPath}/matchboard/Match?postno=${ArticleDTO.postno}">
											<img src="/resources/bootstrap/extra-images/SochingLogo.png" alt=""><i class="ritekhela-bgcolor">신청</i>
										</a>
										</c:when>
										<c:otherwise>
										<a data-fancybox-group="group" href="#">
											<img src="/resources/bootstrap/extra-images/SochingLogo.png" alt=""><i class="ritekhela-bgcolor">불가</i>
										</a>
										</c:otherwise>
										</c:choose>
											<%-- <h1>${article.postcontent}</h1> --%><br></br> <br></br>
										<figcaption>
											<form action="${pageContext.request.contextPath }/matchboard/Teaminfo" method="post">
                            				<td><input type=submit name="name" value="${ArticleDTO.teamname }" ></td>
                            				</form>
											<span class="ritekhela-bgcolor-two">제목 : ${ArticleDTO.posttitle}</span>
											<c:if test="${login.userno == ArticleDTO.userno}">
											<a href="${pageContext.request.contextPath}/matchboard/NewArticleFormModify?postno=${ArticleDTO.postno}"><span class="ritekhela-bgcolor-two">수정</span></a>
											<a href="${pageContext.request.contextPath}/matchboard/NewArticleFormDelete?postno=${ArticleDTO.postno}"><span class="ritekhela-bgcolor-two">삭제</span></a>
											</c:if>
											
										</figcaption>
									</figure>
									<h2>${ArticleDTO.postcontent}<br><br><span class="ritekhela-bgcolor-two">< 신청자수 : ${ArticleDTO.readcnt} 명 >< 모집상태 : ${ArticleDTO.recruitstate} ></span></h2>
								</li>
							</c:forEach>
						</ul>
						<c:if test="${login.userrole=='팀장' || login.userrole=='관리자' }">
						<form action="${pageContext.request.contextPath}/matchboard/NewArticleForm" method="get">
						<input type="hidden" value="${URL}" name="URL">
						<input type="hidden" value="${category}" name="category">
						<input type="submit" value="글 쓰기" class="ritekhela-bgcolor">
						</form>
						</c:if>
					</div>
					<!--// Gallery //-->
					<!--// Pagination //-->
					<c:if test="${articlePage.hasArticles()}">
					<div class="ritekhela-pagination">
						<ul>
							<c:if test="${articlePage.startPage > 5}">
								<li><a href="${pageContext.request.contextPath}/${URL}?pageNo=${articlePage.startPage - 5}"><i
										class="fa fa-angle-left"></i></a></li>
							</c:if>
							<c:forEach var="pNo" begin="${articlePage.startPage}"
								end="${articlePage.endPage}">
								<li><a href="${pageContext.request.contextPath}/${URL}?pageNo=${pNo}">[${pNo}]</a></li>
							</c:forEach>
							<c:if test="${articlePage.endPage < articlePage.totalPages}">
								<li><a href="${pageContext.request.contextPath}/${URL}?pageNo=${articlePage.startPage + 5}"><i
										class="fa fa-angle-right"></i></a></li>
							</c:if>
						</ul>
					</div>
					</c:if>
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

			</div>
		</div>
	</div>
	<!--// Main Section //-->

</div>
<!--// Content //-->

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