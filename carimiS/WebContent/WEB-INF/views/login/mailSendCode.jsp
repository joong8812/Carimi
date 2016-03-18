<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">



<html>







<head>

<TITLE>iOnnuri 통합인증센터 </TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<SCRIPT LANGUAGE="JavaScript" SRC="/ks20/js/common.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" SRC="/ks20/js/ajax.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" SRC="/ks20/js/validationUtil.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" SRC="https://www.ionnuri.org/ks20/js/jquery/jquery.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" SRC="/ks20/js/jquery/ui/ui.core.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" SRC="/ks20/js/jquery/ui/ui.draggable.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" SRC="/ks20/js/jquery/ui/ui.resizable.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" SRC="/ks20/js/jquery/ui/ui.dialog.js"></SCRIPT>
<link rel="stylesheet" type="text/css" href="/jsp/sso/css/style.css" />
<script type="text/javascript" src="/jsp/sso/js/common.js"></script>
<script type="text/javascript" src="/ks20/js/TT_User_Common.js"></script>
<script language="JavaScript" type="text/JavaScript">
		
jQuery(document).ready(function() {

	jQuery('#userid').focus();

	jQuery("#popupNotice").dialog({
		autoOpen: false,
		resizable : false,
		width : 405,
		//height: auto,
		modal: false,
		draggable: true,
		position: [90,30],
		open: function(event, ui) { 
			jQuery("#popupNotice").dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
		}
	});	

	jQuery("#chkNotice").bind("click", function() {
		if(jQuery('#chkNotice').attr("checked") == true) {
			setCookie("Notice" ,"done", "1");				
		}
		jQuery("#popupNotice").dialog('close');
	});

	//if ( getCookie( "Notice" ) != "done" )	lf_popupNotice();
});

function setCookie( name, value, expiredays )
{
        var todayDate = new Date();
        todayDate.setDate( todayDate.getDate() + expiredays );
        document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"       
}


function getCookie( name )
{
        var nameOfCookie = name + "=";
        var x = 0;
        while ( x <= document.cookie.length )
        {
                var y = (x+nameOfCookie.length);
                if ( document.cookie.substring( x, y ) == nameOfCookie ) {if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
                                endOfCookie = document.cookie.length;
                        return unescape( document.cookie.substring( y, endOfCookie ) );
                }
                x = document.cookie.indexOf( " ", x ) + 1;
                if ( x == 0 )
                        break;
        }
        return "";
}

		



function lf_goFamilySite(as_siteNumber) {
	http = jQuery.ajax({
		url	: "/optionSiteInfo.do",
		type : "post",
		async	: true,
		data : {siteCode : as_siteNumber},
		complete: function (res, status) {
			result = jQuery.trim(res.responseText);
			TT_UserLoginCheck(as_siteNumber, result);
		}
	});
}

function lf_NbCheck(as_name, as_birth) {
	jQuery('#name').val(as_name);
	jQuery('#birth').val(as_birth);

	http = jQuery.ajax({
		url		: "/nbcheck.do",
		type	: "POST",
		data 	: {name : as_name, birth : as_birth},
		async	: true,
		complete:function(res, status) {		
			result = jQuery.trim(res.responseText);    		
			jQuery("#nbCheckTbl > tbody").html( result);
			result = result.toLowerCase();
			if(result.substring(0,2)=="ok"){
				jQuery('#dialogNbCheck').dialog("destroy");
				document.RegistrationForm.chur.value=result.substring(3,result.length);
				document.RegistrationForm.action = "/policy.do";
				document.RegistrationForm.method = "post";
				document.RegistrationForm.submit();
				return;
			}else{
				jQuery('#dialogNbCheck').dialog("destroy");
				//alert(res.responseText);  
			
			}

		}

	});
}

function lf_register() 
{
	document.requestForm.action="/nbcheckForm.do";
	document.requestForm.submit();
}


function lf_login2()
{
	var frm = document.requestForm;
	var id = frm.userid;
	var pw = frm.password;

	id.value = jQuery.trim(id.value);
	
	if(isEmpty(id.value)) {
		//cgf_CenterWindow("/jsp/sso/pop.jsp?code=10","pop", 330, 150, 1,1);
		lf_open_msg( "아이디를 먼저 입력해주세요.");
		id.focus();
		return false;
	}	
	if(!isAlphaOrDigit(id.value)) {
		//cgf_CenterWindow("/jsp/sso/pop.jsp?code=11","pop", 330, 150, 1,1);
		lf_open_msg("영문과숫자를 이용하여 4~10자 이내로 입력해주세요.");
		id.focus();
		return false;
	}
	if(isEmpty(pw.value)) {
		//cgf_CenterWindow("/jsp/sso/pop.jsp?code=31","pop", 330, 150, 1,1);
		lf_open_msg("비밀번호를 입력하세요.");
		pw.focus();
		return false;
	}

	frm.requestType.value = 1;
	//frm.returnURL.value =  "/index.do";
	frm.action = "/sso_process.do";
	frm.submit();
	
}

function result( data)
{
	alert(data);
}


