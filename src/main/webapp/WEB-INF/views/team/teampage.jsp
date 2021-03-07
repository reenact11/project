<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jspf" %>
        
        
        <style>
.filterDiv {
  display: none;
}

.show {
  display: block;
}

.containera {
  margin-top: 20px;
  overflow: hidden;
}

/* Style the buttons */
.btn {
  border: none;
  outline: none;
  padding: 12px 16px;
  background-color: #f1f1f1;
  cursor: pointer;
}

.btn:hover {
  background-color: #ddd;
}

.btn.active {
  background-color: #666;
  color: white;
}
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
        <!--// SubHeader //-->
        <div class="ritekhela-subheader">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1>팀 페이지</h1>
                        <ul class="ritekhela-breadcrumb">
                            <li><a href="/">홈페이지</a></li>
                            <li>팀 페이지</li>
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
                <div class="containera">
                    <div class="row">
                    
                    <div id="myBtnContainer">
                    <c:choose>
                    <c:when test="${login.userrole eq '팀장'}">
  <button style=width:20%; class="btn active" onclick="filterSelection('teampage')"> 팀 정보</button>
  </c:when>
  <c:otherwise>
  <button class="btn active" onclick="filterSelection('teampage')"> 팀 정보</button>
  </c:otherwise>
  </c:choose>
  <button class="btn" onclick="filterSelection('teammember')"> 팀원 정보</button>
  <button class="btn" onclick="filterSelection('teamreview')"> 팀 리뷰</button>
  
  <c:if test="${login.userrole == '팀장' || login.userrole == '관리자' }">
  <button class="btn" onclick="filterSelection('teamform')"> 받은 신청서</button>
  </c:if>
