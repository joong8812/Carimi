<%@page import="javafx.scene.control.DatePicker"%>
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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<fmt:requestEncoding value="UTF-8" />
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.9.1/themes/base/jquery-ui.css" />

<script src="http://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<title>monlist</title>

<%!
double sumoil=0;
double sumshop=0;
double summart=0;
double sumcvs=0;
double sumeou=0;
double sumcafe=0;
double summovie=0;
double sumtra=0;
double sumtel=0;
double sumedu=0;
double sumcul=0;
double sumlei=0;
double summedi=0;
double sumbea=0;

double totalsum = 0;

int categorylist;
int scategorylist;

String[][] sumprice = null;
String[][] sumscate = null;
expenditureDTO exp;
%>

<%!
double sumres = 0;
double sumfast = 0;
double sumliq = 0;
double sumeetc = 0;
double sumcgv = 0;
double sumlotte = 0;
double summega = 0;
double sumpri = 0;
double summetc = 0;
double sumresort = 0;
double sumamuse = 0;
double sumtravel = 0;
double sumhotel = 0;
double sumgolf = 0;
double sumair = 0;
double sumletc = 0;
double sumdep = 0;
double sumout = 0;
double sumduty = 0;
double suminter = 0;
double sumhome = 0;
double sumsetc = 0;

%>


<%    
totalsum = sumoil + sumshop + summart + sumcvs + sumeou + sumcafe + summovie + sumtra + sumtel + sumedu + sumcul + sumlei + summedi + sumbea;
%>

