<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	alert("댓글이 성공적으로 등록 되었습니다");
	location.href="${pageContext.request.contextPath}/freeboard/read?no=${postno}&pageNo=${articlePage.currentPage}";
</script>


