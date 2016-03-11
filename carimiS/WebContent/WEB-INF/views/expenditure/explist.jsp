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
			location.href="login.do";
		</script>
	</c:if>

<div class="main-inner">
	<div class="container">
		<div class="row">
			<div class="widget">
				<div class="widget-header">
					<i class="icon-credit-card"></i>
					<h3>${id}'S EXPENDITURE LIST</h3>
				</div>
				<div class="widget-conetent" >
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
							<form action="expwrite.do" method="post">
								<input type="submit" value="지출내역 쓰기" id="submit">
							</form>
						</div>
					</div>
					<div class="widget-content pull-left" style="margin-left: 25px; width:82.5%">
						<form action="listsearch.do" method="post">
							<table>
								<col width=52%>
								<tr>
									<td class="pull-left"><a href='/CarimiS/explist.do?year=${year}&month=${month - 1}'><img
											src="/CarimiS/image/left.png" /></a>${sf3}<a href='/CarimiS/explist.do?year=${year}&month=${month + 1}'><img
											src="/CarimiS/image/right.png" /></a></td>
									<td><input type="text" value="shopname" size="8"
										readonly="readonly" style="text-align: center"></td>
									<td><input type="text" name="stext" size="60"></td>
									<td><input type="submit" value="검색" id="submit"></td>

								</tr>
							</table>
						</form>
						<table class="table table-striped table-bordered pull-right" style="width:100%;" >
							<tr>
								<th>#</th>
								<th>DATE</th>
								<th>TYPE</th>
								<th>CATEGORY</th>
								<th>SCATEGORY</th>
								<th>SHOPNAME</th>
								<th>PRICE</th>
								<th><i class="icon-edit"></i>&nbsp;UPDATE</th>
								<th><i class="icon-remove"></i>&nbsp;DELETE</th>
							</tr>

							<tbody>
							<c:choose>
							<c:when test="${empty explist}">
									<tr>
										<td colspan="9" align="center">작성된 글이 없습니다.</td>
									</tr>
							</c:when>
<c:otherwise>
								<c:forEach begin="${startno-1 }" var="exp" items="${explist}"  varStatus="vs"  end="${endno-1}">
										<tr>
											<td>${vs.count}</td>
											<td>${exp.wdate}</td>
											<td>${exp.moneytype}</td>
											<td>${exp.bcategory}</td>
											<td>${exp.scategory}</td>
											<td>${exp.shopname}</td>
											<td>${exp.price}</td>
											<td style="text-align:center"><a href="expupdate.do?seq=${exp.seq}&month=${month}&year=${year}"><i class=icon-edit></i></a></td>
											<td style="text-align:center"><a href="explistD.do?seq=${exp.seq}"><i class=icon-remove></i></a></td>
										</tr>
									</c:forEach>
								</c:otherwise>
</c:choose>
							</tbody>
						</table>
						
						<div style="text-align:center;">
<c:if test="${!empty explist}">
<a href="explist.do?pageno=1">[맨앞으로]</a>

<a href="explist.do?pageno=${prev_pageno }">[이전]</a> 

<c:forEach var="i" begin="${page_sno}" end="${page_eno }" step="1">
	<a href="explist.do?pageno=${i }">
		<c:choose>
   			<c:when test="${pageno eq i}">
				[${i}]
			</c:when>
			<c:otherwise>
			${i}
			</c:otherwise>
		</c:choose>
	</a>
		<c:if test="${i lt page_eno }">
			,
		</c:if>
</c:forEach>


<a href="explist.do?pageno=${next_pageno}" >[다음]</a>

<a href="explist.do?pageno=${total_page}">[맨뒤로]</a>
</c:if>
</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
