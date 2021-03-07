<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf" %>
        
        <!--// SubHeader //-->
        <div class="ritekhela-subheader">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1>${userinfo.usernname }의 페이지</h1>
                        <ul class="ritekhela-breadcrumb">
                            <li><a href="/">홈페이지</a></li>
                            <li>${userinfo.usernname }의 페이지</li>
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
                            <li>닉네임 : ${userinfo.usernname}</li>
                            <li>나이 : ${userinfo.userage}세</li>
                            <li>성별 : ${userinfo.usergender}</li>
                            <li>거주지 : ${userinfo.userloc}</li>
                            <li>포지션 : ${userinfo.userposition}</li>
                            <li>자기소개 : ${userinfo.userintro}</li>
                            <c:choose>
                            <c:when test="${avgbpm != 0}">
                            <li>평균 BPM : ${avgbpm }</li>
                            </c:when>
                            <c:otherwise>
                            <li>평균 BPM : 받은 리뷰가 없습니다.</li>
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