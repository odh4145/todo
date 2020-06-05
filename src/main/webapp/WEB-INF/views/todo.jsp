<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<jsp:include page="/common/menu"/>

<html>
<head>
<meta charset="UTF-8">
<title>Todo</title>
</head>
<body>
<%
	int mid = 0;
	if(session.getAttribute("mid") != null){
		mid = (int)session.getAttribute("mid");
	}
%>
<%
	if(mid == 0){
%>
	<h3 class="center">로그인 후 이용가능합니다.</h3>
<%
	} else{
%>
<div class="container">
	<div class="row">
		<div class="col-lg-8 col-md-10 mx-auto">
		<c:forEach var="dto" items="${list}">
			<div class="post-preview">
				<input type="checkbox" value="${dto.tid}">
				<h5 class="post-subtitle mt-2">${dto.title}</h5>
				<c:choose>
				<c:when test="${dto.img != null }">
					<img src="${pageContext.request.contextPath}/img/${dto.img}">
				</c:when>
				</c:choose>
				<hr>
			</div>
		</c:forEach>
		</div>
	</div>
</div>
<%
	}
%>
</body>
</html>
