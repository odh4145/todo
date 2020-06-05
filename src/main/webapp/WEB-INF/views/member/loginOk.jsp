<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	int mid = 0;
	if(session.getAttribute("mid") != null){
		mid = (int)session.getAttribute("mid");
	}
%>
<c:choose>
	<c:when test="${result == 1}">
		<script>
			alert("로그인 성공");
			location.href="${pageContext.request.contextPath}/list/<%=mid%>";
		</script>
	</c:when>

	<c:when test="${result == 2}">
		<script>
			alert("잘못된 비밀번호입니다.");
			history.back();
		</script>
	</c:when>

	<c:when test="${result == 3}">
		<script>
			alert("아이디가 존재하지 않습니다.");
			history.back();
		</script>
	</c:when>

	<c:otherwise>
		<script>
			alert("로그인 실패");
			history.back();
		</script>
	</c:otherwise>
</c:choose>