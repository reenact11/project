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
                        <h1>리뷰 작성</h1>
                        <ul class="ritekhela-breadcrumb">
                            <li><a href="/">홈페이지</a></li>
                            <li>리뷰 작성</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!--// SubHeader //-->

        <!--// Content //-->
        <div class="ritekhela-main-content">
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


    #select {
    float: left;
    width: 100%;
    background-color: rgba(0,0,0,0.20);
    color: rgba(120,120,120,1);/* #999999; */
    padding: 5px 20px;
    border: none;
    height: 45px;
    margin-bottom: 12px;
    vertical-align: middle ;
}
    #treview {
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
                    <form role="form" id="review" method="post">
                    <input type="hidden" name="teamno" value="${TtoT.teamno}">
                   	<input type="hidden" name="formno" value="${TtoT.formno}">
                	<select id="select" name="teambpm">
                    <option>평점</option>
                    <% for (int i = 40; i <= 140; i+=10) { %>
                    <option value="<%=i%>"><%=i%>bpm</option>
                     <% } %>
                    </select>
                    <textarea id="treview" name="treview" placeholder="리뷰를 작성해 주세요"></textarea>
                	<button type="submit" class="ListButton">리뷰 전송</button>
                </form>
                        </div>
                        <!--// Full Section //-->

                    </div>
                    
                    <script>
       		$("#review").submit( function(e){
       			if (($.trim($("#treview").val()) == "")) {
       				alert("리뷰를 입력하여 주세요");
       				return false;
       			}
       			if (($.trim($("#select").val()) == "평점")) {
       				alert("평점을 입력하여 주세요");
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