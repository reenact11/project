<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jspf"%>

<!--// SubHeader //-->
<div class="ritekhela-subheader">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>전체 팀 관리</h1>
				<ul class="ritekhela-breadcrumb">
					<li><a href="/">홈페이지</a></li>
					<li>관리자 페이지</li>
					<li>전체 팀 관리</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!--// SubHeader //-->

<style>

.AdminButton {
	background:linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	background-color:#ffffff;
	border-radius:17px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-weight:bold;
	padding:1px 19px;
	text-decoration:none;
}
.AdminButton:hover {
	background:linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	background-color:#f6f6f6;
}
.AdminButton:active {
	position:relative;
	top:1px;
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

							<ul class="row">
								<table>
									<tr>
										<th>팀 번호</th>
										<th>팀명</th>
										<th>팀활동 지역</th>
										<th>팀생성 날짜</th>
										<th>팀탈퇴</th>
									</tr>
									<c:forEach var="tl" items="${teamlist}">
										<div>
											<tr>
												<td>${tl.teamno}</td>
												<td>${tl.teamname }</td>
												<td>${tl.teamloc}</td>
												<td><fmt:formatDate type="date" value="${tl.teamdate}"/></td>
												<form action="${pageContext.request.contextPath}/admin/teamdelete" method="post">
												<td style=width:6%;>
												<input type="hidden" name="teamno" value="${tl.teamno}">
												<button class="AdminButton" type="submit" onclick="return confirm('${tl.teamname}팀을 정말 삭제 시키시겠습니까?')"><i class="fas fa-eraser"></i></button>
												</td>
												</form>
											</tr>
										</div>
									</c:forEach>
								</table>
							</ul>
							
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

				</div>
				<!--// Full Section //-->

			</div>
		</div>
	</div>
	<!--// Main Section //-->

</div>
<!--// Content //-->


<%@ include file="../include/footer.jspf"%>