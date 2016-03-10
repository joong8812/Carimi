
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
    
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
<script type="text/javascript" src="/CarimiS/js/savelocation.js"></script>

<style>
#map_canvas{
	width: 100%;
	height: 300px;
/* 	border: 1px solid red;   */
}
  #infoPanel {
    float: left;
    margin-left: 10px;
  }
  #infoPanel div {
    margin-bottom: 5px;
  }
  #r{
	max-height: 180px;
    overflow-y:scroll; 
}
</style>

<div class="container">
	<div class="widget">
    	<div class="widget-header"> <i class="icon-camera-retro "></i>
			<h3>가맹점 등록</h3>
				<div style="float:right; padding-right:10px">
  			  		<button class="btn" onclick="javascript:history.go(-1);">목록보기</button>
				</div>
       </div>
   	   <div class="widget-content">
    		<form class="form-horizontal" id="_regiForm" name="_regiForm">
    			<div class="control-group">
    				<label class="control-label" for="cardname">카드명</label>
    				<div class="controls">
    					<select name="cardname" style="width:150px">
    						<c:forEach items="${cardnames }" var="cardnames" varStatus="vs" >
								<option value="${cardvalues[vs.count] }">${cardnames }</option>
							</c:forEach>
						</select>
    				</div>
    			</div>
    			<div class="control-group">
    				<label class="control-label" >가맹점 이름</label>
    				<div class="controls">
    					<input class="form-control" id="shopname" type="text" name="shopname" style="width:150px">
    				</div>
    			</div>
    			<div class="control-group">
    				<label class="control-label">혜택 분류</label>
    				<div class="controls">
    					<select name="bcategory" style="width:120px">
    						<c:forEach items="${bcategory }" var="bcategory" varStatus="vs" >
								<option value="${bvalues[vs.count] }">${bcategory }</option>
							</c:forEach>
						</select>
    				</div>
    			</div>
    			<div class="control-group">
    				<label class="control-label">혜택율</label>
    				<div class="controls">
    					<input class="form-control" id="brate" type="text" style="width:60px" name="brate"
					onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>
    				</div>
    			</div>
    			<div class="control-group">
    				<label class="control-label">영업시간</label>
    				<div class="controls">
    					<select name="opentime" style="width:120px">
    						<c:forEach items="${times }" var="times" >
								<option value="${times }">${times }</option>
							</c:forEach>
						</select>
						~
						<select name="closetime" style="width:120px">
							<c:forEach items="${times }" var="times" >
								<option value="${times }">${times }</option>
							</c:forEach>
						</select>
    				</div>
    			</div>
    			<div class="control-group">
    				<label class="control-label">전화번호</label>
    				<div class="controls">
    					<input id="p1" type="text" style="width:30px" name="p1" maxlength="3" size="2"
						onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'> -
						<input id="p2" type="text" style="width:40px" name="p2" maxlength="4" size="2"
						onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'> -
						<input id="p3" type="text" style="width:40px" name="p3" maxlength="4" size="2"
						onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>
    				</div>
    			</div>
    			<div class="control-group">
    				<label class="control-label">주소</label>
    				<div class="controls">
    					<input class="form-control" id="address" type="text" style="width:60%" name="address">
    				</div>
    			</div>
    			<div class="control-group">
    				<label class="control-label">이미지</label>
    				<div class="controls">
    					<input type="file" name="fileload" style="width:60%"/>
    				</div>
    			</div>
    			<div class="control-group">
    				<label class="control-label">위치저장</label>
    				<div class="controls">
    					<div class="row" style="width:100%; display:inline-flex">
							<div class="span6" >
								<div id="map_canvas"></div>
								<div id="infoPanel">
									<b>Current position:</b><div id="info"></div>
						    		<b>Closest matching address:</b><div id="address"></div>
					    		</div>
				    		</div>
				    		<div class="span8" style=" text-align:center;padding-top:100px;">
				    			<input class="form-control input-sm" type="text" size="10px" id="saddress">
				    			<button type="button" class="btn btn-default" style="margin-bottom:3px" onclick="codeAddress()">검색</button>
				    			<div id="r"></div> 
				    		</div>
			    		</div>
    				</div>
    			</div>
    			<div style="text-align:center">
    			<input type="hidden" id="lx" name="locationx"/>
				<input type="hidden" id="ly" name="locationy"/>
				<input id="_saveForm" type="submit" class="btn btn-default" style="width:25%" value="저장"/>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
$("#_saveForm").click(function(){
	var shopname = document.getElementById("shopname").value;
	var brate = document.getElementById("brate").value;
	var p1 = document.getElementById("p1").value;
	var p2 = document.getElementById("p2").value;
	var p3 = document.getElementById("p3").value;
	var address = document.getElementById("address").value;
	
	if(shopname === ""){
		alert("가맹점 이름을 입력 해 주세요");
		document._regiForm.shopname.focus();
		return false;
	} else if(brate === ""){
		alert("혜택율를 입력 해 주세요");
		document._regiForm.brate.focus();
		return false;
	} else if(p1 === "" || p2 === "" || p3 === ""){
		alert("전화번호를 입력 해 주세요");
		document._regiForm.p1.focus();
		return false;
	} else if(address === ""){
		alert("주소를 입력 해 주세요");
		document._regiForm.address.focus();
		return false;
	} else {
		$("#_regiForm").attr({ "target":"_self", "action":"admin_bwriteAf.do", 
			"method":"POST", "enctype":"multipart/form-data"}).submit();	
	}
});
</script>
   
