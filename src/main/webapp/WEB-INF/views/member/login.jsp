<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/common/menu"/>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Todo LogIn</title>

<script>
function chkSubmit(){
	frm = document.forms["frm"];
	var mem_id = frm["id"].value.trim();
	if(mem_id == ""){
		alert("아이디를 입력해주세요");
	    frm["id"].focus();
	    return false;
	}
	
	var mem_pw = frm["pw"].value.trim();
	if(mem_pw == ""){
		alert("비밀번호를 입력해주세요");
	    frm["pw"].focus();
	    return false;
	} 
   	
   	return true;
}
</script>
</head>

<body>
<%
	int mid = 0;
	if(session.getAttribute("mid") != null){
		mid = (int)session.getAttribute("mid");
	}
%>
<%
	if(mid != 0) {
%>
<script>
	alert("비정상적 접근입니다.");
	history.back();
</script>
<%
	} else {
%>
<header class="masthead" style="background-image: url('${pageContext.request.contextPath}/img/home-bg.jpg')">
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<div class="site-heading">
					<h1>Login</h1>
					<span class="subheading">Enter your ID & password</span>
				</div>
			</div>
		</div>
	</div>
</header>

<div class="container mb-4">
	<div class="row">
	<div class="col-lg-6 col-md-10 mx-auto">
		<form name="frm" action="${pageContext.request.contextPath}/loginOk" method="post" onsubmit="return chkSubmit()">
			<div class="control-group">
				<div class="form-group floating-label-form-group controls">
					<h5 class="l_title">ID</h5>
					<input type="text" class="form-control" name="id" id="id">
				</div>
			</div>
			<div class="control-group">
				<div class="form-group floating-label-form-group controls">
					<h5 class="l_title">Password</h5>
					<input type="password" class="form-control" name="pw" id="pw">
				</div>
			</div>
			<br>
			<div id="success"></div>
			<div class="form-group login">
				<button type="submit" class="btn btn-primary" id="login">Login</button>
			</div>
		</form>
		<h6 class="join"><a href="${pageContext.request.contextPath}/join">Do you want to join us?</a></h6>
	</div>
	</div>
</div>
<%
	}
%>
</body>
</html>