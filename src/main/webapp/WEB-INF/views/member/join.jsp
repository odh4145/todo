<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/common/menu"/>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Todo Join</title>

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

<script>
$(document).ready(function(){
// 아이디 중복 체크
	$("#id").blur(function() {
		var id = $('#id').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/member/idCheck?id='+ id,
			type : 'get',
			success : function(data) {	
				console.log(data);
				if (data == 1) {
					$("#id_check").text("이미 사용중인 아이디입니다.");
					$("#id_check").css("color", "red");
					$("#login").attr("disabled", true);
				} else{
					$("#id_check").text("사용가능한 아이디입니다.");
					$("#id_check").css("color", "red");
					$("#login").attr("disabled", false);
				}
			}
		});
	});

//비밀번호 확인
	$("#pw2").blur(function(){	
		
		var pw = $('#pw').val();
		var pw2 = $('#pw2').val();
		
		$.ajax({
			url: "${pageContext.request.contextPath}/member/pwCheck?pw=" + pw + "&pw2=" + pw2,
			type:"GET",
			success:function(data){
				console.log(data);
				
				if(pw != pw2 || pw == "" || pw2 == ""){
					$("#pw_check").text("비밀번호가 다릅니다.");
					$("#pw_check").css("color","red");
					$("#login").attr("disabled", true);
				} else {
					$("#pw_check").text("비밀번호 확인 완료");
					$("#pw_check").css("color","red");
					$("#login").attr("disabled", false);
				}
				
			}
		
		})
		
	});
});
</script>
</head>

<body>
<header class="masthead" style="background-image: url('${pageContext.request.contextPath}/img/home-bg.jpg')">
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<div class="site-heading">
					<h1>Join</h1>
					<span class="subheading">Let's together our service</span>
				</div>
			</div>
		</div>
	</div>
</header>

<div class="container mb-4">
	<div class="row">
	<div class="col-lg-6 col-md-10 mx-auto">
		<form name="frm" action="${pageContext.request.contextPath}/joinOk" method="post" onsubmit="return chkSubmit()">
			<div class="control-group">
				<div class="form-group floating-label-form-group controls">
					<h5 class="l_title">아이디</h5>
					<input type="text" class="form-control" name="id" id="id">
					<h6 class="check_font" id="id_check"></h6>
				</div>
			</div>
			<div class="control-group">
				<div class="form-group floating-label-form-group controls">
					<h5 class="l_title">비밀번호</h5>
					<input type="password" class="form-control" name="pw" id="pw">
				</div>
			</div>
			<div class="control-group">
				<div class="form-group floating-label-form-group controls">
					<h5 class="l_title">비밀번호 확인</h5>
					<input type="password" class="form-control" name="pw2" id="pw2">
					<h6 class="check_font" id="pw_check"></h6a>
				</div>
			</div>
			<br>
			<div id="success"></div>
			<div class="form-group login">
				<button type="submit" class="btn btn-primary" id="login">Join</button>
			</div>
		</form>
	</div>
	</div>
</div>
</body>
