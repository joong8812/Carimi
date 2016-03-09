<%@page import="sigma.carimi.model.memberDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<title>CARIMI</title>
</head>

<body>

<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container"> <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span
                    class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span> </a>
                    <a class="brand" href="javascript:navClick('main')">C A R I M I </a>
      <div class="nav-collapse">
        <ul class="nav pull-right"> 
			<c:if test="${!empty login.id}">
	          <li class="dropdown"><a href="" class="dropdown-toggle" data-toggle="dropdown"><i
	                            class="icon-cog"></i> Account <b class="caret"></b></a>
	            <ul class="dropdown-menu">
	              <li><a href="meminfo.do">Settings</a></li>  
	            </ul>
	          </li>
	        </c:if>
			<c:choose>
				<c:when test="${!empty login.id }">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
		                   class="icon-user"></i>${login.id} 로그인중 <b class="caret"></b></a>
		              	<ul class="dropdown-menu">
							<li><a href="logout.do">logout</a></li>
						</ul>
					</li>
				</c:when>
				<c:otherwise>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
		                            class="icon-user"></i> 로그인해주세요 <b class="caret"></b></a>
		            	<ul class="dropdown-menu">
		             		<li><a href="login.do">Login</a></li>
		            		<li><a href="signup.do">Sign Up</a></li>
			            </ul>
		    	    </li>
				</c:otherwise>
			</c:choose>
      	</ul>
      </div>
      <!--/.nav-collapse --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /navbar-inner --> 
</div>

<script>
function navClick(url){
	var id = document.getElementById(url);
	id.setAttribute('class', 'active');
	 window.name = url;
	location.href = url + ".do";
}
</script>
</body>
</html>