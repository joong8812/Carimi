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

<fmt:requestEncoding value="UTF-8" />
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.9.1/themes/base/jquery-ui.css" />

<script src="http://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<title>exp_write</title>

<style>

.ui-datepicker {
	font-size: 12px;
	width: 170px;
}

.ui-datepicker select.ui-datepicker-month {
	width: 30%;
	font-size: 11px;
}

.ui-datepicker select.ui-datepicker-year {
	width: 40%;
	font-size: 11px;
}
#scategory1{display:none;float:none;margin:10px 0;line-height:1.4} 
#scategory1.open{display:block}
#scategory1.close{display:none; float:none;margin:10px 0;line-height:1.4}
#scategory2{display:none;float:none;margin:10px 0;line-height:1.4} 
#scategory2.open{display:block}
#scategory2.close{display:none; float:none;margin:10px 0;line-height:1.4}
#scategory3{display:none;float:none;margin:10px 0;line-height:1.4} 
#scategory3.open{display:block}
#scategory3.close{display:none; float:none;margin:10px 0;line-height:1.4}
#scategory4{display:none;float:none;margin:10px 0;line-height:1.4} 
#scategory4.open{display:block}
#scategory4.close{display:none; float:none;margin:10px 0;line-height:1.4}
#scategory5{display:none;float:none;margin:10px 0;line-height:1.4} 
#scategory5.open{display:block}
#scategory5.close{display:none; float:none;margin:10px 0;line-height:1.4}
</style>

<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : 'yy-mm-dd',
			inline: true,
	   		onSelect: function(dateText, inst) {
	       		 var wdate = $(this).datepicker('getDate'),
	           	 day  = wdate.getDate(),  
	             month = wdate.getMonth() + 1,              
	             year =  wdate.getFullYear();

	       		alert(day + '-' + month + '-' + year);
	       		 
	   		}
		});
	});
</script>

<div class="main-inner">
	<div class="container">
		<div class="row">
			<div class="widget">
				<div class="widget-header">
					<i class="icon-credit-card"></i>
					<h3>${id} 'S EXPENDITURE LIST</h3>
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
							<form action="explist.do" method="post">
								<input type="submit" value="지출목록 보기" id="submit">
							</form>
						</div>
					</div>

					<div class="widget-content pull-left" style="margin-left: 25px; width: 80%">
						<form action="expsave.do" method="post">
							<input type="hidden" id="id" name="id" value='${id}'>
							<table>
								<col width=52%>
								<tr>
									<td>WDATE</td>
									<td><input type="text" id="datepicker" name="wdate" /></td>
								</tr>
								<tr>
									<td>TYPE</td>
									<td><select id="moneytype" name="moneytype">
											<option>현금/카드</option>
											<option value="cash">현금</option>
											<option value="shin1">신한1</option>
											<option value="shin2">신한2</option>
											<option value="guk1">국민1</option>
											<option value="guk2">국민2</option>
											<option value="uri1">우리1</option>
											<option value="uri2">우리2</option>
											<option value="ha1">하나1</option>
											<option value="ha2">하나2</option>
											<option value="lot1">롯데1</option>
											<option value="lot2">롯데2</option>
											<option value="sam1">삼성1</option>
											<option value="sam2">삼성2</option>
											<option value="nong1">농협1</option>
											<option value="nong2">농협2</option>
											<option value="gi1">기업1</option>
											<option value="gi2">기업2</option>
											<option value="ci1">씨티1</option>
											<option value="ci2">씨티2</option>
									</select></td>
								</tr>
								<tr>
									<td>BCATEGORY</td>
									<td><select id="bcategory" name="bcategory">
											<option>카테고리</option>
											<option value="oil">주유</option>
											<option value="shop">쇼핑</option>
											<option value="mart">대형마트</option>
											<option value="cvs">편의점</option>
											<option value="eou">외식</option>
											<option value="cafe">카페/베이커리</option>
											<option value="movie">영화</option>
											<option value="tra">대중교통</option>
											<option value="tel">통신</option>
											<option value="edu">교육</option>
											<option value="cul">문화</option>
											<option value="lei">레져</option>
											<option value="medi">의료</option>
											<option value="bea">뷰티</option>
									</select></td>
								</tr>
								<tr>
									<td>SCATEGORY</td>
									<td>
										<!-- eou -->
										<div id="scategory1">
											<select id="sca1" name="scategory">
												<option>세부카테고리</option>
												<option value="restaurant">레스토랑</option>
												<option value="fastfood">패스트푸드</option>
												<option value="liquor">주류</option>
												<option value="eou_etc">etc</option>
											</select>
										</div> <!-- movie -->
										<div id="scategory2">
											<select id="sca2" name="scategory">
												<option>세부카테고리</option>
												<option value="cgv">CGV</option>
												<option value="lotte">Lotte cinema</option>
												<option value="megabox">Megabox</option>
												<option value="primus">Primus</option>
												<option value="movie_etc">etc</option>
											</select>
										</div> <!-- lei -->
										<div id="scategory3">
											<select id="sca3" name="scategory">
												<option>세부카테고리</option>
												<option value="resort">리조트</option>
												<option value="amusement">테마파크</option>
												<option value="travel">여행사</option>
												<option value="hotel">호텔</option>
												<option value="golf">골프</option>
												<option value="airline">항공권</option>
												<option value="lei_etc">etc</option>
											</select>
										</div> <!-- shop -->
										<div id="scategory4">
											<select id="sca4" name="scategory">
												<option>세부카테고리</option>
												<option value="department">백화점</option>
												<option value="outlet">아울렛</option>
												<option value="dutyfree">면세점</option>
												<option value="internet">인터넷쇼핑</option>
												<option value="home">홈쇼핑</option>
												<option value="shop_etc">etc</option>
											</select>
										</div> <!-- etc -->
										<div id="scategory5">
											<select id="sca5" name="scategory">
												<option value="-">-</option>
											</select>
										</div>
									</td>
								</tr>
								<tr>
									<td>SHOPNAME</td>
									<td><input type="text" name="shopname" size="50" /></td>
								</tr>
								<tr>
									<td>PRICE</td>
									<td><input type="text" name="price" size="50" /></td>
								</tr>

								<tr>
								
									<td colspan="2" align="center">

									<input type="hidden"
										id="sca" name="sca" /> <input type="submit"
										style="font-size: 9pt; height: 25; width: 40;" value="지출내역 입력"
										id="submit" />
										</td>
										
								</tr>
								
							</table>

						</form>
					</div>
				</div>
