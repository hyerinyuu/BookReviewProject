<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 상세정보</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>

	.table-view{
		width: 80%;
		margin: 0 auto;
		margin-top: 40px;
	}
	
	a.btn, .btn-rbox {
		border-radius: 3px;
		padding: 5px 11px;
		color: #fff;
		display: inline-block;
		background-color: #A2CD0C;
		border : 1px solid #A2CD0C;
		vertical-align: middle;
		text-decoration: none;
		margin: 5px;
		
	}
	
	div.btn-box, .btn-rbox{
		width : 100%;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	a.btn:hover, .btn-rbox:hover {
		/* border: 2px solid black; */
		box-shadow: 5px 5px 8px rgba(80,80,80,0.8)
	}
	
	.jumbotron{
		margin-bottom: 0;
	}
	
	.nav-box{
		margin-bottom: 50px;
	}
	
	#sdiv{
		padding: 25px;
	}

</style>

<script>
	$(function(){
		
		// 도서 리스트로 다시 돌아가는 '목록으로' 버튼 클릭시 script
		$("#btn-list").click(function(){
			document.location.href = "${rootPath}/books/list"
		})
		
		$("#btn-update").click(function(){
			
			if(confirm("도서정보를 수정하시겠습니까?"))
			document.location.href = "${rootPath}/books/update?id=${bDTO.b_code}"
		})
		
		$("#btn-delete").click(function(){
			if(confirm("도서정보를 삭제하시겠습니까?"))
			document.location.replace("${rootPath}/books/delete?id=${bDTO.b_code}")	
			
		})
		
		
			
		$("button").click(function(){
			
			let btn_id = $(this).attr("id")
			let url = "${rootPath}/rbooks/"
			
			if(btn_id == "btn-rbupdate"){
				url += "update?id=${rbdto.rb_seq}"
			}else if(btn_id == "btn-rblist"){
				url += "list"
			}else if(btn_id == "btn-rbdelete"){
				if(!confirm("독서록을 삭제할까요?")){
					return false
				}
				url += "delete?id=${rbdto.rb_seq}"
			}
			document.location.href = url
				
		})
	})
</script>
</head>
<body>

<%@ include file="/WEB-INF/views/include/include-header.jsp" %>

<section>
	<div class="table-view">
		<table class="table table-striped">
		<hr/>
		<h2>도서정보</h2>
		<div  id="sdiv"></div>
		 	<thead class="thead-dark">
				<tr>
					<th>ISBN</th><td colspan="4">${bDTO.b_code}</td>
				</tr>
				
				<tr>
					<th>도서명</th><td>${bDTO.b_name}</td>
					<th>저자</th><td>${bDTO.b_auther}</td>
				</tr>
				
				
				<tr>
					<th>출판사</th><td>${bDTO.b_comp}</td>
					<th>구입일자</th><td>${bDTO.b_year}</td>
				</tr>

				<tr>
					<th>구입가격</th><td colspan="4">${bDTO.b_iprice}</td>
				</tr>
				
			</thead>	
		</table>
	</div>	
</section>
<div  id="sdiv"></div>

<div class="btn-box"> 
	<a href="javascript:void(0)" class="btn" id="btn-update">도서 수정</a>
	<a href="javascript:void(0)" class="btn" id="btn-delete">도서 삭제</a>
	<a href="javascript:void(0)" class="btn" id="btn-list">도서 목록으로</a>
	<a href="javascript:void(0)" class="btn" id="btn-list">독서록 쓰기</a>
</div>
<div  id="sdiv"></div>
<div  id="sdiv"></div>
	
<section>
	<div class="table-view">
		<table class="table table-striped">
		<hr/>
		<h2>독서록</h2>
		<div  id="sdiv"></div>
		 	
		 	<thead class="thead-dark">
				<tr>
					<th>ISBN</th><td colspan="4">${rbDTO.rb_bcode}</td>
				</tr>

				<tr>
					<th>도서제목</th><td>${rbDTO.rb_bname}</td>
					<th>독서일자</th><td>${rbDTO.rb_date}</td>
				</tr>
				
				
				<tr>
					<th>한줄소감</th><td>${rbDTO.rb_subject}</td>
					<th>별점</th><td colspan="4">${rbDTO.rb_star}</td>
				</tr>

				<tr>
					<th>긴줄소감</th><td colspan="4">${rbDTO.rb_text}</td>
				</tr>
				
			</thead>	
		</table>
	</div>			
</section>	

</body>
</html>