<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<%@ include file="../include/header.jspf" %>
        
        <!--// SubHeader //-->
        <div class="ritekhela-subheader">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1>비밀번호 변경</h1>
                        <ul class="ritekhela-breadcrumb">
                            <li>홈페이지</li>
                            <li>비밀번호 변경</li>
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
    <form action="${pageContext.request.contextPath}/pwchange/change" id="changepwd" method="post">
    <input type="hidden" name="useremail" value="${useremail}" >
      <div class="form-group has-feedback">
        <input type="text" name="AuthenticationUser" id="AuthenticationUser" class="form-control" placeholder="이메일 확인 후 인증번호 입력">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" name="userpw" id="pwd1" placeholder="비밀번호">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" id="pwd2" placeholder="비밀번호확인">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">변경</button>
        </div>
        
        <!-- /.col -->
      </div>
    </form>
       <script>
       		$("#changepwd").submit( function(e){
       			if ( $.trim($("#AuthenticationUser").val()) == "" ) {
       				alert("인증번호를 입력해주세요");
       				return false;
       			}
       			if ( $.trim($("#pwd1").val()) == "" ) {
       				alert("비밀번호를 입력해주세요");
       				return false;
       			}
       			if ( $.trim($("#pwd2").val()) == "" ) {
       				alert("비밀번호 확인을 입력해주세요");
       				return false;
       			}
       			if (($.trim($("#pwd1").val()) != $.trim($("#pwd2").val()))) {
       				alert("비밀번호가 일치하지 않습니다.");
       				return false;
       			}
       		});
       
       </script>
                            
                        </div>
                        <!--// Full Section //-->

                    </div>
                </div>
            </div>
            <!--// Main Section //-->

        </div>
        <!--// Content //-->


<%@ include file ="../include/footer.jspf"%>