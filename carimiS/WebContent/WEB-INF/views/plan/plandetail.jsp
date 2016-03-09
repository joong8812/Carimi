<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="sigma.carimi.service.*"%>
<%@ page import="sigma.carimi.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
<link href="http://code.google.com/apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/Carimi/js/showlocation.js"></script>
<style>
#map{
	font-size:25px;
}
#map_canvas{
	width:100%;
	height:300px;
}
</style>


</head>
<body>
	<div class=container>
		<div class="row">
			<div class="span12">
				<div class="widget">
				
					<div class="widget-header">
						<i class="icon-calendar"></i>
						<h3>DAILY SCHEDULE INFOMATION</h3>				
							<div class="pull-right">
								<h3>
							
									<a href='updplan.do?pseq=${detailplan.pseq}'>Modify</a>&nbsp;
									<a href='delplan.do?pseq=${detailplan.pseq}'>Delete</a>&nbsp;
									<a href=plan.jsp>Back</a>
							
								</h3>
							</div>
					</div>
					<div class="widget-content">
					
					<table class=table style="table-layout:fixed">
					<col width=10%><col width=50%>
					
					<tr>
						<td>약속 시작</td><td>${detailplan.padate} / ${detailplan.patime} </td>
					</tr>
					<tr>
						<td>약속 종료</td><td>${detailplan.pedate} / ${detailplan.petime}</td>
					</tr>
					<tr>
						<td>약속 장소</td><td>${detailplan.plocal}</td>
					</tr>
					<tr>
						<td>제목</td><td>${detailplan.ptitle}</td>
					</tr>
					<tr>
						<td>내용</td><td style="word-wrap:break-word">${detailplan.pcontent}</td>
					</tr>
					
			</table>
		
		</div>
		<div class="col-sm-12 col-md-12 col-lg-12">
			<div class="col-sm-2 col-md-2 col-lg-2"></div>
			<div class="col-sm-8 col-md-8 col-lg-8">
				<br>

				<br> <input type="hidden" id="locationx" value="${detailplan.plocation_x}" />
					  <input type="hidden" id="locationy" value="${detailplan.plocation_y}" />

				<div id="map_canvas"></div>
				<br>
				<br>
			</div>
			<div class="col-sm-2 col-md-2 col-lg-2"></div>
		</div>
	
	</div>
	</div>
	</div>
	</div>
</body>
</html>