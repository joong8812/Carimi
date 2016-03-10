<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
<link href="http://code.google.com/apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/showlocation.js"></script>

<style>
#rdate{
	font-size:25px;
}
#map{
	font-size:25px;
}
#map_canvas{
	width:100%;
	height:300px;
}
</style>

<div class="main">
	<div class="main-inner">
	    <div class="container">
	      <div class="row">
	      	<div class="span12">      		
	      		<div class="widget ">
	      			<div class="widget-header">
	      				<i class="icon-th-list"></i>
	      				<h3>Detail Benefit</h3>
	      				<div style="float:right; padding-right:10px">
		  			  		<button class="btn" onclick="javascript:history.go(-1);">뒤로가기</button>
						</div>
	  				</div> <!-- /widget-header -->
					
					<div class="widget-content">
						<div class="col-sm-12 col-md-12 col-lg-12">
							<div class="col-sm-5 col-md-5 col-lg-5">
								<p style="font-size:30px"><strong>${bdto.shopname }</strong></p>
							</div>
							<div class="col-sm-7 col-md-7 col-lg-7"></div>
						</div>		
						<div style="float:left">
							<img src="/CarimiS/bupload/${bdto.filename }" width="400" height="300"/>
						</div>
						<div style="width:50%; float:left; padding-left: 20px">
								<br><br><br><br>
								
								<c:choose>
									<c:when test="${bdto.brate > 100 }">
								    <p id="rdate">&nbsp;&nbsp;${bdto.brate } 원 할인</p>
								    </c:when>
								    <c:otherwise>
							    	<p id="rdate">&nbsp;&nbsp;${bdto.brate } % 할인</p>
									</c:otherwise>
								</c:choose>
							 
							
					    	<table class="table table-striped table-bordered" style="text:center; ">
					    		<tr>
					    			<th>OPEN</th>
					    			<td>${bdto.opentime }-${bdto.closetime }</td>
					    		</tr>
					    		<tr>
					    			<th>TEL</th>
					    			<td>${bdto.phone }</td>
					    			
					    		</tr>
					    		<tr>
					    			<th>LOCATION</th>
					    			<td>${bdto.address }</td>
					    		</tr>
					    	</table>
					  	</div>
					<div class="col-sm-12 col-md-12 col-lg-12">
		<div class="col-sm-2 col-md-2 col-lg-2"></div>
		<div class="col-sm-8 col-md-8 col-lg-8">
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			<input type="hidden" id="brate" value="${bdto.brate }"/>
			<input type="hidden" id="shopname" value="${bdto.shopname }"/>
			<input type="hidden" id="phone" value="${bdto.phone }"/>
			<input type="hidden" id="locationx" value="${bdto.locationx }"/>
			<input type="hidden" id="locationy" value="${bdto.locationy }"/>
			
			<div id="map_canvas"></div>
			
		</div>
		<div class="col-sm-2 col-md-2 col-lg-2"></div>
	</div>
					</div> <!-- /widget -->
		    	</div> <!-- /span8 -->
	    	</div> <!-- /row -->
	    </div> <!-- /container -->
	</div> <!-- /main-inner -->
</div> <!-- /main -->
</div>