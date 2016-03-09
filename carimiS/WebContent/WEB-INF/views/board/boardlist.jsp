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
	 	      	<div class="span10">      		
	           		<div class="widget "> 



<%-- <%
String cardvalue;


if(request.getParameter("cardvalue")==null){
	cardvalue="all";
}else{
	cardvalue=request.getParameter("cardvalue");
}

boardDAO bdao = boardDAO.getInstance();
List<boardDTO> boardlist = bdao.boardList(cardvalue);
%> --%>
 
 



        
    <div class="widget widget-table action-table">
      
            <div class="widget-header"> <i class="icon-th-list"></i>
              <h3>Notice List</h3> 
            
              <div class="pull-right">
              <form action="boardlist.do" method="post" id="searchlist" name="searchlist" style="margin-bottom: -20px">   
              <select name="cardvalue" id="cardvalue" >
              	<option value="all">카드사별 검색-전체
              	<option value="shin">신한
              	<option value="guk">국민
              	<option value="woo">우리
              	<option value="ha">하나
              	<option value="gi">기업
              	<option value="ci">시티
              	<option value="nong">농협
              	<option value="lot">롯데
              	<option value="sam">삼성
              </select>
               </form>
              </div>
             
           </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <table class="table table-striped table-bordered">
                <thead>
  					<tr >
   					<th >#</th>
  					<th >Notice Date</th>
  					<th >ID</th>
  					<th >TITLE</th>
  					<th >Notice Start</th>
  					<th >Notice End</th>
  					<th >Coupon</th>
  				  </tr>
 			</thead>
     	<tbody>
    <c:choose>    
		<c:when test="${empty boardlist}">
			<tr>
				<td colspan="7" style="text-align:center">작성된 글이 없습니다.</td>
			</tr>
		</c:when>
		
		
	<%-- 	:forEach var="i" begin="${page_sno}" end="${page_eno }" step="1" --%>
		<c:otherwise>
		<c:forEach begin="${startno-1 }" items="${boardlist}" var="board"   varStatus="vs"  end="${endno-1}">
			<tr >
		
				<td>${vs.count}</td> 
				<td>${board.bwdate.substring(0,10)}</td>
				<td>${board.id }</td>
				<td align="left">
					<a href='boardDetail.do?bseq=${board.bseq }'><!--id같이 가져감  -->
		      		&nbsp;&nbsp;${board.btitle } 
		   			</a>
		   		</td>
		   		<td>${board.bsdate }</td>
		   		<td>${board.bedate }</td>
		   		<td>
		   		<c:choose>
		   			<c:when test="${empty board.bfilename}">
						쿠폰없음
					</c:when>
					<c:otherwise>
					<input class="btn btn-info btn-default " type="button" name="btnDown" value="다운로드"
					onclick="javascript:document.location.href='/Carimi/filedown?bfilename=${board.bfilename }&pdsid=${board.bseq }'"/>
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
		</c:forEach>
		</c:otherwise>
		</c:choose>	
		 
		   </tbody>
		 
   </table>
   </div>
   </div>
 
 

<div style="text-align:center;">
<c:if test="${!empty boardlist}">
<a href="boardlist.do?pageno=1">[맨앞으로]</a>

<a href="boardlist.do?pageno=${prev_pageno }">[이전]</a> 

<c:forEach var="i" begin="${page_sno}" end="${page_eno }" step="1">
	<a href="boardlist.do?pageno=${i }">
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


<a href="boardlist.do?pageno=${next_pageno}" >[다음]</a>

<a href="boardlist.do?pageno=${total_page}">[맨뒤로]</a>
</c:if>
</div>		 
				
				</div> 
				<!-- /widget -->
	      		
		    </div> 
		    <%-- <!-- /span8 -->
	      	<div class="span2">
	      	         <div class="widget">
            <div class="widget-header"> <i class="icon-trophy"></i>
              <h3>Read Rank</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
           	<jsp:include page="boardreadrank.jsp"></jsp:include>
           	
            </div>
            <!-- /widget-content --> 
          </div>
          <!-- /widget --> 
        </div>
        <!--/span5  --> --%>
	    
	      	
	      	
	      	
	      </div> <!-- /row -->
	
	    </div> <!-- /container -->
	    
	</div> <!-- /main-inner -->
    
</div> <!-- /main -->

<script>
$('option').click(function ()
		{
		    $(this).closest('form').submit();
		});
		
document.searchlist.cardvalue.value="${cardvalue}";
</script>






