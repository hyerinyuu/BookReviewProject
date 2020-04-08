<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${rootPath}/css/modal-box.css?ver=2020-01-31-003" rel="stylesheet"/>
<title>나의 홈페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
 <script>
 	
 $(function(){
	 
	$("#btn-save").click(function(){
		
		 // 도서코드를 입력하지 않고 저장못하게 막아주기
		 if($("#rb_bcode").val() == ""){
			alert("도서코드는반드시 입력하셔야합니다.")
			// 도서코드폼에 focus
			$("#rb_bcode").focus()
			return false
		 }
		 
		 // 독서시간의 default가 0으로 세팅된 상태라서
		 // val == "" 식으로 조건을 걸어도 저장되는 상황이므로
		 // parseInt를 이용하여 문자열 -> 숫자로 변환해 독서시간이 1이하면 알람이 뜨도록 세팅
		 if(parseInt($("#rb_rtime").val()) < 1){
			 alert("독서시간은 반드시 입력하셔야합니다.")
			 return false
		 }		 
			 
		 // btn-save의 type을 button으로 바꿔서 
		 // button을 클릭하면 submit을 수행하도록 script작성
		 $("form").submit()
	
	})
	
	// update 수행시나 사용자가 입력한 값을 바꾸려고 시도할때
	// 클릭 한번만 하면 내용 전체 블럭을 설정해 사용자 배려 
	$("#rb_bname, #rb_rtime").focus(function(){
		$(this).select()
	})
	
	// rb_bname에 값을 입력하고 enter를 누르면 modal box가 뜨는 이벤트 걸어줌
	$("#rb_bname").keypress(function(event){
		
		if(event.keyCode == 13){
			// input값에 들어가야하므로 .text()가 아니고 .val()을 사용해줘야함
			let strText = $(this).val()
			// 검색어를 입력하지 않으면
			if(strText == ""){
				alert("도서 이름을 입력하신 후 Enter를 입력하세요!")
				return false
			}
			
			// 검색어를 입력하고 enter를 누르면 modal box가 뜨도록 세팅
			$("#modal-box").css('display', 'block')
			
			$.post("${rootPath}/books/search", {strText:strText}, function(result){
				$("#modal-content").html(result)
			})
		}	
	})
	
	$("#modal-header span").click(function(){
		$("#modal-box").css('display', 'none')
	})
	 
 })
 
 </script>
<style>

	.form-group{
	
		border: 1px solid green;
		border-radius: 5px;
		margin: 0 auto;
		padding: 2rem;
	}

</style>
</head>
<body>

<%@ include file="/WEB-INF/views/include/include-header.jsp" %>

<h3>독서록추가</h3>
<hr/>
<br/>
<div class="form-group">
	<form:form modelAttribute="rbDTO" autocomplete="on" class="book-form">
	
		<label for="rb_bcode">ISBN</label>
		<form:input path="rb_bcode" class="form-control"/><br/>
		
		<label for="rb_bname">도서명</label>
		<form:input path="rb_bname" class="form-control" placeholder="도서명을 입력하시고 Enter를 입력하세요"/><br/>
		
		<label for="rb_date">독서일자</label>
		<form:input path="rb_date" class="form-control" placeholder="독서일자를 입력하세요"/><br/>
		
		<label for="rb_stime">독서시작시간</label>
		<form:input path="rb_stime" class="form-control" placeholder="독서일자를 입력하세요"/><br/>
		
		<label for="rb_rtime">독서시간</label>
		<form:input type="number" path="rb_rtime" class="form-control" placeholder="독서일자를 입력하세요"/><br/>
		
		<label for="rb_subject">한줄소감</label>
		<form:input path="rb_subject" class="form-control" placeholder="한줄 감상평을 입력하세요"/><br/>
		
		<label for="rb_text">긴줄소감</label>
		<form:textarea path="rb_text" class="form-control" placeholder="소감을 입력하세요"/><br/>
		
		<label for="rb_star">별점</label>
		<form:input type="number" path="rb_star" class="form-control" placeholder="별점을 입력하세요"/><br/>
	
		<button type="reset" class="btn btn-outline-warning btn-block">새로작성</button>
		<button type="button" id="btn-save" class="btn btn-outline-primary btn-block">저장</button>
		
	</form:form>
</div>	

<div id="modal-box">
	<div id="modal-header">
		<span>&times;</span>
	</div>
	
	<div id="modal-content">
	</div>

</div>

</body>
</html>