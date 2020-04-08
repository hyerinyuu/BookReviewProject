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

	$(".content-body").click(function(){
		let bcode = $(this).attr("data-id")
		document.location.href="${rootPath}/books/viewdetail?bcode=" + bcode
	})
	
})


</script>
<style>
	#nodata{
		text-align: center;
	}

</style>
</head>
<body>
<section>
	<div class="table-view">
		<table class="table table-hover" id="viewtable">
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
							<td colspan="6" id="nodata">데이터가 없음</td>
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
		<%@ include file="/WEB-INF/views/pagination.jsp" %>
</section>
<section>
		
</section>
</body>
</html>