function lf_pw_modify()
{
	document.requestForm.action = "/pw_modify.do";
	document.requestForm.method = "post";
	document.requestForm.submit();
	return;
}


function lf_modify()
{

	var url ="/imodify.do";
	//cgf_CenterWindow(url,'MODIFY', 850, 580, 1, 0);
	document.requestForm.action = "/modify.do";
	document.requestForm.method = "post";
	//document.requestForm.target = "MODIFY";
	document.requestForm.submit();
	
	return;

	/*
	document.requestForm.action = "/modify.do";
	document.requestForm.submit();
	return;*/
}


function lf_logout()
{
	document.requestForm.target = "";
	document.requestForm.requestType.value = 6;
	document.requestForm.action = "/sso_process.do";
	document.requestForm.submit();
	return;
}

function lf_withdraw()
{
	var url ="/withdraw.do";
	cgf_CenterWindow(url,'WITHDRAW', 780, 400, 1, 0);
	document.requestForm.action = "/withdraw.do";
	document.requestForm.method = "post";
	document.requestForm.target = "WITHDRAW";
	document.requestForm.submit();
	
	return;
}

function lf_error(msg){
	/*
	jQuery(function() {
		//alert(jQuery("#msg_tr").attr("style"));
		jQuery("#msg_tr").attr("style","display:");
		jQuery("#msg").text(msg);
	});
	//디자인 문제로 인해 이런 친절한 기술은 쓰기 힘듬
	*/
	alert(msg);
}


function lf_openCheckidPwWindow(){	

	document.requestForm.target = "";
	document.requestForm.action = "/jsp/sso/searchid.jsp";
	document.requestForm.submit();

}


function lf_OpenFaq() {
	var loc = window.open("http://icare.ionnuri.org/ecare/guide/sso_faq.jsp","wFaq","toolbar=0,location=0,status=1,menubar=0,scrollbars=1,resizable=1,width=800,height=350");
	var cx = Math.ceil( (window.screen.width - 600) / 2 );
	var cy = Math.ceil( (window.screen.height - 350) / 2 );
		
	//loc.moveTo(cx,cy)
	//loc.focus();
}

function lf_popupNotice()
{
	jQuery('#popupNotice').dialog('open');	
}
</script>

</head>


<body style="background:url(/jsp/sso/img/bg_login.jpg) 50% 0;">



<div id="popupNotice" style="display:none;">
	<div id="popIcsCode_sub" style="width: 405px; height: 350px;">
		<img src="/jsp/sso/img/notice2.jpg" usemap="#noticeClose" border="0">
		<img src="/jsp/sso/img/notice1.jpg">
		<div style="margin-top:2px; text-align: right;"><input type="checkbox" id="chkNotice" value="1"> <label for="chkNotice">하루동안 감추기</label>&nbsp;&nbsp;</div>
	</div>
</div>

<form name="requestForm" method="post" action="/index.do" onsubmit="return false;">
	<input type="hidden" name="server_num" value="SS00">
	<input type="hidden" name="returnURL" value="">
	<input type="hidden" name="requestType" value="">
	<input type="hidden" name="xmldata" value="">

<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td height="100%" align="center" valign="top">
		<table width="330" border="0" cellspacing="0" cellpadding="0" style="margin-top:220px;">

		<tr>
			<td><img src="/jsp/sso/img/ta01_top.gif" width="330" height="15" /></td>
		</tr>

		<tr>
			<td align="center"  style="background: url('/jsp/sso/img/ta01_bg.gif');" >
				<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="70" height="22" align="left"><img src="/jsp/sso/img/txt_id.gif" width="68" height="14" /></td>
					<td width="147" align="center" style="background: URL('/jsp/sso/img/input_bg.gif') no-repeat;" >
						<input type="text" id="userid" name="userid" value="" class="input_textfield3" maxlength="20" size="10"  onkeypress="javascript:if(event.keyCode == 13){lf_login2(); return false;}"  tabindex="1" style=" background-color:transparent; width:134px;padding: 3px 0px 0px 1px; height:18px; border:none;ime-mode:disabled;"/></td>
					<td width="80" rowspan="3" align="right"><input type="image" src="/jsp/sso/img/btn01_login.gif" alt="로그인" id="loginBtn" onClick="lf_login2();" width="69" height="47" tabindex="3"/></td>
				</tr>
				<tr>
					<td height="2" colspan="2"></td>
				</tr>
				<tr>
					<td height="22" align="left"><img src="/jsp/sso/img/txt_pw.gif" width="68" height="14" /></td>
					<td width="147" align="center" style="background: URL('/jsp/sso/img/input_bg.gif') no-repeat;" >
						<input type="password" name="password" size="10" value="" class="input_textfield3"  maxlength="20" onkeypress="javascript:if(event.keyCode == 13){lf_login2(); return false;}" tabindex="2"  style=" background-color:transparent; width:134px;padding: 1px 0px 0px 1px; height:18px; border:none;"/>
					</td>
				</tr>
				<tr>
					<td height="10" colspan="3"></td>
				</tr>
				<tr>
					<td colspan="3" align="left">
						<img src="/jsp/sso/img/reg_1.gif" alt="회원가입" onclick="lf_register()" style="cursor:pointer"/><a href="/jsp/sso/searchid.jsp"><img src="/jsp/sso/img/id_1.gif" alt="아이디 찾기"  border="0"></a><a href="/jsp/sso/searchpw.jsp"><img src="/jsp/sso/img/pwd_1.gif" alt="패스워드 찾기"  border="0"/></a><img src="/jsp/sso/img/faq_1.gif" alt="FAQ" onclick="lf_OpenFaq();" style="cursor:pointer" />
						<!-- 
						<a href="/jsp/sso/searchid.jsp"><img src="/jsp/sso/img/btn01_id.gif" alt="아이디 찾기" border="0" /></a>
						<a href="/jsp/sso/searchpw.jsp"><img src="/jsp/sso/img/btn01_pw.gif"  border="0" alt="비밀번호 찾기" /></a>
						 -->
					</td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><img src="/jsp/sso/img/ta01_dn.gif" width="330" height="12" /></td>
		</tr>
	</table>
	<table>
		<tr>
			<!--td><img src="/jsp/sso/img/copyright_w2.png" usemap="#help" border="0"/></td-->
			<td><img src="/jsp/sso/img/email-me.png" usemap="#help" border="0"/></td>
		</tr>
		</table>
	</td>
