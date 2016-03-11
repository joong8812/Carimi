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

<title>exp_3</title>

<%!
int sum1=0;
int sum2=0;
int sum3=0;
int sum4=0;
int sum5=0;
int sum6=0;
int sum7=0;
int sum8=0;
int sum9=0;
int sum10=0;
int sum11=0;
int sum12=0;
int sum13=0;
int sum14=0;
int sum15=0;
int sum16=0;
int sum17=0;
int sum18=0;
int sum19=0;
int sum20=0;
int sum21=0;
int sum22=0;
int sum23=0;
int sum24=0;
int sum25=0;
int sum26=0;
int sum27=0;
int sum28=0;
int sum29=0;
int sum30=0;
int sum31=0;

int categorylist;
String[][] sumprice = null;
expenditureDTO exp;
%>

<div class="main-inner">
	<div class="container">
		<div class="row">
			<div class="widget">
				<div class="widget-header">
					<i class="icon-credit-card"></i>
					<h3>${id}'S EXPENDITURE ANALYSIS</h3>
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
								<td class="pull-left"><a href="${sleft}"><img
										src="/CarimiS/image/left.png" /></a>${sf3}<a href='${sright}'><img
										src="/CarimiS/image/right.png" /></a></td>
								<td>
									<form action="/CarimiS/exp_1.do" method="post">
										<input type="submit"
											style="font-size: 10pt; height: 25; width: 90px;" value="항목별"
											id="submit1">
									</form>
								</td>
								<td>
									<form action="/CarimiS/exp_2.do" method="post">
										<input type="submit"
											style="font-size: 10pt; height: 25; width: 90px;" value="카드별"
											id="submit1">
									</form>
								</td>
								<td>
									<form action="/CarimiS/exp_3.do" method="post">
										<input type="submit"
											style="font-size: 10pt; height: 25; width: 90px;" value="날짜별"
											id="submit1">
									</form>
								</td>
							</tr>
						</table>

						<div style="width: 200%; padding: 5px; margin: auto;">
							<script type="text/javascript">
					$(function() {
						// Create the chart
	
			    $('#container').highcharts({
			        chart: {
			            type: 'column'
			        },
			        title: {
			            text: 'Expenditure during one month'
			        },
			        xAxis: {
			            type: 'day',
			            enabled: true,
			            labels: {
			                rotation: -45,
			                style: {
			                	color: '#000000',
			                    fontSize: '10px',
			                    fontFamily: 'Verdana, sans-serif'
			                }
			            }
			        },
			        yAxis: {
			            min: 0,
			            title: {
			                text: 'Expenditure (won)'
			            }
			        },
			        legend: {
			            enabled: false
			        },
			        tooltip: {
			            pointFormat: 'Expenditure during one month: <b>{point.y:.f} 원</b>'
			        },
			        series: [{
			            name: 'Expenditure',
			            data: [
			                ['Day1', '${sum1}'*1],
			                ['Day2', '${sum2}'*1],
			                ['Day3', '${sum3}'*1],
    		                ['Day4', '${sum4}'*1],
			                ['Day5', '${sum5}'*1],
			                ['Day6', '${sum6}'*1],
			                ['Day7', '${sum7}'*1],
			                ['Day8', '${sum8}'*1],
			                ['Day9', '${sum9}'*1],
			                ['Day10', '${sum10}'*1],
			                ['Day11', '${sum11}'*1],
			                ['Day12', '${sum12}'*1],
			                ['Day13', '${sum13}'*1],
			                ['Day14', '${sum14}'*1],
			                ['Day15', '${sum15}'*1],
			                ['Day16', '${sum16}'*1],
			                ['Day17', '${sum17}'*1],
			                ['Day18', '${sum18}'*1],
			                ['Day19', '${sum19}'*1],
			                ['Day20', '${sum20}'*1],
			                ['Day21', '${sum21}'*1],
			                ['Day22', '${sum22}'*1],
			                ['Day23', '${sum23}'*1],
			                ['Day24', '${sum24}'*1],
			                ['Day25', '${sum25}'*1],
			                ['Day26', '${sum26}'*1],
			                ['Day27', '${sum27}'*1],
			                ['Day28', '${sum28}'*1],
			                ['Day29', '${sum29}'*1],
			                ['Day30', '${sum30}'*1],
			                ['Day31', '${sum31}'*1]
			            ],
			            dataLabels: {
			                enabled: true,
			                rotation: 0,
			                color: '#9F2a4d',
			                align: 'right',
			                format: '{point.y:.f}', // one decimal
			                y: 10, // 10 pixels down from the top
			                style: {
			                    fontSize: '9px',
			                    fontFamily: 'Verdana, sans-serif'
			                }
			            }
			        }]
			    });
			});
					</script>

			<script src="https://code.highcharts.com/highcharts.js"></script>
			<script src="https://code.highcharts.com/modules/exporting.js"></script>
		
	<div id="container" style="min-width: 400px; width:85%; max-width:85%; height: 500px;"></div>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>