<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
        
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

            <!--// Main Section //-->
            <div class="ritekhela-main-section ritekhela-fixture-list-full">
                <div class="container">
                    <div class="row">
                    
                    <div id="myBtnContainer">
  <button class="btn active" onclick="filterSelection('mypage')"> 내 정보</button>
  <button class="btn" onclick="filterSelection('review')"> 내가 받은 리뷰</button>
  <button class="btn" onclick="filterSelection('form')"> 내가 쓴 신청서</button>
</div>
                        
                        <!--// Full Section //-->
                        <div class="containera">
                        <div class="col-md-12">
                        <div class="filterDiv mypage">
                        <table border=2 style=width:100%;>
                        <h1>내 정보</h1>
                            <tr><td style=width:15%;>아이디</td><td>${mypage.myinfo.userid}</td></tr>
                            <tr><td>이름</td><td>${mypage.myinfo.username}</td></tr>
                            <tr><td>닉네임</td><td>${mypage.myinfo.usernname}</td></tr>
                            <tr><td>이메일</td><td>${mypage.myinfo.useremail}</td></tr>
                            <tr><td>나이</td><td>${mypage.myinfo.userage}세</td></tr>
                            <tr><td>성별</td><td>${mypage.myinfo.usergender}</td></tr>
                            <tr><td>전화번호</td><td>${mypage.myinfo.usertel}</td></tr>
                            <tr><td>거주지</td><td>${mypage.myinfo.userloc}</td></tr>
                            <tr><td>포지션</td><td>${mypage.myinfo.userposition}</td></tr>
                            <tr><td>자기소개</td><td>${mypage.myinfo.userintro}</td></tr>
                            <tr><td>가입일</td><td><fmt:formatDate type="both" value="${mypage.myinfo.userdate}"/></td></tr>
                            </tr>
                            </table>
                            <table>
                            <tr>
                            <th>
                            <label><a href="${pageContext.request.contextPath}/user/mymodify">정보 수정</a></label>
                            </th>
                            <th>
                            <label><a href="${pageContext.request.contextPath}/user/mydelete" type="submit" onclick="return confirm('정말로 탈퇴하시겠습니까?')">회원 탈퇴</a></label>
                            </th>
                            </tr>
                            </table>
                            </div>
                            
                            <div class="filterDiv review">
                            <h1>개인 리뷰</h1>
                            <c:choose>
                            <c:when test="${mypage.avgbpm != 0}">
                            <li>평균 BPM : ${mypage.avgbpm }</li>
                            </c:when>
                            <c:otherwise>
                            <li>평균 BPM : 받은 리뷰가 없습니다.</li>
                            </c:otherwise>
                            </c:choose>
                            <table>
                            <tr>
                            <th style=width:8%;>BPM</th><th>리뷰 내용</th><th style=width:15%;>리뷰 작성일</th>
                            </tr>
                            <c:forEach var="UR" items="${mypage.userreview}" >
                            <div>
                            <tr>
                            <td>${UR.userbpm }</td>
                            <td>${UR.ureview }</td>
                            <td><fmt:formatDate type="date" value="${UR.reviewdate}"/></td>
                            </tr>
                            </div>
                            </c:forEach>
                            </table>
                            </div>
                            
                            <div class="filterDiv form">
                            <h1>나의 신청 목록</h1>
                            <table>
                            <tr>
                            <th style=width:15%;>글 분류</th><th style=width:70%;>게시글 제목</th>
                            </tr>
                            <c:forEach var="mf" items="${mypage.myformlist}" >
                            <div>
                            <tr>
                            <td>${mf.category }</td>
                            <td>${mf.posttitle }</td>
                            <c:choose>
                            <c:when test="${mf.recruitstate == 'O' }">
                            <td>수락 대기</td>
                            </c:when>
                            <c:when test="${mf.bcheck == 'O' }">
                            <td>리뷰 완료</td>
                            </c:when>
                            <c:otherwise>
                            <form action="${pageContext.request.contextPath }/matchboard/FromUtoT" method="get">
                            <input type="hidden" name="postuser" value="${mf.postuser }">
                            <input type="hidden" name="formno" value="${mf.formno }">
                            <input type="hidden" name="userno" value="${mf.userno}">
                            <td><input type="submit" value="리뷰 작성"></td>
                            </form>
                            </c:otherwise>
                            </c:choose>
                            </tr>
                            </div>
                            </c:forEach>
                            </table>
                            </div>
                        </div>
                        </div>
                        <!--// Full Section //-->

                    </div>
                </div>
            </div>
            <!--// Main Section //-->

        </div>
        <!--// Content //-->
        
        <script>
        filterSelection("mypage")
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