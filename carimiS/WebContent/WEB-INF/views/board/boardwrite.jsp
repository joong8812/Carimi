<%@ page contentType="text/html; charset=UTF-8"%>

<%@ page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta name="viewport" content="width=device-width, initial-scale=1">



<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<style>
.ui-datepicker {
	font-size: 12px;
	width: 170px;
}

.ui-datepicker select.ui-datepicker-month {
	width: 30%;
	font-size: 11px;
}

.ui-datepicker select.ui-datepicker-year {
	width: 40%;
	font-size: 11px;
}
</style>
<script>
	$(function() {
		for(var i=1; i<3; i++){
		$("#datepicker"+i).datepicker({
			dateFormat : 'yy-mm-dd',
			inline: true,
	   		onSelect: function(dateText, inst) {
	       		 var wdate = $(this).datepicker('getDate'),
	           	 day  = wdate.getDate(),  
	             month = wdate.getMonth() + 1,              
	             year =  wdate.getFullYear();
	       		 
	   		
	   		}
		});
		} 
	});
</script>

<div class="main">
	
	<div class="main-inner">

	    <div class="container">
	
	      <div class="row">
	      	
	      	<div class="span12">      		
	      		
	      		<div class="widget ">
	      			
	      			<div class="widget-header">
	      				<i class="icon-th-list"></i>
	      				<h3>Notice Upload</h3>
	  				</div> <!-- /widget-header -->
					
					<div class="widget-content">
				
							<div class="tab-content">
								<div class="tab-pane active" id="formcontrols">
								<form class="form-horizontal"
								 name="boardform" onsubmit="submitContents(this);" enctype="multipart/form-data"
action="boardwriteAf.do" method="post">
									<fieldset>
										
										<div class="control-group">											
											<label class="control-label" for="username">작성자</label>
											<div class="controls">
												<input type="text" class="span7 disabled" id="id"  value="${sessionScope.login.id}" disabled>
												<input type="hidden" name="id" value="${sessionScope.login.id}"/>
												<p class="help-block">Your username is for logging in and cannot be changed.</p>
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										
										<div class="control-group">
							 		<label class="control-label">카드</label>											 	   
									 <div class="controls">
									
                                      <label class="checkbox-inline">
                                        <input onclick="chk_only2(this)" name="bselect" type="checkbox"value="shin"  />신한
                                      </label>
    								  <label class="checkbox-inline">
                                        <input onclick="chk_only2(this)" name="bselect" type="checkbox"value="guk"  />국민
                                      </label>
                                      <label class="checkbox-inline">
                                        <input onclick="chk_only2(this)"  name="bselect" type="checkbox"value="woo"  />우리
                                      </label>
                                      <label class="checkbox-inline">
                                        <input onclick="chk_only2(this)"  name="bselect" type="checkbox"value="ha"  />하나
                                      </label>
                                      <label class="checkbox-inline">
                                        <input onclick="chk_only2(this)"  name="bselect" type="checkbox"value="lot"  />롯데
                                      </label>
                                      <label class="checkbox-inline">
                                        <input onclick="chk_only2(this)"  name="bselect" type="checkbox"value="sam"  />삼성
                                      </label>
                                      <label class="checkbox-inline">
                                        <input onclick="chk_only2(this)" name="bselect" type="checkbox"value="nong"  />농협
                                      </label>
                                      <label class="checkbox-inline">
                                        <input onclick="chk_only2(this)"  name="bselect" type="checkbox"value="gi"  />기업
                                      </label>
                                      <label class="checkbox-inline">
                                        <input onclick="chk_only2(this)"  name="bselect" type="checkbox"value="ci"  />시티
                                      </label>
								
										</div>
										</div>
										<div class="control-group">											
											<label class="control-label" for="btitle">제목</label>
											<div class="controls">
												<input type="text" class="span7" name="btitle" id="btitle" placeholder="Title">
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										
										
										<div class="control-group">											
											<label class="control-label" for="bcontent">내용</label>
											<div class="controls">
												 <textarea name="bcontent" id="bcontent" class="span7" ></textarea>
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										<div class="control-group">											
											<label class="control-label" for="Notice S-E">공지 시작일-종료일</label>
											<div class="controls">
												<input id="datepicker1" type="text" name="bsdate" placeholder="Start Date"/>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  	 											<input id="datepicker2" type="text" name="bedate" placeholder="End Date"/>
											</div> <!-- /controls -->				
										</div>
										
										<div class="control-group">											
											<label class="control-label" for="btitle">쿠폰</label>
											<div class="controls">
												<input type="file" name='fileload' style="width:400px;"/>
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										
										

										
								<div class="form-actions">
											<button style="width:100%" type="submit" class="btn btn-primary">쓰기</button> 
											
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
						
<script src="<%=request.getContextPath()%>/se2/js/HuskyEZCreator.js" type="text/javascript" charset="utf-8"></script>

<script src="<%=request.getContextPath()%>/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" type="text/javascript" charset="utf-8"></script>
<script>
function chk_only2(chk){								
	var obj = document.getElementsByName("bselect");
	for(var i=0; i<obj.length; i++){
		if(obj[i] != chk){
			obj[i].checked = false;
		}
	}
}
</script>
<script type="text/javascript">

var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "bcontent",
    sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",
    fCreator: "createSEditor2"

});

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
/* function sendSub(){
	alert(oEditors[0].value);
	oEditors.getById["bcontent"].exec("UPDATE_BCONTENT_FIELD", [ ]);
	 try {
		boardform.submit();
	 }catch(e) {}
} */
function submitContents(elClickedObj) {
	 	oEditors.getById["bcontent"].exec("UPDATE_CONTENTS_FIELD", []);
try {

        elClickedObj.form.submit();

    } catch(e) {}
}
// textArea에 이미지 첨부
function pasteHTML(filepath){
    var sHTML = '<img src="<%=request.getContextPath()%>/se2/upload/'+filepath+'">';
    oEditors.getById["bcontent"].exec("PASTE_HTML", [sHTML]); 
} 
</script>								
