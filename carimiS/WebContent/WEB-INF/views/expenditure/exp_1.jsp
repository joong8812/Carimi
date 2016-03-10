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

<style>

</style>

<%!int sumoil = 0;
	int sumshop = 0;
	int summart = 0;
	int sumcvs = 0;
	int sumeou = 0;
	int sumcafe = 0;
	int summovie = 0;
	int sumtra = 0;
	int sumtel = 0;
	int sumedu = 0;
	int sumcul = 0;
	int sumlei = 0;
	int summedi = 0;
	int sumbea = 0;
	int sumpoi = 0;

	int categorylist;
	String[][] sumprice = null;

	expenditureDTO exp;%>


<div class="main-inner">
	<div class="container">
		<div class="row">
			<div class="widget">
				<div class="widget-header">
					<i class="icon-credit-card"></i>
					<h3>${id}'S EXPENDITURELIST</h3>
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
					
					<div class="widget-content pull-left" style="margin-left:25px; width:82%">
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

						<table class="table table-striped table-bordered" style="width:70%;margin:auto">

							<tr>
								<th>BCATEGORY</th>
								<th>PRICE</th>
							</tr>

							<tbody>
								<c:if test="${empty e1list}">
									<tr>
										<td colspan="2" align="center">작성된 글이 없습니다.</td>
									</tr>
								</c:if>

								<c:if test="${not empty e1list}">

									<c:if test="${sumoil != 0}">
										<tr>
											<td><i class="icon-tint"></i> OIL</td>
											<td>${sumoil}원</td>
										</tr>
									</c:if>
									<c:if test="${sumshop != 0}">
										<tr>
											<td><i class="icon-gift"></i> SHOPPING</td>
											<td>${sumshop}원</td>
										</tr>
									</c:if>
									<c:if test="${summart != 0}">
										<tr>
											<td><i class="icon-shopping-cart"></i> MART</td>
											<td>${summart}원</td>
										</tr>
									</c:if>
									<c:if test="${sumcvs != 0}">
										<tr>
											<td><i class="icon-barcode"></i> CVS</td>
											<td>${sumcvs}원</td>
										</tr>
									</c:if>
									<c:if test="${sumeou != 0}">
										<tr>
											<td><i class="icon-leaf"></i> EAT-OUT</td>
											<td>${sumeou}원</td>
										</tr>
									</c:if>
									<c:if test="${sumcafe != 0}">
										<tr>
											<td><i class="icon-glass"></i> CAFE/BAKERY</td>
											<td>${sumcafe}원</td>
										</tr>
									</c:if>
									<c:if test="${summovie != 0}">
										<tr>
											<td><i class="icon-film"></i> MOVIE</td>
											<td>${summovie}원</td>
										</tr>
									</c:if>
									<c:if test="${sumtra != 0}">
										<tr>
											<td><i class="icon-truck"></i> TRANSPORTATION</td>
											<td>${sumtra}원</td>
										</tr>
									</c:if>
									<c:if test="${sumtel != 0}">
										<tr>
											<td><i class="icon-phone"></i> TELECOM</td>
											<td>${sumtel}원</td>
										</tr>
									</c:if>
									<c:if test="${sumedu != 0}">
										<tr>
											<td><i class="icon-book"></i> EDUCATION</td>
											<td>${sumedu}원</td>
										</tr>
									</c:if>
									<c:if test="${sumcul != 0}">
										<tr>
											<td><i class="icon-picture"></i> CULTURE</td>
											<td>${sumcul}원</td>
										</tr>
									</c:if>
									<c:if test="${sumlei != 0}">
										<tr>
											<td><i class="icon-plane"></i> LEISURE</td>
											<td>${sumlei}원</td>
										</tr>
									</c:if>
									<c:if test="${summedi != 0}">
										<tr>
											<td><i class="icon-user-md"></i> MEDICAL</td>
											<td>${summedi}원</td>
										</tr>
									</c:if>
									<c:if test="${sumbea != 0}">
										<tr>
											<td><i class="icon-magic"></i> BEAUTY</td>
											<td>${sumbea}원</td>
										</tr>
									</c:if>
								</c:if>
							<tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

