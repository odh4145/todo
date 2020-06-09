<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	int mid = 0;
	if(session.getAttribute("mid") != null){
		mid = (int)session.getAttribute("mid");
	}
%>
<c:if test="${result == 0}">
	<script>
		alert("추가 실패");
		history.back();
	</script>
</c:if>
<c:if test="${result == 1}">
	<script>
		alert("할 일이 추가되었습니다.");
		location.href = "${pageContext.request.contextPath}/list/<%=mid%>";
	</script>
</c:if>