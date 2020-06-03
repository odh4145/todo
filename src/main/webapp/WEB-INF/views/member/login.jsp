<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/common/menu"/>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>LogIn</title>
</head>
<body>
<div class="container">
	<div class="row">
	<div class="col-lg-6 col-md-10 mx-auto">
		<form name="login" id="contactForm" novalidate>
			<div class="control-group">
				<div class="form-group floating-label-form-group controls">
					<h5 class="l_title">ID</h5>
					<input type="text" class="form-control" id="id">
				</div>
			</div>
			<div class="control-group">
				<div class="form-group floating-label-form-group controls">
					<h5 class="l_title">Password</h5>
					<input type="password" class="form-control" id="pw">
				</div>
			</div>
			<br>
			<div id="success"></div>
			<div class="form-group login">
				<button type="submit" class="btn btn-primary" id="login">Login</button>
			</div>
		</form>
		<h6 class="join"><a href="">Do you want to join us?</a></h6>
	</div>
	</div>
</div>
</body>
</html>