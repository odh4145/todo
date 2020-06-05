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
				<input type="checkbox" value="${list.tid}">
				<h3 class="post-subtitle">${list.title}</h3>
				<c:when test="${list.img != null }">
					<img src="${pageContext.request.contextPath}/img/${list.img}">
				</c:when>
				<p class="post-meta">${list.tdate }</p>
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
