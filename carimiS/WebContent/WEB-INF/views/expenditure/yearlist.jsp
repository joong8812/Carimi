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
					<h3>${login.id}님의 연간 보고서</h3>
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
						<div>
							<div class="date-picker-year"></div>

						</div>

						<table>
							<tr>
								<td><a href="${sleft }"><img
										src="/CarimiS/image/left.png" /></a> ${sf2 } <a href="${sright }"><img
										src="/CarimiS/image/right.png" /></a></td>
							</tr>
						</table>
						<br>

						<script>
		function ss(){
			return 60;
		}
		</script>

						<div style="width: 200%; padding: 5px; margin: auto;">
							<script type="text/javascript">
				$(function() {
					var sumshop = new Array();
					var totalshop = 0;
					<c:forEach items="${sumshop}" var="sshop">
						sumshop.push("${sshop}");
						
					</c:forEach>
					for (var i = 0; i < 12; i++) {

					  totalshop +=  sumshop[i]*1;
						
					} 
					
					var sumoil = new Array();
					var totaloil = 0;
					<c:forEach items="${sumoil}" var="sshop">
						sumoil.push("${sshop}");
					</c:forEach>
					for (var i = 0; i < 12; i++) {

						totaloil +=  sumoil[i]*1;
						} 
					
					var sumbea = new Array();
					var totalbea = 0;
					<c:forEach items="${sumbea}" var="sshop">
						sumbea.push("${sshop}");
					</c:forEach>
					for (var i = 0; i < 12; i++) {

						totalbea +=  sumbea[i]*1;
							
						} 
					
					var summart = new Array();
					var totalmart = 0;
					<c:forEach items="${summart}" var="sshop">
						summart.push("${sshop}");
					</c:forEach>
					for (var i = 0; i < 12; i++) {

						totalmart +=  summart[i]*1;
							
						} 
					
					var sumcvs = new Array();
					var totalcvs = 0;
					<c:forEach items="${sumcvs}" var="sshop">
						sumcvs.push("${sshop}");
					</c:forEach>
					for (var i = 0; i < 12; i++) {

						totalcvs +=  sumcvs[i]*1;
							
						} 
					
					var sumeou = new Array();
					var totaleou = 0;
					<c:forEach items="${sumeou}" var="sshop">
						sumeou.push("${sshop}");
					</c:forEach>
					for (var i = 0; i < 12; i++) {

						totaleou +=  sumeou[i]*1;
							
						} 
					
					var summovie = new Array();
					var totalmovie = 0;
					<c:forEach items="${summovie}" var="sshop">
						summovie.push("${sshop}");
					</c:forEach>
					for (var i = 0; i < 12; i++) {

						totalmovie +=  summovie[i]*1;
							
						} 
					
					var sumtra = new Array();
					var totaltra = 0;
					<c:forEach items="${sumtra}" var="sshop">
						sumtra.push("${sshop}");
					</c:forEach>
					for (var i = 0; i < 12; i++) {

						totaltra +=  sumtra[i]*1;
							
						} 
					
					var sumtel = new Array();
					var totaltel = 0;
					<c:forEach items="${sumtel}" var="sshop">
						sumtel.push("${sshop}");
					</c:forEach>
					for (var i = 0; i < 12; i++) {

						totaltel +=  sumtel[i]*1;
							
						} 
					
					var sumedu = new Array();
					var totaledu = 0;
					<c:forEach items="${sumedu}" var="sshop">
						sumedu.push("${sshop}");
					</c:forEach>
					for (var i = 0; i < 12; i++) {

						totaledu +=  sumedu[i]*1;
							
						} 
					
					var sumcul = new Array();
					var totalcul = 0;
					<c:forEach items="${sumcul}" var="sshop">
						sumcul.push("${sshop}");
					</c:forEach>
					for (var i = 0; i < 12; i++) {

						totalcul +=  sumcul[i]*1;
							
						} 
					
					var sumlei = new Array();
					var totallei = 0;
					<c:forEach items="${sumlei}" var="sshop">
						sumlei.push("${sshop}");
					</c:forEach>
					for (var i = 0; i < 12; i++) {

						totallei +=  sumlei[i]*1;
							
						} 
					
					var summedi = new Array();
					var totalmedi = 0;
					<c:forEach items="${summedi}" var="sshop">
						summedi.push("${sshop}");
					</c:forEach>
					for (var i = 0; i < 12; i++) {

						totalmedi +=  summedi[i]*1;
							
						} 
					
					var sumcafe = new Array();
					var totalcafe = 0;
					<c:forEach items="${sumcafe}" var="sshop">
						sumcafe.push("${sshop}");
					</c:forEach>
					for (var i = 0; i < 12; i++) {

						totalcafe +=  sumcafe[i]*1;
							
						} 
					
					var score = new Array();
					score = [totaloil,totalshop,totalmart,totalcvs,totaleou,totalcafe,totalmovie,totaltra,totaltel,totaledu,totalcul,totallei,totalmedi,totalbea];
					var scorename = new Array(); 
					scorename = ["주유","쇼핑","대형마트","편의점","외식","카페/베이커리","영화","교통","통신","교육","문화","레저","의료","뷰티"]; 

					var arrIndex=0;
					var max = score[0];
					var k = 0;
					for(k = 1; k < score.length; k++) {
					    if (score[k] > max){
					        max = score[k];
					        arrIndex = k;
					    }
					}
					
					var cardking = [["OIL","SHOP","MART","CVS","EOU","CAFE","MOVIE","TRA","TEL","EDU","CUL","LEI","MEDI","BEA"],
				            ["기업 ibk hi","기업 참!좋은친구","기업 참!좋은친구","씨티 클리어","기업 참!좋은친구","기업 참!좋은친구","기업 참!좋은친구","씨티 클리어","씨티 클리어","국민 굿데이","씨티 클리어","기업 ibk hi","우리 가득한할인","롯데 DC Smart"],
				            ["기업 참!좋은친구","씨티 클리어","씨티 클리어","국민 굿데이","기업 ibk hi","농협 스마티","씨티 클리어","기업 ibk hi","기업 ibk hi","하나 투엑스알파","삼성 S클래스","기업 참!좋은친구","롯데 DC Smart","하나 팝"],
				            ["국민 굿데이","농협 스마티","씨티 멀티플러스","씨티 멀티플러스","농협 스마티","씨티 클리어","우리 가득한할인","씨티 멀티플러스","국민 굿데이","우리 가득한할인","농협 스마티","씨티 클리어","신한 Love","신한 Love"]];
					
					/* alert("지출 내역 중  " + scorename[arrIndex] + "카테고리에서 가장 많은 지출 " + max + "원을 사용하였습니다."); */
					
					if(scorename[arrIndex]=="주유"){
						$("#div1").text(scorename[arrIndex] + "카테고리에서 가장 많은 지출 " + max + "원을 사용하였습니다.");
						$("#div2").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 1위 카드 " + "'" + cardking[1][0] + "' 카드를 추천해드립니다!");
						$("#div3").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 2위 카드는 " + "'" + cardking[2][0] + "' 카드");
						$("#div4").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 3위 카드는 " + "'" + cardking[3][0] + "' 카드입니다.");
						$("#div5").attr("href","http://www.ibk.co.kr");

					}
					if(scorename[arrIndex]=="쇼핑"){
						$("#div1").text(scorename[arrIndex] + "카테고리에서 가장 많은 지출 " + max + "원을 사용하였습니다.");
						$("#div2").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는  1위 카드 " + "'" + cardking[1][1] + "' 카드를 추천해드립니다!");
						$("#div3").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 2위 카드는 " + "'" + cardking[2][1] + "' 카드");
						$("#div4").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 3위 카드는 " + "'" + cardking[3][1] + "' 카드입니다.");
						$("#div5").attr("href","http://www.ibk.co.kr");
					}
 					if(scorename[arrIndex]=="대형마트"){
 						$("#div1").text(scorename[arrIndex] + "카테고리에서 가장 많은 지출 " + max + "원을 사용하였습니다.");
						$("#div2").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 1위 카드 " + "'" + cardking[1][2] + "'" +  " 카드를 추천해드립니다!");
						$("#div3").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 2위 카드는 " + "'" + cardking[2][2] + "' 카드");
						$("#div4").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 3위 카드는 " + "'" + cardking[3][2] + "' 카드입니다.");
						$("#div5").attr("href","http://www.ibk.co.kr");
 					}
 					if(scorename[arrIndex]=="편의점"){
 						$("#div1").text(scorename[arrIndex] + "카테고리에서 가장 많은 지출 " + max + "원을 사용하였습니다.");
						$("#div2").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 1위 카드 " + "'" + cardking[1][3] + "'" +  " 카드를 추천해드립니다!");
						$("#div3").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 2위 카드는 " + "'" + cardking[2][3] + "' 카드");
						$("#div4").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 3위 카드는 " + "'" + cardking[3][3] + "' 카드입니다.");
						$("#div5").attr("href","http://www.citibank.co.kr");
 					}
					if(scorename[arrIndex]=="외식"){
						$("#div1").text(scorename[arrIndex] + "카테고리에서 가장 많은 지출 " + max + "원을 사용하였습니다.");
						$("#div2").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 1위 카드 " + "'" + cardking[1][4] + "'" +  " 카드를 추천해드립니다!");
						$("#div3").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 2위 카드는 " + "'" + cardking[2][4] + "' 카드");
						$("#div4").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 3위 카드는 " + "'" + cardking[3][4] + "' 카드입니다.");
						$("#div5").attr("href","http://www.ibk.co.kr");
					}
 					if(scorename[arrIndex]=="카페/베이커리"){
 						$("#div1").text(scorename[arrIndex] + "카테고리에서 가장 많은 지출 " + max + "원을 사용하였습니다.");
						$("#div2").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 1위 카드 " + "'" + cardking[1][5] + "'" +  " 카드를 추천해드립니다!");
						$("#div3").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 2위 카드는 " + "'" + cardking[2][5] + "' 카드");
						$("#div4").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 3위 카드는 " + "'" + cardking[3][5] + "' 카드입니다.");
						$("#div5").attr("href","http://www.ibk.co.kr");
 					}
 					if(scorename[arrIndex]=="영화"){
 						$("#div1").text(scorename[arrIndex] + "카테고리에서 가장 많은 지출 " + max + "원을 사용하였습니다.");
						$("#div2").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 1위 카드 " + "'" + cardking[1][6] + "'" +  " 카드를 추천해드립니다!");
						$("#div3").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 2위 카드는 " + "'" + cardking[2][6] + "' 카드");
						$("#div4").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 3위 카드는 " + "'" + cardking[3][6] + "' 카드입니다.");
						$("#div5").attr("href","http://www.ibk.co.kr");
 					}
 					if(scorename[arrIndex]=="교통"){
 						$("#div1").text(scorename[arrIndex] + "카테고리에서 가장 많은 지출 " + max + "원을 사용하였습니다.");
						$("#div2").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 1위 카드 " + "'" + cardking[1][7] + "'" +  " 카드를 추천해드립니다!");
						$("#div3").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 2위 카드는 " + "'" + cardking[2][7] + "' 카드");
						$("#div4").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 3위 카드는 " + "'" + cardking[3][7] + "' 카드입니다.");
						$("#div5").attr("href","http://www.citibank.co.kr");
 					}
 					if(scorename[arrIndex]=="통신"){
 						$("#div1").text(scorename[arrIndex] + "카테고리에서 가장 많은 지출 " + max + "원을 사용하였습니다.");
						$("#div2").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 1위 카드 " + "'" + cardking[1][8] + "'" +  " 카드를 추천해드립니다!");
						$("#div3").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 2위 카드는 " + "'" + cardking[2][8] + "' 카드");
						$("#div4").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 3위 카드는 " + "'" + cardking[3][8] + "' 카드입니다.");
						$("#div5").attr("href","http://www.citibank.co.kr");
 					}
 					if(scorename[arrIndex]=="교육"){
 						$("#div1").text(scorename[arrIndex] + "카테고리에서 가장 많은 지출 " + max + "원을 사용하였습니다.");
						$("#div2").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 1위 카드 " + "'" + cardking[1][9] + "'" +  " 카드를 추천해드립니다!");
						$("#div3").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 2위 카드는 " + "'" + cardking[2][9] + "' 카드");
						$("#div4").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 3위 카드는 " + "'" + cardking[3][9] + "' 카드입니다.");
						$("#div5").attr("href","https://www.kbstar.com");
 					}
 					if(scorename[arrIndex]=="문화"){
 						$("#div1").text(scorename[arrIndex] + "카테고리에서 가장 많은 지출 " + max + "원을 사용하였습니다.");
						$("#div2").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 1위 카드 " + "'" + cardking[1][10] + "'" +  " 카드를 추천해드립니다!");
						$("#div3").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 2위 카드는 " + "'" + cardking[2][10] + "' 카드");
						$("#div4").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 3위 카드는 " + "'" + cardking[3][10] + "' 카드입니다.");
						$("#div5").attr("href","http://www.citibank.co.kr");
 					}
 					if(scorename[arrIndex]=="레저"){
 						$("#div1").text(scorename[arrIndex] + "카테고리에서 가장 많은 지출 " + max + "원을 사용하였습니다.");
						$("#div2").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 1위 카드 " + "'" + cardking[1][11] + "'" +  " 카드를 추천해드립니다!");
						$("#div3").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 2위 카드는 " + "'" + cardking[2][11] + "' 카드");
						$("#div4").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 3위 카드는 " + "'" + cardking[3][11] + "' 카드입니다.");
						$("#div5").attr("href","http://www.ibk.co.kr");
 					}
 					if(scorename[arrIndex]=="의료"){
 						$("#div1").text(scorename[arrIndex] + "카테고리에서 가장 많은 지출 " + max + "원을 사용하였습니다.");
						$("#div2").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 1위 카드 " + "'" + cardking[1][12] + "'" +  " 카드를 추천해드립니다!");
						$("#div3").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 2위 카드는 " + "'" + cardking[2][12] + "' 카드");
						$("#div4").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 3위 카드는 " + "'" + cardking[3][12] + "' 카드입니다.");
						$("#div5").attr("href","https://www.wooribank.com");
 					}
 					if(scorename[arrIndex]=="뷰티"){
 						$("#div1").text(scorename[arrIndex] + "카테고리에서 가장 많은 지출 " + max + "원을 사용하였습니다.");
						$("#div2").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 1위 카드 " + "'" + cardking[1][13] + "'" +  " 카드를 추천해드립니다!");
						$("#div3").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 2위 카드는 " + "'" + cardking[2][13] + "' 카드");
						$("#div4").text(scorename[arrIndex] + "카테고리에서 최대 혜택을 제공하는 3위 카드는 " + "'" + cardking[3][13] + "' 카드입니다.");
						$("#div5").attr("href","https://www.lottecard.co.kr");
 					}
					
					
					$('#container').highcharts(
							{

								chart : {
									type : 'column'
								},

								title : {
									text : ''
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
						<div id="div1">여기다</div>
						<div id="div2">여기다</div>
						<div id="div3">여기다</div>
						<div id="div4">여기다</div>
						<div>
							<a href="http://www.naver.com" id="div5">1위카드팡팡!</a>
						</div>
						<br>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

