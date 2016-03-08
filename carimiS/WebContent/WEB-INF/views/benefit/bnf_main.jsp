<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
<link href="http://code.google.com/apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/js/search.js"></script> 
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
 

<style>
#map_canvas{
	width: 100%;
	height: 400px;
/* 	border: 1px solid red;   */
}

#r{
	max-height: 60px;
    overflow-y:scroll; 
}

.pager form{
	float:left;
	font-size:5px;
}
#listGroup{
	height:400px;
	overflow-y: auto;
}
.listgroup{
	display:inline-flex;
	width:100%;
}
.llistgroup{
	width:40%;
	float:right;
}
.rlistgroup{
	width:60%;
	position:relative;
}
.rlistgroup2{
	position:absolute; 
	top:50%;
	width:100%;
	margin-top:-1.5em;
}

</style>

<div class="main">

  <div class="main-inner">
    <div class="container">
      <div class="row">
        <div class="span6">         
          <!-- /widget -->
          <div class="widget">
            <div class="widget-header"> <i class="icon-camera-retro "></i>
              <h3> Benefit Road</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
	             <div class="pull-left" style="background-color:;">
				<h3>
					<span class="icon-pushpin "></span>
					<button type="button" class="btn btn-default btn-sm" onclick="getLocation()">현재위치</button>
				</h3>
					
				</div>
				<div class="pull-right" style="background-color:; ">
					<div  style="background-color:; ">
						<input class="" type="text" size="10px" id="address" placeholder="위치검색">
						<button type="button" class="btn btn-default btn-sm" style="margin-bottom:10px"
						onclick="codeAddress()">확인</button>
					</div >
				</div>
				<br><br>
				<div id="r"></div> 
				<div class="row" style="padding:20px">
					<div class="col-sm-6 col-md-6 col-lg-6" style="background-color: ;">
						<div id="map_canvas"></div>
						<div id="infoPanel" style="text-align:center">
							<input type="hidden" id="info"/>
				    		<br><div id="maddress"></div>
						</div>
					</div>
				</div>
            </div>
            <!-- /widget-content --> 
          </div>
          <!-- /widget --> 
        </div>
        <!-- /span6 -->
        <div class="span6">
        	<div class="widget">
            	<div class="widget-header"> <i class="icon-bookmark"></i>
              		<h3>Important Shortcuts</h3>
            	</div>
           		 <!-- /widget-header -->
	            <div class="widget-content" >
		          	<div style="text-align:center">
						<button type="button"  class="btn"  data-toggle="modal"
						style="width:200px; height:53px; font-size:20px;" data-toggle="modal"
						data-target="#selectBenefit">주변혜택 팡팡</button><br><br>
					</div>	
					<!-- after click 'SEARCH' button in modal page-->
					<c:if test="${!empty searchBtnClick }">
						<c:choose>
							<c:when test="${!empty cards && !empty benefit }">
								<div class="col-sm-12 col-md-12 col-lg-12">
									<ul class="nav nav-pills">
										<li class="${active[0]}"><a id="_home" data-toggle="pill" href="#home" >전체(${total_record})</a></li>
										<li class="${active[1]}"><a id="_menu1" data-toggle="pill" href="#menu1">${kcards[0]}(${total_record1})</a></li>
										<li class="${active[2]}"><a id="_menu2" data-toggle="pill" href="#menu2">${kcards[1]}(${total_record2 })</a></li>
									</ul>
									<div class="tab-content">
										<div id="home" class="tab-pane fade in ${active[0] }">
											<div class="list-group" id="listGroup">
												<c:forEach items="${bTenAllList}" var="btena" varStatus="vs">
													<c:choose>
														<c:when test="${btena.brate > 100}">
												    		<div class="list-group-item">
													    		<div class="listgroup">
													    			<div class="llistgroup">
													    				<a href="javascript:focusMarker(${btena.locationx }, ${btena.locationy });">
																			<img src = "${bTenAllImg[vs.count-1]}"/> 
													    				</a>		
													    			</div>
													    			<div class="rlistgroup" >
													    				<div class="rlistgroup2">
																			<a href="admin_bdetail.do?bseq=${btena.bseq}">${btena.shopname }</a><br>
													    						${btena.brate} 원 할인
													    				</div>
													    			</div>
												    			</div>
												    		</div>
											    		</c:when>
														<c:otherwise>
															<div class="list-group-item">
													    		<div class="listgroup">
													    			<div class="llistgroup">
													    				<a href="javascript:focusMarker(${btena.locationx }, ${btena.locationy });">
																			<img src = "${bTenAllImg[vs.count-1]}"/> 		
													    				</a>
													    			</div>
													    			<div class="rlistgroup" >
													    				<div class="rlistgroup2">
													    					<a href="admin_bdetail.do?bseq=${btena.bseq}">${btena.shopname }</a><br>
														    					${btena.brate} % 할인
													    				</div>
													    			</div>
												    			</div>
												    		</div><br>
														</c:otherwise>	
												 	</c:choose>
												</c:forEach>
												
												<c:choose>
													<c:when test="${!empty bTenAllList}">
														<div class="pager">
															<form action="benefit.do" method="post">
																<input type="hidden" value="${1 }" name="pageno"/>
																<input type="hidden" value="${pageno1 }" name="pageno1"/>
																<input type="hidden" value="active" name="act0"/>
																<input type="hidden" value="" name="act1"/>
																<input type="hidden" value="${cards[0] }" name="cards"/>
																<input type="hidden" value="${cards[1] }" name="cards"/>
																<input type="hidden" value="${pageno2 }" name="pageno2"/>
																	<input type="hidden" value="" name="act2"/>
																<input type="hidden" value="${benefit }" name="benefit"/>
																<input type="image" src="/CarimiS/image/arrows/ll.png" value="맨앞으로">
															</form>
															<form action="benefit.do" method="post">
																<input type="hidden" value="${prev_pageno }" name="pageno"/>
																<input type="hidden" value="${pageno1 }" name="pageno1"/>
																<input type="hidden" value="active" name="act0"/>
																<input type="hidden" value="" name="act1"/>
																<input type="hidden" value="${cards[0] }" name="cards"/>
																<input type="hidden" value="${cards[1] }" name="cards"/>
																<input type="hidden" value="${pageno2 }" name="pageno2"/>
																<input type="hidden" value="" name="act2"/>
																<input type="hidden" value="${benefit }" name="benefit"/>
																<input type="image" src="/CarimiS/image/arrows/l.png" value="이전">
															</form>	
																<c:forEach var="i" begin="${page_sno }" end="${page_eno  }" step="1">
																	<form id="_allnum" action="benefit.do" method="post">
																		<input type="hidden" value="${i }" name="pageno"/> 
																		<input type="hidden" value="${pageno1 }" name="pageno1"/>
																		<input type="hidden" value="active" name="act0"/>
																		<input type="hidden" value="" name="act1"/>
																		<input type="hidden" value="${cards[0] }" name="cards"/>
																		<input type="hidden" value="${cards[1] }" name="cards"/>
																		<input type="hidden" value="${pageno2 }" name="pageno2"/>
																		<input type="hidden" value="" name="act2"/>
																		<input type="hidden" value="${benefit }" name="benefit"/>
																			<c:choose>
																				<c:when test="${pageno eq i }">
																					<input class=" btn-danger" type="submit" value="[${i }]"/>
																				</c:when>
																				<c:otherwise>
																					<input class=" btn-danger" type="submit" value="${i }"/>
																				</c:otherwise>
																			</c:choose>
																	</form>
																</c:forEach>
															<form action="benefit.do" method="post">
																<input type="hidden" value="${next_pageno }" name="pageno"/>
																<input type="hidden" value="${pageno1 }" name="pageno1"/>
																<input type="hidden" value="active" name="act0"/>
																<input type="hidden" value="" name="act1"/>
																<input type="hidden" value="${cards[0] }" name="cards"/>
																<input type="hidden" value="cards[1]" name="cards"/>
																<input type="hidden" value="${pageno2 }" name="pageno2"/>
																<input type="hidden" value="" name="act2"/>
																<input type="hidden" value="${benefit }" name="benefit"/>
																<input type="image" src="/CarimiS/image/arrows/r.png" value="다음">
															</form>
															<form action="benefit.do" method="post">
																<input type="hidden" value="${total_page }" name="pageno"/>
																<input type="hidden" value="${pageno1 }" name="pageno1"/>
																<input type="hidden" value="active" name="act0"/>
																<input type="hidden" value="" name="act1"/>
																<input type="hidden" value="${cards[0] }" name="cards"/>
																<input type="hidden" value="${cards[1] }" name="cards"/>
																<input type="hidden" value="${pageno2 }" name="pageno2"/>
																<input type="hidden" value="" name="act2"/>
																<input type="hidden" value="${benefit }" name="benefit"/>
																<input type="image" src="/CarimiS/image/arrows/rr.png" value="맨뒤로">
															</form>
														</div>
													</c:when>
													<c:otherwise>
													
														<br><br><p>주변 혜택이 없습니다.</p>
													
													</c:otherwise>
												</c:choose>	 
											</div>
										</div>
										<div id="menu1" class="tab-pane fade in ${active[1] }">
											<div class="list-group" id="listGroup">
												<c:forEach items="${bTenCard1List }" var="bten1" varStatus="vs">
													<c:choose>
														<c:when test="${bten1.brate > 100 }">
												    		<div class="list-group-item">
													    		<div class="listgroup">
													    			<div class="llistgroup">
													    				<a href="javascript:focusMarker(${bten1.locationx }, ${bten1.locationy });">
													    					<img src="/CarimiS/image/focusMarkerG.png"/>
													    				</a>
													    			</div>
													    			<div class="rlistgroup" >
													    				<div class="rlistgroup2">
													    				<a href="admin_bdetail.jsp?bseq=${bten1.bseq }">${bten1.shopname }</a><br>
													    				${bten1.brate } 원 할인
													    				</div>
													    			</div>
												    			</div>
												    		</div>
											    		</c:when>
											    		<c:otherwise>
											    			<div class="list-group-item">
													    		<div class="listgroup">
													    			<div class="llistgroup">
													    				<a href="javascript:focusMarker(${bten1.locationx }, ${bten1.locationy });">
													    					<img src="/CarimiS/image/focusMarkerG.png" />
													    				</a>
													    			</div>
													    			<div class="rlistgroup" >
													    				<div class="rlistgroup2">
														    				<a href="admin_bdetail.jsp?bseq=${bten1.bseq }">${bten1.shopname }</a><br>
														    				${bten1.brate } % 할인
													    				</div>
													    			</div>
												    			</div>
												    		</div><br>
														</c:otherwise>
												 	</c:choose>
												</c:forEach>
												<c:choose>
													<c:when test="${!empty bTenCard1List }">
														<div class="pager">
															<form action="benefit.do" method="post">
																<input type="hidden" value="${pageno }" name="pageno"/>
																<input type="hidden" value="${1 }" name="pageno1"/>
																<input type="hidden" value="" name="act0"/>
																<input type="hidden" value="active" name="act1"/>
																<input type="hidden" value="${cards[0] }" name="cards"/>
																<input type="hidden" value="${cards[1] }" name="cards"/>
																<input type="hidden" value="${pageno2 }" name="pageno2"/>
																<input type="hidden" value="" name="act2"/>
																<input type="hidden" value="${benefit }" name="benefit"/>
																<input type="image" src="/CarimiS/image/arrows/ll.png" value="맨앞으로">
															</form>
															<form action="benefit.do" method="post">
																<input type="hidden" value="${pageno }" name="pageno"/>
																<input type="hidden" value="${prev_pageno1} }" name="pageno1"/>
																<input type="hidden" value="" name="act0"/>
																<input type="hidden" value="active" name="act1"/>
																<input type="hidden" value="${cards[0] }" name="cards"/>
																<input type="hidden" value="${cards[1] }" name="cards"/>
																<input type="hidden" value="${pageno2 }" name="pageno2"/>
																<input type="hidden" value="" name="act2"/>
																<input type="hidden" value="${benefit }" name="benefit"/>
																<input type="image" src="/CarimiS/image/arrows/l.png" value="이전">
															</form>	
															<c:forEach var="i" begin="${page_sno1 }" end="${page_eno1 }" step="1">
																<form id="_card1num" action="benefit.do" method="post">
																<input type="hidden" value="${pageno }" name="pageno"/>
																<input type="hidden" value="${i }" name="pageno1"/>
																<input type="hidden" value="" name="act0"/>
																<input type="hidden" value="active" name="act1"/> 
																<input type="hidden" value="${cards[0] }" name="cards"/>
																<input type="hidden" value="${cards[1] }" name="cards"/>
																<input type="hidden" value="${pageno2 }" name="pageno2"/>
																<input type="hidden" value="" name="act2"/>
																<input type="hidden" value="${benefit }" name="benefit"/>
																	<c:choose>
																		<c:when test="${pageno1 eq i }">
																			<input class="btn-danger" type="submit" value="[${i }]"/>
																		</c:when>
																		<c:otherwise>	
																			<input class="btn-danger" type="submit" value="${i }"/>
																		</c:otherwise>
																	</c:choose>
																	</form>
															</c:forEach>
															<form action="benefit.do" method="post">
																<input type="hidden" value="${pageno }" name="pageno"/>
																<input type="hidden" value="${next_pageno1 }" name="pageno1"/>
																<input type="hidden" value="" name="act0"/>
																<input type="hidden" value="active" name="act1"/>
																<input type="hidden" value="${cards[0] }" name="cards"/>
																<input type="hidden" value="${cards[1] }" name="cards"/>
																<input type="hidden" value="${pageno2 }" name="pageno2"/>
																<input type="hidden" value="" name="act2"/>
																<input type="hidden" value=${benefit } name="benefit"/>
																<input type="image" src="/CarimiS/image/arrows/r.png" value="다음">
															</form>
															<form action="benefit.do" method="post">
																<input type="hidden" value="${pageno }" name="pageno"/>
																<input type="hidden" value="${total_page1 }" name="pageno1"/>
																<input type="hidden" value="" name="act0"/>
																<input type="hidden" value="active" name="act1"/>
																<input type="hidden" value="${cards[0] }" name="cards"/>
																<input type="hidden" value="${cards[1] }" name="cards"/>
																<input type="hidden" value="${pageno2 }" name="pageno2"/>
																<input type="hidden" value="" name="act2"/>
																<input type="hidden" value="${benefit }" name="benefit"/>
																<input type="image" src="/CarimiS/image/arrows/rr.png" value="맨뒤로">
															</form>
														</div>	 
													</c:when>
													<c:otherwise>	
														<br><br><p>주변 혜택이 없습니다.</p>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
										<div id="menu2" class="tab-pane fade in ${active[2] }">
											<div class="list-group" id="listGroup">
												<c:forEach items="${bTenCard2List }" var="bten2" varStatus="vs">
													<c:choose>
														<c:when test="${bten2.brate > 100 }">
												    		<div class="list-group-item">
													    		<div class="listgroup">
													    			<div class="llistgroup">
													    				<a href="javascript:focusMarker(${bten2.locationx }, ${bten2.locationy });">
													    					<img src="/CarimiS/image/focusMarker.png" />
													    				</a>
													    			</div>
													    			<div class="rlistgroup" >
													    				<div class="rlistgroup2">
													    				<a href="admin_bdetail.jsp?bseq=${bten2.bseq }">${bten2.shopname }</a><br>
													    					${bten2.brate } 원 할인
													    				</div>
													    			</div>
												    			</div>
												    		</div>
											    		</c:when>
											    		<c:otherwise>
											    			<div class="list-group-item">
													    		<div class="listgroup">
													    			<div class="llistgroup">
													    				<a href="javascript:focusMarker(${bten2.locationx }, ${bten2.locationy });">
													    					<img src="/CarimiS/image/focusMarker.png" />
													    				</a>
													    			</div>
													    			<div class="rlistgroup" >
													    				<div class="rlistgroup2">
													    				<a href="admin_bdetail.jsp?bseq=${bten2.bseq }">${bten2.shopname }</a><br>
													    					${bten2.brate } % 할인
													    				</div>
													    			</div>
												    			</div>
												    		</div><br>
											    		</c:otherwise>
													</c:choose>
												</c:forEach>
												<c:choose>
													<c:when test="${!empty bTenCard2List }">
														<div class="pager">
															<form action="benefit.do" method="post">
																<input type="hidden" value="${pageno }" name="pageno"/>
																<input type="hidden" value="${pageno1 }" name="pageno1"/>
																<input type="hidden" value="" name="act0"/>
																<input type="hidden" value="" name="act1"/>
																<input type="hidden" value="${cards[0] }" name="cards"/>
																<input type="hidden" value="${cards[1] }" name="cards"/>
																<input type="hidden" value="${1 }" name="pageno2"/>
																<input type="hidden" value="active" name="act2"/>
																<input type="hidden" value="${benefit }" name="benefit"/>
																<input type="image" src="/CarimiS/image/arrows/ll.png" value="맨앞으로">
															</form>
															<form action="benefit.do" method="post">
																<input type="hidden" value="${pageno }" name="pageno"/>
																<input type="hidden" value="${pageno1 }" name="pageno1"/>
																<input type="hidden" value="" name="act0"/>
																<input type="hidden" value="" name="act1"/>
																<input type="hidden" value="${cards[0] }" name="cards"/>
																<input type="hidden" value="${cards[1] }" name="cards"/>
																<input type="hidden" value="${prev_pageno2 }" name="pageno2"/>
																<input type="hidden" value="active" name="act2"/>
																<input type="hidden" value="${benefit }" name="benefit"/>
																<input type="image" src="/CarimiS/image/arrows/l.png" value="이전">
															</form>	
															<c:forEach var="i" begin="${page_sno2 }" end="${page_eno2 }" step="1">
																	<form id="_card2num" action="benefit.do" method="post">
																	<input type="hidden" value="${pageno }" name="pageno"/>
																	<input type="hidden" value="${pageno1 }" name="pageno1"/> 
																	<input type="hidden" value="" name="act0"/>
																	<input type="hidden" value="" name="act1"/>
																	<input type="hidden" value="${cards[0] }" name="cards"/>
																	<input type="hidden" value="${cards[1] }" name="cards"/>
																	<input type="hidden" value="${i }" name="pageno2"/>
																	<input type="hidden" value="active" name="act2"/>
																	<input type="hidden" value="${benefit }" name="benefit"/>
																		<c:choose>
																			<c:when test="${pageno2 eq i }">
																				<input class="btn-danger" type="submit" value="[${i }]"/>
																			</c:when>
																			<c:otherwise>
																				<input class="btn-danger" type="submit" value="${i }"/>
																			</c:otherwise>
																		</c:choose>
																	</form>
																</c:forEach>
															<form action="benefit.do" method="post">
																<input type="hidden" value="${pageno }" name="pageno"/>
																<input type="hidden" value="${pageno1 }" name="pageno1"/>
																<input type="hidden" value="" name="act0"/>
																<input type="hidden" value="" name="act1"/>
																<input type="hidden" value="${cards[0] }" name="cards"/>
																<input type="hidden" value="${cards[1] }" name="cards"/>
																<input type="hidden" value="${next_pageno2 }" name="pageno2"/>
																<input type="hidden" value="active" name="act2"/>
																<input type="hidden" value="${benefit }" name="benefit"/>
																<input type="image" src="/CarimiS/image/arrows/r.png" value="다음">
															</form>
															<form action="benefit.do" method="post">
																<input type="hidden" value="${pageno }" name="pageno"/>
																<input type="hidden" value="${pageno1 }" name="pageno1"/>
																<input type="hidden" value="" name="act0"/>
																<input type="hidden" value="" name="act1"/>
																<input type="hidden" value="${cards[0] }" name="cards"/>
																<input type="hidden" value="${cards[1] }" name="cards"/>
																<input type="hidden" value="${total_page2 }" name="pageno2"/>
																<input type="hidden" value="active" name="act2"/>
																<input type="hidden" value="${benefit }" name="benefit"/>
																<input type="image" src="/CarimiS/image/arrows/rr.png" value="맨뒤로">
															</form>
														</div>
													</c:when>
													<c:otherwise>	 
														<br><br><p>주변 혜택이 없습니다.</p>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									
									</div>
								</div>
								
							</c:when>
							<c:otherwise>						
							<script>
								alert("선택을 안 한 카드 혹은 혜택이 있습니다");
							</script>
						</c:otherwise>
						</c:choose>
				  </c:if>
				</div>
                 <!-- /shortcuts --> 
           </div>
            <!-- /widget-content --> 
         </div>
          <!-- /widget -->
        
        </div>
        <!-- /span6 --> 
      </div>
      <!-- /row --> 
    </div>
    <!-- /container --> 
    
    <div class="modal fade" id="selectBenefit" role="dialog">
   	 	<div class="modal-benefit">
    
      <!-- Modal content-->
		<div class="modal-content">
        	<div class="modal-header">
          		<button type="button" class="close" data-dismiss="modal">&times;</button>
          		<h2 class="modal-title" style="text-align:center">당신의 선택은?</h2>
       		 </div>
        
        	<div class="modal-body" style="text-align:center">
				<form id="_formSearch" method="post">
          			<h3>카드 선택</h3><br>
	          			<label class="checkbox-inline">
	          				<img src="/CarimiS/image/cards/shinhan.gif" name="card" id="si" 
	          				onclick="selectCard('si', this)"></label>
	          			<label class="checkbox-inline">
	          				<img src="/CarimiS/image/cards/kb.gif" name="card" id="ku" 
	          				onclick="selectCard('ku' , this)"></label>
	          			<label class="checkbox-inline">
	          				<img src="/CarimiS/image/cards/woori.gif" name="card" id="w" 
	          				onclick="selectCard('w', this)"></label><br><br>
	          			<label class="checkbox-inline">
	          				<img src="/CarimiS/image/cards/hana.gif" name="card" id="h" 
	          				onclick="selectCard('h', this)"></label>
	          			<label class="checkbox-inline">
	          				<img src="/CarimiS/image/cards/lotte.gif" name="card" id="l" 
	          				onclick="selectCard('l', this)"></label>
	          			<label class="checkbox-inline">
	          				<img src="/CarimiS/image/cards/samsung.gif" name="card" id="sa" 
	          				onclick="selectCard('sa', this)"></label><br><br>
	          			<label class="checkbox-inline">
	          				<img src="/CarimiS/image/cards/nh.gif" name="card" id="n" 
	          				onclick="selectCard('n', this)"></label>
	          			<label class="checkbox-inline">
	          				<img src="/CarimiS/image/cards/ibk.gif" name="card" id="ki" 
	          				onclick="selectCard('ki', this)"></label>
	          			<label class="checkbox-inline">
	          				<img src="/CarimiS/image/cards/citi.gif" name="card" id="ci" 
	          				onclick="selectCard('ci', this)"></label><br><br><hr>
          			<h3>혜택 선택</h3><br>
		       			<label class="checkbox-inline">
		       				<img src="/CarimiS/image/benefits/oil_off.png"  name="bnf"
		       				id="oil" onclick="selectBenefit('oil', this)"/>
		       			</label>
		       			<label class="checkbox-inline">
		       				<img src="/CarimiS/image/benefits/shop_off.png"  name="bnf"
		       				id="shop" onclick="selectBenefit('shop', this)"/>
		       			</label>
		       			<label class="checkbox-inline">
		       				<img src="/CarimiS/image/benefits/mart_off.png"  name="bnf"
		       				id="mart" onclick="selectBenefit('mart', this)"/>
		       			</label>
		       			<label class="checkbox-inline">
		       				<img src="/CarimiS/image/benefits/cvs_off.png"  name="bnf"
		       				id="cvs" onclick="selectBenefit('cvs', this)"/>
		       			</label><br>
		       			<label class="checkbox-inline">
		       				<img src="/CarimiS/image/benefits/eou_off.png"  name="bnf"
		       				id="eou" onclick="selectBenefit('eou', this)"/>
		       			</label>
		       			<label class="checkbox-inline">
		       				<img src="/CarimiS/image/benefits/cafe_off.png"  name="bnf"
		       				id="cafe" onclick="selectBenefit('cafe', this)"/>
		       			</label>
		       			<label class="checkbox-inline">
		       				<img src="/CarimiS/image/benefits/movie_off.png"  name="bnf"
		       				id="movie" onclick="selectBenefit('movie', this)"/>
		       			</label>
		       			<label class="checkbox-inline">
		       				<img src="/CarimiS/image/benefits/tra_off.png"  name="bnf"
		       				id="tra" onclick="selectBenefit('tra', this)"/>
		       			</label><br>
		       			<label class="checkbox-inline">
		       				<img src="/CarimiS/image/benefits/tel_off.png"  name="bnf"
		       				id="tel" onclick="selectBenefit('tel', this)"/>
		       			</label>
		       			<label class="checkbox-inline">
		       				<img src="/CarimiS/image/benefits/edu_off.png"  name="bnf"
		       				id="edu" onclick="selectBenefit('edu', this)"/>
		       			</label>
		       			<label class="checkbox-inline">
		       				<img src="/CarimiS/image/benefits/cul_off.png"  name="bnf"
		       				id="cul" onclick="selectBenefit('cul', this)"/>
		       			</label>
		       			<label class="checkbox-inline">
		       				<img src="/CarimiS/image/benefits/lei_off.png"  name="bnf"
		       				id="lei" onclick="selectBenefit('lei', this)"/>
		       			</label><br>
		       			<label class="checkbox-inline">
		       				<img src="/CarimiS/image/benefits/medi_off.png"  name="bnf"
		       				id="medi" onclick="selectBenefit('medi', this)"/>
		       			</label>
		       			<label class="checkbox-inline">
		       				<img src="/CarimiS/image/benefits/bea_off.png"  name="bnf"
		       				id="bea" onclick="selectBenefit('bea', this)"/>
		       			</label>
		       			<label class="checkbox-inline">
		       				<img src="/CarimiS/image/benefits/poi_off.png"  name="bnf"
		       				id="poi" onclick="selectBenefit('poi', this)"/>
		       			</label><br><br><hr>
	       			<input type="hidden" name="userchk" value="click"/>
	       			<input type="hidden" name="benefit" id="benefit"/>
	       			<input type="hidden" name="cards" id="card1"/>
	       			<input type="hidden" name="cards" id="card2"/>
					<input type="submit" id="_btnSearch" class="btn btn-default" value="검색"/>
          		</form>
         	 </div>
        </div>
      </div>
      
    </div>
  </div>
 