</div>
                        
                        <!--// Full Section //-->
                         <div class="containera">
                        <div class="col-md-12">
                        
                        <div class="filterDiv teampage">
                        <h1>팀 정보</h1>
                        <table border=2 style=width:100%;>
                            <tr><td style=width:15%;> 팀이름</td><td>${teaminfoMap.teaminfo.teamname }</td></tr>
                            <tr><td> 팀소개</td><td>${teaminfoMap.teaminfo.teamintro }</td></tr>
                            <tr><td> 활동지역</td><td>${teaminfoMap.teaminfo.teamloc }</td></tr>
                            <tr><td> 창립일</td><td><fmt:formatDate type="both" value="${teaminfoMap.teaminfo.teamdate }" /></td></tr>
                            <tr><td> 팀원 수</td><td>${teaminfoMap.teaminfo.teamcount } 명</td></tr>
                            </table>
                            <c:if test="${teaminfoMap.teaminfo.teamlogo ne null}">
                            <h1>팀 로고</h1>
                            <table>
                            <tr>
                            <td>
                            <img src="/displayFile?fileName=${teaminfoMap.teaminfo.teamlogo}"alt="">
                            </td>
                            </tr>
                            </table>
                            </c:if>
                            <table>
                            <tr>
                            <c:choose>
                            <c:when test="${login.userrole == '팀장' || login.userrole == '관리자'}">
                            <th>
                            <label><a href="${pageContext.request.contextPath}/team/teammodify">정보 수정</a></label>
                            </th>
                            <th>
                            <label><a href="${pageContext.request.contextPath}/team/teamdelete">팀 해체</a></label>
                            </th>
                            </c:when>
                            <c:otherwise>
                            <th>
                            <label><a href="${pageContext.request.contextPath}/team/teamquit" onclick="return confirm('정말로 탈퇴하시겠습니까?')" >팀 탈퇴</a></label>
                            </th>
                            </c:otherwise>
                            </c:choose>
                            </tr>
                            </table>
                            </div>
                            
                             <div class="filterDiv teammember">
                            <h1>팀원 정보</h1>
                            <table>
                            <tr>
                            <th>닉네임</th><th>포지션</th><th>나이</th><th style=width:30%;>지역</th><th>직책</th>
                            <c:if test="${login.userrole eq '팀장'}">
                            <th style=white-space:nowrap;>팀장위임</th>
                            </c:if>
                            </tr>
                            <c:forEach var="tm" items="${teaminfoMap.teammember}" >
                            <tr>
                            <c:if test="${teaminfoMap.teaminfo.teamcount == 1}">
                            <td colspan=6>소속된 팀원이 없습니다</td>
                            </c:if>
                            <c:if test="${tm.usernname != login.usernname}">
                            <form action="${pageContext.request.contextPath }/user/userinfo" method="get">
                            <td><input type=button name="usernname" value="${tm.usernname }" ></td>
                            </form>
                            <td>${tm.userposition }</td>
                            <td>${tm.userage }</td>
                            <td>${tm.userloc }</td>
                            <td>${tm.userrole }</td>
                            <c:if test="${login.userrole eq '팀장'}">
                            <form action="${pageContext.request.contextPath }/team/leaderchange" method="post">
                            <input type="hidden" name="usernname" value="${tm.usernname }" >
                            <td><button class="AdminButton" type="submit" onclick="return confirm('정말로 위임하시겠습니까?')"><i class="fas fa-exchange-alt"></i></button></td>
                            </form>
                            </c:if>
                            </c:if>
                            </tr>
                            </c:forEach>
                            </table>
                            </div>
                            
                             <div class="filterDiv teamreview">
                            <h1>팀 리뷰</h1>
                            <c:choose>
                            <c:when test="${teaminfoMap.avgbpm != 0}">
                            <li>팀 평균 BPM : ${teaminfoMap.avgbpm }</li>
                            </c:when>
                            <c:otherwise>
                            <li>팀 평균 BPM : 받은 리뷰가 없습니다.</li>
                            </c:otherwise>
                            </c:choose>
                            <table>
                            <tr>
                            <th style=width:8%;>BPM</th><th>리뷰 내용</th><th style=width:15%;>리뷰작성일</th>
                            </tr>
                            <c:forEach var="TR" items="${teaminfoMap.teamreview}" >
                            <div>
                            <tr>
                            <td>${TR.teambpm }</td>
                            <td>${TR.treview }</td>
                            <td><fmt:formatDate type="date"
														value="${TR.reviewdate}" /></td>
                            </tr>
                            </div>
                            </c:forEach>
                            </table>
                            </div>
                            
                             <div class="filterDiv teamform">
                            <c:if test="${login.userrole == '팀장' || login.userrole == '관리자' }">
                            <h1>신청 목록</h1>
                            <table>
                            <tr>
                            <th>글 분류</th><th>신청서 내용</th><th>신청자 닉네임<th>
                            </tr>
                            <c:forEach var="fl" items="${teaminfoMap.formlist}" >
                            <div>
                            <tr>
                            <td>${fl.category }</td>
                            <td>${fl.formcontent }</td>
                            <td><form action="${pageContext.request.contextPath }/user/userinfo" method="get">
                            <input type="submit" name="usernname" value="${fl.usernname }" >
                            </form></td>
                            <c:choose>
                            <c:when test="${fl.recruitstate=='O' }">
                            
                            <c:choose>
                            <c:when test="${fl.category != 'VSTeam' && fl.category != 'PlusGuest' }">			
                            <td style="display:flex;justify-content:space-evenly;">
                            <form action="${pageContext.request.contextPath }/collectboard/yes" method="post">
                            <input type="hidden" name="postuser" value="${fl.postuser }"> 
                            <input type="hidden" name="formno" value="${fl.formno }">
                            <input type="hidden" name="userno" value="${fl.userno}">
                            <input type="submit" value="수락">
                            </form>
                            <div class="divline" style="background-color:#000;width:1px;"></div>
                            <form action="${pageContext.request.contextPath }/collectboard/no" method="post">
                            <input type="hidden" name="formno" value="${fl.formno }">
                            <input type="submit" value="거절">
                            </form>
                            </td>
                            </c:when>
                            <c:otherwise>
                            <td style="display:flex;justify-content:space-evenly;">
                            <form action="${pageContext.request.contextPath }/matchboard/yes" method="post"><!-- begin 	VSTeam, PlusGuest 일 경우 실행-->
                             <input type="hidden" name="postno" value="${fl.postno }">
                            <input type="hidden" name="formno" value="${fl.formno }">
                            <input type="hidden" name="userno" value="${fl.userno}">
                            <input type="hidden" name="category" value="${fl.category}">
                            <input type="submit" value="수락">
                            </form>
                            <div class="divline" style="background-color:#000;width:1px;"></div>
                            <form action="${pageContext.request.contextPath }/matchboard/no" method="post">
                            <input type="hidden" name="formno" value="${fl.formno }">
                            <input type="hidden" name="postno" value="${fl.postno }">
                            <input type="hidden" name="userno" value="${fl.userno}">
                            <input type="hidden" name="category" value="${fl.category}">
                            <input type="submit" value="거절">
                            </form>
                            </td>
                            </c:otherwise>
                            </c:choose>
                            </c:when>
                            <c:when test="${fl.acheck=='O'}">
                            <td>리뷰 완료</td>
                            </c:when>
                            <c:otherwise>	<!--팀페이지에서 유정  -->
                            <c:choose>
                            <c:when test="${fl.category eq 'VSTeam' }">
                            <form action="${pageContext.request.contextPath }/matchboard/FromTtoT" method="get">
                            <input type="hidden" name="postuser" value="${fl.postuser }"> 
                            <input type="hidden" name="formno" value="${fl.formno }">
                            <input type="hidden" name="userno" value="${fl.userno}">
                            <td><input type="submit" value="리뷰 작성"></td>
                            </form>
                            </c:when>
                            <c:otherwise>
                            <form action="${pageContext.request.contextPath }/matchboard/FromTtoU" method="get">
                            <input type="hidden" name="postuser" value="${fl.postuser }"> 
                            <input type="hidden" name="formno" value="${fl.formno }">
                            <input type="hidden" name="userno" value="${fl.userno}">
                            <td><input type="submit" value="리뷰 작성"></td>
                            </form>
                            </c:otherwise>
                            </c:choose>
                            </c:otherwise>
                            
                            
                            
                            
                            </c:choose>
                            </tr>
                            </div>
                            </c:forEach>
                            </table>
                            </c:if>
                            </div>
                            
                        </div>
                        <!--// Full Section //-->

                    </div>
                </div>
            </div>
            <!--// Main Section //-->

        </div>
        </div>
        <!--// Content //-->
        
         <script>
        filterSelection("teampage")
        function filterSelection(c) {
  var x, i;
  x = document.getElementsByClassName("filterDiv");
  if (c == "all") c = "";
  for (i = 0; i < x.length; i++) {
    w3RemoveClass(x[i], "show");
    if (x[i].className.indexOf(c) > -1) w3AddClass(x[i], "show");
  }
}
function w3AddClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    if (arr1.indexOf(arr2[i]) == -1) {element.className += " " + arr2[i];}
  }
}

function w3RemoveClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    while (arr1.indexOf(arr2[i]) > -1) {
      arr1.splice(arr1.indexOf(arr2[i]), 1);     
    }
  }
  element.className = arr1.join(" ");
}

// Add active class to the current button (highlight it)
var btnContainer = document.getElementById("myBtnContainer");
var btns = btnContainer.getElementsByClassName("btn");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function(){
    var current = document.getElementsByClassName("active");
    current[0].className = current[0].className.replace(" active", "");
    this.className += " active";
  });
}
</script>


<%@ include file ="../include/footer.jspf"%>