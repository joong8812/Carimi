<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@page import="sigma.carimi.model.memberDTO"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
<link href="http://code.google.com/apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/savelocation.js"></script>
<link rel="stylesheet" media="screen" href="css/ui.core.css" type="text/css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.timepicker.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery.timepicker.css" />
<style>
#map_canvas {
	width: 400px;
	height: 300px;
	/* 	border: 1px solid red;   */
}

#infoPanel {
	float: left;
	margin-left: 10px;
}

#infoPanel div {
	margin-bottom: 5px;
}

#r {
	max-height: 60px;
	overflow-y: scroll;
}

</style>


<script>
	$(function() {
		$("#padate").datepicker(
				{
					dateFormat : "yy-mm-dd",
					showAnim : "fadeIn",
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					yearSuffix : '년',
					onClose: function( selectedDate ) {
				        $( "#pedate" ).datepicker( "option", "minDate", selectedDate );
				      }
				});
		$("#pedate").datepicker(
				{
					dateFormat : "yy-mm-dd",
					showAnim : "fadeIn",
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					yearSuffix : '년',
					onClose: function( selectedDate ) {
				        $( "#padate" ).datepicker( "option", "maxDate", selectedDate );
				      }
				});
	});
</script>
<script>
	$(function() {
		$('#patime').timepicker({
	        timeFormat: 'HH:mm',	       
	        // startTime: new Date(0,0,0,15,0,0),
	        interval: 15
	    });
		$('#petime').timepicker({
	        timeFormat: 'HH:mm',	       
	        // startTime: new Date(0,0,0,15,0,0),
	        interval: 15
	    });
	});
</script>
</head>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	Calendar cal = Calendar.getInstance();
	String year = Integer.toString(cal.get(Calendar.YEAR));
	String month = Integer.toString(cal.get(Calendar.MONTH) + 1);
	String date = Integer.toString(cal.get(Calendar.DATE));
	if (month.length() != 2) {
		month = "0" + month;
	}
	if (date.length() !=2) {
		date = "0" + date;
	}
%>
<div class="main-inner">
	<div class="container">
		<div class="row">
			<div class="span12">
			<div class="widget">
				<div class="widget-header">
					<i class="icon-calendar"></i><h3>${login.id } &nbsp;님 일정 쓰기</h3>
					<div class="pull-right">
								<h3>
									<a href=plan.do>목록</a>
								</h3>
							</div>
				</div>
				<div class="widget-content">		
			<form action="addplanAf.do" method="post">
			<table class="table table-striped table-bordered">
				<tr>
					<td>ID</td>
					<td><input type="text" name="id" value="${login.id }" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>약속일 시작</td>
					<td><input type="text" name="padate" id="padate" /></td>
				</tr>
				<tr>
					<td>약속일 종료</td>
					<td><input type="text" name="pedate" id="pedate" /></td>
				</tr>
				<tr>
					<td>약속 시작 시간</td>
					<td><input id="patime" type="text" name="patime" /></td>
				</tr>
				<tr>
					<td>약속 종료 시간</td>
					<td><input id="petime" type="text" name="petime" /></td>
				</tr>
				<tr>
					<td>약속장소</td>
					<td><input type="text" name="plocal" /></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="ptitle" /></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><input type="text" name="pcontent" /></td>
				</tr>
				<tr>
					<td>작성일</td>
					<td><input type="text" name="pwdate"
						value="<%=year%>-<%=month%>-<%=date%>" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>위치저장</td>
					<td style="display:inline-flex">
						<div class="col-sm-7 col-md-7 col-lg-7">
							<div id="map_canvas"></div>
							<div id="infoPanel">
								<b>Current position:</b>
								<div id="info"></div>
								<b>Closest matching address:</b>
								<div id="address"></div>
							</div>
						</div>&nbsp;&nbsp;&nbsp;
						<div class="col-sm-5 col-md-5 col-lg-5">
							<input class="form-control input-lg" type="text" size="50px"
								id="saddress">
							<button type="button"onclick="codeAddress()">검색</button>
							<div id="r"></div>
						</div>
					
					</td>
				</tr>
				<tr>
				<td colspan="2">
					<input type="hidden" id="lx" name="lx"/>
					<input type="hidden" id="ly" name="ly"/>
					<input type="submit" value="저장"/>
				</td>
			</table>
		</form>
		</div>
		<!-- <input type="submit" name="bt" value="저장"> -->
				</div>
			</div>
		</div>
</div>
</div>
</html>