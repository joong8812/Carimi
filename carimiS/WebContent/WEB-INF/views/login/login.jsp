<%@page import="sigma.carimi.model.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  
<head>
    <meta charset="utf-8">
    <title>Login - Bootstrap Admin Template</title>
    	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes"> 
    
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />

<link href="<%=request.getContextPath()%>/css/font-awesome.css" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
    
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/pages/signin.css" rel="stylesheet" type="text/css">

</head>

<body>
	
	<div class="navbar navbar-fixed-top">
	
	<div class="navbar-inner">
		
		<div class="container">
			
			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</a>
			
			<a class="brand" href="main.do">
				C A R I M I				
			</a>		
			
			<div class="nav-collapse">
				<ul class="nav pull-right">
					
					<li class="">						
						<a href="signup.do" class="">
							Don't have an account?
						</a>
						
					</li>
					
					<li class="">						
						<a href="main.do" class="">
							<i class="icon-chevron-left"></i>
							Back to Homepage
						</a>
						
					</li>
				</ul>
				
			</div><!--/.nav-collapse -->	
	
		</div> <!-- /container -->
		
	</div> <!-- /navbar-inner -->
	
</div> <!-- /navbar -->


<br><br>
<div class="account-container">
	
	<div class="content clearfix">
		
		<form action="loginAf.do" method="post">
		
			<h1>Member Login</h1>		
			
			<div class="login-fields">
				
				<p>Please provide your details</p>
				
				<div class="field">
					<label for="username">Username:</label>
					<input type="text" id="id" name="id" value="" placeholder="Username" class="login username-field" />
				</div> <!-- /field -->
				
				<div class="field">
					<label for="password">Password:</label>
					<input type="password" id="pwd" name="pwd" value="" placeholder="Password" class="login password-field"/>
				</div> <!-- /password -->
				
			</div> <!-- /login-fields -->
			
			<div></div>
			
			<div class="login-actions">
				
				<span class="login-checkbox" style="margin-top: 32px;">
					<input id="Field" name="Field" type="checkbox" class="field login-checkbox" value="First Choice" tabindex="4" />
					<label class="choice" for="Field" >Keep me signed in</label>
				</span>
									
				<button class="button btn btn-success btn-large">Sign In</button>
				
			</div> <!-- .actions -->
			
			
			
		</form>
		
	</div> <!-- /content -->
	
</div> <!-- /account-container -->



<script src="<%=request.getContextPath()%>/js/jquery-1.7.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>

<script src="<%=request.getContextPath()%>/js/signin.js"></script>

</body>

</html>
