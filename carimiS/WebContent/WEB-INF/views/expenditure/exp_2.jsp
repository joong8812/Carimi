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

<%!int sumcash = 0;
	int sumshin1 = 0;
	int sumshin2 = 0;
	int sumguk1 = 0;
	int sumguk2 = 0;
	int sumuri1 = 0;
	int sumuri2 = 0;
	int sumha1 = 0;
	int sumha2 = 0;
	int sumlot1 = 0;
	int sumlot2 = 0;
	int sumsam1 = 0;
	int sumsam2 = 0;
	int sumnong1 = 0;
	int sumnong2 = 0;
	int sumgi1 = 0;
	int sumgi2 = 0;
	int sumci1 = 0;
	int sumci2 = 0;

	int categorylist;
	String[][] sumprice = null;
	expenditureDTO exp;%>

<title>exp_2</title>

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
					<div class="widget-content pull-left" style="margin-left: 25px; width:82%">
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

						<table class="table table-striped table-bordered" style="width:70%; margin:auto">

							<tr>
								<th>TYPE</th>
								<th>PRICE</th>
							</tr>

							<tbody>
								<c:if test="${empty e2list}">
									<tr>
										<td colspan="2" align="center">작성된 글이 없습니다.</td>
									</tr>
								</c:if>

								<c:if test="${not empty e2list}">
									<c:if test="${sumshin1 != 0}">
										<tr>
											<td>신한 LOVE <img src="/CarimiS/image/si_love.jpg"
												width="22px"></td>
											<td>${sumshin1}원</td>
										</tr>
									</c:if>
									<c:if test="${sumshin2 != 0}">
										<tr>
											<td>신한 TASTY <img src="/CarimiS/image/si_tasty.png"
												width="22px"></td>
											<td>${sumshin2}원</td>
										</tr>
									</c:if>
									<c:if test="${sumguk1 != 0}">
										<tr>
											<td>국민 굿데이 <img src="/CarimiS/image/ku_goodday.png"
												width="22px"></td>
											<td>${sumguk1}원</td>
										</tr>
									</c:if>
									<c:if test="${sumguk2 != 0}">
										<tr>
											<td>국민 다담 <img src="/CarimiS/image/ku_ddam.png"
												width="22px"></td>
											<td>${sumguk2}원</td>
										</tr>
									</c:if>
									<c:if test="${sumuri1 != 0}">
										<tr>
											<td>우리 다모아 <img src="/CarimiS/image/w_damoa.jpg"
												width="22px" height="22px" /></td>
											<td>${sumuri1}원</td>
										</tr>
									</c:if>
									<c:if test="${sumuri2 != 0}">
										<tr>
											<td>우리 가득한 <img src="/CarimiS/image/w_gadeuk.jpg"
												width="22px" height="22px" /></td>
											<td>${sumuri2}원</td>
										</tr>
									</c:if>
									<c:if test="${sumha1 != 0}">
										<tr>
											<td>하나 2x@ <img src="/CarimiS/image/h_2xa.png" width="22px"
												height="22px" /></td>
											<td>${sumha1}원</td>
										</tr>
									</c:if>
									<c:if test="${sumha2 != 0}">
										<tr>
											<td>하나 POP <img src="/CarimiS/image/h_pop.png" width="22px"
												height="22px" /></td>
											<td>${sumha2}원</td>
										</tr>
									</c:if>
									<c:if test="${sumlot1 != 0}">
										<tr>
											<td>롯데 DC 슈프림 <img src="/CarimiS/image/l_dcsm.png"
												width="22px" height="22px" /></td>
											<td>${sumlot1}원</td>
										</tr>
									</c:if>
									<c:if test="${sumlot2 != 0}">
										<tr>
											<td>롯데 DC 슈프림 <img src="/CarimiS/image/l_dcsu.png"
												width="22px" height="22px" /></td>
											<td>${sumlot2}원</td>
										</tr>
									</c:if>
									<c:if test="${sumsam1 != 0}">
										<tr>
											<td>삼성 S클래스 <img src="/CarimiS/image/sa_sclass.png"
												width="22px" height="22px" /></td>
											<td>${sumsam1}원</td>
										</tr>
									</c:if>
									<c:if test="${sumsam2 != 0}">
										<tr>
											<td>삼성 2 V2 <img src="/CarimiS/image/sa_2v2.png"
												width="22px" height="22px" /></td>
											<td>${sumsam2}원</td>
										</tr>
									</c:if>
									<c:if test="${sumnong1 != 0}">
										<tr>
											<td>농협 스마티<img src="/CarimiS/image/n_smarty.png"
												width="22px" height="22px" /></td>
											<td>${sumnong1}원</td>
										</tr>
									</c:if>
									<c:if test="${sumnong2 != 0}">
										<tr>
											<td>농협 TAKE 5<img src="/CarimiS/image/n_take5.png"
												width="22px" height="22px" /></td>
											<td>${sumnong2}원</td>
										</tr>
									</c:if>
									<c:if test="${sumgi1 != 0}">
										<tr>
											<td>기업 참좋은<img src="/CarimiS/image/ki_cham.gif"
												width="22px" height="22px" /></td>
											<td>${sumgi1}원</td>
										</tr>
									</c:if>
									<c:if test="${sumgi2 != 0}">
										<tr>
											<td>기업 IBK HI<img src="/CarimiS/image/ki_ibkhi.jpg"
												width="22px" height="22px" /></td>
											<td>${sumgi2}원</td>
										</tr>
									</c:if>
									<c:if test="${sumci1 != 0}">
										<tr>
											<td>씨티 클리어<img src="/CarimiS/image/ci_cle.png" width="22px"
												height="22px" /></td>
											<td>${sumci1}원</td>
										</tr>
									</c:if>
									<c:if test="${sumci2 != 0}">
										<tr>
											<td>씨티 멀티<img src="/CarimiS/image/ci_mul.png" width="22px"
												height="22px" /></td>
											<td>${sumci2}원</td>
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


