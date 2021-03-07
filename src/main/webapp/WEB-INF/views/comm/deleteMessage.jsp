<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	alert("댓글이 성공적으로 삭제되었습니다");
	location.href="${pageContext.request.contextPath}/article/read.do?no=${postno}&pageNo=${articlePage.currentPage}";
</script>