</div></div></div></div>
<script>

var lval;
$('#sca1').change(function(){
	document.getElementsByName("scategory").value=document.getElementsByName("scategory")[0].value;
	lval = document.getElementsByName("scategory").value;
	
	document.getElementById("sca").value = lval;
	alert(document.getElementById("sca").value);
});
$('#sca2').change(function(){
	document.getElementsByName("scategory").value=document.getElementsByName("scategory")[1].value;
	lval = document.getElementsByName("scategory").value;
	
	document.getElementById("sca").value = lval;
	alert(document.getElementById("sca").value);
});
$('#sca3').change(function(){
	document.getElementsByName("scategory").value=document.getElementsByName("scategory")[2].value;
	lval = document.getElementsByName("scategory").value;
	document.getElementById("sca").value = lval;
	alert(document.getElementById("sca").value);
});
$('#sca4').change(function(){
	document.getElementsByName("scategory").value=document.getElementsByName("scategory")[3].value;
	lval = document.getElementsByName("scategory").value;
	document.getElementById("sca").value = lval;
	alert(document.getElementById("sca").value);
});
$('#sca5').change(function(){
	document.getElementsByName("scategory").value=document.getElementsByName("scategory")[4].value;
	lval = document.getElementsByName("scategory").value;
	document.getElementById("sca").value = lval;
	alert(document.getElementById("sca").value);
});


$('#bcategory').change(function(){ 
	var selector = document.getElementById("bcategory");
	
		if(selector[selector.selectedIndex].value=="eou" ){
			
			for(var i=1; i<22;  i++){
				$('#scategory'+i).removeClass('close');
				$('#scategory'+i).removeClass('open');
			}
			$('#scategory1').addClass('open');
			
		}
		else if(selector[selector.selectedIndex].value=="movie" ){
			alert(selector[selector.selectedIndex].value);
			for(var i=1; i<22;  i++){
				$('#scategory'+i).removeClass('close');
				$('#scategory'+i).removeClass('open');
			}
			$('#scategory2').addClass('open');
		}
		else if(selector[selector.selectedIndex].value=="lei" ){
			alert(selector[selector.selectedIndex].value);
			for(var i=1; i<22;  i++){
				$('#scategory'+i).removeClass('close');
				$('#scategory'+i).removeClass('open');
			}
			$('#scategory3').addClass('open');
		}
		else if(selector[selector.selectedIndex].value=="shop" ){
			alert(selector[selector.selectedIndex].value);
			for(var i=1; i<22;  i++){
				$('#scategory'+i).removeClass('close');
				$('#scategory'+i).removeClass('open');
			}
			$('#scategory4').addClass('open');
		}else{
			for(var i=1; i<22;  i++){
				$('#scategory'+i).removeClass('close');
				$('#scategory'+i).removeClass('open');
			}
			$('#scategory5').addClass('open');
		};
});

</script>
