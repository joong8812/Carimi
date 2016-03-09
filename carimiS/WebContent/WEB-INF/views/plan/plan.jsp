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
	<!-- <link href='http://fullcalendar.io/js/fullcalendar-2.6.0/fullcalendar.css' rel='stylesheet' /> -->
	<!-- <link href='http://fullcalendar.io/js/fullcalendar-2.6.0/fullcalendar.print.css' rel='stylesheet' media='print' /> -->
	<script
		src='//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
	<script
		src='//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script
		src='http://fullcalendar.io/js/fullcalendar-2.6.0/fullcalendar.js'></script>


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
						
						<%-- <%
								planDTO pdto = pdao.cardPlan(new planDTO(id));
								String mc1 = pdto.getMycard1();
								String mc2 = pdto.getMycard2();
								String[] e_card = {"shin1", "shin2", "guk1", "guk2", "uri1", "uri2", "ha1", "ha2", "lot1", "lot2", "sam1",
										"sam2", "nong1", "nong2", "gi1", "gi2", "ci1", "ci2", "미보유"};
								String[] k_card = {"신한 LOVE", "신한 Tasty", "국민 굿데이", "국민 다담", "우리 다모아할인", "우리 가득한할인", "하나 Pop", "하나 2X 알파",
										"롯데 DC 슈프림", "롯데 DC 스마트", "삼성 S클래스", "삼성 2 v2", "농협 스마티", "농협 Take5", "기업 IBK Hi", "기업 참!좋은친구",
										"씨티 멀티플러스", "씨티 클리어", "미보유"};
								String mycard1 = "";
								String mc1_shot = "";
								String mycard2 = "";
								String mc2_shot = "";

								for (int i = 0; i < e_card.length; i++) {
									if (e_card[i].indexOf(mc1) >= 0) {
										mycard1 = k_card[i];
										mc1_shot = k_card[i].substring(0, 2);
									}
									if (e_card[i].indexOf(mc2) >= 0) {
										mycard2 = k_card[i];
										mc2_shot = k_card[i].substring(0, 2);
										System.out.println(mc2_shot);
									}
								}
							%>
							<%
								List<planDTO> eventplan = pdao.eventPlan(new planDTO());

								for (int i = 0; i < eventplan.size(); i++) {
									planDTO pdto1 = eventplan.get(i);
									int bseq = Integer.parseInt(pdto1.getBseq());
							%>
							<%
								if (pdto1.getBtitle().contains(mc1_shot)) {
							%>
							<script>				
					cardEventArray1 = [];
					var cardEvent1 = {};					
					cardEvent1.title = '<%=pdto1.getBtitle()%>';
					cardEvent1.start = '<%=pdto1.getBsdate()%>';
					cardEvent1.end = '<%=pdto1.getBedate()%>';
					cardEvent1.color= '#b6aafb'; 
					cardEvent1.url= '../board/boarddetail.jsp?bseq=<%=bseq%>';
					cardEventArray1.push(cardEvent1);				
					</script>
							<%
								}
							%>
							<%
								if (!mc2_shot.equals("미보유") && pdto1.getBtitle().contains(mc2_shot)) {
							%>
							<script>
					cardEventArray2 = [];
					var cardEvent2 = {};					
					cardEvent2.title = '<%=pdto1.getBtitle()%>';
					cardEvent2.start = '<%=pdto1.getBsdate()%>';
					cardEvent2.end = '<%=pdto1.getBedate()%>';
					cardEvent2.color= '#f8aafb';   // an option!
					cardEvent2.url= '../board/boarddetail.jsp?bseq=<%=bseq%>';
					cardEventArray2.push(cardEvent2);
					</script>
							<%
								}
							%>
							<%
								if (mc2_shot.equals("미보")) {
							%>
							<script>
					cardEventArray2 = [];
					var cardEvent2 = {};					
					cardEvent2.title = '';
					cardEvent2.start = '<%=pdto1.getBsdate()%>';
					cardEvent2.end = '<%=pdto1.getBedate()%>';
					cardEvent2.color= 'transparent';
					cardEventArray2.push(cardEvent2);
					</script>
							<%
								}
							%>
							<%
								if (mc1_shot.equals("미보")) {
							%>
							<script>
					cardEventArray1 = [];
					var cardEvent1 = {};					
					cardEvent1.title = '';
					cardEvent1.start = '<%=pdto1.getBsdate()%>';
					cardEvent1.end = '<%=pdto1.getBedate()%>';
					cardEvent1.color= 'transparent';
					cardEventArray1.push(cardEvent1);
					</script>
							<%
								}
								}
							%>
							<tr>
								<td align="center">1</td>
								<td><font style="color: #b6aafb"><%=mycard1%></font></td>
							</tr>
							<%
								if (!mc2.equals("미보유")) {
							%>
							<tr>
								<td align="center">2</td>
								<td><font style="color: #f8aafb"><%=mycard2%></font></td>
							</tr>
							<%
								}
							%>  --%>
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
		
		alert("addOn");
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
				today:'Day',
				month:'Monthly',
				week:'Weekly',
				day:'Daily'
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
					}
					/*{
					 	events : cardEventArray1
					// an option!
					// textColor: 'black' // an option!
					},

					{
						events : cardEventArray2

					// textColor: 'black' // an option!
					} */ ]

			});

	});
</script>
</body>

