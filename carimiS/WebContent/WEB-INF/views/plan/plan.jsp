<%@page import="sigma.carimi.model.memberDTO"%>
<%@page import="sigma.carimi.service.planDAO"%>
<%@page import="java.util.*"%>
<%@page import="java.time.Year"%>
<%@page import="java.util.Calendar"%>
<%@page import="sigma.carimi.model.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>
	<script src="//fb.me/react-with-addons-0.14.3.js"></script>
	<script src="//fb.me/react-dom-0.14.3.js"></script>
	<script
		src='//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
	<script
		src='//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script
		src='http://fullcalendar.io/js/fullcalendar-2.6.0/fullcalendar.js'></script>
		
	<c:if test="${empty login}">
		<script>
			alert("로그인 해야 가능한 서비스 입니다");
			location.href="login.do";
		</script>
	</c:if>

		<div class="main-inner">
			<div class="container">
				<div class="row">
					<div class="span9">
						<div class="widget">
						<div class="widget-header">
							<i class="icon-calendar"></i>
							<h3>DAILY SCHEDULE INFOMATION</h3>
						</div>
						<div class="widget-body">
							<div id=calendar></div>
						</div>
						</div>
					</div>
					<div class="span3">
						
						<div class="widget-header"> <i class="icon-credit-card"></i>
              				<h3>CARD LIST</h3>
            			</div>
            			<div class="widget-content">
						<table class="table table-striped table-bordered">
						
						<c:forEach var="cardlist" items="${cardlist }" varStatus="vs">
							<c:if test="${cardlist ne'미보유'}">
								<c:choose>
									<c:when test="${vs.count eq 1 }">
										<tr>
											<td><font style="color: #b6aafb">${cardlist }</font></td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<td><font style="color: #f8aafb">${cardlist }</font></td>
										</tr>
									</c:otherwise>
								</c:choose>
							</c:if>
						</c:forEach>
						
						<c:if test="${!empty cardevent1 }">
							<script>				
								cardEventArray1 = [];
								var cardEvent1 = {};					
								cardEvent1.title = "${cardevent1.btitle }";
								cardEvent1.start = "${cardevent1.bsdate }";
								cardEvent1.end = "${cardevent1.bedate }";
								cardEvent1.color= '#b6aafb'; 
								cardEvent1.url= "boardDetail.do?bseq=${cardevent1.bseq }";
								cardEventArray1.push(cardEvent1);				
							</script>

						</c:if>
						
						<c:if test="${!empty cardevent2 }">
							<c:choose>
							<c:when test="${cardevent2.btitle ne '미보유 고객을 위한 연중행사' }">	
								<script>
									cardEventArray2 = [];
									var cardEvent2 = {};					
									cardEvent2.title = "${cardevent2.btitle }";
									cardEvent2.start = "${cardevent2.bsdate }";
									cardEvent2.end = "${cardevent2.bedate }";
									cardEvent2.color= '#f8aafb'; 
									cardEvent2.url= "boardDetail.do?bseq=${cardevent2.bseq }";
									cardEventArray1.push(cardEvent2);				
								</script>
							</c:when>
							<c:otherwise>
								<script>
									cardEventArray2 = [];
									var cardEvent2 = {};					
									cardEvent2.title = "";
									cardEvent2.start = "";
									cardEvent2.end = "";
									cardEvent2.color= 'transparent';
									cardEventArray2.push(cardEvent2);
								</script>
							</c:otherwise>
							</c:choose>
						</c:if>
					
						</table>
							
							 <input type="button" value="일정쓰기" onclick="location='addplan.do'">
						
						</div>
				</div>
		</div>
	</div>
</div>

<script>
	var eventArray = [];
</script>

 
	<c:forEach var="lp" items="${listplan }">
	
	<script>
		var eventObject = {};
		eventObject.title = "${lp.ptitle}";
		eventObject.start = "${lp.padate}" + "T"+ "${lp.patime}";
		eventObject.end = "${lp.pedate}" + "T"+ "${lp.petime}";
		eventObject.content = "${lp.pcontent}";
		eventObject.local = "${lp.plocal}";
		eventObject.color= '#00ba8c';
	 	eventObject.url = "plandetail.do?pseq=${lp.pseq}";  
		eventArray.push(eventObject);
	</script>
	</c:forEach>

	<%
		Calendar cal = Calendar.getInstance();
		String year = Integer.toString(cal.get(Calendar.YEAR));
		String month = Integer.toString(cal.get(Calendar.MONTH) + 1);
		String date = Integer.toString(cal.get(Calendar.DATE));
		if (month.length() != 2) {
			month = "0" + month;
		}
		if (date.length() != 2) {
			date = "0" + date;
		}
	%>

<script>
	$(function() { // document ready
		
		$('#calendar').fullCalendar({
			
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month,agendaWeek,agendaDay'
			},
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNames:['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
			dayNamesShort:['일','월','화','수','목','금','토'],
			buttonText: {
				today:'오늘',
				month:'월간',
				week:'주간',
				day:'일간'
			},
			titleFormat: {
				month : 'yyyy년 MMMM',
				week : "yyyy년 MMMM d[ yyyy]{'일 ~'[ MMM] dd일 }",
				day : 'yyyy년 MMMM d일'
			},
			fixedWeekCount:false,
			overlap:true,
			eventLimit: true, // for all non-agenda views
			defaultDate : "<%=year%>-<%=month%>-<%=date %>",
			eventSources : [
					{
						events : eventArray
					},
					{
					 	events : cardEventArray1
					},
					{
						events : cardEventArray2
					}]

			});

	});
</script>
</body>

