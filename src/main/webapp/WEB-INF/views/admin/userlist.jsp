<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jspf"%>

<!--// SubHeader //-->
<div class="ritekhela-subheader">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>전체 유저 관리</h1>
				<ul class="ritekhela-breadcrumb">
					<li><a href="/">홈페이지</a></li>
					<li>관리자 페이지</li>
					<li>전체 유저 관리</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!--// SubHeader //-->


<style>
.AdminButton {
	background: linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	background-color: #ffffff;
	border-radius: 17px;
	border: 1px solid #dcdcdc;
	display: inline-block;
	cursor: pointer;
	color: #666666;
	font-family: Arial;
	font-weight: bold;
	padding: 1px 15px;
	text-decoration: none;
}

.AdminButton:hover {
	background: linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	background-color: #f6f6f6;
}

.AdminButton:active {
	position: relative;
	top: 1px;
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
										<th style=width:5%;>no</th>
										<th style=width:17%;>닉네임</th>
										<th style=width:8%;>이름</th>
										<th style=width:9%;>잠금상태</th>
										<th style=width:12%;>가입일자</th>
										<th style=width:5%;>잠금/해제</th>
										<th style=width:5%;>계정탈퇴</th>
									</tr>
									<c:forEach var="ul" items="${userlist}">
										<div>
											<tr>
												<td>${ul.userno}</td>
												<td>${ul.usernname }</td>
												<td>${ul.username}</td>
												<td>${ul.userlock}</td>
												<td><fmt:formatDate type="date" value="${ul.userdate}" /></td>
												<c:choose>
													<c:when test="${ul.userlock =='N'}">
													<td style="width: 6%;">
														<form
															action="${pageContext.request.contextPath}/admin/userlock"
															method="get">
															<input type="hidden"
																name="userno" value="${ul.userno}"> <input
																type="hidden" name="userlock" value="${ul.userlock}">
																<%-- <input type="submit" value="계정잠금" onclick="return confirm('${ul.username}회원을 정말 계정잠금 하시겠습니까?')"> --%>
																<button class="AdminButton" type="submit"
																	onclick="return confirm('${ul.username}회원을 정말 계정잠금 하시겠습니까?')">
																	<i class="fas fa-lock"></i>
																</button>
														</form>
														</td>
													</c:when>
													<c:otherwise>
													<td>
														<form
															action="${pageContext.request.contextPath}/admin/userlock"
															method="post">
															<input type="hidden" name="userno"
																value="${ul.userno}"> <input type="hidden"
																name="userlock" value="${ul.userlock}">
																<button class="AdminButton" type="submit"
																	onclick="return confirm('${ul.username}회원을 정말 잠금해제 하시겠습니까?')">
																	<i class="fas fa-lock-open"></i>
																</button>
														</form>
														</td>
													</c:otherwise>
												</c:choose>
												<td style="width: 6%">
												<form action="${pageContext.request.contextPath}/admin/userdelete" method="post">
													<input type="hidden"
														name="userno" value="${ul.userno}">
														<button class="AdminButton" type="submit"
															onclick="return confirm('${ul.username}회원을 정말 계정탈퇴 시키시겠습니까?')">
															<i class="fas fa-user-slash"></i>
														</button>
												</form>
												</td>
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