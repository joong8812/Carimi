<%-- <%@page import="javafx.scene.control.DatePicker"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="sigma.carimi.model.expenditureDTO"%>
<%@ page import="sigma.carimi.model.memberDTO"%>
<%@ page import="sigma.carimi.service.expenditureDAO"%>
<%@ page import="sigma.carimi.service.expenditureService"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:requestEncoding value="UTF-8" />

<%!
int sumoil=0;
int sumshop=0;
int summart=0;
int sumcvs=0;
int sumeou=0;
int sumcafe=0;
int summovie=0;
int sumtra=0;
int sumtel=0;
int sumedu=0;
int sumcul=0;
int sumlei=0;
int summedi=0;
int sumbea=0;
int sumpoi=0;

int categorylist;
String[][] sumprice = null;



%>

<c:if test="${not empty e1List}">
   <c:forEach items="${e1List}" var="e1">
      <script>
         var e1Object = {};
         e1Object.title = '${e1.title}';
         e1Object.start = '${e1.start_time}';
         e1Object.end = '${e1.end_time}';
         e1Object.lat = parseFloat('${e1.lat}');
         e1Object.lng = parseFloat('${e1.lng}');
         eventArray.push(e1Object);
      </script>
   </c:forEach>
   <script>
      defaultDate = moment(eventArray[0].start).format('YYYY-MM-DD');
   </script>
</c:if>

<div class="main-inner">
<div class="container">
	<div class="row">
		<div class="widget">
			<div class="widget-header">
				<i class="icon-credit-card"></i>
				<h3>${id}'S EXPENDITURE LIST</h3>
			</div>
			<div class="widget-conetent">
				<div class="widget-content pull-left">
					<div>
						<form action="monlist.do" method="post">
							<input type="submit" value="월간 보고서" id="submit">
							<input type="hidden" id="id" name="id" value='${id}'>
							<input type="hidden" id="wdate" name="wdate" value='${wdate}'>
						</form>
						<form action="yearlist.do" method="post">
							<input type="submit" value="연간 보고서" id="submit">
						</form>

						<form action="exp_1.do" method="post">
							<input type="submit" value="지출 분석" id="submit">
						</form>
						<form action="expwrite.do" method="post">
							<input type="submit" value="지출내역 쓰기" id="submit">
						</form>
					</div>
				</div>
					<div class="widget-content pull-left" style="margin-left: 25px;">
						<table>
							<col width=52%>
							<tr>
								<td class="pull-left"><a href="${sleft}"><img
										src="/CarimiS/image/left.png" /></a>${sf3}<a href='${sright}'><img
										src="/CarimiS/image/right.png" /></a>
								</td>
								<td>
								<form action="/CarimiS/views/expenditure/exp_1.jsp" method="post">
								<input type="submit" style="font-size: 10pt; height: 25; width: 90px;" value="항목별" id="submit1">
								</form>
								</td>
								<td>
								<form action="/CarimiS/views/expenditure/exp_2.jsp" method="post">
									<input type="submit" style="font-size: 10pt; height: 25; width: 90px;" value="카드별" id="submit1">
								</form>
								</td>
								<td>
								<form action="/CarimiS/views/expenditure/exp_3.jsp" method="post">
									<input type="submit" style="font-size: 10pt; height: 25; width: 90px;" value="날짜별" id="submit1">
								</form>
								</td>
							</tr>
						</table>		
		
