<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 홈페이지</title>
<script>
$(function(){

	$("#search-table tr").click(function(){
	      
        let trs = $(this).children()   
        let b_code = trs.eq(0).text()
        let b_name = trs.eq(1).text()
        
        $("#rb_bcode").val(b_code)
        $("#rb_bname").val(b_name)
        
        $("#modal-box").css("display","none")
    })
	
})


</script>
</head>
<style>
#search-table {
	
	background-color: white;
	border-collapse: collapse;
	width: 85%;
	
	margin: 10px auto;
	border-bottom: 1px solid #ddd;	
	
	height: 100%;
	
	overflow: scroll;
	
}

#search-table td, #search-table th{
	white-space: nowrap;
	text-align: left;
	padding: 8px;
	vertical-align: top;
} 

</style>
<body>
<section>
	<div class="ser">
		<table class="table table-hover" id="search-table">
			<thead class="thead-dark">
				<tr>
					<th>도서코드</th>
					<th>도서명</th>
					<th>저자</th>
					<th>출판사</th>
					<th>구입일자</th>
					<th>구입가격</th>
				</tr>
			</thead>	
			
			<c:choose>
					<c:when test="${empty BLIST}">
						<tr>
							<td colspan="6">데이터가 없음</td>
						</tr>
					</c:when>
					
					<c:otherwise>
						<c:forEach items="${BLIST}" var="bdto">
							<tr class="content-body" data-id="${bdto.b_code}">
								<td>${bdto.b_code}</td>
								<td>${bdto.b_name}</td>
								<td>${bdto.b_auther}</td>
								<td>${bdto.b_comp}</td>
								<td>${bdto.b_year}</td>
								<td>${bdto.b_iprice}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
		</div>	
</section>
</body>
</html>