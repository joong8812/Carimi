<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />

<c:if test="${login.auth eq 0 or empty login }">
	<script>	
		alert("관리자만 접속 가능합니다!");
		location.href="main.do";
	</script>
</c:if>

<div class="container">
	<!-- /widget-header -->

	<div class="shortcuts">
		<a href="admin_bwrite.do" class="shortcut"><i
			class="shortcut-icon icon-list-alt"></i><span class="shortcut-label">가맹점 등록</span> 
		</a>
		<!-- /shortcuts -->
	</div>
	<!-- /widget-content -->

	<!-- /widget -->
	<div class="row">
		<div class="span12">
			<div class="widget ">
				<div class="widget widget-table action-table">
					<div class="widget-header">
						<i class="icon-bookmark"></i>
						<h3>가맹점 목록</h3>
					</div>
					<div class="widget-content">
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>#</th>
									<th>Cardname</th>
									<th>Name</th>
									<th>Category</th>
									<th>Score</th>
									<th>Time</th>
									<th>Tel</th>
									<th>Location</th>
									<th>Image</th>
									<th>Detail</th>
									<th>Del</th>
								</tr>
							</thead>
							<c:choose>
								<c:when test="${empty benefitTenList }">
									<tr>
										<td colspan="11" style="text-align:center">검색 결과가 없습니다</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${benefitTenList }" var="bdto" varStatus="vs">
										<tr>
											<td>${bdto.bseq }</td>
											<td>${kcardnames[vs.count-1] }</td>
											<td>${bdto.shopname }</td>
											<td>${bdto.bcategory }</td>
											<td>${bdto.brate }</td>
											<td>${bdto.opentime }~${bdto.closetime }</td>
											<td>${bdto.phone }</td>
											<td>${bdto.address }</td>
											<td><img src="/CarimiS/bupload/${bdto.filename }" width="30px" height="30px"></td>
											<td><button class="btn"
													onclick="location.href='admin_bdetail.do?bseq=${bdto.bseq}'">
													보기</button></td>
											<td><button class="btn"
													onclick="delChk(${bdto.bseq})">삭제</button></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

	<div style="text-align: center">
		<form action="admin_page.do" method="GET">
			<select name="find" style="width: 100px">
	<!-- 			<option value="brate">혜택 -->
				<option value="address">주소
				<option value="shopname">매장이름
	<!-- 			<option value="cardname">카드이름 -->
			</select> <input type="text" name="search">
			<button style="margin-top: -9px" type="submit" class="btn">검색</button>
		</form>
	</div>
<c:if test="${!empty benefitTenList }">
	<div style="text-align: center">
		<a href="admin_page.do?s_pageno=1">[맨앞으로]</a> <a
			href="admin_page.do?s_pageno=${prev_pageno }">[이전]</a>
	
		<c:forEach var="i" begin="${page_sno }" end="${page_eno }" step="1">
			<a href="admin_page.do?s_pageno=${i }&find=${x1 }&search=${x2 }">
				<c:choose>
					<c:when test="${pageno eq i }">
						[${i }]
					</c:when>
					<c:otherwise>
						${i }
					</c:otherwise>
				</c:choose>
			</a>
				<%--	콤마	 --%>
			<c:if test="${i < page_eno }">
				,
			</c:if>
	 	</c:forEach>
	
		<a href="admin_page.do?s_pageno=${next_pageno }">[다음]</a> <a
			href="admin_page.do?s_pageno=${total_page }">[맨뒤로]</a>
	</div>
</c:if>

<script>
function delChk(bseq){
	var chk = confirm("정말 삭제 하시겠습니까?");
	if(chk){
		location.href = "admin_bdel.do?bseq=" + bseq;
	}
}
</script>