<% 
categorylist = e1list.size();
sumprice = new String[categorylist][2];
NumberFormat formatter = new DecimalFormat("#,###");
%>

	<%
	sumoil=0;
	sumshop=0;
	summart=0;
	sumcvs=0;
	sumeou=0;
	sumcafe=0;
	summovie=0;
	sumtra=0;
	sumtel=0;
	sumedu=0;
	sumcul=0;
 	sumlei=0;
	summedi=0;
	sumbea=0;
	sumpoi=0;
			
		for (int j = 0; j < "${e1list}".length(); j++) {
			expenditureDTO exp = "${e1list}".get(j);
			String date = "${e1list}".get(j).getWdate().substring(0, 7);

				sumprice[j][0] = exp.getBcategory();
				sumprice[j][1] = Integer.toString(exp.getPrice());

				if (date.equals("${sf3}")&&sumprice[j][0].equals("oil")) {
					sumoil = sumoil + Integer.parseInt(sumprice[j][1]);
				} else if (date.equals("${sf3}")&&sumprice[j][0].equals("shop")) {
					sumshop = sumshop + Integer.parseInt(sumprice[j][1]);
				} else if (date.equals("${sf3}")&&sumprice[j][0].equals("mart")) {
					summart = summart + Integer.parseInt(sumprice[j][1]);
				} else if (date.equals("${sf3}")&&sumprice[j][0].equals("cvs")) {
					sumcvs = sumcvs + Integer.parseInt(sumprice[j][1]);
				} else if (date.equals("${sf3}")&&sumprice[j][0].equals("eou")) {
					sumeou = sumeou + Integer.parseInt(sumprice[j][1]);
				} else if (date.equals("${sf3}")&&sumprice[j][0].equals("cafe")) {
					sumcafe = sumcafe + Integer.parseInt(sumprice[j][1]);
				} else if (date.equals("${sf3}")&&sumprice[j][0].equals("movie")) {
					summovie = summovie + Integer.parseInt(sumprice[j][1]);
				} else if (date.equals("${sf3}")&&sumprice[j][0].equals("tra")) {
					sumtra = sumtra + Integer.parseInt(sumprice[j][1]);
				} else if (date.equals("${sf3}")&&sumprice[j][0].equals("tel")) {
					sumtel = sumtel + Integer.parseInt(sumprice[j][1]);
				} else if (date.equals("${sf3}")&&sumprice[j][0].equals("edu")) {
					sumedu = sumedu + Integer.parseInt(sumprice[j][1]);
				} else if (date.equals("${sf3}")&&sumprice[j][0].equals("cul")) {
					sumcul = sumcul + Integer.parseInt(sumprice[j][1]);
				} else if (date.equals("${sf3}")&&sumprice[j][0].equals("lei")) {
					sumlei = sumlei + Integer.parseInt(sumprice[j][1]);
				} else if (date.equals("${sf3}")&&sumprice[j][0].equals("medi")) {
					summedi = summedi + Integer.parseInt(sumprice[j][1]);
				} else if (date.equals("${sf3}")&&sumprice[j][0].equals("bea")) {
					sumbea = sumbea + Integer.parseInt(sumprice[j][1]);
				}
				
		}
	
	
		System.out.println("sumoil= " + sumoil);
		System.out.println("sumshop= " + sumshop);
		System.out.println("summart= " + summart);
		System.out.println("sumcvs= " + sumcvs);
		System.out.println("sumeou= " + sumeou);
		System.out.println("sumcafe= " + sumcafe);
		System.out.println("summovie= " + summovie);
		System.out.println("sumtra= " + sumtra);
		System.out.println("sumtel= " + sumtel);
		System.out.println("sumedu= " + sumedu);
		System.out.println("sumcul= " + sumcul);
		System.out.println("sumlei= " + sumlei);
		System.out.println("summedi= " + summedi);
		System.out.println("sumbea= " + sumbea);
	%>

<div>

				<table class="table table-striped table-bordered" align="center" width="80%">
				<col width="10%" />
				<col width="10%" />
				<tr>
					<th>BCATEGORY</th>
					<th>PRICE</th>
				</tr>
				<c:if test="${empty explist}">
									<tr>
										<td colspan="3" align="center">작성된 글이 없습니다.</td>
									</tr>
								</c:if>
		
				<%if(sumoil!=0){%>
			<tr>
		   		<td><i class="icon-tint"></i> OIL</td>
		        <td><%=sumoil%>원</td>
			</tr><%} %>
		<%if(sumshop!=0){%>
			<tr>
		   		<td><i class="icon-gift"></i> SHOPPING</td>
		   		<td><%=sumshop%>원</td>
			</tr><%} %>
		<%if(summart!=0){%>
			<tr>
		   		<td><i class="icon-shopping-cart"></i> MART</td>
		   		<td><%=summart%>원</td>
			</tr><%} %>
		<%if(sumcvs!=0){%>
			<tr>
			   <td><i class="icon-barcode"></i> CVS</td>
			   <td><%=sumcvs%>원</td>
			</tr><%} %>
		<%if(sumeou!=0){%>
			<tr>
			   <td><i class="icon-leaf"></i> EAT-OUT</td>
			   <td><%=sumeou%>원</td>
			</tr><%} %>
		<%if(sumcafe!=0){%>
			<tr>
			   <td><i class="icon-glass"></i> CAFE/BAKERY</td>
			   <td><%=sumcafe%>원</td>
			</tr><%} %>
		<%if(summovie!=0){%>
			<tr>
			   <td><i class="icon-film"></i> MOVIE</td>
			   <td><%=summovie%>원</td>
			</tr><%} %>
		<%if(sumtra!=0){%>
			<tr>
			   <td><i class="icon-truck"></i> TRANSPORTATION</td>
			   <td><%=sumtra%>원</td>
			</tr><%} %>
		<%if(sumtel!=0){%>
			<tr>
			   <td><i class="icon-phone"></i> TELECOM</td>
			   <td><%=sumtel%>원</td>
			</tr><%} %>
		<%if(sumedu!=0){%>
			<tr>
			   <td><i class="icon-book"></i> EDUCATION</td>
			   <td><%=sumedu%>원</td>
			</tr><%} %>
		<%if(sumcul!=0){%>
			<tr>
			   <td><i class="icon-picture"></i> CULTURE</td>
			   <td><%=sumcul%>원</td>
			</tr><%} %>
		<%if(sumlei!=0){%>
			<tr>
			   <td><i class="icon-plane"></i> LEISURE</td>
			   <td><%=sumlei%>원</td>
			</tr><%} %>
		<%if(summedi!=0){%>
			<tr>
			   <td><i class="icon-user-md"></i> MEDICAL</td>
			   <td><%=summedi%>원</td>
			</tr><%} %>
		<%if(sumbea!=0){%>
			<tr>
			   <td><i class="icon-magic"></i> BEAUTY</td>
			   <td><%=sumbea%>원</td>
			</tr><%} %>
		
			</table>
</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
 --%>