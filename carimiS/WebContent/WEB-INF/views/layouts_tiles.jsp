<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
 <link href="<%=request.getContextPath()%>/css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
        rel="stylesheet">
        
<link href="<%=request.getContextPath()%>/css/font-awesome.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/font.css" />

<link href="<%=request.getContextPath()%>/css/pages/dashboard.css" rel="stylesheet">
 <script src="<%=request.getContextPath()%>/js/jquery-1.7.2.min.js"></script> 
</head>
<body>
	<tiles:insertAttribute name="top_menu"/>
		
	<tiles:insertAttribute name="nav_menu"/>
		
	
	<tiles:insertAttribute name="content"/>
	
	<tiles:insertAttribute name="bottom_menu"/>
<script src="<%=request.getContextPath()%>/js/excanvas.min.js"></script> 
<script src="<%=request.getContextPath()%>/js/chart.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/full-calendar/fullcalendar.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/base.js"></script> 
	
</body>

</html>
