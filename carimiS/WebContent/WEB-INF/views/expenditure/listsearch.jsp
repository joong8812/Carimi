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
<title>exp_write</title>

<div class="main-inner">
	<div class="container">
		<div class="row">
			<div class="widget">
				<div class="widget-header">
					<i class="icon-credit-card"></i>
					<h3>${id}'S EXPENDITURE LIST</h3>
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


					<div class="widget-content pull-left" style="margin-left:25px; width:82%">
						<table>
							<col width=52%>
							<tr>
								<td class="pull-left">
									<a href='/CarimiS/listsearch.do?year=${year}&month=${month - 1}&stext=${stext}'>
										<img src="/CarimiS/image/left.png" />
									</a>${sf3}
									<a href='/CarimiS/listsearch.do?year=${year}&month=${month + 1}&stext=${stext}'>
										<img src="/CarimiS/image/right.png" />
									</a>
								</td>
							</tr>
						</table>

						<table class="table table-striped table-bordered" style="width:70%;margin:auto">
							<tr>
								<th>#</th>
								<th>DATE</th>
								<th>TYPE</th>
								<th>BCATEGORY</th>
								<th>SCATEGORY</th>
								<th>SHOPNAME</th>
								<th>PRICE</th>
							</tr>

							<tbody>
								<c:if test="${empty getsearchlist}">
									<tr>
										<td colspan="7" align="center">작성된 글이 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${not empty getsearchlist}">
									<c:forEach var="exp" items="${getsearchlist}" varStatus="vs">
										<c:if test="${fn:substring(sf3, 5, 7) == fn:substring(exp.wdate, 5, 7)}">
										<tr>
											<td class="count"></td>
											<td>${exp.wdate}</td>
											<td>${exp.moneytype}</td>
											<td>${exp.bcategory}</td>
											<td>${exp.scategory}</td>
											<td>${exp.shopname}</td>
											<td>${exp.price}</td>
										</tr>
										</c:if>
									</c:forEach>
								</c:if>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="<%=request.getContextPath()%>/js/jquery-1.7.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/signin.js"></script>

<script>
$(document).ready(function() {
	$(".count").each(function(index, element) {		
		$(".count").eq(index).text(index + 1);
	});
});
</script>
