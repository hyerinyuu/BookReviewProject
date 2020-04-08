<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 홈페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script>
$(function(){

	$("#btn-save").click(function(){
		
		 // 도서코드를 입력하지 않고 저장못하게 막아주기
		 if($("#b_code").val() == ""){
			alert("도서코드는 반드시 입력하셔야합니다.")
			// 도서코드폼에 focus
			$("#b_code").focus()
			return false
		 }
		 
		 // 도서코드를 입력하지 않고 저장못하게 막아주기
		 if($("#b_name").val() == ""){
			alert("도서명은 반드시 입력하셔야합니다.")
			// 도서코드폼에 focus
			$("#b_name").focus()
			return false
		 }
			 
		 // btn-save의 type을 button으로 바꿔서 
		 // button을 클릭하면 submit을 수행하도록 script작성
		 $("form").submit()
	
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

<div class="form-group">
	<form:form modelAttribute="bDTO" autocomplete="on" class="book-form">
	
		<label for="b_code">도서코드</label>
		<form:input path="b_code" class="form-control" id="b_code" placeholder="도서코드를 nnn-nn-nnnn-nnn-n 형식으로 입력하세요"/><br/>
		
		<label for="b_name">도서명</label>
		<form:input path="b_name" class="form-control" id="b_name" placeholder="도서명을 입력하세요"/><br/>
		
		<label for="b_auther">저자</label>
		<form:input path="b_auther" class="form-control" placeholder="저자를 입력하세요"/><br/>
		
		<label for="b_comp">출판사</label>
		<form:input path="b_comp" rows="5" class="form-control" placeholder="출판사를 입력하세요"/><br/>
		
		<label for="b_year">발행일</label>
		<form:input path="b_year" class="form-control" placeholder="발행일을 입력하세요"/><br/>
		
		<label for="b_iprice">가격</label>
		<form:input path="b_iprice" type="number" class="form-control" default = "0" placeholder="가격을 입력하세요"/><br/>
	
		<button type="reset" class="btn btn-outline-warning btn-block">새로작성</button>
		<button type="button" id="btn-save" class="btn btn-outline-primary btn-block">저장</button>
		
	</form:form>
</div>	
 <script>
 	
 $(function(){
	 
 })
 
 </script>
 
<!--   
<section class="col-lg-4 col-md-5 col-sm-11">

	<form class="was-validated" method="POST" enctype="multipart/form-data" action="${rootPath}/books/insert">

	<div class="form-box">
		<div class="form-group">
		
			<label for="b_code">도서코드</label>
			<input type="text" class="form-control" placeholder="도서코드를 입력하세요" id="b_code" name="b_code"><br/>
			
			<label for="b_code">도서명</label>
			<input type="text" class="form-control" placeholder="도서명을 입력하세요" id="b_name" name="b_name"><br/>
			
			<label for="b_auther">저자</label>
			<input type="text" class="form-control" placeholder="저자를 입력하세요" id="b_auther" name="b_auther"><br/>
			
			<label for="b_comp">출판사</label>
			<input type="text" class="form-control" placeholder="출판사를 입력하세요" id="b_comp" name="b_comp"><br/>
			
			<label for="b_year">발행일</label>
			<input type="text" class="form-control" value="${bDTO.b_year}"  placeholder="도서 발행일 입력하세요" id="b_year" name="b_year"><br/>
			
			<label for="b_iprice">도서가격</label>
			<input type="text" class="form-control" placeholder="도서 가격을 입력하세요" id="b_iprice" name="b_iprice"><br/>
			
			<button type="reset" class="btn btn-outline-warning btn-block">새로작성</button>
			<button type="submit" id="btn-save" class="btn btn-outline-primary btn-block">저장</button>
		
		</div>	
	</div>	
	
	
	</form>
</section>
 -->
 
</body>
</html>