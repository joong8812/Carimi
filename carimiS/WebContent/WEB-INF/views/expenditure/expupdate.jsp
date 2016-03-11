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

<title>expupdate</title>

<script>
	$(function() {
		$("#datepicker")
				.datepicker(
						{
							dateFormat : 'yy-mm-dd',
							inline : true,
							onSelect : function(dateText, inst) {
								var wdate = $(tdis).datepicker('getDate'), day = wdate
										.getDate(), montd = wdate.getMontd() + 1, year = wdate
										.getFullYear();
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
					<h3>${id}님의 지출 리스트 수정하기</h3>
				</div>
				<div class="widget-conetent">
					<div class="widget-content pull-left">
						<div>
							<form action="monlist.do" method="post">
								<script>

								</script>
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
						</div>
					</div>

					<div class="widget-content pull-left"
						style="margin-left: 25px; width: 80%">
						<form action="updsave.do" method="post">
							<input type="hidden" id="id" name="id" value='${id}'>
							<table>
								<tr>
									<td>#</td>
									<td><input type="text" name="seq" readonly="readonly"
										value='${edto.seq}'/></td>
								</tr>
								<tr>
									<td class="td">날짜</td>
									<td><input type="text" id="datepicker" name="wdate"
										value='${edto.wdate}' size="50" /></td>
								</tr>
								<tr>
									<td class="td">현금/카드</td>
									<td><select id="moneytype" name="moneytype">
											<option value='${edto.moneytype}'>'${edto.moneytype}'</option>
											<option value="cash">현금</option>
											<option value="shin1">신한 LOVE</option>
											<option value="shin2">신한 TASTY</option>
											<option value="guk1">국민 굿데이</option>
											<option value="guk2">국민 다담</option>
											<option value="uri1">우리 다모아</option>
											<option value="uri2">우리 가득한</option>
											<option value="ha1">하나 2x@</option>
											<option value="ha2">하나 POP</option>
											<option value="lot1">롯데 DC 슈프림</option>
											<option value="lot2">롯데 DC 스마트</option>
											<option value="sam1">삼성 S클래스</option>
											<option value="sam2">삼성 2 V2</option>
											<option value="nong1">농협 스마티</option>
											<option value="nong2">농협 TAKE 5</option>
											<option value="gi1">기업 참좋은</option>
											<option value="gi2">기업 IBK HI</option>
											<option value="ci1">씨티 클리어</option>
											<option value="ci2">씨티 멀티</option>
									</select></td>

								</tr>
								<tr>
									<td class="td">카테고리</td>
									<td><select id="bcategory" name="bcategory">
											<option value='${edto.bcategory}'>'${edto.bcategory}'</option>
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
									<td class="td">세부카테고리</td>
									<td><input type="text" name="scategory" value='${edto.scategory}'
										size="50" /></td>
								</tr>
								<tr>
									<td class="td">사용처</td>
									<td><input type="text" name="shopname" value='${edto.shopname}'
										size="50" /></td>
								</tr>
								<tr>
									<td class="td">금액</td>
									<td><input type="text" name="price" value='${edto.price}'
										size="50" /></td>
								</tr>
								<tr>
									<td colspan="2" align="center">
									<br>
									<input type = "hidden" name = "year" value = '${year}'>
									<input type = "hidden" name = "month" value = '${month}'>
									<input type="submit"
										style="font-size: 9pt; height: 25; width: 40;" value="수정하기"
										id="submit" /></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