<div class="main-inner">
	<div class="container">
		<div class="row">
			<div class="widget">
				<div class="widget-header">
					<i class="icon-credit-card"></i>
					<h3>${id}님의 월간 보고서</h3>
				</div>
				<div class="widget-conetent">
					<div class="widget-content pull-left">
						<div>
							<form action="monlist.do" method="post">
								<input type="submit" value="월간 보고서" id="submit"> <input
									type="hidden" id="id" name="id" value='${id}'> <input
									type="hidden" id="wdate" name="wdate" value='${wdate}'>
							</form>
							<form action="yearlist.do" method="post">
								<input type="submit" value="연간 보고서" id="submit">
							</form>

							<form action="exp_1.do" method="post">
								<input type="submit" value="지출 분석" id="submit">
							</form>
							<form action="explist.do" method="post">
								<input type="submit" value="지출목록 보기" id="submit">
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
								<td class="pull-left"><a href='${sleft}'><img
										src="/CarimiS/image/left.png" /></a>${sf3}<a href='${sright}'><img
										src="/CarimiS/image/right.png" /></a></td>
							</tr>
						</table>

						<div style="width: 200%; padding: 5px; margin: auto;">
							<script type="text/javascript">
					$(function() {
						// Create the chart
						$('#container')
								.highcharts(
										{
											chart : {
												type : 'pie'
											},
											title : {
												text : ''
											},
											plotOptions : {
												series : {
													dataLabels : {
														enabled : true,
														format : '{point.name}: {point.y:.1f}%'
													}
												}
											},

											tooltip : {
												headerFormat : '<span style="font-size:15px">{series.name}</span><br>',
												pointFormat : '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
											},
											series : [ {
												name : 'Consumption',
												colorByPoint : true,
												data : [ {
													name : 'Eat-out',
													y : ('${sumeou}'/'${totalsum}')*100,
													drilldown : 'Eat-out'
												}, {
													name : 'Movie',
													y : ('${summovie}'/'${totalsum}')*100,
													drilldown : 'Movie'
												}, {
													name : 'Leisure',
													y : ('${sumlei}'/'${totalsum}')*100,
													drilldown : 'Leisure'
												}, {
													name : 'Shopping',
													y : ('${sumshop}'/'${totalsum}')*100,
													drilldown : 'Shopping'
												}, {
													name : 'Telecom',
													y : ('${sumtel}'/'${totalsum}')*100,
													drilldown : null
												}, {
													name : 'Transportaion',
													y : ('${sumtra}'/'${totalsum}')*100,
													drilldown : null
												}, {
													name : 'Education',
													y : ('${sumedu}'/'${totalsum}')*100,
													drilldown : null
												}
												, {
													name : 'Oil',
													y : ('${sumoil}'/'${totalsum}')*100,
													drilldown : null
												}
												, {
													name : 'Mart',
													y : ('${summart}'/'${totalsum}')*100,
													drilldown : null
												}
												, {
													name : 'CVS',
													y : ('${sumcvs}'/'${totalsum}')*100,
													drilldown : null
												}
												, {
													name : 'Cafe',
													y : ('${sumcafe}'/'${totalsum}')*100,
													drilldown : null
												}
												,  {
													name : 'Culture',
													y : ('${sumcul}'/'${totalsum}')*100,
													drilldown : null
												}
												, {
													name : 'Medical',
													y : ('${summedi}'/'${totalsum}')*100,
													drilldown : null
												}
												, {
													name : 'Beauty',
													y : ('${sumbea}'/'${totalsum}')*100,
													drilldown : null
												}]
											} ],
											drilldown : {
												series : [
														{
															name : 'Eat-out',
															id : 'Eat-out',
															data : [
																	[ 'Restaurant', ('${sumres}'/'${sumeou}')*100 ],
																	[ 'Fastfood',  ('${sumfast}'/'${sumeou}')*100 ],
																	[ 'Liquor',  ('${sumliq}'/'${sumeou}')*100],
																	[ 'etc', ('${sumeetc}'/'${sumeou}')*100 ] ]
														},
														{
															name : 'Movie',
															id : 'Movie',
															data : [
																	[ 'CGV', ('${sumcgv}'/'${summovie}')*100 ],
																	[ 'Lotte cinema', ('${sumlotte}'/'${summovie}')*100],
																	[ 'Megabox',  ('${summega}'/'${summovie}')*100],
																	[ 'Primus', ('${sumpri}'/'${summovie}')*100 ],
																	[ 'etc', ('${summetc}'/'${summovie}')*100 ] ]
														},
														{
															name : 'Leisure',
															id : 'Leisure',
															data : [
																	[ 'Resort', ('${sumresort}'/'${sumlei}')*100 ],
																	[ 'Amusement park',  ('${sumamuse}'/'${sumlei}')*100],
																	[ 'Travel agency',  ('${sumtravel}'/'${sumlei}')*100 ],
																	[ 'Hotel',  ('${sumhotel}'/'${sumlei}')*100 ],
																	[ 'Golf', ('${sumgolf}'/'${sumlei}')*100 ],
																	[ 'Airline',  ('${sumair}'/'${sumlei}')*100 ],
																	[ 'etc',  ('${sumletc}'/'${sumlei}')*100 ] ]
														},
														{
															name : 'Shopping',
															id : 'Shopping',
															data : [
																	[ 'Department store',  ('${sumdep}'/'${sumshop}')*100],
																	[ 'Outlet', ('${sumout}'/'${sumshop}')*100 ],
																	[ 'Duty Free Shop',  ('${sumduty}'/'${sumshop}')*100],
																	[ 'Internet shopping',  ('${suminter}'/'${sumshop}')*100],
																	[ 'Homeshopping',  ('${sumhome}'/'${sumshop}')*100 ],
																	[ 'etc',  ('${sumsetc}'/'${sumshop}')*100]
																   ]
														}]
											}
										});
					});
				</script>

							<script src="https://code.highcharts.com/highcharts.js"></script>
							<script src="https://code.highcharts.com/modules/data.js"></script>
							<script src="https://code.highcharts.com/modules/drilldown.js"></script>

							<div id="container" style="min-width: 480px; width:100%; max-width:100%; height: 500px;"></div>
						</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>

