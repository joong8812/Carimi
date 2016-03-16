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


<title>explist</title>

<c:if test="${empty login}">
	<script>
		alert("로그인 해야 가능한 서비스 입니다");
		location.href = "login.do";
	</script>
</c:if>

<div class="main-inner">
	<div class="container">
		<div class="row">
			<div class="widget">
				<div class="widget-header">
					<i class="icon-credit-card"></i>
					<h3>${id}님의 지출리스트</h3>
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
							<form action="expwrite.do" method="post">
								<input type="submit" value="지출내역 쓰기" id="submit">
							</form>
							
						</div>
					</div>
					<div class="widget-content pull-left"
						style="margin-left: 25px; width: 82.5%">
						<form action="listsearch.do" method="post">
							<table>
								<col width=52%>
								<tr>
									<td class="pull-left"><a
										href='/CarimiS/explist.do?year=${year}&month=${month - 1}'><img
											src="/CarimiS/image/left.png" /></a>${sf3}<a
										href='/CarimiS/explist.do?year=${year}&month=${month + 1}'><img
											src="/CarimiS/image/right.png" /></a></td>
									<td><input type="text" value="사용처" size="8"
										readonly="readonly" style="text-align: center"></td>
									<td><input type="text" name="stext" size="60"></td>
									<td><input type="submit" value="검색" id="submit"></td>

								</tr>
							</table>
						</form>
						<table class="table table-striped table-bordered pull-right"
							style="width: 100%;">
							<tr>
								<th>#</th>
								<th>날짜</th>
								<th>현금/카드</th>
								<th>카테고리</th>
								<th>세부카테고리</th>
								<th>사용처</th>
								<th>금액</th>
								<th><i class="icon-edit"></i>&nbsp;수정</th>
								<th><i class="icon-remove"></i>&nbsp;삭제</th>
							</tr>

							<tbody>
								<c:choose>
									<c:when test="${empty explist}">
										<tr>
											<td colspan="9" align="center">작성된 글이 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach begin="${startno-1 }" var="exp" items="${explist}"
											varStatus="vs" end="${endno-1}">
											<tr>
												<td>${vs.count}</td>
												<td>${exp.wdate}</td>
												<c:if test="${exp.moneytype == 'shin1'}">
												<td>신한 LOVE</td>
												</c:if>
												<c:if test="${exp.moneytype == 'shin2'}">
												<td>신한 TASTY</td>
												</c:if>
												<c:if test="${exp.moneytype == 'guk1'}">
												<td>국민 굿데이</td>
												</c:if>
												<c:if test="${exp.moneytype == 'guk2'}">
												<td>국민 다담</td>
												</c:if>
												<c:if test="${exp.moneytype == 'uri1'}">
												<td>우리 다모아</td>
												</c:if>
												<c:if test="${exp.moneytype == 'uri2'}">
												<td>우리 가득한</td>
												</c:if>
												<c:if test="${exp.moneytype == 'ha1'}">
												<td>하나 2x@</td>
												</c:if>
												<c:if test="${exp.moneytype == 'ha2'}">
												<td>하나 POP</td>
												</c:if>
												<c:if test="${exp.moneytype == 'lot1'}">
												<td>롯데 DC 슈프림</td>
												</c:if>
												<c:if test="${exp.moneytype == 'lot2'}">
												<td>롯데 DC 스마트</td>
												</c:if>
												<c:if test="${exp.moneytype == 'sam1'}">
												<td>삼성 S클래스</td>
												</c:if>
												<c:if test="${exp.moneytype == 'sam2'}">
												<td>삼성 2 V2</td>
												</c:if>
												<c:if test="${exp.moneytype == 'nong1'}">
												<td>농협 스마티</td>
												</c:if>
												<c:if test="${exp.moneytype == 'nong2'}">
												<td>농협 TAKE</td>
												</c:if>
												<c:if test="${exp.moneytype == 'gi1'}">
												<td>기업 참좋은</td>
												</c:if>
												<c:if test="${exp.moneytype == 'gi2'}">
												<td>기업 IBK</td>
												</c:if>
												<c:if test="${exp.moneytype == 'ci1'}">
												<td>씨티 클리어</td>
												</c:if>
												<c:if test="${exp.moneytype == 'ci2'}">
												<td>씨티 멀티</td>
												</c:if>
												
												<c:if test="${exp.bcategory == 'oil'}">
												<td>주유</td>
												</c:if>
												<c:if test="${exp.bcategory == 'shop'}">
												<td>쇼핑</td>
												</c:if>
												<c:if test="${exp.bcategory == 'mart'}">
												<td>대형마트</td>
												</c:if>
												<c:if test="${exp.bcategory == 'cvs'}">
												<td>편의점</td>
												</c:if>
												<c:if test="${exp.bcategory == 'eou'}">
												<td>외식</td>
												</c:if>
												<c:if test="${exp.bcategory == 'cafe'}">
												<td>카페/베이커리</td>
												</c:if>
												<c:if test="${exp.bcategory == 'movie'}">
												<td>영화</td>
												</c:if>
												<c:if test="${exp.bcategory == 'tra'}">
												<td>교통</td>
												</c:if>
												<c:if test="${exp.bcategory == 'tel'}">
												<td>통신</td>
												</c:if>
												<c:if test="${exp.bcategory == 'edu'}">
												<td>교육</td>
												</c:if>
												<c:if test="${exp.bcategory == 'cul'}">
												<td>문화</td>
												</c:if>
												<c:if test="${exp.bcategory == 'lei'}">
												<td>레저</td>
												</c:if>
												<c:if test="${exp.bcategory == 'medi'}">
												<td>의료</td>
												</c:if>
												<c:if test="${exp.bcategory == 'bea'}">
												<td>뷰티</td>
												</c:if>
												
												<c:if test="${exp.scategory == 'restaurant'}">
												<td>레스토랑</td>
												</c:if>
												<c:if test="${exp.scategory == 'fastfood'}">
												<td>패스트푸드</td>
												</c:if>
												<c:if test="${exp.scategory == 'liquor'}">
												<td>주류</td>
												</c:if>
												<c:if test="${exp.scategory == 'eou_etc'}">
												<td>etc</td>
												</c:if>
												<c:if test="${exp.scategory == 'cgv'}">
												<td>CGV</td>
												</c:if>
												<c:if test="${exp.scategory == 'lotte'}">
												<td>Lotte cinema</td>
												</c:if>
												<c:if test="${exp.scategory == 'megabox'}">
												<td>Megabox</td>
												</c:if>
												<c:if test="${exp.scategory == 'primus'}">
												<td>Primus</td>
												</c:if>
												<c:if test="${exp.scategory == 'movie_etc'}">
												<td>etc</td>
												</c:if>
												<c:if test="${exp.scategory == 'resort'}">
												<td>리조트</td>
												</c:if>
												<c:if test="${exp.scategory == 'amusement'}">
												<td>테마파크</td>
												</c:if>
												<c:if test="${exp.scategory == 'travel'}">
												<td>여행사</td>
												</c:if>
												<c:if test="${exp.scategory == 'hotel'}">
												<td>호텔</td>
												</c:if>
												<c:if test="${exp.scategory == 'golf'}">
												<td>골프</td>
												</c:if>
												<c:if test="${exp.scategory == 'airline'}">
												<td>항공권</td>
												</c:if>
												<c:if test="${exp.scategory == 'lei_etc'}">
												<td>etc</td>
												</c:if>
												<c:if test="${exp.scategory == 'department'}">
												<td>백화점</td>
												</c:if>
												<c:if test="${exp.scategory == 'outlet'}">
												<td>아울렛</td>
												</c:if>
												<c:if test="${exp.scategory == 'dutyfree'}">
												<td>면세점</td>
												</c:if>
												<c:if test="${exp.scategory == 'internet'}">
												<td>인터넷쇼핑</td>
												</c:if>
												<c:if test="${exp.scategory == 'home'}">
												<td>홈쇼핑</td>
												</c:if>
												<c:if test="${exp.scategory == 'shop_etc'}">
												<td>etc</td>
												</c:if>
												<c:if test="${exp.scategory == null}">
												<td></td>
												</c:if>
												<td>${exp.shopname}</td>
												<td>${exp.price}원</td>
												<td style="text-align: center"><a
													href="expupdate.do?seq=${exp.seq}&month=${month}&year=${year}"><i
														class=icon-edit></i></a></td>
												<td style="text-align: center"><a
													href="explistD.do?seq=${exp.seq}"><i class=icon-remove></i></a></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>

						<div style="text-align: center;">
							<c:if test="${!empty explist}">
								<a href="explist.do?pageno=1">[맨앞으로]</a>

								<a href="explist.do?pageno=${prev_pageno }">[이전]</a>

								<c:forEach var="i" begin="${page_sno}" end="${page_eno }"
									step="1">
									<a href="explist.do?pageno=${i }"> <c:choose>
											<c:when test="${pageno eq i}">
												[${i}]
											</c:when>
											<c:otherwise>
											${i}
											</c:otherwise>
										</c:choose></a>
											<c:if test="${i lt page_eno }">
												,
											</c:if>
								</c:forEach>

								<a href="explist.do?pageno=${next_pageno}">[다음]</a>

								<a href="explist.do?pageno=${total_page}">[맨뒤로]</a>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
