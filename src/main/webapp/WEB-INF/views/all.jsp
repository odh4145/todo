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
<%
	int mid = 0;
	if(session.getAttribute("mid") != null){
		mid = (int)session.getAttribute("mid");
	}
%>
</head>
<body>
<!-- Page Header -->
<header class="masthead" style="background-image: url('${pageContext.request.contextPath}/img/home-bg.jpg')">
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<div class="site-heading">
					<h1>All List</h1>
					<span class="subheading">Check your all list</span>
				</div>
			</div>
		</div>
	</div>
</header>

<div class="container">	
	<div class="row mb-5">	
		<form class="col-lg-8 col-md-10 mx-auto">
		<c:forEach var="dto" items="${list}">
			<div class="post-preview">
				<input name="tid" type="checkbox" value="${dto.tid}">
				<c:choose>
					<c:when test="${dto.act == 1 }">
						<h6 class="complete">완료된 일입니다.</h6>
					</c:when>
				</c:choose>
				<h5 class="post-subtitle mt-2">${dto.title}</h5>
				<c:choose>
					<c:when test="${dto.img != null }">
						<img src="${pageContext.request.contextPath}/img/${dto.img}">
					</c:when>
				</c:choose>
				<hr>
			</div>
		</c:forEach>
		<div class="clearfix">
          <input class="btn btn-primary float-right" type="submit"
          	formaction="${pageContext.request.contextPath}/goDelete/<%=mid %>/" value="삭제">
        </div>
		</form>
	</div>
</div>
</body>
</html>
