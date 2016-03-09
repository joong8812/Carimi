<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="UTF-8" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.9.1/themes/base/jquery-ui.css" />
	
<script src="http://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>

<style>
#header {
	background-color: white;
	color: black;
	text-align: left;
	padding: 5px;
	height: 80px;
	border: 1px solid #F2E6D9;
}

#wrapperDiv {
	width: 100%;
	height: 570px;
	background-color: #ffffff;
}

#nav {
	line-height: 20px;
	background-color: #F2E6D9;
	margin: 10px;
	width: 230px;
	height: 570px;
	float: left;
	padding: 20px;
}

.center {
	width: 44%;
	padding: 5px;
	height: 50px;
	float: left;
}

.center div div div {border:none; background:none;}
.center div div {border:none; background:none;}
.ui-datepicker-title {margin:0 2.3em 0 0 !important; text-align:left !important;}

#submit {
	background-color: #b6e2ed;
}
.ui-datepicker-calendar,.ui-datepicker-month {
	display: none;
}
div.ui-datepicker-header 
a.ui-datepicker-prev,div.ui-datepicker-header 
a.ui-datepicker-next
{
    display: none;  
}
div.ui-widget-header,div.ui-helper-clearfix,div.ui-widget-content{
background-color:white;
}
</style>



<div class="main-inner">
	<div class="container">
		<div class="row">
			<div class="widget">
				<div class="widget-header">
					<i class="icon-credit-card"></i>
					<h3>&nbsp;${login.id } &nbsp;'S YEARLY CHARTS
					</h3>
				</div>
				<div class="widget-conetent">
					<div class="widget-content pull-left">
						<div>
							<form action="monlist.do" method="post">
								<input type="submit" value="월간 보고서" id="submit">
							</form>
							<form action="yearlist.do" method="post">
								<input type="submit" value="연간 보고서" id="submit">
							</form>
	
							<form action="exp_1.do" method="post">
								<input type="submit" value="지출 분석" id="submit">
							</form>
							<form action="exp_write.do" method="post">
								<input type="submit" value="지출내역 쓰기" id="submit">
							</form>
						</div>
					</div>
				<div class="widget-content pull-left" style="margin-left:25px;" >
						<div>
							<div class ="date-picker-year"></div>
					
						</div>
		
					<table>
					<tr>
						<td><a href="${sleft }"><img src="/CarimiS/image/left.png" /></a> 
						${sf2 } 
						<a href="${sright }"><img src="/CarimiS/image/right.png" /></a></td>
					</tr>
				</table> 
		<br>
		
		<input type="hidden" id="sumshop" value="${sumshop }">

		<div
			style="width: 200%; padding: 5px; margin: auto;">
			<script type="text/javascript">
				$(function() {
					$('#container').highcharts(
							{

								chart : {
									type : 'column'
								},

								title : {
									text : 'Total Card Consumption'
								},

								xAxis : {
									categories : [ 'Jan', 'Feb', 'Mar', 'Apr',
											'May', 'Jun', 'Jul', 'Aug', 'Sep',
											'Oct', 'Nov', 'Dec' ]
								},

								yAxis : {
									allowDecimals : false,
									min : 0,
									title : {
										text : 'Consumption'
									}
								},

								tooltip : {
									formatter : function() {
										return '<b>' + this.x + '</b><br/>'
												+ this.series.name + ': '
												+ this.y + '<br/>' + 'Total: '
												+ this.point.stackTotal;
									}
								},

								plotOptions : {
									column : {
										stacking : 'normal'
									}
								},

								series : [
										{
											name : 'Shopping',
											data : [ 5, '${sumshop}' , 4, 7, 2, 6, 8, 9, 3,
													5, 4, 1 ],
											stack : 'month'
										},
										{
											name : 'Oil',
											data : [ 3, '${sumoil}', 4, 2, 5, 6, 3, 8, 1,
													4, 5, 9 ],
											stack : 'month'
										},
										{
											name : 'Cafe',
											data : [ 2, '${sumcafe}', 6, 2, 1, 2, 1, 3, 6,
													4, 1, 2 ],
											stack : 'month'
										},
										{
											name : 'Beauty',
											data : [ 3, '${sumbea}', 4, 4, 3, 2, 4, 8, 4,
													3, 2, 1 ],
											stack : 'month'
										},
										{
											name : 'Mart',
											data : [ 3, '${summart}', 4, 2, 5, 6, 4, 1, 5,
													2, 1, 1 ],
											stack : 'month'
										},
										{
											name : 'CVS',
											data : [ 2, '${sumcvs}', 6, 2, 1, 2, 1, 5, 9,
													6, 8, 4 ],
											stack : 'month'
										},
										{
											name : 'eat-out',
											data : [ 3, '${sumeou}', 4, 4, 3, 2, 6, 4, 4,
													3, 5, 1 ],
											stack : 'month'
										},
										{
											name : 'Movie',
											data : [ 3, '${summovie}', 4, 2, 5, 8, 9, 2, 5,
													1, 6, 3 ],
											stack : 'month'
										},
										{
											name : 'Transportaion',
											data : [ 2, '${sumtra}', 6, 2, 1, 5, 4, 4, 6,
													3, 1, 2 ],
											stack : 'month'
										},
										{
											name : 'Telecom',
											data : [ 3, '${sumtel}', 4, 4, 3, 6, 2, 5, 1,
													2, 2, 3 ],
											stack : 'month'
										},
										{
											name : 'Education',
											data : [ 3, '${sumedu}', 4, 4, 3, 7, 4, 1, 5,
													1, 2, 2 ],
											stack : 'month'
										},
										{
											name : 'Culture',
											data : [ 3, '${sumcul}', 4, 2, 5, 3, 2, 2, 1,
													5, 4, 1 ],
											stack : 'month'
										},
										{
											name : 'Leisure',
											data : [ 2, '${sumlei}', 6, 2, 1, 6, 4, 5, 4,
													2, 1, 1 ],
											stack : 'month'
										},
										{
											name : 'Medical',
											data : [ 3, '${summedi}', 4, 4, 3, 2, 3, 5, 4,
													1, 4, 1 ],
											stack : 'month'
										}]
							});

				});
			</script>

			<script src="https://code.highcharts.com/highcharts.js"></script>
			<script src="https://code.highcharts.com/modules/exporting.js"></script>

			<div id="container"
				style="min-width: 480px; width: 100%; max-width: 100%; height: 500px;"></div>

		</div>
		<br>
</div></div></div></div>
	</div>
</div>

