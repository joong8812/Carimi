<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>
<body>

<div class="subnavbar">
  <div class="subnavbar-inner">
    <div class="container">
      <ul class="mainnav">
        <li class="" id="main"><a href="javascript:navClick('main')"><i class="icon-dashboard"></i><span>Dashboard</span> </a> </li>
        <li id="analysis"><a href="javascript:navClick('analysis')"><i class="icon-list-alt"></i><span>Reports</span> </a> </li>
        <li id="benefit" class="dropdown"><a href="" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-facetime-video"></i><span>Benefit Tour</span><b class="caret"></b> </a>
	        <ul class="dropdown-menu">
	        	<c:choose>
	        		<c:when test="${login.auth eq 1 }">
	        			<li><a href="javascript:navClick('benefit')">Service</a></li>
            			<li><a href="javascript:navClick2('benefit', 'admin_page.do')">Admin</a></li>
	        		</c:when>
	        		<c:otherwise>
	        			<li><a href="javascript:navClick('benefit')">Service</a></li>
	        		</c:otherwise>
	        	</c:choose>
	        </ul>
        </li>

		<li id="explist"><a href="javascript:navClick('explist')"><i class="icon-bar-chart"></i><span>Expenditure</span></a></li>
		<li id="plan"><a href="javascript:navClick('plan')"><i class="icon-calendar"></i><span>Schedule</span> </a> </li>
		
        <li class="dropdown" id="boardlist"><a href="#" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-bell"></i><span>Notice</span> <b class="caret"></b></a>
           <ul class="dropdown-menu">
   		    <c:choose>
	        		<c:when test="${login.auth eq 1 }">
	        			<li><a href="javascript:navClick('boardlist')">List</a></li>
            			<li><a href="javascript:navClick2('boardlist', 'boardwrite.do')">Write</a></li>
	        		</c:when>
	        		<c:otherwise>
	        			<li><a href="javascript:navClick('boardlist')">List</a></li>
	        		</c:otherwise>
	        	</c:choose>
           </ul>
        </li>
      </ul>
    </div>
    <!-- /container --> 
  </div>
  <!-- /subnavbar-inner --> 
</div>
<script>
var navname = window.name;
var id = document.getElementById(navname);
if(navname === 'benefit' || navname === 'boardlist'){
	id.setAttribute('class', 'active dropdown');	
} else {
	id.setAttribute('class', 'active');
}

</script>

<script>
function navClick(url){
	 window.name = url;
	location.href = url + ".do";
}
function navClick2(url, gourl){
 	 window.name = url;
	location.href = gourl;
}
</script>
</body>
</html>

