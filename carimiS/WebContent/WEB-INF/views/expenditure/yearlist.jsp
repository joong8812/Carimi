<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="UTF-8" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.9.1/themes/base/jquery-ui.css" />
	
<script src="http://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>

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
							<form action="explist.do" method="post">
								<input type="submit" value="지출목록 보기" id="submit">
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
		
		<script>
		function ss(){
			return 60;
		}
		</script>

		<div
			style="width: 200%; padding: 5px; margin: auto;">
			<script type="text/javascript">
				$(function() {
					var sumshop = new Array();
					<c:forEach items="${sumshop}" var="sshop">
						sumshop.push("${sshop}");
					</c:forEach>
					
					var sumoil = new Array();
					<c:forEach items="${sumoil}" var="sshop">
						sumoil.push("${sshop}");
					</c:forEach>
					
					var sumbea = new Array();
					<c:forEach items="${sumbea}" var="sshop">
						sumbea.push("${sshop}");
					</c:forEach>
					
					var summart = new Array();
					<c:forEach items="${summart}" var="sshop">
						summart.push("${sshop}");
					</c:forEach>
					
					var sumcvs = new Array();
					<c:forEach items="${sumcvs}" var="sshop">
						sumcvs.push("${sshop}");
					</c:forEach>
					
					var sumeou = new Array();
					<c:forEach items="${sumeou}" var="sshop">
						sumeou.push("${sshop}");
					</c:forEach>
					
					var summovie = new Array();
					<c:forEach items="${summovie}" var="sshop">
						summovie.push("${sshop}");
					</c:forEach>
					
					var sumtra = new Array();
					<c:forEach items="${sumtra}" var="sshop">
						sumtra.push("${sshop}");
					</c:forEach>
					
					var sumtel = new Array();
					<c:forEach items="${sumtel}" var="sshop">
						sumtel.push("${sshop}");
					</c:forEach>
					
					var sumedu = new Array();
					<c:forEach items="${sumedu}" var="sshop">
						sumedu.push("${sshop}");
					</c:forEach>
					
					var sumcul = new Array();
					<c:forEach items="${sumcul}" var="sshop">
						sumcul.push("${sshop}");
					</c:forEach>
					
					var sumlei = new Array();
					<c:forEach items="${sumlei}" var="sshop">
						sumlei.push("${sshop}");
					</c:forEach>
					
					var summedi = new Array();
					<c:forEach items="${summedi}" var="sshop">
						summedi.push("${sshop}");
					</c:forEach>
					
					var sumcafe = new Array();
					<c:forEach items="${sumcafe}" var="sshop">
						sumcafe.push("${sshop}");
					</c:forEach>
					
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
											data : [ sumshop[0]*1, sumshop[1]*1, sumshop[2]*1, sumshop[3]*1,
											         sumshop[4]*1, sumshop[5]*1, sumshop[6]*1, sumshop[7]*1, 
											         sumshop[8]*1, sumshop[9]*1, sumshop[10]*1, sumshop[11]*1 ],
											stack : 'month'
										},
										{
											name : 'Oil',
											data : [ sumoil[0]*1, sumoil[1]*1, sumoil[2]*1, sumoil[3]*1, 
											         sumoil[4]*1, sumoil[5]*1, sumoil[6]*1, sumoil[7]*1, 
											         sumoil[8]*1, sumoil[9]*1, sumoil[10]*1, sumoil[11]*1 ],
											stack : 'month'
										},
										{
											name : 'Cafe',
											data : [ sumcafe[0]*1, sumcafe[1]*1, sumcafe[2]*1, sumcafe[3]*1, 
											         sumcafe[4]*1, sumcafe[5]*1, sumcafe[6]*1, sumcafe[7]*1, 
											         sumcafe[8]*1, sumcafe[9]*1, sumcafe[10]*1, sumcafe[11]*1 ],
											stack : 'month'
										},
										{
											name : 'Beauty',
											data : [ sumbea[0]*1, sumbea[1]*1, sumbea[2]*1, sumbea[3]*1, 
											         sumbea[4]*1, sumbea[5]*1, sumbea[6]*1, sumbea[7]*1, 
											         sumbea[8]*1, sumbea[9]*1, sumbea[10]*1, sumbea[11]*1 ],
											stack : 'month'
										},
										{
											name : 'Mart',
											data : [ summart[0]*1, summart[1]*1, summart[2]*1, summart[3]*1, 
											         summart[4]*1, summart[5]*1, summart[6]*1, summart[7]*1, 
											         summart[8]*1, summart[9]*1, summart[10]*1, summart[11]*1 ],
											stack : 'month'
										},
										{
											name : 'CVS',
											data : [ sumcvs[0]*1, sumcvs[1]*1, sumcvs[2]*1, sumcvs[3]*1, 
											         sumcvs[4]*1, sumcvs[5]*1, sumcvs[6]*1, sumcvs[7]*1, 
											         sumcvs[8]*1, sumcvs[9]*1, sumcvs[10]*1, sumcvs[11]*1 ],
											stack : 'month'
										},
										{
											name : 'eat-out',
											data : [ sumeou[0]*1, sumeou[1]*1, sumeou[2]*1, sumeou[3]*1, 
											         sumeou[4]*1, sumeou[5]*1, sumeou[6]*1, sumeou[7]*1, 
											         sumeou[8]*1, sumeou[9]*1, sumeou[10]*1, sumeou[11]*1 ],
											stack : 'month'
										},
										{
											name : 'Movie',
											data : [ summovie[0]*1, summovie[1]*1, summovie[2]*1, summovie[3]*1, 
											         summovie[4]*1, summovie[5]*1, summovie[6]*1, summovie[7]*1, 
											         summovie[8]*1, summovie[9]*1, summovie[10]*1, summovie[11]*1 ],
											stack : 'month'
										},
										{
											name : 'Transportaion',
											data : [ sumtra[0]*1, sumtra[1]*1, sumtra[2]*1, sumtra[3]*1, 
											         sumtra[4]*1, sumtra[5]*1, sumtra[6]*1, sumtra[7]*1, 
											         sumtra[8]*1, sumtra[9]*1, sumtra[10]*1, sumtra[11]*1 ],
											stack : 'month'
										},
										{
											name : 'Telecom',
											data : [ sumtel[0]*1, sumtel[1]*1, sumtel[2]*1, sumtel[3]*1, 
											         sumtel[4]*1, sumtel[5]*1, sumtel[6]*1, sumtel[7]*1, 
											         sumtel[8]*1, sumtel[9]*1, sumtel[10]*1, sumtel[11]*1 ],
											stack : 'month'
										},
										{
											name : 'Education',
											data : [ sumedu[0]*1, sumedu[1]*1, sumedu[2]*1, sumedu[3]*1, 
											         sumedu[4]*1, sumedu[5]*1, sumedu[6]*1, sumedu[7]*1, 
											         sumedu[8]*1, sumedu[9]*1, sumedu[10]*1, sumedu[11]*1 ],
											stack : 'month'
										},
										{
											name : 'Culture',
											data : [ sumcul[0]*1, sumcul[1]*1, sumcul[2]*1, sumcul[3]*1, 
											         sumcul[4]*1, sumcul[5]*1, sumcul[6]*1, sumcul[7]*1, 
											         sumcul[8]*1, sumcul[9]*1, sumcul[10]*1, sumcul[11]*1 ],
											stack : 'month'
										},
										{
											name : 'Leisure',
											data : [ sumlei[0]*1, sumlei[1]*1, sumlei[2]*1, sumlei[3]*1, 
											         sumlei[4]*1, sumlei[5]*1, sumlei[6]*1, sumlei[7]*1, 
											         sumlei[8]*1, sumlei[9]*1, sumlei[10]*1, sumlei[11]*1 ],
											stack : 'month'
										},
										{
											name : 'Medical',
											data : [ summedi[0]*1, summedi[1]*1, summedi[2]*1, summedi[3]*1, 
											         summedi[4]*1, summedi[5]*1, summedi[6]*1, summedi[7]*1, 
											         summedi[8]*1, summedi[9]*1, summedi[10]*1, summedi[11]*1 ],
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

