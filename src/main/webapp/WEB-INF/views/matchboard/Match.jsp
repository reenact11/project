<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>		<!-- 경로설정하기 -->
<%@ include file="../include/header.jspf" %>


        <div class="ritekhela-subheader">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1>${boardname }</h1>
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
<style>

    #title {
    float: left;
    width: 100%;
    background-color: rgba(0,0,0,0.20);
    color: rgba(120,120,120,1);/* #999999; */
    padding: 22px 22px;
    border: none;
    height: 30px;
    margin-bottom: 12px;
    vertical-align: middle !important;
}

    #content {
    float: left;
    width: 100%;
    background-color: rgba(0,0,0,0.20);
    color: rgba(120,120,120,1);/* #999999; */
    padding: 10px 20px 5px 20px;
    border: none;
    height: 140px;
    margin-bottom: 12px;
    vertical-align: middle !important;
}
</style>
            <!--// Main Section //-->
            <div class="ritekhela-main-section ritekhela-fixture-list-full">
                <div class="container">
                    <div class="row">
                        
                        
                        <div class="col-md-12">
                        <form action="${pageContext.request.contextPath}/matchboard/Match" id="write" method="post">
                   <%-- 	<input type="hidden" name="category" value="${category}"> --%>
                    <input type="hidden" name="postno" value="${postno}">
                   	<input type="hidden" name="URL" value="${URL}">
                    <textarea id="content" name="postcontent" placeholder="신청서를 작성 해 주세요"></textarea>
                	
                    
                    <input type="submit" value="신청하기" class="ritekhela-bgcolor">
                </form>
                        </div>
                        <!--// Full Section //-->

                    </div>
                    
                    <script>
       		$("#write").submit( function(e){
       			if (($.trim($("#content").val()) == "")) {
       				alert("내용을 입력하여 주세요");
       				return false;
       			}
       		});
       
       </script>
                </div>
            </div>
            <!--// Main Section //-->

        </div>
        <!--// Content //-->
<%@ include file ="../include/footer.jspf"%>