<script>
$("#_btnSearch").click(function(){
	var benefit = document.getElementById("benefit").value;
	var card1 = document.getElementById("card1").value;
	var card2 = document.getElementById("card2").value;
	if(benefit != "" && card1 != "" && card2 != ""){
		$("#_formSearch").attr({ "target":"_self", "action":"benefit.do" }).submit();
		viewMarker(null);	
	} else {
		alert("카드 2개 와 혜택 1개를 꼭 선택 해주세요!");
		return false;
	}
	
	
});
</script>

<c:if test="${!empty searchBtnClick }">
	<script>
		var jsonInfo = ${jsonInfo}; 
		viewMarker(jsonInfo , 'all');
	</script>	
</c:if>


<!-- whenever you click page number, you can see mark up on the map -->
<c:choose>
	<c:when test="${active[0] eq 'active' }">
		<script>
			var jsonInfo =	${jsonInfo};
			viewMarker(jsonInfo, 'all');
		</script> 
	</c:when>
	<c:when test="${active[1] eq 'active' }">
		<script>
			var jsonInfo1 = ${jsonInfo1};
			viewMarker(jsonInfo1, 'card1');
		</script> 
	</c:when>
	<c:when test="${active[2] eq 'active' }">
		<script>
			var jsonInfo2 = ${jsonInfo2};
			viewMarker(jsonInfo2, 'card2');
		</script> 
	</c:when>
</c:choose>

<script>

$("#_home").click(function(){
	var jsonInfo =	${jsonInfo};
	viewMarker(jsonInfo, 'all');
});
$("#_menu1").click(function(){
	var jsonInfo1 = ${jsonInfo1};
	viewMarker(jsonInfo1, 'card1');
});
$("#_menu2").click(function(){
	var jsonInfo2 = ${jsonInfo2};
	viewMarker(jsonInfo2, 'card2');
});
	
</script>
