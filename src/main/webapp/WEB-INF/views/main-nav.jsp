<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	  $('[data-toggle="popover"]').popover();   
})
</script>
<style>

</style>

<div class="nav-box">
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
	
	  <ul class="navbar-nav">
		  	<li class="nav-item">
		      <a class="nav-link" href="${rootPath}/">Home</a>
		    </li>
		  
		    <li class="nav-item">
		      <a class="nav-link" href="${rootPath}/rbooks/list">Reviews</a>
		    </li>
	  </ul>	 
	  
	  <form class="form-inline ml-auto">
    	<input class="form-control mr-sm-2" id="keyword" name="keyword" placeholder="책 이름을 입력하세요">
    	<button class="btn btn-light">search</button>
  	  </form>   
		    
	    
	  <ul class="navbar-nav ml-auto">
	    
	    <c:if test="${empty MEMBER}">
		    <li class="nav-item">
		      <a class="nav-link" href="${rootPath}/member/login">SignUp</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="${rootPath}/member/join">SignIn</a>
		    </li>
	    </c:if>
	    
	    <c:if test="${!empty MEMBER}">
	    
	    	 <li class="nav-item"> 	
				<a class="nav-link">Hello! "${MEMBER.m_id}"</a>	      
		    </li>
		    
		    <li class="nav-item">
		      	<a class="nav-link" href="${rootPath}/member/logout" data-toggle="popover" data-trigger="hover" data-content="Really?!?">SignOut</a>
		    </li>
		   
		</c:if>    
	    
	  </ul>
	</nav>

</div>
