<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.List" %>
<% request.setCharacterEncoding("UTF-8");%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>





<div class="main">
	
	<div class="main-inner">

	    <div class="container">
	
	      <div class="row">
	      	
	      	<div class="span12">      		
	      		
	      		<div class="widget ">
	      			
	      			<div class="widget-header">
	      				<i class="icon-th-list"></i>

	      				<h3>공지사항</h3>
	  				</div> <!-- /widget-header -->
					
					<div class="widget-content">
				
							<div class="tab-content">
								<div class="tab-pane active" id="formcontrols">
								<form id="edit-profile" class="form-horizontal"
								 name="boardform" onsubmit="submitContents(this);" 
action="boardupload.jsp" method="post" enctype="multipart/form-data">
									<fieldset>
										
										<div class="control-group ">											
											<label class="control-label" for="username">작성자</label>
											<div class="controls">
												<input type="text" class="span3 disabled" id="username" value="${boardDetail.id }" disabled/>
										
												
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										<div class="control-group pull-right">											
											<label class="control-label" for="Notice S-E">공지 시작일-종료일</label>
											<div class="controls">
													<input type="text" class="span3 disabled"  id="Notice S-E" value="${boardDetail.bsdate } - ${boardDetail.bedate } " disabled/>
											</div> <!-- /controls -->				
										</div>
										
										<div class="control-group ">											
											<label class="control-label" for="firstname">제목</label>
											<div class="controls">
													<input type="text" class="span3 disabled"  value="${boardDetail.btitle }" disabled/>
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										
										
										
										<div class="control-group">											
											<label class="control-label" for="lastname">내용</label>
											<div class="controls" >
												<pre>	${boardDetail.bcontent }</pre>
											
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										
										
										<div class="control-group">											
											<label class="control-label" for="coupon">쿠폰</label>
											<div class="controls">
											
											<c:choose>
								   			<c:when test="${empty boardDetail.bfilename}">
												<pre>쿠폰없음</pre>
											</c:when>
											<c:otherwise>
											
											<pre><input class="btn btn-info btn-default " type="button" name="btnDown" value="다운로드"
											onclick="javascript:document.location.href='/Carimi/filedown?bfilename=${board.bfilename }&pdsid=${board.bseq }'"/></pre>
											</c:otherwise>
										</c:choose>
										
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
									<div class="form-actions">
										<c:choose>
											<c:when test="${login.auth eq 1 }">
										 <button class="btn btn-primary" style="width:100%"
																 type="button" name="btnDown" 
										onclick="javascript:document.location.href=
										'boarddelete.do?bseq=${boardDetail.bseq }&id=${boardDetail.id }'"><span class="glyphicon glyphicon-off"></span>삭제</button>
										</c:when>
									     	<c:otherwise>
									     <p style="text-align:center;">글의 삭제는 관리자만 가능합니다.</p>
									     	</c:otherwise>
									     </c:choose>
									</div> <!-- /form-actions -->										
										

										
	
									</fieldset>
								</form>
								</div>
								</div>
								</div>
								</div>
								</div>
								</div>
								</div>
								</div>
								</div>