</tr>
</table>

<div id="msg_div" style="display:none;position : absolute; top : 45%; left : 35%;">
<table width="330" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td><img src="/jsp/sso/img/pop_b_title.gif" width="301" height="30" /></td>
	<td><a href="javascript:lf_close_msg()"><img src="/jsp/sso/img/pop_b_close.gif" width="29" height="30" border="0" onfocus="this.blur()"/></a></td>
</tr>
</table>
<table width="330" border="0" cellpadding="0" cellspacing="1" class="bg_green01">
<tr>
	<td height="145" align="center" valign="top" background="/jsp/sso/img/pop_bg.gif">
		<table width="310" border="0" cellpadding="0" cellspacing="0">
		<tr>
		<td align="right" height="30">&nbsp;</td>
		</tr>
		<tr>
			<td align="center" class="basic_wb"><p id="msg_p">msg</p></td>
		</tr>
		<tr>
			<td align="center">&nbsp;</td>
		</tr>
		<tr>
			<td align="center"><a href="javascript:lf_close_msg()"><img src="/jsp/sso/img/btn01_close.gif" width="56" height="25" border="0" /></a></td>
		</tr>
		</table></td>
</tr>
</table>
</div>

	

</form>


<map name="help" id="help">
	<area shape="rect" coords="1,23,255,45" href="mailto:ischool@onnuri.org" title="iSchool 관리자에게 메일보내기(ischool@onnuri.org)">
	<area shape="rect" coords="261,23,456,45" href="mailto:icare@onnuri.org" title="iCare 관리자에게 메일보내기(icare@onnuri.org)" style="border: 1px solid;">
	<area shape="rect" coords="1,42,255,66" href="mailto:ischool@onnuri.org" title="iSchool 관리자에게 메일보내기(ischool@onnuri.org)">
	<area shape="rect" coords="261,42,456,66" href="mailto:ncare@onnuri.org" title="iCare 관리자에게 메일보내기(ncare@onnuri.org)" style="border: 1px solid;">
</map>

<map name="noticeClose" id="noticeClose">
	<area shape="rect" coords="343,2,396,19" href="#" onclick="jQuery('#popupNotice').dialog('close');" title="닫기" >
</map>

<!-- 전기안전점검 공지 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

// jQuery(function($){
//  var layerWindow = $('.mw_layer');
//  var layer = $('#layer');
 
//  // Show
//   layerWindow.addClass('open');

//  // ESC Event
//  $(document).keydown(function(event){
//   if(event.keyCode != 27) return true;
//   if (layerWindow.hasClass('open')) {
//    layerWindow.removeClass('open');
//   }
//   return false;
//  });
//  // Hide Window
//  layerWindow.find('>.bg').mousedown(function(event){
//   layerWindow.removeClass('open');
//   return false;
//  });
// });
</script>
<!-- 전기안전점검 공지 -->






<style tyle="text/css">
.mw_layer{display:none;position:fixed;_position:absolute;top:0;left:0;z-index:10000;width:100%;height:100%}
.mw_layer.open{display:block}
.mw_layer .bg{position:absolute;top:0;left:0;width:100%;height:100%;background:#000;opacity:.5;filter:alpha(opacity=50)}
#layer{position:absolute;top:100px;left:50%;width:880px;margin:0 0 0 -440px;padding:28px 28px 0 28px;border:2px solid #555;background:#fff;font-size:12px;font-family:Tahoma, Geneva, sans-serif;color:#767676;line-height:normal;white-space:normal}

</style>

	<!-- light box -->
	<div class="mw_layer">
		<div class="bg"></div>
		<div id="layer">
			<img src="https://www.ionnuri.org/jsp/sso/notice.png" alt="전기안전점검에 따른 행정프로그램 중단안내" />
		</div>
	</div>



</body>



</html>