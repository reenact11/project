<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf" %>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
        
        <!--// SubHeader //-->
        <div class="ritekhela-subheader">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1>마이 페이지</h1>
                        <ul class="ritekhela-breadcrumb">
                            <li><a href="/">홈페이지</a></li>
                            <li>마이 페이지</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!--// SubHeader //-->

        <!--// Content //-->
        <div class="ritekhela-main-content">
<style>

    #name,#nickname,#email,#userage,#tel,#loc {
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

    #intro {
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
                        <form role="form" id="mymodify"method="post">
                   	<input type="hidden" name="userid" value="${mypage.userid }">
                    <input type="text" name="username" id="name" value="${mypage.username}" placeholder="이름">
                    <input type="text" name="usernname" id="nickname" value="${mypage.usernname}" placeholder="닉네임">
                    <input type="email" name="useremail" value="${mypage.useremail}" id="email"placeholder="이메일">
                    <select id="userage" name="userage" >
                    <option>나이</option>
                    <% for (int i = 1; i < 100; i++) { %>
                    <option value="<%=i%>"><%=i%>세</option>
                     <% } %>
                    </select>
                    
                <div id="radio">    
                    성별 : 
                    <input type="radio" name="usergender" value="M" checked> 남자
                    <input type="radio" name="usergender" value="F"> 여자<br>
                </div>  
                    <input type="text" name="usertel" id="tel" value="${mypage.usertel}">
                    <input type="text" name="userloc" id="loc" value="${mypage.userloc}">
                 <div id="radio">     
                    포지션 : 
                    <input type="radio" name="userposition" value="FW"> FW
                    <input type="radio" name="userposition" value="DF"> DF
                    <input type="radio" name="userposition" value="MF"> MF
                    <input type="radio" name="userposition" value="GK"> GK
                    <input type="radio" name="userposition" value="ALL" checked> ALL
                </div>  
                	<textarea id="intro" name="userintro" placeholder="자기소개">${mypage.userintro}</textarea>
                	
                    
                    <button type="submit" class="ListButton">정보 수정</button>
                </form>
                        </div>
                        <!--// Full Section //-->

                    </div>
                    
                    <script>
       		$("#mymodify").submit( function(e){
       			if (($.trim($("#name").val()) == "")) {
       				alert("이름을 입력하여 주세요");
       				return false;
       			}
       			if (($.trim($("#nickname").val()) == "")) {
       				alert("닉네임을 입력하여 주세요");
       				return false;
       			}
       			if (($.trim($("#email").val()) == "")) {
       				alert("이메일을 입력하여 주세요");
       				return false;
       			}
       			if (($.trim($("#userage").val()) == "나이")) {
       				alert("나이를 입력하여 주세요");
       				return false;
       			}
       			if (($.trim($("#tel").val()) == "")) {
       				alert("전화번호를 입력하여 주세요");
       				return false;
       			}
       			if (($.trim($("#loc").val()) == "")) {
       				alert("거주지를 입력하여 주세요");
       				return false;
       			}
       			if (($.trim($("#intro").val()) == "")) {
       				alert("자기소개를 입력하여 주세요");
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