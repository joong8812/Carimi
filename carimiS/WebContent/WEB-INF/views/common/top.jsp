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
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
 <link href="<%=request.getContextPath()%>/css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
        rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/font-awesome.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/pages/dashboard.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/jquery-1.7.2.min.js"></script> 

 <% 
//세션 확인

memberDTO user=(memberDTO)session.getAttribute("login");

//로그인 세션값을 user라는 공간에 담아둠
boolean isLogin=false;
if(user==null){
	isLogin=false;
}else{
	isLogin=true;
}
//null이면 거짓 데이터가 들으면 참
%>
</head>

<body>

<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container"> <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span
                    class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span> </a><a class="brand" href="./main.do">C A R I M I </a>
      <div class="nav-collapse">
        <ul class="nav pull-right"> 
<%-- 	        <%if(isLogin){ %> --%>
			<c:if test="${!empty login.id}">
	          <li class="dropdown"><a href="" class="dropdown-toggle" data-toggle="dropdown"><i
	                            class="icon-cog"></i> Account <b class="caret"></b></a>
	            <ul class="dropdown-menu">
	              <li><a href="<%=request.getContextPath()%>/view/member/meminfo.jsp">Settings</a></li>  
	            </ul>
	          </li>
	         </c:if>
<%-- 	        <%}%> --%>
	       	<%if(isLogin){ %>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
	                   class="icon-user"></i>${login.id} 로그인중 <b class="caret"></b></a>
	              	<ul class="dropdown-menu">
						<li><a href="logout.do">logout</a></li>
					</ul>
				</li>
			<%}else{ %> 
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
	                            class="icon-user"></i> 로그인해주세요 <b class="caret"></b></a>
	            	<ul class="dropdown-menu">
	             		<li><a href="login.do">Login</a></li>
	            		<li><a href="signup.do">Sign Up</a></li>
		            </ul>
	    	    </li>
			<%}%>
      	</ul>
      </div>
      <!--/.nav-collapse --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /navbar-inner --> 
</div>