<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.List" %>
<% request.setCharacterEncoding("UTF-8");%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="main">
	<div class="main-inner">
		<div class="container">
	      <div class="row">
	 	      	<div class="span12">      		
	           		<div class="widget ">      
    <div class="widget widget-table action-table">
      
            <div class="widget-header"> <i class="icon-th-list"></i>
              <h3>로그 목록</h3> 오늘 방문자 수 : ${TodayCount} 총 방문자 수 : ${AllCount }
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <table class="table table-striped table-bordered">
                <thead>
  					<tr >
   					<th >IP</th>
  					<th >접속시간</th>
  					
  				  </tr>
 			</thead>
     	<tbody>
    <c:choose>    
		<c:when test="${empty loglist}">
			<tr>
				<td colspan="2" style="text-align:center">방문자가 없습니다.</td>
			</tr>
		</c:when>
		
		
	<%-- 	:forEach var="i" begin="${page_sno}" end="${page_eno }" step="1" --%>
		<c:otherwise>
		<c:forEach begin="${startno-1 }" items="${loglist}" var="log"   varStatus="vs"  end="${endno-1}">
			<tr >
		
				<td>${log.ip}</td> 
				<td>${log.vdate}</td>
				
		   		
			</tr>
		</c:forEach>
		</c:otherwise>
		</c:choose>	
		 
		   </tbody>
		 
   </table>
   </div>
</div>
 
 

<div style="text-align:center;">
<c:if test="${!empty loglist}">
<a href="loglist.do?pageno=1">[맨앞으로]</a>

<a href="loglist.do?pageno=${prev_pageno }">[이전]</a> 

<c:forEach var="i" begin="${page_sno}" end="${page_eno }" step="1">
	<a href="loglist.do?pageno=${i }">
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


<a href="loglist.do?pageno=${next_pageno}" >[다음]</a>

<a href="loglist.do?pageno=${total_page}">[맨뒤로]</a>
</c:if>
</div>		 
				
				</div> 
				<!-- /widget -->
	      		
		    </div> 
		
	    
	      	
	      	
	      	
	      </div> <!-- /row -->
	
	    </div> <!-- /container -->
	    
	</div> <!-- /main-inner -->
    
</div> <!-- /main -->








