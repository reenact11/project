<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jspf" %>
        
        <!--// SubHeader //-->
        <div class="ritekhela-subheader">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1>${teaminfo.teamname }의 팀페이지</h1>
                        <ul class="ritekhela-breadcrumb">
                            <li><a href="/">홈페이지</a></li>
                            <li>${teaminfo.teamname }의 팀페이지</li>
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
                            <ul>
                            <li>팀명 : ${teaminfo.teamname}</li>
                            <li>팀소개 : ${teaminfo.teamintro}</li>
                            <li>팀 활동지역 : ${teaminfo.teamloc}</li>
                            <li>팀원 수 : ${teaminfo.teamcount} 명</li>
                            <li>팀 생성일자 : <fmt:formatDate type="date" value="${teaminfo.teamdate}" /></li>
                            <c:choose>
                            <c:when test="${avgbpm != 0}">
                            <li>팀 평균 BPM : ${avgbpm }</li>
                            </c:when>
                            <c:otherwise>
                            <li>팀 평균 BPM : 받은 리뷰가 없습니다.</li>
                            </c:otherwise>
                            </c:choose>
                            </ul>
               
                        </div>
                        <!--// Full Section //-->

                    </div>
                </div>
            </div>
            <!--// Main Section //-->

        </div>
        <!--// Content //-->


<%@ include file ="../include/footer.jspf"%>