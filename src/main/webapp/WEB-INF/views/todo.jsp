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
<%!
	// 페이징 관련 변수들
	int writePages = 10;
%>
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

<!------ 페이징 AJAX 자바스크립트  ------>
<%-- <script>
$(document).ready(function(){
	$("input#page").val(1);  // 페이지 최초 로딩되면 1페이지로 기본 세팅
	loadPage(1)// page 읽어오기
	$("button#prev").click(function(){
		// 현재 페이지 정보
		var curPage = parseInt($("input#page").val());
		
		// 첫페이지였다면 ..
		if(curPage == 1){
			alert("첫 페이지입니다.");
			return;
		}
		
		// 첫페이지 아니라면 이전페이지 로딩
		loadPage(curPage - 1); 		
	});
	
	$("button#next").click(function(){
		// 현재페이지
		var curPage = parseInt($("input#page").val());
		loadPage(curPage + 1);   // 다음 페이지 로딩		
	});
});
function loadPage(page){	
	$.ajax({
		url : "${pageContext.request.contextPath}/todo/list/<%=mid%>/" + page,
		type : "GET",
		cache : false,
		success : function(data, status){
			if(status == "success"){			
				if(updateList(data)){ // 페이지 업데이트
					// 페이지 로딩이 성공한 뒤라야 현재 페이지 정보 업데이트
					$("input#page").val(page);
				}
			}
		}		
	});
} // end loadPage()
function updateList(jsonObj){
	result = "";
	
	if(jsonObj.status == "OK"){
	
		var count = jsonObj.count; // 글 개수
		var items = jsonObj.list;  // 글 목록
		var mid = <%= mid%>;
		var i;
		for(i = 0; i < count; i++){
			result += "<tr>\n";	
			result += "<td>" + items[i].mb_nn + "</td>\n";
			result += "<td>" + items[i].co_subject + "</td>\n";
			result += "<td>" + items[i].co_content + "</td>\n";			
			// Timestamp --> yyyy/MM/dd hh:mm:ss 로 표현
			var regDate = new Date(items[i].co_regdate);
			var strDate = regDate.getFullYear() + "." +
						(regDate.getMonth() + 1) + "." +     // +1 해추어어야 한다 
						regDate.getDate();		
			result += "<td>" +strDate + "</td>\n";
			result += "<td class='tdNotify'><button type='button' onclick='popUp(this.value)' class='tBtn notify' value='" + items[i].co_uid + "'>신고하기</button></td>"
			
			if(mb_uid == items[i].mb_uid){				
				result += "<td><button class='tBtn' value='"+ items[i].co_uid + "' onclick='goDelete(this.value)'>";
				result += "<i class='fas fa-times tBtn'></i></button></td>"
				result += "</tr>\n";
			} else{
				result +="<td></td>\n"
				result += "</tr>\n";
			}
		}
		
		$("table#list tbody").html(result); // 테이블 내용 업데이트
		return true;
	} else {
		return false;
	}
	
	return false;
}
</script> --%>
<script>
$(document).ready(function(){
	$(".act").click(function() {
		$("input[name=tid]:checked").each(function() {
			var tid = $(this).val();
		}
			
		$.ajax({
			url:"${pageContext.request.contextPath}/todo/goAct/<%=mid%>/tid",
			type:"POST",
			data: {
				"mid" : mid, 
				"tid" : tid,
			},
			cache:false,
			success:function(data, status){
				alert("할 일을 완료하셨군요!")
			}			
		});
	});
});
</script>
</head>
<body>

<div class="container">
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
          <a class="btn btn-primary float-right act" href="#">완료</a>
          <a class="btn btn-primary float-right mr-3 delete" href="#">삭제</a>
        </div>
		</form>
	</div>
</div>
<%
	}
%>
</body>
</html>
