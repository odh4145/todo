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
<script>
$(read)
function todoInsert() {
	frm = document.forms["frm"];
	var title = frm["title"].value.trim();
	if(title == ""){
		alert("할 일을 입력해주세요.");
	    frm["title"].focus();
	    
	    return false;
	} else{
		return true;
	}   	
}
</script>
</head>
<body>

<div class="container">
	<div class="row mb-3">
		<form name="frm" class="col-lg-8 col-md-10 mx-auto" 
			action="${pageContext.request.contextPath}/insertOk" onsubmit="return todoInsert()">
		<button class="btn btn-primary" type="submit">할 일 추가</button>
		<input type="hidden" value="<%=mid%>" name="mid" id="nid">
			<div class="control-group">
				<div class="form-group floating-label-form-group controls pb-2 pt-2">
					<input type="text" placeholder="나의 할 일은?" name="title" id="title">
				</div>
				<div class="form-group floating-label-form-group controls pb-2 pt-2">
					<input type="file" name="img" id="img">
				</div>
			</div>	
		</form>
	</div>
	
	<div class="row mb-5">	
		<form class="col-lg-8 col-md-10 mx-auto">
		<c:forEach var="dto" items="${list}">
			<div class="post-preview">
				<input name="tid" type="checkbox" value="${dto.tid}">
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
          	formaction="${pageContext.request.contextPath}/goAct/<%=mid %>/" value="완료">
          <input class="btn btn-primary float-right mr-3" type="submit"
          	formaction="${pageContext.request.contextPath}/goDelete/<%=mid %>/" value="삭제">
        </div>
		</form>
	</div>
</div>
</body>
</html>
