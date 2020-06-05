<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${result == 0}">
	<script>
		alert("가입 실패");
		history.back();
	</script>
</c:if>
<c:if test="${result == 1}">
	<script>
		alert("가입하신 아이디로 로그인 해주세요.");
		location.href = "${pageContext.request.contextPath}/login";
	</script>
</c:if>